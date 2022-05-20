package com.java.ot;


public class Main {
	private Input inputIns = new Input();
	private Process processIns = new Process();
	private Output outputIns = new Output();

	public static void main(String[] args) {
		Main main = new Main();
	
		String input =main.inputIns.input1();
		
		String result = main.processIns.process1(input);
		
		main.outputIns.output1(result);
		
	}

//	private String inputStr() {
//		// 입력
//		Scanner scan = new Scanner(System.in);
//		String input = scan.nextLine();
//		
//		return input;
//	}
//	private String process(String input) {
//		String str = null;
//		if(input==null) return null;
//		
//		try {
//			Integer.parseInt(input);
//			str="숫자:";
//		} catch (Exception e) {
//			str="문자:"; 
//		}
//	
//		str+=input;
//		return str;
//	}
//	private void output(String result) {
//		System.out.println(result);
//	}
//	
//	
}
