From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
Date: Wed, 27 Jun 2012 13:46:47 +0300
Message-ID: <1340794007.29342.50.camel@sauron.fi.intel.com>
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-agi+MRH9evovqYYqw4oW"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1339064536-20553-1-git-send-email-stigge@antcom.de>
Sender: linux-doc-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org


--=-agi+MRH9evovqYYqw4oW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 12:22 +0200, Roland Stigge wrote:
> This patch adds support for the SLC NAND controller inside the LPC32xx So=
C.
>=20
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Now the write_page and write_page_raw functions return an error code,
see this commit in the l2 tree:

http://git.infradead.org/users/dedekind/l2-mtd.git/commit/49c8d9ab3b7073266=
5249f2d993f734378ebbba9

I've amended your SLC driver, see below the diff. But I think it could
return the real return code becuse it can fail - could you please take a
look and send an incremental patch?

Please, base your work on top of the l2-mtd tree:
git://git.infradead.org/users/dedekind/l2-mtd.git

Thanks!

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.=
c
index 796e37b..7e2e78d 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -673,9 +673,9 @@ static int lpc32xx_nand_read_page_raw_syndrome(struct m=
td_info *mtd,
  * Write the data and OOB data to the device, use ECC with the data,
  * disable ECC for the OOB data
  */
-static void lpc32xx_nand_write_page_syndrome(struct mtd_info *mtd,
-                                            struct nand_chip *chip,
-                                            const u8 *buf, int oob_require=
d)
+static int lpc32xx_nand_write_page_syndrome(struct mtd_info *mtd,
+                                           struct nand_chip *chip,
+                                           const u8 *buf, int oob_required=
)
 {
        struct lpc32xx_nand_host *host =3D chip->priv;
        u8 *pb =3D chip->oob_poi + chip->ecc.layout->eccpos[0];
@@ -691,20 +691,22 @@ static void lpc32xx_nand_write_page_syndrome(struct m=
td_info *mtd,
=20
        /* Write ECC data to device */
        chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+       return 0;
 }
=20
 /*
  * Write the data and OOB data to the device, no ECC correction with the
  * data or OOB data
  */
-static void lpc32xx_nand_write_page_raw_syndrome(struct mtd_info *mtd,
-                                                struct nand_chip *chip,
-                                                const u8 *buf,
-                                                int oob_required)
+static int lpc32xx_nand_write_page_raw_syndrome(struct mtd_info *mtd,
+                                               struct nand_chip *chip,
+                                               const u8 *buf,
+                                               int oob_required)
 {
        /* Raw writes can just use the FIFO interface */
        chip->write_buf(mtd, buf, chip->ecc.size * chip->ecc.steps);
        chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+       return 0;
 }
=20
 static bool lpc32xx_dma_filter(struct dma_chan *chan, void *param)


--=20
Best Regards,
Artem Bityutskiy

--=-agi+MRH9evovqYYqw4oW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6uSXAAoJECmIfjd9wqK0czYQAMkP5FNnN/B+qIwsdWX6+ea2
djtf95zk0KJ7Nla/0N3IwOY1vJJ8RNod6H1e7wxX1N7RV3rl9UJMqN445AwfXlt9
MMgMZwE2jj67POH00OjROIfZvOEg1URBBUY7CDfaW0830wAPofgTPUc/v96uVmSQ
wdzkXprLN9aRGJs7mua7x4BKf0Fe8DZAIl2znt9sOyUbSUmun8jTzFsnemqlI8Yi
8GabZJhpBuZXjNwi3HkKZLoXOaxbaUrFQswabnyQZxUxLeAWXZ/lc2/hRDiRaKqA
yzR1YZim+lDz2Jg89TBUUdVdrcDfn/+jUlIxnMMXFn7BZ+qaIiKPjjllNcFckoIY
ouAIMRwcYuFvW99KNE/xXdCXAbXImVwH34lm5Jl9tA1oA50hI4SN4vHuP1hTro67
9LYbWdJU8DhHZGDnUYGHRw2wVJAeiBRWp/gIZrrPaXLRpFlNnzOkbamiZoC3Zw8D
KxwCYQ92oywiEx7DDmj8fUrzd6Op/wT30Aey/sFJUrzlBzkrz8IkaZUPOJxHbFYT
0fh7PnJ5D2dGWP4GRNZKhukhkea5qjNRaDQtFMiKdpx2OZWcKrv8JtVJSfLtNjdF
CC3Vydt+V3S3RxjIc3dQ+lFti+5QOAal12SqK/Qgblwp3751cPlkgIgcznJR4NGM
xWev6Q5/RLoULGmx5Gzx
=nM4M
-----END PGP SIGNATURE-----

--=-agi+MRH9evovqYYqw4oW--

