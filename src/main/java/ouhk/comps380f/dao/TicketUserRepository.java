package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.TicketUser;

public interface TicketUserRepository extends JpaRepository<TicketUser, String> {
}

