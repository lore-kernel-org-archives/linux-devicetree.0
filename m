From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC] regulator: da9052/53: da9052-i2c.txt binding document
 changes
Date: Wed, 27 Jul 2016 19:24:17 +0100
Message-ID: <20160727182417.GW11806@sirena.org.uk>
References: <6ED8E3B22081A4459DAC7699F3695FB70173DAC199@SW-EX-MBX02.diasemi.com>
 <6ED8E3B22081A4459DAC7699F3695FB70173DB39F6@NB-EX-MBX02.diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NQqDiQVflaif2hna"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6ED8E3B22081A4459DAC7699F3695FB70173DB39F6@NB-EX-MBX02.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DEVICTREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, "Ying-Chun Liu (PaulLiu" <paul.liu@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Shawn Guo <shawn.guo@linaro.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--NQqDiQVflaif2hna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 25, 2016 at 11:31:27AM +0000, Steve Twiss wrote:

> There are already several device tree files using a naming scheme different to that found
> in the binding text document. Since those have been used for real already, I will just follow
> those existing DT file naming conventions instead.

The other thing you can try to do here is have a -v2 binding with the
corrected names that's easier for people to follow though it does make
the implementation more complex and may not be worth it.

--NQqDiQVflaif2hna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXmPxQAAoJECTWi3JdVIfQc7UH/R0Atm/sbo9H75SaZVsczyOP
DBDibkmtKXWov8mEeq7LWOO0eINr0oN9ybZWYrvvIM3VOiK5n2nG55QcFzt+1Sxj
a6e5Rjn3rymj0Znb5SPXrtRsUHnmC6lD2Ik1CZXxZKZj8gQwMtqqbq9GOFDedLn9
IcKP/Q/8S7ysYvE51AMIO0FFF2R2ExPlSI6M6C1Pe3ZBRjfIa33ccLZXlsdVEPS7
1FNl25/9julb3ijmDo0dCI2ZINyc6x5sxSYFY+vwjG5PTf62kwhNuo/vLg3AlnTp
D+Rp23s8LzMrxKI8f3CXOPBEkGqH49yjB1Qp1bl8gDq4jbahqFj4ZDeJ0Xqf6pM=
=T4kX
-----END PGP SIGNATURE-----

--NQqDiQVflaif2hna--
