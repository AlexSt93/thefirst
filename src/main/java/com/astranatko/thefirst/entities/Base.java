package com.astranatko.thefirst.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@MappedSuperclass
@Data
@NoArgsConstructor
@AllArgsConstructor
public abstract class Base {

    @Id
    @Column(name = "ID", nullable = false, length = 7)
    @SequenceGenerator(name = "id_seq", sequenceName = "id_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
    protected Integer id;

    @Column(name = "NAME", nullable = false, length = 100)
    protected String name;
}
