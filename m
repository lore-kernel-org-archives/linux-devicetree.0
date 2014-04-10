From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] pinctrl: sunxi: support multiple pin controller
Date: Thu, 10 Apr 2014 14:39:41 +0200
Message-ID: <20140410123941.GQ28585@lukather>
References: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
 <1397132747-13917-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yPSgZSQ6mfPWgZ9n"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397132747-13917-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yPSgZSQ6mfPWgZ9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 02:25:44PM +0200, Boris BREZILLON wrote:
> Add support for multiple pin controller instances.
>=20
> First remove the static definition of the sunxi gpio chip struct and fill
> the dynamically struct instead.
> Then define a new pin_base field in the sunxi_pinctrl_desc which will be
> used to specify the gpiochip base pin.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yPSgZSQ6mfPWgZ9n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTRpENAAoJEBx+YmzsjxAgy5QQAI80bjZO5b6sxx7WDONnKdjJ
SpgJByOBUXqKeRcXAFrs35g/D+d0xT/ryIFEv0aLIzZwO+7w+bilXkLgNI3CppQX
UL8OoCL5fU3WtHpbC51GVWseVZqTkisQJal6CzsAk/YoJzb7+T7tWSg9D92OKT0z
HzI7oLNy6QMQGqXX4nMvu9Z2pa1V+BT4wX5zsP3KujOes+Xg2ZPsoMwsRbiwOIOS
+YyxkxjEqCqkd/jofxXhyNQTd0H2Z+B9hizYPRML1mUDUYJwyFHTRqFdOPkG8DEM
yNy/+a+ObrxTgKrJJlrCMlmKAD7XWP9y29zFRtNg43+mMb8vTLja1ZH9tcoms9MO
S1PcfZAomnkWV20z/wVYSS195jDL1RZ92Ms9Cjgqm3kyFDzR/kpyglwI9iwk+AiT
B54zV7fxq/nnV0A38JJzBHqOVNYJMzH57Kj+zzfoY89I6Rczj69AsbPn+6H+TAC/
D44P90Aqnj7ATjofFHz4eqzoDgfYJWKiiFpwRGF8dqVmx5LkL1JhPBlJQEanyXLe
Rn6W5Rj5OB8fSf5nv/l0XVHH+IXoz6BJiNR1beZOrHd2OOJOpRCOg/yubk82J4eD
b4hPWCgkFZytEh8NSU81liYwquEEL4sjZcIt3i89WfRKlbQVPWRRrszfd6ismGe5
mCru6qEshRxVp8Um0m7I
=gNYv
-----END PGP SIGNATURE-----

--yPSgZSQ6mfPWgZ9n--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
