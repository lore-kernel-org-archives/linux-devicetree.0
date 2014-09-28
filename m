From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Sun, 28 Sep 2014 11:22:02 +0100
Message-ID: <20140928102202.GM27755@sirena.org.uk>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
 <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YGQsgxOP0v8GKjPA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411779588-22031-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--YGQsgxOP0v8GKjPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 27, 2014 at 12:59:47AM +0000, Stefan Wahren wrote:
> This patch adds the Device tree bindings for the Freescale MXS
> on-chip regulators.

Use subject lines matching the style for the subsystem.

> +Required regulator properties:
> +- compatible: Must be "fsl,mxs-regulator"
> +- reg: Absolute physical address of the register set for the regulator
> +
> +Any regulator property defined as part of the core regulator
> +binding, defined in regulator.txt, can also be used.

While this should be using compatibles to identify which regulator is
being supported note that the binding doesn't document the fact that the
code makes regulator-name mandatory or what values are required.

--YGQsgxOP0v8GKjPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUJ+FJAAoJECTWi3JdVIfQKWkH/07JDU+MbOO0709bg6SPkhl/
AEOdpHTku5FHYJ7DSRUEmijpqjw+1s4YR2CYs1UmNseHUeFpKtkKrBBtpjrNsFnE
/ahHfCQPPy4JnLQpwpsD0lTB56bLV0z+NHTLRQPb3cuiBXyZykQTx9tNwcuD0ThH
WKa6hJm+3aYMtaE78sNPmUcDUjCzNbDHqopGvr1uJeMiuYIJdamHNGZp7fSWF3yR
7bMHnvoq7qBFcwVBOfI6HjvMfvybzURfan/hWaNTVGhA0FZx0r62Rd+x/2PeI9OF
UttFSaQerzOhoumc44DOXn62J6e3LZD7A6CNJ56A+wNHw3/Yvf0S63vWrkpFWn4=
=7ewL
-----END PGP SIGNATURE-----

--YGQsgxOP0v8GKjPA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
