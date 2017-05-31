From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v7 16/34] [media] add Omnivision OV5640 sensor driver
Date: Wed, 31 May 2017 21:58:21 +0200
Message-ID: <20170531195821.GA16962@amd>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495672189-29164-17-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TZNg+MwTxZMZA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +/* min/typical/max system clock (xclk) frequencies */
> +#define OV5640_XCLK_MIN  6000000
> +#define OV5640_XCLK_MAX 24000000
> +
> +/*
> + * FIXME: there is no subdev API to set the MIPI CSI-2
> + * virtual channel yet, so this is hardcoded for now.
> + */
> +#define OV5640_MIPI_VC	1

Can the FIXME be fixed?

> +/*
> + * image size under 1280 * 960 are SUBSAMPLING

-> Image

> + * image size upper 1280 * 960 are SCALING

above?

> +/*
> + * FIXME: all of these register tables are likely filled with
> + * entries that set the register to their power-on default values,
> + * and which are otherwise not touched by this driver. Those entries
> + * should be identified and removed to speed register load time
> + * over i2c.
> + */

load->loading? Can the FIXME be fixed?

> +	/* Auto/manual exposure */
> +	ctrls->auto_exp =3D v4l2_ctrl_new_std_menu(hdl, ops,
> +						 V4L2_CID_EXPOSURE_AUTO,
> +						 V4L2_EXPOSURE_MANUAL, 0,
> +						 V4L2_EXPOSURE_AUTO);
> +	ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops,
> +					    V4L2_CID_EXPOSURE_ABSOLUTE,
> +					    0, 65535, 1, 0);

Is exposure_absolute supposed to be in microseconds...?


> +	/* Auto/manual gain */
> +	ctrls->auto_gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
> +					     0, 1, 1, 1);
> +	ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> +					0, 1023, 1, 0);
> +
> +	ctrls->saturation =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,
> +					      0, 255, 1, 64);
> +	ctrls->hue =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE,
> +				       0, 359, 1, 0);
> +	ctrls->contrast =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST,
> +					    0, 255, 1, 0);
> +	ctrls->test_pattern =3D
> +		v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> +					     ARRAY_SIZE(test_pattern_menu) - 1,
> +					     0, 0, test_pattern_menu);
> +

It is good to see sensor that has autogain/etc. I'm emulating them in
v4l-utils, and hardware that supports it is a good argument.=20

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkvIF0ACgkQMOfwapXb+vIQOgCgsTO+wMPGS8nZdQDl/v500f6b
WWEAn05F9/nPXBiTR4tjYn7SprknFjM2
=9cZc
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
