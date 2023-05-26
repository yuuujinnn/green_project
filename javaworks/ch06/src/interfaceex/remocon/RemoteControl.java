package interfaceex.remocon;

public interface RemoteControl {
	//상수
	public int MAX_VOLUME = 10;
	public int MIN_VOLUME = 0;
	
	//추상 메서드
	public void turnOn();
	
	public void turnOff();
	
	public void setVolume(int volume);
	
}
