From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Tue, 28 Feb 2017 10:25:25 +0100
Message-ID: <20170228092525.xcwyhuit6w43rjzz@lukather>
References: <20170227192715.50198-1-icenowy@aosc.xyz>
 <20170227192715.50198-2-icenowy@aosc.xyz>
 <20170228064258.mqpu33udgokxazkz@lukather>
 <630891488270931@web10m.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbvmx6557yspg344"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBEEE2XCQKGQEYIHFVSQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <630891488270931-rwkuSX3kbspxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jbvmx6557yspg344
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:35:31PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 28.02.2017, 14:43, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Tue, Feb 28, 2017 at 03:27:14AM +0800, Icenowy Zheng wrote:
> >> =C2=A0The H3 SoC have a bigger SID controller, which has its direct re=
ad
> >> =C2=A0address at 0x200 position in the SID block, not 0x0.
> >>
> >> =C2=A0Also, H3 SID controller has some silicon bug that makes the dire=
ct read
> >> =C2=A0value wrong at cold boot, add code to workaround the bug. (This =
bug has
> >> =C2=A0already been fixed on A64 and later SoCs)
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >
> > Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Who will finally apply these patches?
>=20
> I have seen that you are one of the maintainers of NVMEM subsystem.

Srinivas usually merges the patches.

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

--jbvmx6557yspg344
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtUIFAAoJEBx+YmzsjxAgtcMP/1bEDnYpZ63TlX6LAtKiUAN3
VdakSgx/Q8hxAEJNFGcJINuxsb5g8cuP0Fqb6u7h5hBI0U28XUQS5pw9pzSUAgdN
C5ZfFTxVXZGNoAIiiJidinN/ZfvB7It/jlBgBO4iE/FEC26hgtT1Fh7GBHiLmcLV
FlsFLHboFeFybXxNSA9/+KCpjypPpFycsV1o5VR75X4+sNyE85Tcad+kEC8O8Nrb
wdVHn7yQ2ocVG5NbKvaCUmugO3L+eXifLwpZPUEzrK1T5/g+H2LYE6PxfcxAbqyv
ul0VsqOibj3iebipjU7SFWk6cy94HS1avnKvMmCrR8URbjtI+ok39K+9sIzxYsZn
hfvETWBPSBG1mTMCibAv1qcy7f0up6sq0iHbHYAWyL71tmZ8+6AEic57enCgwsQ0
XNehSTsFoDIxHT1Gt4IYGev++goJtdLo0Yr5dvTUG6XUHASZ9s1ZtDICGRGCHlIe
MYCxacDryxxzGGt9cgWXsPuQHZsBgaaHfNllDuRtvJzQN9wPCWcweaFPVwx5/5vv
u3gPrqMU5+fRNAoBG5kvKK9ijBttQugikgHhrpg5KZDiM+unPupU3IhCqGnVJbwb
nHDF48BXG6Q6We1DaWgKGApz91ORzl6vmIZO/yakbotqStHLDlX1Iv6gzQDdSebO
hv7RwYs/z72eZ+uj+wIG
=84d2
-----END PGP SIGNATURE-----

--jbvmx6557yspg344--
