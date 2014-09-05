From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/4] usb: gadget: pxa27x_udc: add devicetree support
Date: Fri, 5 Sep 2014 10:58:32 -0500
Message-ID: <20140905155832.GG24449@saruman.home>
References: <1409511732-15259-1-git-send-email-robert.jarzmik@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409511732-15259-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 31, 2014 at 09:02:09PM +0200, Robert Jarzmik wrote:
> Add support for device-tree device discovery. If devicetree is not
> provided, fallback to legacy platform data "discovery".
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

please split this patch. First add udc->gpio and fix all the gpio
details, then add devicetree.

--=20
balbi

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUCd2oAAoJEIaOsuA1yqREauAP/3FYogGek5l07kRm2wxKXeWy
Zro9LULc5xZoZTf8jnm35k3P5lPUBNEJLUZwqsw9ZQTfuMU9a9z9cV6Zb/wyZzGh
z821Qczta5KC6xBRpQlGaakZ+yPZY9iOp4VpRr55oE7/GUX+peKbFtCxZomOw65r
U7PdjPamtNTl/nlmznPuqHNl7iLfNvdXCMIYAhNit/09a8ihQ+ODc+c7Po0ugQS/
kUBnzbrnOvAY9kH62BFDK1dXRJLgVr4SZPf86zXRrCGmSWd/DFtV4dLfgOgn1ZOg
SHstR0ncvN8i/naGlwnX5HXShwGIRBPLWZskb5A6Dnr/gDkHH7na3x4xaPoHbxPJ
nn/DQSTKkvTOSmdd2iNrbIAY0w3XtJkRnncysSglrj7wkbAn3ii5bj3xy8Y3w9Nt
vaKX1VdkMzZ65itkBqyro21GpvNpfnObRXWwRShSeU40Sm/ow45+oRVIXV4Iw1+M
nF/ORqP1BxfvYN/YdXsSdBjhQ6hQOQoxfygv+dIO1bXveQKZ96VpG4Hg5aDjm96O
2kfxSFnkTVTvvyXF/YIa04nhuJ4e7XSOK8QkcUCgDM0/gAdS4TPUjSRILjLY0wgz
YhxKBV5Vb6cnZEAnaJvK9M/7oTHhVUCfHSqR8NnexI2PTTDe9MIzX/ntCxmAIiB0
rE5ChY2SYRG6B0SbaxLe
=aNKe
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
