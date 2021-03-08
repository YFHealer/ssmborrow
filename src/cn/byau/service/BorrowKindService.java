package cn.byau.service;

import cn.byau.dao.BorrowKindMapper;
import cn.byau.pojo.BorrowKind;

import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by tjh on 2017/5/13.
 */
@Service("borrowKindService")
public class BorrowKindService {

    @Autowired
    private BorrowKindMapper borrowKindDao;

    public List<BorrowKind> list() {
        return borrowKindDao.list();
    }
    public BorrowKind getByKindId(String kindId) {
        return borrowKindDao.getByKindId(kindId);
    }
    
    
    
}
