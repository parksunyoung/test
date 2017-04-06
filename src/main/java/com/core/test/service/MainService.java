package com.core.test.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.core.test.repository.MainDao;
import com.core.test.vo.IsMasterVo;

@Service
public class MainService {
	private static final String SAVE_PATH = "/upload";
	private static final int EMP_PAGE = 5;
	private static final int COUNT_PAGE = 5;

	@Autowired
	private MainDao mainDao;

	// 사원리스트
	public Map<String, Object> getEmpList(int page, String keyword, String filterCheck) {

		List<IsMasterVo> list = mainDao.getEmpList(keyword, filterCheck, page, EMP_PAGE); // 사용자리스트

		long totalCount = mainDao.getListCount(keyword, filterCheck); // 조회할 객수
		int last_page = (int) Math.ceil((double) totalCount / EMP_PAGE); // 마지막 페이지
		int after_page = (int) Math.ceil((double) page / COUNT_PAGE) * COUNT_PAGE; // 출력되는 마지막 페이지
		int pre_page = after_page - COUNT_PAGE + 1; // 출력되는 첫번째 페이지
		int next_page = after_page + 1; // 페이지 전으로 돌아가기
		int before_page = pre_page - 1; // 페이지 다음으로 확인

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("kwd", keyword);
		map.put("filterCheck", filterCheck);

		map.put("page", page);
		map.put("totalCount", totalCount);
		map.put("user_page", EMP_PAGE);
		map.put("count_page", COUNT_PAGE);
		map.put("last_page", last_page);
		map.put("pre_page", pre_page);
		map.put("after_page", after_page);
		map.put("next_page", next_page);
		map.put("before_page", before_page);

		return map;
	}

	public void modify(IsMasterVo isMasterVo, MultipartFile multipartFile) {
		isMasterVo.setJuminNo(isMasterVo.getTextjumin1() + '-' + isMasterVo.getTextjumin2());
		isMasterVo.setBirth(
				isMasterVo.getBirthyear() + '.' + isMasterVo.getBirthmonth() + '.' + isMasterVo.getBirthday());
		isMasterVo.setPhone(
				isMasterVo.getTextphone1() + '-' + isMasterVo.getTextphone2() + '-' + isMasterVo.getTextphone3());
		try {
			String orgFileName = multipartFile.getOriginalFilename();
			String fileExtName = orgFileName.substring(orgFileName.lastIndexOf('.') + 1, orgFileName.length());
			String saveFileName = generateSaveFileName(fileExtName);

			if (multipartFile.isEmpty() == true) {
				// DB에 저장
				isMasterVo.setImage("");
			} else {
				// 파일 저장
				writeFile(multipartFile, saveFileName);
				// DB에 저장
				isMasterVo.setImage(saveFileName);
			}
			mainDao.update(isMasterVo);

		} catch (IOException ex) {

			throw new RuntimeException("upload file");
		}
	}

	// 사원삭제
	public void deleteEmp(List<Integer> values) {
		mainDao.deleteEmp(values);
	}

	// 사원정보
	public IsMasterVo modifyEmp(int no) {
		IsMasterVo isMasterVo = mainDao.modifyEmp(no);
		
		isMasterVo.setBirthyear(""+isMasterVo.getBirth().substring(0, 4));
		isMasterVo.setBirthmonth(""+isMasterVo.getBirth().substring(5, 7));
		isMasterVo.setBirthday(""+isMasterVo.getBirth().substring(8));

		isMasterVo.setTextjumin1(""+isMasterVo.getJuminNo().substring(0, 6));
		isMasterVo.setTextjumin2(""+isMasterVo.getJuminNo().substring(7));
		
		isMasterVo.setTextphone1(""+isMasterVo.getPhone().substring(0, 3));
		isMasterVo.setTextphone2(""+isMasterVo.getPhone().substring(4, 8));
		isMasterVo.setTextphone3(""+isMasterVo.getPhone().substring(9));
		
		return isMasterVo;
	}

	// 사원등록
	public void write(IsMasterVo isMasterVo, MultipartFile multipartFile) {
		isMasterVo.setJuminNo(isMasterVo.getTextjumin1() + '-' + isMasterVo.getTextjumin2());
		isMasterVo.setBirth(
				isMasterVo.getBirthyear() + '.' + isMasterVo.getBirthmonth() + '.' + isMasterVo.getBirthday());
		isMasterVo.setPhone(
				isMasterVo.getTextphone1() + '-' + isMasterVo.getTextphone2() + '-' + isMasterVo.getTextphone3());

		try {
			String orgFileName = multipartFile.getOriginalFilename();
			String fileExtName = orgFileName.substring(orgFileName.lastIndexOf('.') + 1, orgFileName.length());
			String saveFileName = generateSaveFileName(fileExtName);

			if (multipartFile.isEmpty() == true) {
				// DB에 저장
				isMasterVo.setImage("");
			} else {
				// 파일 저장
				writeFile(multipartFile, saveFileName);
				// DB에 저장
				isMasterVo.setImage(saveFileName);
			}

			mainDao.insert(isMasterVo);

		} catch (IOException ex) {
			throw new RuntimeException("upload file");
		}
	}

	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(fileData);
		fos.close();
	}

	private String generateSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();

		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ("." + extName);

		return fileName;
	}

}
