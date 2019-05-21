From: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength and nand-ecc-step-size optional
Date: Tue, 21 May 2019 10:44:21 -0400
Message-ID: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

nand-ecc-strength and nand-ecc-step-size can be made optional as
brcmnand driver can support using raw NAND layer detected values.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index bcda1df..0d952af 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -101,12 +101,12 @@ Required properties:
                               number (e.g., 0, 1, 2, etc.)
 - #address-cells            : see partition.txt
 - #size-cells               : see partition.txt
-- nand-ecc-strength         : see nand.txt
-- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
 
 Optional properties:
+- nand-ecc-strength         : see nand-controller.yaml
+- nand-ecc-step-size        : must be 512 or 1024. See nand-controller.yaml
 - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
-                              chip-select. See nand.txt
+                              chip-select. See nand-controller.yaml
 - brcm,nand-oob-sector-size : integer, to denote the spare area sector size
                               expected for the ECC layout in use. This size, in
                               addition to the strength and step-size,
-- 
1.9.0.138.g2de3478
