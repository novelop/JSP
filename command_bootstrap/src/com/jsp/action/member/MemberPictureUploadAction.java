package com.jsp.action.member;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.jsp.action.Action;
import com.jsp.controller.FileUploadResolver;
import com.jsp.controller.GetUploadPath;
import com.jsp.controller.MultipartHttpServletRequestParser;
import com.jsp.exception.NotMultipartFormDataException;

public class MemberPictureUploadAction implements Action {

	//업로드 파일 환경 설정
	private static final int MEMORY_THRESHOLD = 1024 * 500;
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1;
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		request.setCharacterEncoding("utf-8");
		try {
			// 1. request 변환
			MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			// 2. 저장할 경로
			String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
			
			// 3. 업로드 된 이미지 저장
			FileItem[] items = multi.getFileItems("pictureFile");
			List<File> uploadFiles = FileUploadResolver.fileUpload(items, uploadPath);
			
			String uploadFileName = uploadFiles.get(0).getName();
			
			// 4. 이전 이미지 삭제
			String oldPicture = multi.getParameter("oldPicture");
			File oldFile = new File(uploadPath + File.separator + oldPicture);
			if(oldFile.exists()) {
				oldFile.delete();
			}
			
			// 5. 저장한 파일명 보내기
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(uploadFileName);
			
		} catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST); //400
		} catch (Exception e) {
			response.sendError(response.SC_INTERNAL_SERVER_ERROR); //500
		}
		return url;
	}

}
