package taketrans;

public class Main {

	public static void main(String[] args) {
		// 사람 객체 생성
		Person inbi = new Person("박인비", 10000);
		Person nara = new Person("이나라", 5000);
		Person minsu = new Person("민수", 5000);
		
		// 버스 객체 생성
		Bus bus100 = new Bus(100);
		
		// 지하철 객체 생성
		Subway subwayGreen = new Subway("2호선");
		
		// 사람이 버스를 탄다
		inbi.takeBus(bus100);
		nara.takeBus(bus100);
		
		// 사람이 지하철을 탄다
		minsu.takeSubway(subwayGreen);
		
		
		
		inbi.showInfo();
		nara.showInfo();
		bus100.showInfo();

		minsu.showInfo();
		subwayGreen.showInfo();

	}

}
