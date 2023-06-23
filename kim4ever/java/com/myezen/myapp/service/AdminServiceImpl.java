package com.myezen.myapp.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.persistance.AdminService_Mapper;
import com.myezen.myapp.persistance.MemberService_Mapper;



@Service("AdminServiceImpl")


public class AdminServiceImpl implements AdminService {

	private AdminService_Mapper asm;
	
	@Autowired
	public AdminServiceImpl(SqlSession sqlSession) {
		this.asm = sqlSession.getMapper(AdminService_Mapper.class);
	}
	
	//관리자 메인페이지 총 자전거
	@Override
	public int getTotalBkidxCount() {
		
		return asm.getTotalBkidxCount();
	}

	//관리자 메인페이지 대여중인 자전거
	@Override
	public int getTotalRidxCount() {
		
		return asm.getTotalRidxCount();
	}
	
	//관리자 메인페이지 고장난 자전거
	@Override
	public int getTotalErrorCount() {
		
		return asm.getTotalErrorCount();
	}
	
	//관리자 메인페이지 대여 가능한 자전거
	@Override
	public int getTotalRentCount() {
		
		return asm.getTotalRentCount();
	}
	
	//관리자 메인페이지 대여소 별 대여 가능 자전거 수
	@Override
	public ArrayList<BikeJoinVo> canRentBike() {
		
		ArrayList<BikeJoinVo> rblist = asm.canRentBike();
		
		return rblist;
	}
	
	//관리자 메인페이지 이용현황 자전거 수
	@Override
	public ArrayList<BikeJoinVo> getRentalCountByDateRange() {
		
		ArrayList<BikeJoinVo> rbclist = asm.getRentalCountByDateRange();
		
		return rbclist;
	}
		
	
	//회원삭제
	@Override
	public void deleteMember(String memberId) {
	System.out.println("memberId"+memberId);
	asm.deleteMember(memberId);
		
		}

	//회원리스트
	@Override
	public ArrayList<BikeJoinVo> memberList(SearchCriteria scri) {
				
	ArrayList<BikeJoinVo> alist = asm.memberList(scri);
	
	return alist;
	}
	
	@Override
	public int memberListCount(SearchCriteria scri) {
			
		return asm.memberListCount(scri);
	}

	@Override
	public ArrayList<BikeJoinVo> memberOutList(SearchCriteria scri) {
		
		ArrayList<BikeJoinVo> alist = asm.memberOutList(scri);

		return alist;
	}

	@Override
	public int memberOutListCount(SearchCriteria scri) {

		return asm.memberOutListCount(scri);
	}
	
	
	//신고 내역 리스트
	@Override
	public ArrayList<BikeJoinVo> searchBikeErrors(SearchCriteria scri) {

		return asm.searchBikeErrors(scri);
	}
	
	@Override
	public int searchBikeErrorsCount(SearchCriteria scri) {
		 return asm.searchBikeErrorsCount(scri);
	}
	
	//신고 내역 상세보기
	@Override
	public BikeJoinVo getErrorContent(int eidx) {
		
		return asm.getErrorContent(eidx);
	}
	
	//수리센터 보내기 버튼 누르면 bikeState R로 업데이트
	@Override
	public void updateBikeState(int eidx) {
		asm.updateBikeState(eidx);
		
	}
	
	//수리 내역 페이지
	@Override
	public ArrayList<BikeJoinVo> searchBikerepairList(SearchCriteria scri) {

		return asm.searchBikerepairList(scri);	
	}
	
	@Override
	public int searchBikerepairListCount(SearchCriteria scri) {

		return asm.searchBikerepairListCount(scri);
	}
	
	//수리 완료 버튼 누르면 bikeState Y로 업데이트
	@Override
	public void updateBikeStateY(int eidx) {
		asm.updateBikeStateY(eidx);
		
	}
	
	//회원 상세정보
	@Override
	public BikeJoinVo getMemberByMemberId(String memberId) {

		return asm.getMemberByMemberId(memberId);
	}

	//관리자 자전거 리스트
	@Override
	public ArrayList<BikeJoinVo> bikeList(SearchCriteria scri) {
		
	ArrayList<BikeJoinVo> klist = asm.bikeList(scri);	
		return klist;
	}
	
	//관리자 자전거 카운트
	@Override
	public int bikeListCount(SearchCriteria scri) {
		
		return asm.bikeListCount(scri);
	}
	
	
	//대여소 리스트
	@Override
	public ArrayList<BikeJoinVo> rentalshopList() {
		
	ArrayList<BikeJoinVo> rlist = asm.rentalshopList();
		return rlist;
	}

	//대여소 추가
	@Override
	public int rentalshopInsert(String rentalshopName, String rentalshopLocation ,String latitude, String longitude) {

		int value = asm.rentalshopInsert(rentalshopName,rentalshopLocation,latitude,longitude);
		
		return value;
	}

	//대여소 이름 중복
	@Override
	public int adminrentalshopNameCheck(String rentalshopName) {
		int value = asm.adminrentalshopNameCheck(rentalshopName);
		return value;
	}

	//대여소 삭제
	@Override	
	public void deleteRentalshop(String rentalshopName) {
		System.out.println("rentalshopName"+rentalshopName);
		asm.deleteRentalshop(rentalshopName);
		
	}
	
	//모임 리스트
	@Override
	public ArrayList<GatheringJoinVo> gatheringList() {
		
		ArrayList<GatheringJoinVo> gjlist = asm.gatheringList();
		return gjlist;
	}
	
	//모임 상세 보기
	@Override
	public GatheringJoinVo gatheringDetail(int giidx) {
		
		return asm.gatheringDetail(giidx);
	}
	
	
	//모임 신고 내역 리스트
	@Override
	public ArrayList<GatheringJoinVo> gatheringDeclaration() {
		
		ArrayList<GatheringJoinVo> gdlist = asm.gatheringDeclaration();
		return gdlist;
	}

	//모임 신고 내역 상세 보기
	@Override
	public GatheringJoinVo DeclarationDetail(int gdix) {
		
	
		return asm.DeclarationDetail(gdix);
	}





	

	

	






	

	

	

	


	

	

	

	

	



	

	

	

	

	

	

	



	

	

	






}