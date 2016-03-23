From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 3/4] mtd: nand: set ECC algorithm in nand_dt_init
Date: Wed, 23 Mar 2016 11:19:02 +0100
Message-ID: <1458728343-1234-4-git-send-email-zajec5@gmail.com>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use recently added of_get_nand_ecc_algo for that.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mtd/nand/nand_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
index f2c8ff3..ef977f3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3979,7 +3979,7 @@ ident_done:
 static int nand_dt_init(struct nand_chip *chip)
 {
 	struct device_node *dn =3D nand_get_flash_node(chip);
-	int ecc_mode, ecc_strength, ecc_step;
+	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
=20
 	if (!dn)
 		return 0;
@@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
 		chip->bbt_options |=3D NAND_BBT_USE_FLASH;
=20
 	ecc_mode =3D of_get_nand_ecc_mode(dn);
+	ecc_algo =3D of_get_nand_ecc_algo(dn);
 	ecc_strength =3D of_get_nand_ecc_strength(dn);
 	ecc_step =3D of_get_nand_ecc_step_size(dn);
=20
@@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_mode >=3D 0)
 		chip->ecc.mode =3D ecc_mode;
=20
+	if (ecc_algo >=3D 0)
+		chip->ecc.algo =3D ecc_algo;
+
 	if (ecc_strength >=3D 0)
 		chip->ecc.strength =3D ecc_strength;
=20
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
