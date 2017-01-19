From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
Date: Thu, 19 Jan 2017 16:39:50 +0100
Message-ID: <20170119153950.gosrmbm7jesxljyj@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170116180116.36729-3-icenowy@aosc.xyz>
 <20170117090456.fgw6lpqgurwwcczj@lukather>
 <5926181484672894@web12g.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qdxlgc3jxhpx5d5n"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBP54QPCAKGQEEVTOIPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5926181484672894-8HWTsTVPW6xxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zepan <715805855-9uewiaClKEY@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qdxlgc3jxhpx5d5n
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 01:08:14AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 17.01.2017, 17:05, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > Hi,
> >
> > On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:
> >> =C2=A0V3s has a similar but cut-down CCU to H3.
> >>
> >> =C2=A0Add support for it.
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0---
> >
> > Output from checkpatch:
> > total: 5 errors, 2 warnings, 3 checks, 857 lines checked
>=20
> I remembered some errors' code is directly derived from ccu-sun8i-h3.c,
> so I generated a patch file for "clk: sunxi-ng: Add H3 clocks" and run
> checkpatch on it:
> total: 4 errors, 5 warnings, 1159 lines checked
>=20
> Should I still get all errors fixed?

Yes, please.

Thanks!
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

--qdxlgc3jxhpx5d5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgN3CAAoJEBx+YmzsjxAg+4kQAJGtnOkz8mtmQ1HunD73n5fn
GmVp6pqSOFdXlZGE03OoUdrXQ7ytjG+UCma2FjsgdN845ux7Xag1QG9RAstDbhH0
WOHEJVOZSlQhPwE1mTvFEp0iTFvUtjA/3PDjFmatOBSjNITyP2sIDTv/GiAFeZxO
8xuF0vS98k8qrr7txtkkiaPAfGbx/wrFOo2+MlM/fvCBTAvR0sbOCX7eK1yoSdG8
wq7fbeGKrzcEXWktXGtAqkHkGlbmnv9PNGp71ZbnaXd1COVj4p0KCCQCfT0kPiy+
QUgRjcUPNISMoAkIEz39TgI2vWGKptQJiwFCagLkAkAZlZsoU+/8booF+sQQDkTf
hu8nR9S+qB6V3qqI0q7owPS/kXcDytWxCHZn/DzoFNRtdcOh5Fq0s8Hff1NOzEdv
MxkSUJYJX0ImLJMip2tDrzuYwrHDjnbo6bDlRGp3Ys7dTDKUh79KaZQP0pt+sd8M
039IogGChsgCMjf922jQCqqVtQixlOVcWJSS0EHC+dlIdPD73UHkultj1jAdy3Ym
oZ1zalgDRi7eGP7H0Fn+os2edIyxjLyLB5xXFdZZl1HlpcMGUd+ayN9bxZHtQn3G
8LbdN1fQYGoGosPA654/lgtxhFQtUktJiUR/Wz/aPBYsAnLNmMGHfcfYL/ylGsVJ
FmBjS21+/xPs8RVVal0G
=FNgZ
-----END PGP SIGNATURE-----

--qdxlgc3jxhpx5d5n--
