From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v2 0/4] Allow to specify an ECC scheme through DT
Date: Tue, 1 Apr 2014 12:04:17 +0200
Message-ID: <20140401100417.GI27979@kw.sim.vm.gnt>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2843867268523534050=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>, Willy Tarreau <w@1wt.eu>, Simon Guinot <sguinot@lacie.com>, linux-mtd@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--===============2843867268523534050==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YPJ8CVbwFUtL7OFW"
Content-Disposition: inline


--YPJ8CVbwFUtL7OFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2014 at 08:34:46AM -0300, Ezequiel Garcia wrote:
> Now that we have agreed on the ECC devicetree binding, here's a patchset
> that makes pxa3xx-nand driver use it.
>=20
> This work is required on platforms where the flash device reports a requi=
red
> ECC strength, but that are capable of handling a stronger one. Simon Guin=
ot
> reported a situation where the vendor provided a bootloader configured wi=
th
> a stronger than required ECC scheme. Without this patches, such a situati=
on
> would require a hack to make the driver use a specific ECC scheme.
>=20
> (Simon: it would be great if you can confirm this allows you to remove an=
y hacks).

Hi Ezequiel,

I confirm this allows me to configure the ECC strength and step size
=66rom DT.

Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks.

Simon

>=20
> The first two patches clean the pxa_ecc_init(), preparing for the real
> work to be done.
>=20
> The third patch makes use of the ECC strength and ECC step size parameter=
s.
> To ensure full backward compatibility, the patch *tries* to use DT-specif=
ied
> ECC parameters, falling back to using the ONFI-specified settings if the
> former are missing.
>=20
> Also, we use the ONFI 'datasheet' ECC strength requirement, to ensure the
> DT-specified ECC strength is strong enough to meet the requirement.
>=20
> Finally, the last patch updates the documentation binding, with the suppo=
rted
> ECC parameters.
>=20
> Tested on Marvell's Armada 370 RD and also Compulab's CM-X300 (PXA3xx SoC=
),
> which is a non-DT platform. Based on today's l2-mtd.git.
>=20
> Changes from v1:
>=20
>   * Fixed typo in ECC strength normalization calculus.
>=20
> Ezequiel Garcia (4):
>   mtd: nand: pxa3xx: Normalize ECC strength for ECC scheme selection
>   mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
>   mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
>   mtd: nand: pxa3xx: Add supported ECC strength and step size to the DT
>     binding
>=20
>  .../devicetree/bindings/mtd/pxa3xx-nand.txt        |  8 +++
>  drivers/mtd/nand/pxa3xx_nand.c                     | 78 +++++++++++++---=
------
>  include/linux/platform_data/mtd-nand-pxa3xx.h      |  3 +
>  3 files changed, 59 insertions(+), 30 deletions(-)
>=20
> --=20
> 1.9.0
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--YPJ8CVbwFUtL7OFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlM6jyEACgkQgtp0PDeOcDrJYwCbB37olW/nb3Be40qffuROAMUa
vMwAn3rZ9C8K4VHc2o76KoLzzENN3KIZ
=RmDT
-----END PGP SIGNATURE-----

--YPJ8CVbwFUtL7OFW--


--===============2843867268523534050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2843867268523534050==--
