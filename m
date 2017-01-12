From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Date: Thu, 12 Jan 2017 18:13:45 +0100
Message-ID: <20170112171345.nzkgg6jjyz6ywb54@lukather>
References: <20170111065524.tILSH8cS@smtp1p.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xtl6ajsohtdxdgqk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBU7S33BQKGQEECGSB3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170111065524.tILSH8cS-V6dNpkQgAPs0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xtl6ajsohtdxdgqk
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 11, 2017 at 11:55:16AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8811=E6=97=A5 02:10=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrote:=20
> > > V3s has a similar but cut-down CCU to H3.=20
> > >=20
> > > Add support for it.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> >
> > It looks like there's nothing different but the clocks that you=20
> > register with the H3, please just use the H3 driver.=20
>=20
> USB gate part is different, and many things have gone.

As far as I can see, you're only adding a few clocks, and removing a
bunch. This is definitely something that can be dealt with by simply
registering a slightly different set of clocks, like we're doing on
sun5i.

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

--xtl6ajsohtdxdgqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7lEAAoJEBx+YmzsjxAgcUMP/03z4B5xu2ltdotMrezeOC0K
PHB7Wq8Rrfqzu2ZwcUieC5PsDZmRdhW13M7C56iFyvnG6sIWuD1qbCCcLVh0ZhAd
5woJrj5g9nZsc2aNEKGmMjbtrCu6qFJFM7ZxGavjUJvepuxwyg3Ftxup75erakAd
5fdRJ5eE/+nxzN4ywDp2IhxLFAx8G5y/1KnPnK4bZw10yPOiytAzKBxddOK6MkJW
qI3qOK3HCU++5VU262uHUy2/3EpDDP1KWvH6+SRLbcvmWAI8h34HB9S7f1NXrQFf
r/DYPG6e7T2Q/DAj9j0W72vCHIU9QecobSrWUolUUgfEgdpjkYbiREEAhl4qutB4
G5IqTcBuNDxfUQ7J9Jb3JwtMgJN8+Jc309nELDDF/2aoHegMrKwpVc8fcRO2kGBy
mTBbBufvPlFU30pT26ut2pbTKSqpE9vxcb84vAR7tRCwPsFFyP435tKZSGQiMQFm
8Q4/nK/130l0Wc0re8Kk3fgNg49KQ1QEgrgc9IipzvAm2412qkFuDUVmmLbqmfZs
DWwsBvH41DJvk0EF76FttHmOe5pD/korDuEKcawxi50iw3tim63yE9Hpl6mRcEI9
7YB7sEVQMhzM0QSrjz26ngj4+95C839LR35FjC2vRZByIE/B6GZSB7uHh9rLAbMy
OqHnBbDZACZb5Gj1voTr
=R7Qx
-----END PGP SIGNATURE-----

--xtl6ajsohtdxdgqk--
