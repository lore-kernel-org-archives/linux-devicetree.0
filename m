From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1] regulator: da9210: addition of device tree support
Date: Thu, 14 Jul 2016 16:48:21 +0100
Message-ID: <20160714154821.GA30372@sirena.org.uk>
References: <20160713154433.496843FAD9@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160713154433.496843FAD9@swsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 13, 2016 at 04:41:19PM +0100, Steve Twiss wrote:

> Two files are modified, the driver source file and the binding document.
> Updates for the regulator source file include an .of_match_table entry, node
> match checking in the probe() function for a compatible da9210 string, and
> a new "BUCK" regulator entry. The binding documentation changes have been
> made to reflect these updates.

If the device only has one regulator and no other functionality I'd
expect the properties to just be in the top level node for the device -
no need to go fiddling around with a subnode to hold another subnode to
hold all the properties.

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXh7REAAoJECTWi3JdVIfQCv4IAILgOPlda2npBqRig7IArbsm
dY4naqX70nOBD7+ceKBc+nGLl5mDP2Hafibq5gkKnW9uA5fhTXrPpc0YQJmxrG+7
0Cua3cN9Rn3YxhKuAPVCFrOsDFwPYWuFzpkQk8Mk2rxG6jkEc6Xq1dSNI3cumyCP
F9cE0d4eh7hGbwWMv4pncbe3iJkCdXH2IccWdf2WvEL5jZlL7stS9/HU401P0dgY
zd8NDEC20Tt0FBalFVBL0NzQrA1jRUgjDhhw/QLNCcUuDrgPzTyPqnVBLWgJbakc
RH+k4LLITQAgNaerY6nqtJVIwEPBEwMj9VAc9iEdy2LhWtBLZvrnt3DgIo8o1aI=
=VL6c
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
