package jdbc;

public class PostDTO {
	private int pno;
	private String ptitle;
	private String pupfolder;
	private String puuid;
	private String pfilename;
	private String pdate;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPupfolder() {
		return pupfolder;
	}
	public void setPupfolder(String pupfolder) {
		this.pupfolder = pupfolder;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public String getPfilename() {
		return pfilename;
	}
	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public PostDTO(int pno, String ptitle, String pupfolder, String puuid, String pfilename, String pdate) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.pupfolder = pupfolder;
		this.puuid = puuid;
		this.pfilename = pfilename;
		this.pdate = pdate;
	}
	public PostDTO() {
		
	}
	
}
