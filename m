From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/3] Documentation: devicetree: deprecate "soft_bch" nand-ecc-mode value
Date: Fri, 22 Apr 2016 13:23:14 +0200
Message-ID: <1461324197-1333-2-git-send-email-zajec5@gmail.com>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Now that we support nand-ecc-algo property it should be used together
with "soft" to specify software BCH ECC.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documenta=
tion/devicetree/bindings/mtd/nand.txt
index 5ac4ab7..68342ea 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -20,8 +20,10 @@ Optional NAND controller properties
 Optional NAND chip properties:
=20
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
-  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_f=
irst",
-  "soft_bch".
+		  Supported values are: "none", "soft", "hw", "hw_syndrome",
+		  "hw_oob_first".
+		  Deprecated values:
+		  "soft_bch": use "soft" and nand-ecc-algo instead
 - nand-ecc-algo: string, algorithm of NAND ECC.
 		 Supported values are: "hamming", "bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
--=20
1.8.4.5
