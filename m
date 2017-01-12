From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Date: Thu, 12 Jan 2017 18:19:54 +0100
Message-ID: <20170112171954.mj45su57fixzo6og@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-3-icenowy@aosc.xyz>
 <20170110181006.yrd6moy2mctzoc4c@lukather>
 <2705031484163593@web1g.yandex.ru>
 <2714901484163893@web1g.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxcid5gza52osl6z"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRHV33BQKGQEMGEKFLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2714901484163893-/w1NKm4lK9luio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--uxcid5gza52osl6z
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2017 at 03:44:53AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 12.01.2017, 03:40, "Icenowy Zheng" <icenowy-ymACFijhrKM@public.gmane.org>:
> > 11.01.2017, 02:10, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> >> =C2=A0On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrote:
> >>> =C2=A0=C2=A0V3s has a similar but cut-down CCU to H3.
> >>>
> >>> =C2=A0=C2=A0Add support for it.
> >>>
> >>> =C2=A0=C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >>
> >> =C2=A0It looks like there's nothing different but the clocks that you
> >> =C2=A0register with the H3, please just use the H3 driver.
> >
> > Nope.
> >
> > It has a different PLL (PLL_ISP) at different address, and some
> > different muxes.
>=20
> Forgot to mention the missing of PLL_DE and related misses.

Those are not conflicting, it's just a slightly different set of
clocks.

So there's really nothing undoable.

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

--uxcid5gza52osl6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7q5AAoJEBx+YmzsjxAgJg8P/R+Kr62ig8qc8xTnzxVUaHSU
/A4fMOCsBt1v36t9YvyMGAxSnrqDdDRyIBtPOybEDuqMEfUc8m9cUDdH0DiFNY7U
3qCwmhK51ZRM/aoyOyLE2emYu4w3f31bRCpV/6mEKC8AlsOSeOpyCclh3bTB/Mfm
GPm9dDvfk04t+Q9DUTp5610zAR9A7kyndeK1hAABmZzFchxKW5b12FvQRMQJNNRb
t5WiRI7rS9X7zwr0yAT1wAd4bDXrkv13OeNhOfF9TpgbY9k59iqj3xPuDoLUXYoA
Sn8vpW7CgNQ5+Dj+Tqa7riRcxPyDlxFLPWHr150iT+kuADfQIPfxssv3sfvnHbBh
/XzgHZkfWTp856cPGZlGY4ZSqm0hfSOnS1JS2H+QRK+DPrAKl+O8pdgCHt/7FHFE
vsJFuaS4FJPvxaJKivX2vwUerSWvQih6wI+OInu7qkehjZTmmKgVStbDPkJF4cO8
Zs4oCzDkAMzpWd7FulAqOClnk9l+1//TeySY4ohObn8PWeGn8UZSUiFK2Siv1W5B
szJdiM4rKzBb6zzJSAIUbvZj4S86XJ+hCpg8McFix23dsI/p5T/bWJzx4dhTv7Rq
OFmh7M+8jO9FAo7Gm+rnhyIYTXLXnc0MMNpIx8v3aTcbrqUm6cNIVrNYfHz7JCWI
O96q+/slF3xe7BwL9K4M
=UJOe
-----END PGP SIGNATURE-----

--uxcid5gza52osl6z--
