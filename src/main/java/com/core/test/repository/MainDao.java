package com.core.test.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.test.vo.IsMasterVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	

	//사원 리스트 출력
	public List<IsMasterVo> getEmpList(String keyword, String filterCheck, int page, int emp_page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("filterCheck", filterCheck);
		map.put("page", page);
		map.put("emp_page", emp_page);
		System.out.println( keyword);
		return sqlSession.selectList("ismaster.getEmpList",map);
	}
	
	//사원 수 조회
	public int getListCount(String keyword, String filterCheck){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("filterCheck", filterCheck);
		return sqlSession.selectOne("ismaster.getListCount", map);
	}
	//사원 삭제
	public void deleteEmp(List<Integer> values){
		sqlSession.delete("ismaster.delete", values);
	}
	//사원 정보
	public IsMasterVo modifyEmp(int no){
		return sqlSession.selectOne("ismaster.modifyByEmp", no);
	}
	// 글쓰기
	public int insert(IsMasterVo isMasterVo) {	
		return sqlSession.insert("ismaster.insert", isMasterVo);
	}
	//수정
	public int update(IsMasterVo isMasterVo) {
		System.out.println("asd"+isMasterVo);
		return sqlSession.update("ismaster.update", isMasterVo);
	}
}
