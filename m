From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: gadget: udc: renesas_usb3: add support for R-Car M3-W
Date: Fri, 28 Jul 2017 21:16:59 +0900
Message-ID: <1501244219-11840-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for R-Car M3-W. This patch also adds R-Car
Gen3 generic version's compatible.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 +++++++++++++---
 drivers/usb/gadget/udc/renesas_usb3.c                  |  8 ++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 8d52766..e280258 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -3,20 +3,30 @@ Renesas Electronics USB3.0 Peripheral driver
 Required properties:
   - compatible: Must contain one of the following:
 	- "renesas,r8a7795-usb3-peri"
+	- "renesas,r8a7796-usb3-peri"
+	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 compatible
+	  device
+
+    When compatible with the generic version, nodes must list the
+    SoC-specific version corresponding to the platform first
+    followed by the generic version.
+
   - reg: Base address and length of the register for the USB3.0 Peripheral
   - interrupts: Interrupt specifier for the USB3.0 Peripheral
   - clocks: clock phandle and specifier pair
 
-Example:
+Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
-		compatible = "renesas,r8a7795-usb3-peri";
+		compatible = "renesas,r8a7795-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
 		reg = <0 0xee020000 0 0x400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 328>;
 	};
 
 	usb3_peri1: usb@ee060000 {
-		compatible = "renesas,r8a7795-usb3-peri";
+		compatible = "renesas,r8a7795-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
 		reg = <0 0xee060000 0 0x400>;
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 327>;
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index aa2b185..45410f3 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2506,6 +2506,14 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 		.compatible = "renesas,r8a7795-usb3-peri",
 		.data = &renesas_usb3_priv_gen3,
 	},
+	{
+		.compatible = "renesas,r8a7796-usb3-peri",
+		.data = &renesas_usb3_priv_gen3,
+	},
+	{
+		.compatible = "renesas,rcar-gen3-usb3-peri",
+		.data = &renesas_usb3_priv_gen3,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usb3_of_match);
-- 
1.9.1
