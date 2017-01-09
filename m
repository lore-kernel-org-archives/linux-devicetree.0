From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 3/6] clk: sunxi-ng: Add H5 clocks
Date: Mon, 9 Jan 2017 12:01:12 +0100
Message-ID: <20170109110112.yzmz5dcnw5lthhbm@lukather>
References: <20170106014959.nqPebrUB@smtp1p.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="55e3muqlmyqo54af"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBA63ZXBQKGQEUB2X6HA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170106014959.nqPebrUB-V6dNpkQgAPs0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--55e3muqlmyqo54af
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 06:48:31AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=886=E6=97=A5 06:04=E4=BA=8E Maxime Ripard <maxime.ri=
pard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Dec 27, 2016 at 12:25:15AM +0800, Icenowy Zheng wrote:=20
> > > Add the H5 CCU clocks set based on the H3 one.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> >
> > Is there any difference with H3's?=20
>=20
> One more Transport Stream controller, so one more bus gate and bus
> reset for it.

There's no need to duplicate more than 1000 lines of code just for
that then. Just add a new compatible and reuse the clocks already
defined.

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

--55e3muqlmyqo54af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYc210AAoJEBx+YmzsjxAgP3YP/1gWhVo0FL5xv2HdmdwRUCkb
aqFMOK/QLVMvKeBbK7B6dq8+8LHnLGf/j9daA329c6dDZsmM0jDXaXhI7E9e0H4D
sMikhbdxPUIpVBYQ+eHGDxAOVj0mZ/o9pkxq1nu55zavBSqSEcj98zAGQD84GojQ
jkXBS95TvE5eAKxnqU5biU/wF0H3GK1dqREMVlN9rt+j4r0i7GUijwFwNnqFMknl
ZC+noVaB1ng/VTxXVF/S9XyaaUi1j6CHsOMY3Y1iO3RwhLxPPhjCVCGqWX74Btth
D7DjmpyOUage2sM/DwOoqoWksKuh6SuEA4dcL4hbxe21DeKjWgCJQul5ydPuGh9Z
G7hSlaV1PLLa/viktJbb7H+y2h0C+7GMGB+UAqkQIb7d/haUTOt2ysLwmitTBz5P
GJIo2sxgLQ8xaUW52L2d4GqlzWIWPNfRgKpKqz8BeEGr7hi4gRyRfjURNVyunoGx
J+mxM9vwgA0RO1MvVof++iADpqzVfNc1kRTMZBdu/oG24E6zXUFjlMuITQK0iGoa
yJfP/sVYaRL8kQKZSZ+RfsAgu93DgpUeOvxiyPPAvp8nUdGOxs3fP5iNJq/fbHSR
pUtvwBdlMzgFKel7BmvfxQkUBnrMUCJhxiLOraK60jqC4rwXoVNrghnBID9/l6Xl
l+xhgWA2UBSyEv4ETQgK
=L4Qd
-----END PGP SIGNATURE-----

--55e3muqlmyqo54af--
