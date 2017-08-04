From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/3] usb: gadget: udc: renesas_usb3: add support for R-Car M3-W
Date: Fri,  4 Aug 2017 11:16:58 +0900
Message-ID: <1501813018-6116-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for R-Car M3-W. This patch also adds R-Car
Gen3 generic version's compatible and changes ".compatible" in
the usb3_of_match from "renesas,r8a7796-usb3-peri" to
"renesas,rcar-gen3-usb3-peri".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 +++++++++++++---
 drivers/usb/gadget/udc/renesas_usb3.c                  |  2 +-
 2 files changed, 14 insertions(+), 4 deletions(-)

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
index aa2b185..b1e166c 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2503,7 +2503,7 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 
 static const struct of_device_id usb3_of_match[] = {
 	{
-		.compatible = "renesas,r8a7795-usb3-peri",
+		.compatible = "renesas,rcar-gen3-usb3-peri",
 		.data = &renesas_usb3_priv_gen3,
 	},
 	{ },
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
