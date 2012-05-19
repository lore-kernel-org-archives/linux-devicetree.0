From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2] regulator: dt: fix the name of regulator supply
Date: Sat, 19 May 2012 14:10:20 +0100
Message-ID: <20120519131019.GS4039@opensource.wolfsonmicro.com>
References: <1337369652-27094-1-git-send-email-ldewangan@nvidia.com>
 <20120519104303.GQ4039@opensource.wolfsonmicro.com>
 <4FB79444.9010306@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yBTw3iMQSKDA2CaE"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FB79444.9010306@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--yBTw3iMQSKDA2CaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 19, 2012 at 06:08:28PM +0530, Laxman Dewangan wrote:

> The descriptor is set on the regulator driver and hence it need to
> be parse this in the regulator driver.
> We need to set the name regulator_desc->supply_name and hence it
> needs to be in dt binding documentation of that device/regulators.

> Is this what you recommend?

I'm sorry, I still can't understand what you're trying to say here
especially the first sentance.  Listing the name of the supply in the
binding documentation doesn't seem like a bad idea if that's what you're
trying to say.

--yBTw3iMQSKDA2CaE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPt5rGAAoJEBus8iNuMP3dvV4P/1m/h6LAmHYV/jcG6+OvOSYq
N1sk61Lx5yEykhkMT2+8+d9bFPoKvPPqHAvrvwWXQcyMiHvH4oQ1N6MDb21/EPBf
J5LS8hyiIytW2JBbLbWEjUBSbiRyEvQyLsgXQqK7gXqr44UoiWIGRAbKx3EqTNb6
IIT3CS+5mx9fv8tTOBAnRO2FYqrrZyFPcbms4s7/12Qsk1DJ7gIM5Jgk7FZu3DM1
cWvbREuy49oY2esgN5+Bc8exJ9uZgrOSGgojz85P2Y//LrWEjrJqrFxHia8ccU+Z
VeBJN/AImrmpKnMR6BpEw+F40A0CKla3qWb6hubkt0sbxYQrP9MNcmKdfjHMvAHz
9erRuRMD/cH4yFUV63tTRYtrj6hY1M2gXIlT2U+I2tAeoZYT8md8EjOu3x54Rt3Y
xPDaoH/13v5yldK5nMRaoX5p9S0KcjnDlDLJKzRv/h029By1OBMb6P3Pem4Uhpd1
iWHTsHSOfVIm//Sru+UPD0zE7/EPb/VHsIutQ3kco55ClrQC7T7sXSYQqnkjjAh+
UODqC3n8fWr6dssf1u0sW5xd8HozaNh6RAc2VBrP6Syvi1w4gno4jF+0quDbTPtn
XbgYC+ilLcc1/x8c4lsLYWJzpmm9R/3wIW56astoj6Y6IcWH3f1/zfTsmaBz05FH
5LeWqp+c+0JjWfmcA5NT
=iuTy
-----END PGP SIGNATURE-----

--yBTw3iMQSKDA2CaE--
