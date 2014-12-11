From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Thu, 11 Dec 2014 23:41:04 +0100
Message-ID: <20141211224104.GA11666@earth.universe>
References: <20141211214801.4127.93914.stgit@notabene.brown>
 <20141211215943.4127.24792.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141211215943.4127.24792.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 12, 2014 at 08:59:44AM +1100, NeilBrown wrote:
> A "tty slave" is a device connected via UART.
> It may need a driver to, for example, power the device on
> when the tty is opened, and power it off when the tty
> is released.
>=20
> A "tty slave" is a platform device which is declared as a
> child of the uart in device-tree:
>=20
> &uart1 {
> 	bluetooth {
> 		compatible =3D "tty,regulator";
> 		vdd-supply =3D <&vaux4>;
> 	};
> };
>=20
> runtime power management is used to power-up the device
> on tty_open() and  power-down on tty_release().
>=20
> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>

FWIW:

Acked-By: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

-- Sebastian

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJUih19AAoJENju1/PIO/qa5oEP/RY34vy8VJRE3Fez7FB9zX+k
GhEmT+Mzn0XHfsYWclVNCAj/1roznRwpw+Gw1QmAW8Z26h/ab9CrIjQpu0idSEMA
rhRJSL+a/+TwfdQYc7wPFCqlcCia+zXzrgTJLteWkoN+f8N3YyFILQpZtun9UKb2
J2tkcLu9lU/B2tl8FJ1Oi5yYD4RpZ9oFqiMA/AQM6WbGcmKFK04SY+Pv82fhCtm9
asTHv/Ao95jUIwZsnp4rUumIwxP83+yhJT9JnF1ttLj/OPTcxJOGyQDTKLoqgoVI
7aIZ3Tmx4P/idy95fd60P4bkCa6jgKEjlxgKYe4QCnb2UiiHfWyVQoHxVm5pgM0d
hGdtwF2JXvJ3Hom8mDMw3w3yQ2QoYOg7sq9/dpMSZqX1zym0waJmiVFzz26PWY+c
Y6SZQCzwtEfY9Ncs96ZYqlZMnetCkCPbkjwVDfTigJpGLGKIuL7SIL0gyU2asO82
7XP2y7+Q+/VjGQmle74K0lG3lmnZ5Bk6k84vuXCSxPJxf1+os2/59394RtCWBkTf
omiRExXkGtKDtFqGvnfTSM9BUd3HvwP011ra3R81+nzaQIMQDGtosleHqPHuKZ06
PEQ/KJRHAHY3nI2PYKZNDoWIvxkGnZeXw/8cfHES8arA/BEVhnzkyeW7V+uJYXCh
aTI3/pxM7Wt55xIRf3iK
=t1+L
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
