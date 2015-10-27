From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 27 Oct 2015 09:16:08 +0900
Message-ID: <20151027001608.GJ28319@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk>
 <562ACCCC.503@ti.com>
 <20151024221457.GS29919@sirena.org.uk>
 <562D3F77.5040205@ti.com>
 <20151026004320.GU29919@sirena.org.uk>
 <562E4B1D.4060205@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6lCXDTVICvIQMz0h"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562E4B1D.4060205-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6lCXDTVICvIQMz0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2015 at 10:47:41AM -0500, Andrew F. Davis wrote:
> On 10/25/2015 07:43 PM, Mark Brown wrote:

> >>.of_compatible = "mediatek,mt6397-regulator",

> >This is in the MFD, this is not used in actual systems.

> Not sure what you mean by "actual systems", it looks like these
> use it?:

> arch/arm/boot/dts/mt8135-evbp1.dts
> arch/arm64/boot/dts/mediatek/mt8173-evb.dts

To repeat: the regulator driver does not register a compatible string
for the device for device model probing.

> I understand this, I thought we are talking about compatible strings in
> the regulator sub-node, not how the core instantiates the sub-driver.

No, this exactly about how the device model devices are instantiated.

--6lCXDTVICvIQMz0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLsJHAAoJECTWi3JdVIfQfMsH+QEmDoUieeLnFtOsfzaDde6H
6l9DgqVcGQXGrHkmZzxZ7gGXHfhNityaFRvuuFox6hrROf7MnPozQtD3WYM3Irpk
XM24Ucms04mOi502qu/k1K6sr8Zy+FdnrNyVYBFeKI+IinT2PrfW6lCL97SkBM6M
YtTlLNgPO0gnqYiFoSWxOhtubjISOr97ZimYr0eVf8QSsYKPckGSyY5m02IX5geE
SttAS6UIsgv8hKLSfcl9xVQsCryeniTh25kr6q6RvVMBtVAM/epMs0SS2EhfIgJ6
0ac1fSbNe2YgFx28d/jQv2qyCVb76rEJ82HVemttZDek34MSm9qlimoBnIUwBGE=
=lNrx
-----END PGP SIGNATURE-----

--6lCXDTVICvIQMz0h--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
