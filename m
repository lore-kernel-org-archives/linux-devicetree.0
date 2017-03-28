From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH v4 3/3] DT nodes for Broadcom Northstar2 USB DRD Phy
Date: Tue, 28 Mar 2017 17:57:32 +0530
Message-ID: <1490704052-11314-4-git-send-email-raviteja.garimella@broadcom.com>
References: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree nodes for USB Dual Role Device Phy for
Broadcom's Northstar2 SoC.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 9f9e203..97c35c4 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -428,6 +428,20 @@
 			};
 		};
 
+		usbdrd_phy: phy@66000960 {
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
+			status = "disabled";
+		};
+
 		pwm: pwm@66010000 {
 			compatible = "brcm,iproc-pwm";
 			reg = <0x66010000 0x28>;
-- 
2.1.0
