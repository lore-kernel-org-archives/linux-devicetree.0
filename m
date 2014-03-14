From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] spi: dw-mmio: add oftree support
Date: Fri, 14 Mar 2014 16:26:14 +0000
Message-ID: <20140314162614.GW366@sirena.org.uk>
References: <1394787326-14520-1-git-send-email-s.trumtrar@pengutronix.de>
 <20140314161403.GN25870@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RBdmpsAEjcqDYAXp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140314161403.GN25870-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--RBdmpsAEjcqDYAXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 14, 2014 at 04:14:03PM +0000, Mark Rutland wrote:

> > +Synopsys DesignWare SPI master controller.
> > +
> > +Required properties:
> > +- compatible : "snps,dw-spi-mmio"

> Is there not a better name than "dw-spi-mmio"?

> What's the full name of the device, as on a datasheet? Is there no model
> number?

It's a Synopsis Designware IP block rather than a part - Google suggests
DW_apb_ssi.

--RBdmpsAEjcqDYAXp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTIy2jAAoJELSic+t+oim9C7sP/30oTUa1x3+VheIKQJVb2+2k
74wVEmEUjqAcudOsaxcNKIS+6w4XO0J8SSHWsDELSWQltFYjrZhPSYhXFtimYuBB
75pPCC9nhUKxawC40clGqVcbzlp5zDUg9o1SojM3qt8E3xM1phKQ2dhmvaTcH2WR
YznQDtDnddAeZ6Yqs3+ExBCZI7hGzf0JdUDcqWde0Qk0nSxQnUM6NDSMMkJo2/D3
IqN10ADUjJ8I0Cah6TPrMA52Yguq098IwVOYLj7tBJxErntSmV97/zMXquofJXF5
/h4aIsjRxQZWc8J1FmhYlAZD/LEIBkZAywImaxXw8nHhsDaUTdMOBjCDNrukpsSk
Y4TtII0KMLi1t52yPwc4GQkrRcM5tGvUcFX7yMvR9RCX9tr5R09D7XYEU+xohm4N
LwSACeOAhGaHvgzTykOe0NGGr/MXitDEOrXURxslEx+DoP1AO03vU6tT4QcyyJ2m
jhHC1Bty7wcIzx7s3wW0lEH2DHIwtI6krCQruHazvQh2IarIETXJnBq+vmnUxji7
Vw+qC2lpIBjgI9Wm9meyW7sIwt5c6/RXb74cMGmJ6LrAeR1HJ+f6plj2ydIRUZX6
Lo6zpPMzccZtxA+9mJIS618GT89M6sfzmCJ7tYsWFwAw+UXGswPSaz1Kw038DU2w
4m5AO+U7TAoMVvBFg6Ao
=lYhQ
-----END PGP SIGNATURE-----

--RBdmpsAEjcqDYAXp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
