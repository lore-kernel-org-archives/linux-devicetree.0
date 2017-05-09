From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v6 11/13] ARM: dts: sun8i: add DE2 nodes
 for V3s SoC
Date: Tue, 9 May 2017 21:26:11 +0200
Message-ID: <20170509192611.vouyitju6x3yibzz@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-12-icenowy@aosc.io>
 <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA@mail.gmail.com>
 <8ad5de02ffc13348dfc71e9ec203205c@aosc.io>
 <20170505123035.pwh3idz73ujrd3hx@lukather>
 <47D16B11-E976-464C-92AD-213D837C8F68@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="izwh5njcozroauyf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <47D16B11-E976-464C-92AD-213D837C8F68-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--izwh5njcozroauyf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4601;0c
On Fri, May 05, 2017 at 08:34:16PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:30:35, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> >On Fri, May 05, 2017 at 04:53:43PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> >> > > +               de2_clocks: clock@1000000 {
> >> > > +                       compatible =3D
> >"allwinner,sun50i-h5-de2-clk";
> >> >=20
> >> > I am a bit skeptical about this. Since the V3S only has one mixer,
> >do
> >> > the clocks
> >> > for the second one even exist?
> >>=20
> >> It's described in the de_clock.c in the BSP source code, and in
> >hardware
> >> these bits can be really set (although without clock output).
> >>=20
> >> So I use this compatible which has still the extra clocks.
> >
> >If it's not usable, then it shouldn't be in the code, it's basically
> >dead code.
>=20
> Thus should we have one more DE2 CCU compatible without mixer1
> clocks for V3s?

If those clocks don't exist on v3s, then yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--izwh5njcozroauyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZEhfPAAoJEBx+YmzsjxAgJc4P/09NGdSg5d2ycinJHrsja/xT
NOvSgvRl4G9hkgaLgbLB8N8lzV42FzDP7hu2VquGlGTC74nl6rxbbHLO+aY3F990
H9jKj4TIFDL/WdoLfzP+WqmEEVGgiPaG90kthR7Ol+1Z2seCWDJN3M07NbvaeLSa
VKz6idBiLl24k/2aPi9TKVZQjQ8Af2hHMpZR5MGwJGwodmk+3V6tppAeSZIT1wxw
wxJS2I+A0DvSzurVeBrqb1IQZ9yeb67JQprd1X5v6TvVZUdPaFhIpsiIymvIv6R3
bT3rGtBBDbuzvd6o5IHrM0SHe65l9Y7Lp+6HrXxTJAcOOSC5jtkO5KUZwfVkvTns
th1BZsJLCEqyeDstDKOuZxw/uwmSZV+1e2ObOOtf/aiiF+eMV2jY0pTnv4NtuOLC
/rC0tS5GIrhjFNDR2AZZMO5ym5YPHElMCR+X3U0UV7uizqTu19+iGmf/GWrqfJ0D
9YOxyHEkTsY11p9T+Sesqr3u4frqvZ0P7uXusTr2AwbyfyTb+El5iuPt10glHlC7
LmDYFHtyafBNN7H5YxTfDtSKPy+85LfhLSRQxaSOxNoWHXBtai+MzQSVq9QTCQ4A
/2AG6vgdt1mwLL/X9QU3gRIPcyVVPRDVOzToonySH+du3n0p0Cr5Kn7w6pwT/KJe
0DovP+LAh98vOK6VYzfg
=IQHl
-----END PGP SIGNATURE-----

--izwh5njcozroauyf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
