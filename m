From: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/4] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Tue, 25 Oct 2016 16:39:02 +0200
Message-ID: <1477406345-27192-2-git-send-email-abailon@baylibre.com>
References: <1477406345-27192-1-git-send-email-abailon@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477406345-27192-1-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>

DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
new file mode 100644
index 0000000..5663d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -0,0 +1,43 @@
+TI DA8xx MUSB
+~~~~~~~~~~~~~
+For DA8xx/OMAP-L1x/AM17xx/AM18xx platforms.
+
+Required properties:
+~~~~~~~~~~~~~~~~~~~~
+ - compatible : Should be set to "ti,da830-musb".
+
+ - reg: Offset and length of the USB controller register set.
+
+ - interrupts: The USB interrupt number.
+
+ - interrupt-names: Should be set to "mc".
+
+ - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
+
+ - phys: Phandle for the PHY device
+
+ - phy-names: Should be "usb-phy"
+
+Optional properties:
+~~~~~~~~~~~~~~~~~~~~
+ - vbus-supply: Phandle to a regulator providing the USB bus power.
+
+Example:
+	usb_phy: usb-phy {
+		compatible = "ti,da830-usb-phy";
+		#phy-cells = <0>;
+		status = "okay";
+	};
+	usb20: usb@1e00000 {
+		compatible = "ti,da830-musb";
+		reg =   <0x00200000 0x10000>;
+		interrupts = <58>;
+		interrupt-names = "mc";
+
+		dr_mode = "host";
+		vbus-supply = <&usb_vbus>;
+		phys = <&usb_phy 0>;
+		phy-names = "usb-phy";
+
+		status = "okay";
+	};
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
