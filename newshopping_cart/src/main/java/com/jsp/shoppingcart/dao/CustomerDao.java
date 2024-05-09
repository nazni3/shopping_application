package com.jsp.shoppingcart.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shoppingcart.dto.Customer;

@Repository
public class CustomerDao {
	@Autowired
	EntityManagerFactory emf;

	public void saveCustomer(Customer Customer) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(Customer);
		et.commit();
	}

	public Customer login(String email, String password) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("select m from Customer m where m.email=?1 and m.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		try {
			Customer customer = (Customer) query.getSingleResult();
			return customer ;
		} catch (NoResultException e) {
            return null ;
		}

	}

	public void updateCustomer(Customer m) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(m);
		et.commit();
	}

	public void deleteCustomerById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		Customer m = em.find(Customer.class, id);
		et.begin();
		em.remove(m);
		et.commit();
	}

	public Customer findCustomerById(int id) {
		EntityManager em = emf.createEntityManager();

		Customer m = em.find(Customer.class, id);

		if (m != null)
			return m;
		else
			return null;
	}
}
