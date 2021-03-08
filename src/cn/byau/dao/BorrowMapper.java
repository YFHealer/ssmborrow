package cn.byau.dao;

import java.util.List;
import java.util.Map;

import cn.byau.pojo.Borrow;


public interface BorrowMapper {
	/**
	 * 根据 courseId 删除一条记录
	 * @param courseId
	 * @return 被删除的记录个数
	 */
	int delete(String courseId);

	/**
	 * 添加一条记录
	 * @param course
	 * @return
	 */
	int save(Borrow borrow);

	/**
	 * 根据courseId查询一条记录
	 * @param courseId
	 * @return
	 */
	Borrow getById(String borrowId);

	/**
	 * 修改一条记录
	 * 
	 * @param course
	 * @return
	 */
	int update(Borrow borrow);

	/**
	 * 根据couresId的值进行模糊查询，得到的记录数
	 * @param courseId
	 * @return
	 */
	int count(String borrowId);

	/**
	 * 根据courseId的值进行模糊查询后分页得到的记录数
	 * @param map
	 * @return
	 */
	List<Borrow> listByPage(Borrow borrow);

	/**
	 * 显示所有记录
	 * 
	 * @return
	 */
	List<Borrow> list();

	/**
	 * 批量添加 ，从excel导入时使用
	 * @param courseList
	 * @return
	 */

	int insertBatch(List<Borrow> borrowList);

	/**
	 * 批量删除
	 * 
	 * @param ids为主键构成的数组
	 * @return
	 */
	int deleteBatch(String ids[]);

}