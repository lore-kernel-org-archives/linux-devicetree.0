From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Wed, 17 Sep 2014 11:36:00 -0700
Message-ID: <20140917183600.GT7960@sirena.org.uk>
References: <1409029109-28769-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1409029109-28769-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20140826072727.GB9574@lee--X1>
 <20140917161554.GJ30918@lee--X1>
 <20140917181939.GG10179@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qAWpXEdoCCy57CK7"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140917181939.GG10179@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--qAWpXEdoCCy57CK7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 17, 2014 at 11:19:40AM -0700, Bjorn Andersson wrote:

> The regulator driver have a strong dependency on the mfd driver, but Kconfig
> will make sure it's not selectable until the two parts merges again, so it
> should be fine. But I guess it's up to Mark?

Yes, that's the normal approach.  I'd have applied it but a lot of the
early discussion seemed to be about the register I/O interface.

--qAWpXEdoCCy57CK7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUGdSPAAoJECTWi3JdVIfQrs8H/jAAOz2hwR9v9oCGfy6P1N8h
zSNLAamZTQFrAo7km54+1kAxmhLQBpEeUNra6z/WYCuv9G6FkGSbIS74YDRx+jRV
Sm1O2vr8ejFm0ERCosivnlicmA1x76b6/Kd2rsbmPVGOn+WcmqPCmKKbZHWwTRtl
Fd6/08r1bd25S89Tz9QlAfEoEicqAz1UIXVs9LxAaw9Tnh+9/eGzdLk8nhczYJiA
ciw9uP0DEvbQks4gkg+yFWFLlSFkyY6WJDI8yGXeHJ9oPnUFX6C3dH2kF3L14Rav
p1YNwG99C+yEOuLPFq4hPIJFmQr904xO2lVKwu5MDN0jp3bcdoKe4QTy4S0h4Ss=
=U6zP
-----END PGP SIGNATURE-----

--qAWpXEdoCCy57CK7--
