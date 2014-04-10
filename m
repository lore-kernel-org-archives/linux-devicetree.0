From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/5] pinctrl: sunxi: define A31 R_PIO pin functions
Date: Thu, 10 Apr 2014 14:43:42 +0200
Message-ID: <20140410124342.GR28585@lukather>
References: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
 <1397132747-13917-4-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wc6dtGz1CZgs+5WP"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWFETKNAKGQEYGSNZEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397132747-13917-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wc6dtGz1CZgs+5WP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 02:25:45PM +0200, Boris BREZILLON wrote:
> The A31 SoC provides both PL and PM pio bank through the R_PIO block.
>=20
> These pins all support gpio function and can bbe assigned to system
> peripherals (like TWI, P2WI, JTAG, ...)
>=20
> Add new compatible string to the DT bindings doc.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wc6dtGz1CZgs+5WP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTRpH+AAoJEBx+YmzsjxAgCukP/RZcU9ThheeXn/GkqneCMQTf
j2XHiCHeE+ysDjzHPAhOTKjB2k99/feWtpM0kvQD8P16e1Lods6e7EY2anleOX9B
2Tlke1E6IeZoTkGJuaYDnge2zJkhNNgEfJovzbmAerxidsbMJdXUEQUI3CmeYlyu
BY7V77DoZrD76GQYFX98ZZG3dbLpMmcbt12DpbZdFnR03B7obw3sVlZBI0cVz3CO
KOjOcWKdlSf/BOaRL02XQ3E3PUYWhNeQgx/aZlelCuolUcy90YCpB8yHLZe7G9tn
b0h/gXrBpeS/ik7qMRSLS8Ha+pNwmuLDxmpYbUFB+elwDzBSs978XMEePJ7+eiGK
QhioEpPuVAWDFSCjKqBgFO5SflJJXcruVv1QQbGppYoMOzOifzpsfxJRLz8WzHDm
gkZkik9pUkDx5UUTJON688olx6AbEnbs1hebfVSPHD7zm0zHCofKGQxPyCNtREzO
xsSOjtD2kDV6KBkD/jdjpkUgHg5dko9/K8jL7LFjMJF0oPCzAi2mnQpa2y0cdVWy
eydq6+NUKpvETmpGrnF4njmaFyjTHOSMrlkujOFt/bWVs2Zi25r0V9Nnsy28njX4
a70DqFtbQN1KQwEnQPYLRcucGePEo6UEl3jio3KNgXFcIKb1hJUox+wAT487rGyz
5fXS6JxGhDr3D2MGHvfr
=5zeC
-----END PGP SIGNATURE-----

--wc6dtGz1CZgs+5WP--
