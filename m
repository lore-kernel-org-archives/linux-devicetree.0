Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:54292 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729456AbfFGWMj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 18:12:39 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
From: Oleh Kravchenko <oleg@kaa.org.ua>
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Message-ID: <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
Date: Sat, 8 Jun 2019 01:12:28 +0300
MIME-Version: 1.0
In-Reply-To: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vG1zKJ1DLp9BCWm74pxVtJRKDSHsPi682"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vG1zKJ1DLp9BCWm74pxVtJRKDSHsPi682
Content-Type: multipart/mixed; boundary="UJBr04gkGR3IxGReCbfiELJC7oUYTbDzn";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy
 <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
In-Reply-To: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>

--UJBr04gkGR3IxGReCbfiELJC7oUYTbDzn
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

08.06.19 00:48, Oleh Kravchenko =D0=BF=D0=B8=D1=88=D0=B5:
> Jacek,
>=20
>> For blinking you can use blink_set op. To be able to recommend
>> you anoptimal solution for the effect we would need more
>> details regarding its nature.
>=20
> Thanks, I will do that.
> But how to properly handle other effects? Not only blinking?

	int		(*blink_set)(struct led_classdev *led_cdev,
				     unsigned long *delay_on,
				     unsigned long *delay_off);

My LED board doesn't support any delay settings at all.
Should I always set delay_on, delay_off to zero?

=20
> And how to define it by device tree?
> Driver can't get this information about what is really supported.
> I don't want define effect code inside DT.
>=20
> =20
>>>> This is a new driver there should be no DT that has this compatible =
or

--=20
Best regards,
Oleh Kravchenko



--UJBr04gkGR3IxGReCbfiELJC7oUYTbDzn--

--vG1zKJ1DLp9BCWm74pxVtJRKDSHsPi682
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz64UwACgkQ0xNJm20p
l4xyYxAAucF8gIdpcDBHtCNUKyCRbHrmbQrvR269wDeIZm+752g2Wo9z7SACLsBh
W7SrZCdhYZ7sfUussfrtEJUyEYdxvjmNTiWmQGhkiI5kHYGSHKflc/9MvN/qK3n1
i91/46shbNSzCKIE+KdUedil24XXgPQWLQJrO2GRdt6BflIv/Yp1uKG9vJ9ra2R9
0ET60VmHmI7kzQFMfP6AbkSYN++r5TzTasDKECLFCofzEPaS5fwWFOeI2jg1tSE+
mke9tn0Q4/YJJGT4+yBNQAOMJVxL87nzZ2E+WWEy2eN9mSwPS3tJkacrIASkBsJI
8yJxHmGNUtnQcHDWM47vftPzDFO5ea9VeQT3nXefmISXb4KhDPfgFNZO7sWGmN5V
g23+itvb94Q7jxo/s8Yr1X9L6lXcIZ/xAlU4aYEsi+lhgJycRTUoC28A2lZsLkoU
JiEwtZmQWoyZsh1CHjaBybwQ43j4o1LeU7/Ni8dmDigmyhBhJr/oB75qCSlGtNgo
xXYE36MqaWc6P4v7VD4zWFMB7joab7Mf1o5dfjnLe/WSDw4gal1oJ7MlTrjNSUji
ab15K8gc9tuJcxmHBuRXcHVtjcZeWqUJwFWYDRfpcXOYDeGr3YPCKD9n1bdY+fkS
h/hGR+cQ66Eaf1q9JkbpLZYTADA+drBnQNqvCQadarHzXl5KpHE=
=Qj19
-----END PGP SIGNATURE-----

--vG1zKJ1DLp9BCWm74pxVtJRKDSHsPi682--
