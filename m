From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V5 1/2] regulator: Add document for MT6323 regulator
Date: Tue, 9 Feb 2016 12:41:33 +0000
Message-ID: <20160209124133.GE13270@sirena.org.uk>
References: <1454874037-38905-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454874037-38905-1-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, chen.zhong@mediatek.com, HenryC.Chen@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 07, 2016 at 08:40:36PM +0100, John Crispin wrote:

> +Required properties:
> +- compatible: "mediatek,mt6323-regulator"

I'm really not happy with MFD subfunctions like this which add no
information over the parent device name appearing directly in the
binding, it results in us putting Linux specifics about how we split the
device up into the driver.  It's not like this could realistically be
used separately to the parent device.  Just have the MFD create the
device directly or if the individual regulators are reusable IPs which
can share a driver then describe them as such in the DT.

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWud58AAoJECTWi3JdVIfQPf0H/jEkIXIvvJDcvu9AQclWFyDn
ft5K80u4zn4Hb6bfZ2mfAKtzAPQnBnloXHrkzuy+vfUBhX1iMNLBtJhGmFmuNQRx
37MYAN5ZRNULlLiMK9a7f0l6JLJjjFntoBr695EOqabIK/Itw02Sbo5UAiUHjTvI
3uL4Ri55W6k33AhhAROwh2eRXtvdbTi0p/9oQQj8+rvaualF/DOm/5PhPgURzu2+
kzK7Oh4Rsdmvil8v84xXawRHeThWo4J0M2owKKQrbJBuOCmHdaxTElhZn8GeGK5Q
Y0PzgInGdh5TtDMRD5wOIoEcSjpOS1GGhWT/FwF+Xnn1cWgr1YVugvAGpfbMRvk=
=Mgy3
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
