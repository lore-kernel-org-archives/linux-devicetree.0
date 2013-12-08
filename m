From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: lis302 DT binding for Nokia N900
Date: Sun, 8 Dec 2013 15:48:20 +0100
Message-ID: <20131208144818.GA26502@earth.universe>
References: <20131203122059.GB4653@earth.universe>
 <52A473D8.7020706@tremplin-utc.net>
 <20131208134651.GA25587@earth.universe>
 <52A47B84.8050009@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A47B84.8050009-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Cc: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 08, 2013 at 03:00:36PM +0100, =C9ric Piel wrote:
> On 08-12-13 14:46, Sebastian Reichel wrote:
> :
> >No, it's connected via I2C. Please note, that the N900's accelerometer
> >is already supported, but only when initialized via legacy boardcode.
> >
> >The problem is, that I can't specify negative values in the device
> >tree file (the device tree compiler complains). I couldn't find any
> >example of negative numbers in any dts file, so I guess, that
> >negative numbers are not supported.
> >
> :
> >I just want to port the existing boardcode to device tree.
> >The existing platform data is defined as rx51_lis3lv02d_data in
> >arch/arm/mach-omap2/board-rx51-peripherals.c.
> Oh! Yes, then the values themselves should be fine.
> Indeed, the problem is in the parsing of the DT values.
> Currently, lis3lv02d_init_dt() reads values as unsigned int:
>=20
> u32 val;
> if (of_get_property(np, "st,axis-x", &val))
> 	pdata->axis_x =3D val;
>=20
> So it's quite unlikely to get negative ;-) Is there a way to read
> signed ints in DT? If so, I can update the driver.

I just found a link, which describes how to put negative values into
the DTS, so that the device tree compiler understands them and
translates them into 2's-compliment [0].

The kernel code currently does not provide of_property_read_s32(),
but it seems that there was just no use case so far. At least one
of the DT binding maintainers seems to be finde with introducing it
[1].

I will prepare a patch, which adds of_property_read_s32 and another
one, which updates lis3lv02d to use the new function.

[0] http://www.mail-archive.com/linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg05121.html
[1] http://www.mail-archive.com/linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg05125.html

-- Sebastian

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSpIayAAoJENju1/PIO/qaBisP/Ay6NxLTHnkPyu8i4wlQUFc+
Fg5B70Ar5m0cH1aTTT4MTwS2jUG8Y/Rzb9zRnZdKh4CUCJ7us6eKenDGnxY5SZ4e
Zn/QrzveqOeHRYKlPS7SpoVKm0vOBmt/U6rSpoaN8+9MCeaqMZiBIN939uHZfNTT
9uLHJna7M9+1EHWbCMbL/0m608SFIsOfmU+A9I3lF+oD8QAT2KQfANKxKiBNCUx2
iVu1Dd+xlpkO6alUu90XGRsTgt0tZRJ8H8EtQwy9VO6vhj02GXDP+N+Y9zuj2BPM
z+e0JBogDqL5G45e/cvoT5kBA4xr1aFZPRg3h31HjZGNDouBDrZWMNS+DFQ0+Obw
qAmAipvhxRT9nkBXVYyJ/4DBU55Z2tC7HGyRwLV/u2GiWVFkGDw90SSduiR0LyaM
HHXwxIjWD9V9fWlN40edyzL81Oz+7d+1vlp4bTCxt1dUSA6MGkRYLbf4e1fQYF0/
05vQ/0QM648pVTYJW1s3NVRxeVyL7DeGKbzFKRdNikQIaXwQOqLgLIKX2MSTiLf1
KFboaOe+9ifAu4UO0JGg3wKxXD1yQ4ZArL3+n1WP5Ud7g/QOMS7SKQWzFySR57j9
n5WQz0fPQmHJS1OSOWdQOksa4dLwpci54OYgOS25qm2Rzi2cI97YaWhz8xjbD0cC
+mOWYpjM8/54SEGTgjTA
=/s2i
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
