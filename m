From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Fri, 10 Mar 2017 22:55:16 +0100
Message-ID: <20170310215515.GA6540@amd>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-15-git-send-email-steve_longerbeam@mentor.com>
 <20170302160257.GK3220@valkosipuli.retiisi.org.uk>
 <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
 <20170310122634.0ffda7c6@vento.lan>
 <20170310155708.GX21222@n2100.armlinux.org.uk>
 <20170310174228.3fe39100@vento.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8842825092535360544=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170310174228.3fe39100@vento.lan>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe
List-Id: devicetree@vger.kernel.org


--===============8842825092535360544==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Argh! that is indeed a bug at libv4l (and maybe at gstreamer).
>=20
> I guess that the always_needs_conversion logic was meant to be used to
> really odd proprietary formats, e. g:
> =09
> /*  Vendor-specific formats   */
> #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YU=
V */
> #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov h=
w compress */
> #define V4L2_PIX_FMT_SN9C10X  v4l2_fourcc('S', '9', '1', '0') /* SN9C10x =
compression */
> ...
>=20
> I suspect that nobody uses libv4l2 with MC-based V4L2 devices. That's
> likely why nobody reported this bug before (that I know of).
>=20
> In any case, for non-proprietary formats, the default should be to
> always offer both the emulated format and the original one.
>=20
> I suspect that the enclosed patch should fix the issue with bayer formats.

=2E..
> @@ -178,7 +178,7 @@ struct v4lconvert_data *v4lconvert_create_with_dev_op=
s(int fd, void *dev_ops_pri
>  	/* This keeps tracks of devices which have only formats for which apps
>  	   most likely will need conversion and we can thus safely add software
>  	   processing controls without a performance impact. */
> -	int always_needs_conversion =3D 1;
> +	int always_needs_conversion =3D 0;
> =20
>  	if (!data) {
>  		fprintf(stderr, "libv4lconvert: error: out of memory!\n");
> @@ -208,8 +208,8 @@ struct v4lconvert_data *v4lconvert_create_with_dev_op=
s(int fd, void *dev_ops_pri
>  		if (j < ARRAY_SIZE(supported_src_pixfmts)) {
>  			data->supported_src_formats |=3D 1ULL << j;
>  			v4lconvert_get_framesizes(data, fmt.pixelformat, j);
> -			if (!supported_src_pixfmts[j].needs_conversion)
> -				always_needs_conversion =3D 0;
> +			if (supported_src_pixfmts[j].needs_conversion)
> +				always_needs_conversion =3D 1;
>  		} else
>  			always_needs_conversion =3D 0;
>  	}

Is the else still needed? You changed default to 0...

										Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljDIMIACgkQMOfwapXb+vLHPgCaA/hVPU+c5+BD+uhS8twLktUB
1yQAnRjOmbNw8KPZCQyVxELpIxhyOhGX
=CboU
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============8842825092535360544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============8842825092535360544==--
