From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 10/11] of: mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch" mapping
Date: Sun, 17 Apr 2016 19:11:43 +0200
Message-ID: <1460913104-27388-11-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460913104-27388-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

There isn't any difference between handling NAND_ECC_SOFT and
NAND_ECC_SOFT_BCH now. What matters is the new field called "algo".
Please note we're keeping backward DT compatibility. We are still
treating "soft_bch" value as the one setting Hamming algorithm, it's
just handled in of_get_nand_ecc_algo now.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 drivers/of/of_mtd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index 15d056e..a70a38c 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -22,7 +22,6 @@ static const char *nand_ecc_modes[] =3D {
 	[NAND_ECC_HW]		=3D "hw",
 	[NAND_ECC_HW_SYNDROME]	=3D "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	=3D "hw_oob_first",
-	[NAND_ECC_SOFT_BCH]	=3D "soft_bch",
 };
=20
 /**
@@ -45,6 +44,14 @@ int of_get_nand_ecc_mode(struct device_node *np)
 		if (!strcasecmp(pm, nand_ecc_modes[i]))
 			return i;
=20
+	/*
+	 * For backward compatibility we support few obsoleted values that do=
n't
+	 * have their mappings into nand_ecc_modes_t anymore (they were merge=
d
+	 * with other enums).
+	 */
+	if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_SOFT;
+
 	return -ENODEV;
 }
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
--=20
1.8.4.5
