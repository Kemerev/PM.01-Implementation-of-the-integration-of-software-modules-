BEGIN;


CREATE TABLE IF NOT EXISTS public.carconditions
(

    CONSTRAINT carconditions_pkey PRIMARY KEY (condition_id)
);

CREATE TABLE IF NOT EXISTS public.cars
(

    CONSTRAINT cars_pkey PRIMARY KEY (car_id)
);

CREATE TABLE IF NOT EXISTS public.clients
(

    CONSTRAINT clients_pkey PRIMARY KEY (client_id)
);

CREATE TABLE IF NOT EXISTS public.personaldrivers
(

    CONSTRAINT personaldrivers_pkey PRIMARY KEY (driver_id)
);

CREATE TABLE IF NOT EXISTS public.pickuplocations
(

    CONSTRAINT pickuplocations_pkey PRIMARY KEY (location_id),
    CONSTRAINT pickuplocations_location_name_key UNIQUE (location_name)
);

CREATE TABLE IF NOT EXISTS public.reservations
(

    CONSTRAINT reservations_pkey PRIMARY KEY (reservation_id)
);

CREATE TABLE IF NOT EXISTS public.types
(

    CONSTRAINT types_pkey PRIMARY KEY (type_id),
    CONSTRAINT types_type_name_key UNIQUE (type_name)
);

ALTER TABLE IF EXISTS public.carconditions
    ADD CONSTRAINT carconditions_car_id_fkey FOREIGN KEY (car_id)
    REFERENCES public.cars (car_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.cars
    ADD CONSTRAINT cars_location_id_fkey FOREIGN KEY (location_id)
    REFERENCES public.pickuplocations (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.cars
    ADD CONSTRAINT cars_type_id_fkey FOREIGN KEY (type_id)
    REFERENCES public.types (type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.personaldrivers
    ADD CONSTRAINT personaldrivers_car_id_fkey FOREIGN KEY (car_id)
    REFERENCES public.cars (car_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.personaldrivers
    ADD CONSTRAINT personaldrivers_client_id_fkey FOREIGN KEY (client_id)
    REFERENCES public.clients (client_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.reservations
    ADD CONSTRAINT reservations_car_id_fkey FOREIGN KEY (car_id)
    REFERENCES public.cars (car_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.reservations
    ADD CONSTRAINT reservations_pickuplocation_id_fkey FOREIGN KEY (pickuplocation_id)
    REFERENCES public.pickuplocations (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;