From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pinctrl: sunxi: add definitions
 for add A20 and R40 support to A10 driver
Date: Thu, 4 May 2017 16:40:10 +0200
Message-ID: <20170504144010.lco2r6jviff63bcd@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-3-icenowy@aosc.io>
 <20170504140431.zhpcxvphxnxj7ipq@lukather>
 <318E9984-9F5A-41C3-A3E0-52D5ECA05212@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hkzpfawk6wz66o4k"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTH2VTEAKGQEONOQQSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <318E9984-9F5A-41C3-A3E0-52D5ECA05212-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hkzpfawk6wz66o4k
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 10:07:47PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:04:31, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Thu, May 04, 2017 at 09:49:58PM +0800, Icenowy Zheng wrote:
> >> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
> >>=20
> >> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> >> into A10 driver, and add R40 support into it.
> >
> >While your commit log is good, the commit title is misleading since
> >you're not adding it to the A10 driver. You just adding SoC IDs
> >definitions
>=20
> Is "pinctrl: sunxi: Add SoC ID definitions for A10, A20 and R40 SoCs" OK?

Yep, it is, thanks!
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

--hkzpfawk6wz66o4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCz1KAAoJEBx+YmzsjxAgITcQAKV4W05UeZv/lKUjBIRdeSIF
UmrRsQV4L/AmqiRYXx+FfzuPp1SPbsW312K7rb8foX5sZLlsB84hwSwtB9kqg52v
0b4bXKmYzrpKtKodWBKqMHcuXkLLQdhOpVq0XB3xhWSTDnjTRLC4fbw0zIbJl74E
MwcvfD3kQTFzEFuwfNY6GEnxVOisYxDOot6jqaHY5Jk+az4AA5hucHsHsdFq1FPm
Tx/ylXXgdabWmUuYhJMqleWIc28z+iZw2nylWnrOSd7evxL95/GHXTnt7lnztztW
JG1esEiEhtBrc+8+nN4fu14NsyJEthkgS+/IbBMdTL7adTmX67oa7sRwmtwCF640
BCGJrncAnf5TZDXb4xzYEay2rsHvqaFuGeUwOpCrTux7cPC5e+S86o2JSrGB+HNC
cfB6P0z0yNVkxAMqa9bkS3OoljySWU2EwQqEmeMoLExz0sjPLLLqzbOIVqi33/3r
zOrB6/KUlwJkYAttkGUjQz27xEtJ/+vgBy+3sY9517XNDjOXFA89J4LeG1VA4DWn
DVwkSqK96DrXAy6nHuJ0DRfwEfCweU6SURnQuZTInedgAOtSfYMUi9G6dYXM8qkH
itVOtGEOu6kCzLUaNZrSX34hrZgK3HdaJl/LvaEVR1KmfdHWBXt7Keb9Pgr+1qtb
IBFuMUXQ4ciIANXrWKhm
=Nusp
-----END PGP SIGNATURE-----

--hkzpfawk6wz66o4k--
