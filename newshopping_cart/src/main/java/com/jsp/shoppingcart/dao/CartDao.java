package com.jsp.shoppingcart.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shoppingcart.dto.Cart;

@Repository
public class CartDao {
	@Autowired
	EntityManagerFactory emf;

	public void saveCart(Cart Cart) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(Cart);
		et.commit();
	}

	public Cart findCartById(int id) {
		EntityManager em = emf.createEntityManager();
		Cart i = em.find(Cart.class, id);
		if (i != null)
			return i;
		else
			return null;
	}

	public void updateCart(Cart Cart) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(Cart);
		et.commit();
	}

	public void deleteCartById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		Cart i = em.find(Cart.class, id);

		et.begin();
		em.remove(i);
		et.commit();
	}

	public Cart removeAllItemsFromCart(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		Cart c = em.find(Cart.class, id);
		c.setItems(null);
		c.setTotalprice(0);

		et.begin();
		em.merge(c);
		et.commit();

		return c;

	}

	public void removeItemFromCartById(int cart_id, int item_id) {

	}
}
