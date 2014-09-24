From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: sunxi: Add debug uart used by
 sun9i (Allwinner A80)
Date: Wed, 24 Sep 2014 08:39:02 +0200
Message-ID: <20140924063902.GR15315@lukather>
References: <1411311493-24344-1-git-send-email-wens@csie.org>
 <1411311493-24344-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xr6Gr0irOxp3+3c"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBROORGQQKGQEOLPNGBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411311493-24344-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, yhf-HcjymKqD97rQT0dZR+AlfA@public.gmane.org, ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5xr6Gr0irOxp3+3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2014 at 10:58:09PM +0800, Chen-Yu Tsai wrote:
> The uarts on sun9i are still compatible with the dw_8250, but are
> located at different addresses.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index b11ad54..58b5218 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -707,6 +707,14 @@ choice
>  		  Say Y here if you want kernel low-level debugging support
>  		  on SOCFPGA based platforms.
> =20
> +	config DEBUG_SUN9I_UART0
> +		bool "Kernel low-level debugging messages via sun9i UART0"
> +		depends on ARCH_SUNXI && MACH_SUN9I

Depending on MACH_SUN9I should be enough. It already depends on ARCH_SUNXI.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5xr6Gr0irOxp3+3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUImcGAAoJEBx+YmzsjxAgEhgQAIO5JOvsoXe3SSMItj+Bu54F
G7MDrSG2DaNgDt/kbPU08MWoMWosEs1zq1oovURd0A+50ecaX8Zr7LO7ZkI7quOm
rX5u4Pu20mpxjhimCwuuAw99X/yj6oR85plf0XHH7Miovt4yIEMgkyOaXu1fh3Qs
jE6j2oq5ddZ0Zkf+L3wG7A0/FAsTStYlWOQCEUMP21orLSd5vdnnq4fjSulhqbCe
64b+SGR21DJ6iNF2iQalpT9Hb3333K7DYTKQyHXet7CvRmONFYd4yoUwtiGWj84G
iUgJq0xEXNE9LxfXWpg+GfRskwiYqy+gnpfbydLyfzVyIwo1ZO/q2HJuK3Zv0kox
yhRc+out9bVVNINhbMhUHxIK2Hu3MoTXYu5UUXZ2bciQCZ3Mf7hwK5C2r9Gjd5Sk
2RRbdGkdYpbkb6q9DxbDXN09b2rk9oyXOfO96NltOMYA7ns0bdTMjs8++gaOYyrO
O8qRvt0clWjFEj6xWgy/t78SnoB7/AAhih0fkiMkGGZdEDgjfQlYEUPLsZ/CZ7NK
rqteBfEZ87YRZecXbpV+GIu1CxOC9JIIi1GK8vwmEMk69lYV0EaBdExa+iyjJca2
HzZ9d3nZXjHeSxci0wVGEfpM2OpYWpvpKofV2/IeznGjYFBQwTrcw1ncCyiXcnwe
Wx6GCcJ/Ngnbbh28+uH7
=8UQ/
-----END PGP SIGNATURE-----

--5xr6Gr0irOxp3+3c--
