From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Date: Thu, 12 Jan 2017 18:41:23 +0100
Message-ID: <20170112174122.iqzrcyytfefqspwq@lukather>
References: <20170112203149.VhtuR9dM@smtp3j.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ooietzld5dnpkws3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQ7733BQKGQECUBY2AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170112203149.VhtuR9dM-fU7thrOZ3Cs0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "	linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "	linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "	linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ooietzld5dnpkws3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 01:31:41AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8813=E6=97=A5 01:19=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 12, 2017 at 03:44:53AM +0800, Icenowy Zheng wrote:=20
> > >=20
> > >=20
> > > 12.01.2017, 03:40, "Icenowy Zheng" <icenowy-ymACFijhrKM@public.gmane.org>:=20
> > > > 11.01.2017, 02:10, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m>:=20
> > > >> =C2=A0On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrot=
e:=20
> > > >>> =C2=A0=C2=A0V3s has a similar but cut-down CCU to H3.=20
> > > >>>=20
> > > >>> =C2=A0=C2=A0Add support for it.=20
> > > >>>=20
> > > >>> =C2=A0=C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > > >>=20
> > > >> =C2=A0It looks like there's nothing different but the clocks that =
you=20
> > > >> =C2=A0register with the H3, please just use the H3 driver.=20
> > > >=20
> > > > Nope.=20
> > > >=20
> > > > It has a different PLL (PLL_ISP) at different address, and some=20
> > > > different muxes.=20
> > >=20
> > > Forgot to mention the missing of PLL_DE and related misses.=20
> >
> > Those are not conflicting, it's just a slightly different set of=20
> > clocks.=20
>=20
> If saying so, we can have only one ccu driver, and make every ccu
> register different set ;-)
>=20
> V3s itself is a totally different SoC with H3.
>=20
> The relationship of V3s and H3 can be farther than the relationship
> of A33 and H3=F0=9F=98=83

A33 and H3 are an entirely different story. The H3 and A33 have
conflicting clocks (ie same clocks with different parameters). This is
not your case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ooietzld5dnpkws3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7/CAAoJEBx+YmzsjxAgGKsQAIOUNUi+25hpeYhZ7qWqu7sH
wDqIin/+WvYcyvYnCO8qvtsHzU8f83joDDvU2duNzwuQOewZAsTz9lhJJzP4pzgy
n5iON29JACv2nXKvdMy2m6eT5DQDIXuIBsaA7oc/Ap2eqTXSGx5Gsck3N24CQ2TO
D/0yut3zjCObgnApLi28yg5VQK5MdQYLvhvGgXcQbvv/ymALLJHXDTxTXunAxRi0
/9fjUiCJopiXTGZQHQTepe6qoRveJvO480Bq9E0cIXd3De7flV7h+HrCx67xmHMk
3ZqfoQHdqzy4lBQfvWVQjWeAQWFJLrlzBfN+cuM4FxPBODiK0vuEijWcTOgjKhXf
dZnniwtpQ/k1mKvBeH2nEVMeq8RhupEW6AL9iDbqynDvTckD2XqBgU3GZc6t+Jpu
au58LG7Ro0fCZ6HHzgxpO/zZja4FSifs0O2cImc7LmYU4p9h9hlNh24aoyjx0i1t
ceDNQ5Q6L/MuFkm36N5/ssN3BZ4l5XmhIJWqka9erWa5T6fY6xCQl+yVaT1NzvQG
OCCJg9tCv+g4X+vvxU0fJtUXDBIw3aRiDOop6dOj7YRF5vwpJqasSdZSCVyUUxWX
7tbiWGBHXxqSkBXclrOnb9SbnO3EG6OK3T3QnQGV4qZ+bojVNFl6YaQcEZ24LPLK
WZOUA08ycYuPV76e2uEv
=PovE
-----END PGP SIGNATURE-----

--ooietzld5dnpkws3--
