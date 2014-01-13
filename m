From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun4i: dt: Add basic board support for
 LinkSprite pcDuino
Date: Mon, 13 Jan 2014 11:07:08 +0100
Message-ID: <20140113100708.GY2941@lukather>
References: <alpine.DEB.2.02.1401111509430.13932@trabant.deployis.eu>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HENu/cXyPKFN4XCQ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAHXZ2LAKGQEPFZUJCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1401111509430.13932-35KbhngVGxv1KanxuVi64+yrfmlZI2zM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HENu/cXyPKFN4XCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zoltan,

On Sat, Jan 11, 2014 at 04:54:52PM +0100, Zoltan HERPAI wrote:
> This patch will add a basic board support DT for the
> LinkSprite pcDuino.
>=20
> Signed-off-by: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile              |    1 +
>  arch/arm/boot/dts/sun4i-a10-pcduino.dts |   48 +++++++++++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/sun4i-a10-pcduino.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b663ed7..a2e3620 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -253,6 +253,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D \
>  	sun4i-a10-cubieboard.dtb \
>  	sun4i-a10-mini-xplus.dtb \
>  	sun4i-a10-hackberry.dtb \
> +	sun4i-a10-pcduino.dtb \
>  	sun5i-a10s-olinuxino-micro.dtb \
>  	sun5i-a13-olinuxino.dtb \
>  	sun5i-a13-olinuxino-micro.dtb \
> diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/=
sun4i-a10-pcduino.dts
> new file mode 100644
> index 0000000..752f002
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright 2014 Zoltan HERPAI
> + * Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +/include/ "sun4i-a10.dtsi"
> +
> +/ {
> +	model =3D "LinkSprite pcDuino";
> +	compatible =3D "pcduino,a10-pcduino", "allwinner,sun4i-a10";

Is LinkSprite the retailer or the manufacturer?

If the former, it shouldn't appear in the model string, if the latter,
it should be the prefix in the compatible.

Otherwise, it looks very good, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HENu/cXyPKFN4XCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS07rMAAoJEBx+YmzsjxAgPyMP/3nLK9BcpavAx+m8G4MRbrPY
tw9O6qk2y0DXSZ6QOUt/y1bMQNqxzlkh3cXflrDA0gdmHiJHpiTX2UTbkB4RlKd/
xmenNEXLO4GRQUJQ4+X5VTfanmMFuRoGlHhHJ+973z/a+eLmUOtMedMxFJ2S42zZ
zv9lfNdCVoFIOa/tPI5r61nTuk0VzGVLpF9zrx0L7Ud90Q/eXzEl7124rQzt3wg7
wRh23Igc1s0HJsfWylSUUYv6PQvdg5kK/PmC1HNc+dDx3FzxaDUbE6q9+TlT+4hD
Pn/pIXZHf7+/qRk2qXSjM9O9aEpP6io8jt6l8fhjpGdnfdryBr8U6TRsaaYWviPF
XuHOLZF3VmqDqxsVTautHb8AiO9aw7ZP/4/K//i3uJYttblQDH51oygvNZnnZCW3
xZGvooAN51tf6nncd7lnkCBZUu8ZRAFPqAvEAeYXfvwW/Pp5ruQybaWEsD8TAZ2b
hMcy6q3cowGUALjPscke9qcFMgL36zOqM7ehhZLlYDWJ1T8E/MLU5HYvafTSeJbD
ZC17T8Cf2qd6V2wlw06fqfqU9PKtzaQV+0IqihQxJBM9wQMGvr+UvcU57q5IS2Qs
xVtFPmhdJY3s73aOwyFFm5WzAyKnqla/jS9Zoht2Ov08uKjsmuO3fSpn3aWf0tsh
+OJkJyMRa2MOCUbeYmq5
=YLGw
-----END PGP SIGNATURE-----

--HENu/cXyPKFN4XCQ--
