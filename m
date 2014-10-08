From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 2/2] ARM: shmobile: lager: enable HS-USB
Date: Wed, 08 Oct 2014 23:55:59 +0400
Message-ID: <2455064.TG6DqQLVoV@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1674850.BZpGW9kEud-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Enable HS-USB device for the Lager board, defining the GPIO that the driver
should check when probing. Since this board doesn't have the OTG ID pin, we
assume that GP5_18 (USB0_PWEN) is an ID pin because it is 1 when the SW5 is
in position 2-3 (meaning USB function) and 0 in other positions.

Note that there will be pinctrl-related error messages if both internal PCI
and HS-USB drivers are enabled but they should be just ignored.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
[Sergei: added pin node and prop, moved device node, fixed summary, supplemented
changelog]
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
Changes in version 4:
- fixed pin node name;
- moved pin node before USB0's one.

Changes in version 3:
- added pin function/group and the pinctrl-related prop;
- moved the HS-USB node to precede the USB PHY node;
- uppercased "arm" in the summary;
- supplemented changelog.

 arch/arm/boot/dts/r8a7790-lager.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7790-lager.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790-lager.dts
+++ renesas/arch/arm/boot/dts/r8a7790-lager.dts
@@ -221,6 +221,11 @@
 		renesas,function = "iic3";
 	};
 
+	hsusb_pins: hsusb {
+		renesas,groups = "usb0_ovc_vbus";
+		renesas,function = "usb0";
+	};
+
 	usb0_pins: usb0 {
 		renesas,groups = "usb0";
 		renesas,function = "usb0";
@@ -425,6 +430,13 @@
 	pinctrl-names = "default";
 };
 
+&hsusb {
+	status = "okay";
+	pinctrl-0 = <&hsusb_pins>;
+	pinctrl-names = "default";
+	renesas,enable-gpio = <&gpio5 18 GPIO_ACTIVE_HIGH>;
+};
+
 &usbphy {
 	status = "okay";
 };

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
