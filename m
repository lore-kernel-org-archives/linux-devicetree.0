From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 2/2] mfd: dt: tps65910: add power off control
Date: Fri, 17 Aug 2012 12:42:39 +0200
Message-ID: <20120817104239.GB27633@avionic-0098.mockup.avionic-design.de>
References: <1345194989-11614-1-git-send-email-bilhuang@nvidia.com>
 <1345194989-11614-3-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1345194989-11614-3-git-send-email-bilhuang@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bill Huang <bilhuang@nvidia.com>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, broonie@opensource.wolfsonmicro.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, xxie@nvidia.com, lrg@slimlogic.co.uk, jhovold@gmail.com, kyle.manna@fuel7.com, rklein@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 02:16:29AM -0700, Bill Huang wrote:
> Add DT property "ti,system-power-controller" telling whether or not this
> pmic is in charge of controlling the system power, so the power off
> routine can be hooked up to system call "pm_power_off".
>=20
> Based on the work by:
> Dan Willemsen <dwillemsen@nvidia.com>
>=20
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/mfd/tps65910.txt |    4 +++
>  drivers/mfd/tps65910.c                             |   22 ++++++++++++++=
++++++
>  include/linux/mfd/tps65910.h                       |    3 ++
>  3 files changed, 29 insertions(+), 0 deletions(-)

The same comments as for the tps6586x driver apply here as well.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLiAfAAoJEN0jrNd/PrOhSxUP/27inzoTXZrLGBCY4IbIpCvm
4uSytMuF2jTg4tjfdyL8oQiZrOmn+tL2P4NmfWtPdPsitCKNN8WfifaWwDKgfRNf
uYsXqqkTJj3taGf0XUckEjRqFNN4vsEw9/xJPAifFaPe64csr+RjbG2Pv/+p/X5A
Tq51vakF8ResilT6uLXS+SvRdl1cmkmWYWGwgrrXdkE5DzPMd6LbEvEMMxziVJQS
r8Q4RtUjjXTX0nwKGobihid2QMwzPTpv7C0zzwQoLkcR0OGSwuatGsc13uLNePyc
tY+UHiJhv34vu15GU5VpIisy5mFxLGtLzzo5pgdp4E8AfeUgHbIqOHo2OYajgjok
G4qA2oLtY7w2Xhn5X3L9GImHKhdbq9JgWvvg567aRnOP070d+WrAcXtWDBwjY0ZC
CGX3l9+KxncJqMvv8I2aqkXj/2mmq4iSoIaCWsDdCxGAt/A++WDJHFQOkvO3O1ON
YZBD4HnBhiInZcGhxe6tukS8A2wcK9iWemNYaTi4xk4oAR3iSKO9BFSq9F6sXapl
lftQ1LtK8fPFWoH63vAEkHEGri2V9qtmOFDtf5cOdIdkHsALmq+BscKXMPISanC1
I6Vux1gS/Exl810JijzvNuuzUa9QsEK8NbTlDzRfGSb0q9ISfmJ/Rj41N6bcRkIe
UNxl4DRwV3V9/aL2XeaY
=J3+f
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
