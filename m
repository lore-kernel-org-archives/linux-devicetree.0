From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] net/macb: bindings doc: Merge cdns-emac to macb
Date: Mon, 30 Nov 2015 14:51:46 +0100
Message-ID: <497a8248e7cf8b7f7f30d6c47c8591583dcc0bce.1448891503.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Merge two bindings for the same driver to together.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 Documentation/devicetree/bindings/net/cdns-emac.txt | 20 --------------------
 Documentation/devicetree/bindings/net/macb.txt      |  3 +++
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/cdns-emac.txt

diff --git a/Documentation/devicetree/bindings/net/cdns-emac.txt b/Documentation/devicetree/bindings/net/cdns-emac.txt
deleted file mode 100644
index 4451ee973223..000000000000
--- a/Documentation/devicetree/bindings/net/cdns-emac.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Cadence EMAC Ethernet controller
-
-Required properties:
-- compatible: Should be "cdns,[<chip>-]{emac}"
-  Use "cdns,at91rm9200-emac" Atmel at91rm9200 SoC.
-  Use "cdns,zynq-gem" Xilinx Zynq-7xxx SoC.
-  Or the generic form: "cdns,emac".
-- reg: Address and length of the register set for the device
-- interrupts: Should contain macb interrupt
-- phy-mode: see ethernet.txt file in the same directory.
-
-Examples:
-
-	macb0: ethernet@fffc4000 {
-		compatible = "cdns,at91rm9200-emac";
-		reg = <0xfffc4000 0x4000>;
-		interrupts = <21>;
-		phy-mode = "rmii";
-		local-mac-address = [3a 0e 03 04 05 06];
-	};
diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index b5d79761ac97..1361a6daf63f 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible: Should be "cdns,[<chip>-]{macb|gem}"
+  Use "cdns,at91rm9200-emac" Atmel at91rm9200 SoC.
   Use "cdns,at91sam9260-macb" for Atmel at91sam9 SoCs or the 10/100Mbit IP
   available on sama5d3 SoCs.
   Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
@@ -10,7 +11,9 @@ Required properties:
   Use "atmel,sama5d2-gem" for the GEM IP (10/100) available on Atmel sama5d2 SoCs.
   Use "atmel,sama5d3-gem" for the Gigabit IP available on Atmel sama5d3 SoCs.
   Use "atmel,sama5d4-gem" for the GEM IP (10/100) available on Atmel sama5d4 SoCs.
+  Use "cdns,zynq-gem" Xilinx Zynq-7xxx SoC.
   Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
+  Or the generic form: "cdns,emac".
 - reg: Address and length of the register set for the device
 - interrupts: Should contain macb interrupt
 - phy-mode: See ethernet.txt file in the same directory.
-- 
1.9.1
