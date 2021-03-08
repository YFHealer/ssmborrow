package cn.byau.dao;

import java.util.List;

import cn.byau.pojo.Borrow;
import cn.byau.pojo.BorrowKind;

public interface BorrowKindMapper {
	List<BorrowKind> list();

	BorrowKind getByKindId(String kindId);
	
	
	

}