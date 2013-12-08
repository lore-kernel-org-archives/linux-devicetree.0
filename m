From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: lis302 DT binding for Nokia N900
Date: Sun, 8 Dec 2013 14:46:53 +0100
Message-ID: <20131208134651.GA25587@earth.universe>
References: <20131203122059.GB4653@earth.universe>
 <52A473D8.7020706@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A473D8.7020706-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Cc: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi =C9ric,

On Sun, Dec 08, 2013 at 02:27:52PM +0100, =C9ric Piel wrote:
> On 03-12-13 13:21, Sebastian Reichel wrote:
> >The lis302 has already a DT binding described in [0],
> >which descibes misc. hardware properties. The problem
> >is, that the Nokia N900 needs negative values for some
> >of the properties, which seem to be unsupported by DT.
> >The following values would be needed for the N900 (taken
> >from board code):
> >
> >st,axis-x =3D <1>;  /* LIS3_DEV_X */
> >st,axis-y =3D <-2>; /* LIS3_INV_DEV_Y */
> >st,axis-z =3D <-3>; /* LIS3_INV_DEV_Z */
> >
> >st,min-limit-x =3D <-32>;
> >st,min-limit-y =3D <3>;
> >st,min-limit-z =3D <3>;
> >
> >st,max-limit-x =3D <-3>;
> >st,max-limit-y =3D <32>;
> >st,max-limit-z =3D <32>;
> >
> >Can you please tell me how to setup the properties correctly?
>=20
> The code to support inversion of the axis is there... but apparently
> only in the I2C code. It seems the SPI code doesn't (yet) use any of
> these values. Is the accelerometer on the N900 connected via SPI, by
> chance?

No, it's connected via I2C. Please note, that the N900's accelerometer
is already supported, but only when initialized via legacy boardcode.

The problem is, that I can't specify negative values in the device
tree file (the device tree compiler complains). I couldn't find any
example of negative numbers in any dts file, so I guess, that
negative numbers are not supported.

> It should be pretty simple to extend the SPI driver to support axis
> conversion too. It'd basically be a copy-paste of
> lis3lv02d_i2c_probe()
>=20
> Concerning {min,max}-limit-*, I only have vague understanding of
> this information (only used in self test), but it should already be
> working fine with both I2C and SPI (as it's bus independent). In
> addition, note that it's compared to raw data (i.e., before axis
> conversion), so you probably don't need to put negative values
> there.

I just want to port the existing boardcode to device tree.
The existing platform data is defined as rx51_lis3lv02d_data in
arch/arm/mach-omap2/board-rx51-peripherals.c.

-- Sebastian

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSpHhLAAoJENju1/PIO/qaiUMP/jyQ9ycIKSPnifamXDMFiwX1
NvQ88PIE9JQlU9WRgXM2GnWHf+Dk5VICDGdrvrQ45oZ8EHfuLszkO30iTWXWbprV
bLv90n4cCtXL0DxG5Pf91UK5wulCuTcUWRVmpyTxsKYHMnPRoHrhF6hvQsNMtTnF
EOBTuQoaJG9nwZbm+Rp2ELvmlBdv6TzRgzj01VjXsOEuOhOgG+cP1eGnUtvhhS1C
bELk7UMke8OU6aDCpSkfJShcf4NjgTR6wXANiICnNlitslqbv8Y/h+N5DhVuyJaB
S1gPnBbJ37TuOB8446+rjtDR+CXYaJqvCNC2Euvt9pUnsi/+wFBUY2szxV3+9hF7
z5IBEWw9tq0SUpMX3g61ebTdxIm5AfIp0qtyUo7cj+3a0h0u7GAwIa5OnnXcxBhD
SAPoY4T15HvB79wRz0qYrL2xrxAl/aVK1NQ25Q/1/LliWk5rEtzXFUY73DIBBcd5
jBIZZBGeAyo5T/c3ah2Ud5qZ6y48mh451l4EvdYor4YMiDGQqYvHyXKFOXi2kvgd
xWQr/R8bVPGWD9Gvdu30ag2z3bH5Q3U8Iq0bw+O2Uew2n/wbdxq9ZqXV7/RCPeJ/
aNwQ0+vSZyV4kC+YMmQxpklXOc/YGc7npg7dpDSj9LPIx6IkC/3exgLj/zHDsj9j
gvbC8VgKyR9KLPfb6x9v
=RP0Y
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
