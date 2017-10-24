From: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: Add dt node for Broadcom Cygnus USB phy
Date: Tue, 24 Oct 2017 10:07:02 +0530
Message-ID: <1508819822-29956-4-git-send-email-raveendra.padasalagi@broadcom.com>
References: <1508819822-29956-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508819822-29956-1-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafal Milecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT node for Broadcom's USB phy controller's used
in Cygnus family of SoC.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7c957ea..810df68 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -96,6 +96,41 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		extcon_usb: extcon_usb {
+			compatible = "linux,extcon-usb-gpio";
+			vbus-gpio = <&gpio_asiu 121 0>;
+			id-gpio = <&gpio_asiu 122 0>;
+			status = "okay";
+		};
+
+		usbphy: phy@0301c028 {
+			compatible = "brcm,cygnus-usb-phy";
+			reg = <0x0301c028 0x4>,
+			      <0x0301d1b4 0x5c>,
+			      <0x18115000 0xa00>,
+			      <0x18111000 0xa00>;
+			reg-names = "crmu-usbphy-aon-ctrl", "cdru-usbphy",
+				    "usb2h-idm", "usb2d-idm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usbphy0: usb-phy@0 {
+				#phy-cells = <1>;
+				reg = <0>;
+			};
+
+			usbphy1: usb-phy@1 {
+				#phy-cells = <1>;
+				reg = <1>;
+			};
+
+			usbphy2: usb-phy@2 {
+				#phy-cells = <1>;
+				reg = <2>;
+				extcon = <&extcon_usb>;
+			};
+		};
+
 		otp: otp@0301c800 {
 			compatible = "brcm,ocotp";
 			reg = <0x0301c800 0x2c>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
