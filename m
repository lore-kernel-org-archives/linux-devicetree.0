From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] regulator: support for regulator match by
 regulator-compatible
Date: Tue, 19 Jun 2012 11:43:18 +0100
Message-ID: <20120619104254.GD3974@opensource.wolfsonmicro.com>
References: <1340085087-6608-1-git-send-email-ldewangan@nvidia.com>
 <1340085087-6608-2-git-send-email-ldewangan@nvidia.com>
 <20120619093211.GB3974@opensource.wolfsonmicro.com>
 <4FE04788.5040008@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p//XFgTqeVWI1epd"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FE04788.5040008@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--p//XFgTqeVWI1epd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 19, 2012 at 03:04:00PM +0530, Laxman Dewangan wrote:

> Agree. Currently following regulators are using this (based on grep)
> mfd/tps6586x.c
> regulator/ab8500.c
> regulator/db8500-prcmu.c
> and regulator/tps65910.

That looks about right.

> If the related change in tps65910 is fine and there is no more
> concern/feedback on the approach then I can create a series of patch
> to modify the other regulator and related dts file to follow the
> same.

> If you want, I can make the new changes as part of this series or
> can start with new series.

> I like to go with new series patch for other change once this is accepted.

I've no concerns with the interface or the code itself other than the
usability issue with partial deployment so if you could do the updates
for the other drivers that'd be great.  I'll hold off on applying this
until we've got everything else updated.

--p//XFgTqeVWI1epd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP4Fe2AAoJEBus8iNuMP3dlT8P/1S+Unnb6vNDeyfiRD6+e5wl
XaYllUIX6i/++H4/D5bdCU50tAbRadH2AXAMjEmtIk/boUn03s2jIIPvVC6neGOh
q2+8USJqarKSDHgGwc/uqEVPuuFcUG1PSdFbn3U9o5PdTB+r4qF2mnmSSCseeohr
zW/aWiiA7pgGJcs7L1aKMUC9gdq7BT675/GUy5RGAnZphFdXEJg5D2hI9LGL+lh+
mLEQiD0bdi0wjplagvu5hlDG136VhwuKiOhV1ujYRz70jEGrVoJogT0hzSuZ4Ec7
7a0IoH9qaun8TNrQMpL+iLFXhwulCn1Ca6D7nQBQE7tFetRmLbaTXM/EgX3ZOS1a
Z/CRr3T/48GLRTsh4oIRYcm8/pKIMJKPirQ986JX38CdreLAcjpMNfoDHiXBS3SP
bLNIVYm+dAV1ZaeSAEGaAea4uV9EDFFczMOyAq0sjQ9j9NB2YPmb0XoX63MNSKjW
XIt9jrdmieLPVpN1AmN5r/v9e1oFk+fu1vfhoLSYtS1RM/WtOrZH84xHSxEj1zUy
R+Mf9iscDvqMuEYWAU4tTE8tL9AhTN0coStdCLRtT24luofSRCKWvYC1Robpmr9F
RIuTNRpM1LnCkfYlNrUFDxpLt/sot3fXaw6Dwnh5iqTJ2kTOp71uNYzIag4ML0ck
O3Ejg0U0wcOz30ww6Nbs
=fAsv
-----END PGP SIGNATURE-----

--p//XFgTqeVWI1epd--
