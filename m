From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/3] Add DT bindings documentation for NS2 USB DRD phy
Date: Tue, 28 Mar 2017 17:57:30 +0530
Message-ID: <1490704052-11314-2-git-send-email-raviteja.garimella@broadcom.com>
References: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490704052-11314-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation for NS2 DRD Phy driver DT bindings

Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/phy/brcm,ns2-drd-phy.txt   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
new file mode 100644
index 0000000..04f063a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
@@ -0,0 +1,30 @@
+BROADCOM NORTHSTAR2 USB2 (DUAL ROLE DEVICE) PHY
+
+Required properties:
+ - compatible: brcm,ns2-drd-phy
+ - reg: offset and length of the NS2 PHY related registers.
+ - reg-names
+   The below registers must be provided.
+   icfg - for DRD ICFG configurations
+   rst-ctrl - for DRD IDM reset
+   crmu-ctrl - for CRMU core vdd, PHY and PHY PLL reset
+   usb2-strap - for port over current polarity reversal
+ - #phy-cells: Must be 0. No args required.
+ - vbus-gpios: vbus gpio binding
+ - id-gpios: id gpio binding
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+	usbdrd_phy: phy@66000960 {
+			#phy-cells = <0>;
+			compatible = "brcm,ns2-drd-phy";
+			reg = <0x66000960 0x24>,
+			      <0x67012800 0x4>,
+			      <0x6501d148 0x4>,
+			      <0x664d0700 0x4>;
+			reg-names = "icfg", "rst-ctrl",
+				    "crmu-ctrl", "usb2-strap";
+			id-gpios = <&gpio_g 30 0>;
+			vbus-gpios = <&gpio_g 31 0>;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
