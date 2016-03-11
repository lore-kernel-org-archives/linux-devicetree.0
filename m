From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Fri, 11 Mar 2016 09:29:45 +0100
Message-ID: <1457684989-13318-1-git-send-email-petr@barix.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
---
v1: <initial>

v2:
 - using standard properties "dr_mode", "mentor,power", "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits"
 - using "ti," prefix instead of "da8xx," for specific property names
 - no wildcards in compatibility string

v3:
 - added "reg", "interrupts" and "interrupt-names" properties
 - wildcards in compatibility string

v4:
 - compatibility string set to "ti,da830-musb"
 - "mentor,num-eps", "mentor,multipoint", "mentor,ram-bits" properties removed and hardcoded
 - "ti,phy20-clkmux-cfg" renamed to "ti,phy20-clkmux-pll" and changed to boolean
 - removed "ti,hwmods"

v5:
 - "ti,phy20-refclock-frequency" property made mandatory

v6:
 - using "ti,usb2-phy-" prefix instead of "ti,phy20-" for the specific properties

v7:
 - removed the "mentor,power" property; hard coded to 500mA in the code

v8:
 - "ti,usb2-phy-refclock-frequency" renamed to "ti,usb2-phy-refclock-hz" and description amended
 - "ti,usb2-phy-clkmux-pll" changed to "ti,usb2-phy-clkmux-refclkin" to reflect the more common case
 - USB maximum power modelled via a regulator "vbus-supply"

v9: <no change>
v10: <no change>

 .../devicetree/bindings/usb/da8xx-usb.txt          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
new file mode 100644
index 0000000..a6eda5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -0,0 +1,45 @@
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
+ - vbus-supply: Phandle to a regulator providing the USB bus power.
+
+ - ti,usb2-phy-refclock-hz : Integer. Frequency in Hz of the USB 2.0 PHY reference clock,
+     either provided by the internal PLL or an external source.
+     The supported values are: 12MHz, 13MHz, 19.2MHz, 20MHz, 24MHz, 26MHz, 38.4MHz, 40MHz, 48MHz.
+
+
+Optional properties:
+~~~~~~~~~~~~~~~~~~~~
+ - ti,usb2-phy-clkmux-refclkin: Boolean. Defines the USB 2.0 PHY reference clock source.
+     If present the the external USB_REFCLKIN pin is used as a clock source, otherwise
+     the internal PLL is used.
+
+Example:
+
+	usb20: usb@1e00000 {
+		compatible = "ti,da830-musb";
+		reg =   <0x00200000 0x10000>;
+		interrupt-parent = <&intc>;
+		interrupts = <58>;
+		interrupt-names = "mc";
+
+		dr_mode = "host";
+		vbus-supply = <&usb_vbus>;
+
+		ti,usb2-phy-refclock-hz = <24000000>;
+
+		status = "okay";
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
