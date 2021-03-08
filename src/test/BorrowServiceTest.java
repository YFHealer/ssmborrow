/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.byau.dao.BorrowMapper;
import cn.byau.pojo.Borrow;
import cn.byau.service.BorrowService;

/** 声明用的是Spring的测试类 **/
@RunWith(SpringJUnit4ClassRunner.class)

/** 声明spring主配置文件位置，注意：以当前测试类的位置为基准,有多个配置文件以字符数组声明 **/
@ContextConfiguration(locations={"../config/spring-core.xml"})

/** 声明使用事务，不声明spring会使用默认事务管理 **/
//@Transactional

/** 声明事务回滚，要不删除一个数据就没有了，注意：插入数据时可注掉，不让事务回滚 **/
//@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)

public class BorrowServiceTest {
    @Resource
    private BorrowService borrowService;
    @Resource
    private BorrowMapper borrowMapper;
    
       
    @Test 
    public void saveCourseTest() {
    	Borrow course=new Borrow("1050","65412","1","2018.11.2","2018.12.2","0");
        
       int x= borrowMapper.save(course);
       assertEquals(1, x);
    }
  
    @Test 
    public void testImportxls() {
   int x=borrowService.importXls(new File("D:\\workspace2017new\\ssmzuopin\\import.xls")).size();
   assertEquals(10, x);
    }
    
    
    

}