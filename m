From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 13:14:09 +0100
Message-ID: <20151021121409.GA8232@sirena.org.uk>
References: <1445014753-15450-2-git-send-email-afd@ti.com>
 <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
 <20151021084633.GB3270@x1>
 <20151021102952.GJ32054@sirena.org.uk>
 <20151021111832.GC3270@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151021111832.GC3270@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2015 at 12:18:32PM +0100, Lee Jones wrote:
> On Wed, 21 Oct 2015, Mark Brown wrote:
> > On Wed, Oct 21, 2015 at 09:46:33AM +0100, Lee Jones wrote:
> > > On Tue, 20 Oct 2015, Andrew F. Davis wrote:

> > It is however the normal way we write compatible strings - the class
> > information would normaly go in the node name (ie, i2c@7000c000 or
> > whatever).

> I didn't say it hasn't been done before, just that I didn't like it
> for the aforementioned reasons.  I can also find 1000's of compatible
> strings which do append "-<device_type>", so it's not exactly an
> unheard of practice.

It's a pretty substantial change in the way we make compatible strings
that we probably want to discuss more widely if we want to adopt it -
we've not been using that idiom and it's pretty surprising.  I'm not
really sure it help much and we do already have the pre-@ noise words
for this purpose (as well as comments in the DT).

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWJ4GLAAoJECTWi3JdVIfQz0AH/RiB/O4Izz9j0mLRswa2X/ZS
L4mt3pbMxHGQiDpXB3TRXbPD4LJqWVuz35mNF+I62PVSCEKFF7OcfxGaAsUyJ/Fg
MywZ1tKWRSs01PbHNdjTmb/ygVB8ty2SJz7RGPgG50MKCFGNy3Ahw+TSOPialIOf
I1vWiCRdFKVflWcHWRSfwhqNaGYg7rSboKJCjWuo3kMGxB1VAo1ZLX9mWpNUzZPI
xi3cSxV2ARp+ow1CXa1t2VppMxfVhMg7BfCATTI/ETNE3qwzvxkj/r7W5xQUPPt1
hGUJWwseSMx0TtM53qbleO/wjJtq6d4Si2Pml08vTSZmaTYY/syUr7tN3tSZ0B8=
=t1Uq
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
