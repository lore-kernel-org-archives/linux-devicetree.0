From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] phy: rcar-gen3-usb2: revise the example of device tree doc
Date: Wed, 24 Aug 2016 15:49:21 +0900
Message-ID: <1472021362-8085-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

The clocks property should be set to &cpg, not &mstpX_clks.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index 2281d6c..b54fb36 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -30,11 +30,11 @@ Example (R-Car H3):
 		compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
 		reg = <0 0xee080200 0 0x700>;
 		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp7_clks R8A7795_CLK_EHCI0>;
+		clocks = <&cpg CPG_MOD 703>;
 	};
 
 	usb-phy@ee0a0200 {
 		compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
 		reg = <0 0xee0a0200 0 0x700>;
-		clocks = <&mstp7_clks R8A7795_CLK_EHCI0>;
+		clocks = <&cpg CPG_MOD 702>;
 	};
-- 
1.9.1
