From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 6/6] ARM: dts: mmp2: add OLPC XO 1.75 machine
Date: Sat, 3 Aug 2019 10:58:24 +0200
Message-ID: <20190803085824.GB8224@amd>
References: <20190802103326.531250-1-lkundrak@v3.sk>
 <20190802103326.531250-7-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190802103326.531250-7-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-08-02 12:33:26, Lubomir Rintel wrote:
> This is a fairly complete description of an OLPC XO 1.75 laptop.
> What's missing for now is the GPU, LCD controller, DCON, the panel and
> audio.

Ok, but I need GPU/LCD/panel... that's my only output. Is video
expected to work in 5.2? Does the firmware pass right device tree,
including the GPU/LCD/DCON?

Is there config somewhere I could use?

Thanks a lot,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1FTLAACgkQMOfwapXb+vKvhwCfRiwZa8E3fNBqMi6b0KGpOPIQ
EL0AnjUujlV3bPaUb0uSNTtgJ13k53kC
=DqjA
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
