From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] fixed-regulator: dt-bindings: Fixed building error for
 compatible property
Date: Fri, 20 Sep 2019 11:55:38 +0100
Message-ID: <20190920105538.GB3822@sirena.co.uk>
References: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2019 at 12:09:04PM +0530, Pragnesh Patel wrote:
> Compatible property is not of type 'string', so remove const:
> from it.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.  There's no
need to resubmit to fix this alone.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2EsCkACgkQJNaLcl1U
h9CKhwf+O7GegnloAg4l4BjReZMOu45L2Pdn4/Ua9uM40hSO+MKWFBZlFYJWz/Pe
+b3y1K+kLxQY+z+OnkT23Rr/j4h4FXeKgKdWwjek7va80C+1EPzOYM28VfF8PF86
rMnymJPk0vbq6Xm05nZX++dApXDPLHMJHVpLh3lZUoNz4b++K9nWUhNpGsRWLNFY
TyjGqyyGS08YbjCAUp+pJqGmVUSqW2JJBE1HrR/ru5h8RqL7+mBbAmR0GdnSwNIp
rUQazY+9heCGRjz/Qjamgkp4HPozARGTFgcYjhSVpAOcaFlQdFfPTTwyUANM3woC
5Thuz1bWC8uJiLZvwTuXPmdYODDusA==
=hxy2
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
