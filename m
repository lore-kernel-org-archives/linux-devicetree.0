From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH v2 3/3] ARM: dts: Add dt node for Broadcom Cygnus USB phy
Date: Wed,  8 Nov 2017 13:16:43 +0530
Message-ID: <1510127203-5815-4-git-send-email-raveendra.padasalagi@broadcom.com>
References: <1510127203-5815-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510127203-5815-1-git-send-email-raveendra.padasalagi@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vikram Prakash <vikram.prakash@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add DT node for Broadcom's USB phy controller's used
in Cygnus family of SoC.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7c957ea..c7b39dd 100644
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
+		usbphy: usb-phy@0301c028 {
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
