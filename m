From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/3] mtd: nand: add support for "nand-ecc-algo" DT property
Date: Fri, 22 Apr 2016 13:23:13 +0200
Message-ID: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

So far it was only possible to specify ECC algorithm using "soft" and
"soft_bch" values of nand-ecc-mode prop. There wasn't a way to specify
it for a hardware ECC mode.

Now that we have independent field in NAND subsystem for storing info
about ECC algorithm we may also add support for this new DT property.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt |  2 ++
 drivers/mtd/nand/nand_base.c                   | 20 +++++++++++++-----=
--
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documenta=
tion/devicetree/bindings/mtd/nand.txt
index a17662b..5ac4ab7 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -22,6 +22,8 @@ Optional NAND chip properties:
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_f=
irst",
   "soft_bch".
+- nand-ecc-algo: string, algorithm of NAND ECC.
+		 Supported values are: "hamming", "bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not pres=
ent false
=20
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
index 7bc37b4..a5417a0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4003,17 +4003,23 @@ static int of_get_nand_ecc_mode(struct device_n=
ode *np)
 	return -ENODEV;
 }
=20
+static const char * const nand_ecc_algos[] =3D {
+	[NAND_ECC_HAMMING]	=3D "hamming",
+	[NAND_ECC_BCH]		=3D "bch",
+};
+
 static int of_get_nand_ecc_algo(struct device_node *np)
 {
 	const char *pm;
-	int err;
+	int err, i;
=20
-	/*
-	 * TODO: Read ECC algo OF property and map it to enum nand_ecc_algo.
-	 * It's not implemented yet as currently NAND subsystem ignores
-	 * algorithm explicitly set this way. Once it's handled we should
-	 * document & support new property.
-	 */
+	err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
+	if (!err) {
+		for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
+			if (!strcasecmp(pm, nand_ecc_algos[i]))
+				return i;
+		return -ENODEV;
+	}
=20
 	/*
 	 * For backward compatibility we also read "nand-ecc-mode" checking
--=20
1.8.4.5
