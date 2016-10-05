From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 7/8] ARM64: dts: meson-gxbb: Add SRAM node
Date: Wed,  5 Oct 2016 09:33:33 +0200
Message-ID: <1475652814-30619-8-git-send-email-narmstrong@baylibre.com>
References: <1475652814-30619-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475652814-30619-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, khilman@baylibre.com, heiko@sntech.de, wxt@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 443811b..88f98f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -94,6 +94,15 @@
 			status = "disabled";
 		};
 
+		sram: sram@c8000000 {
+			compatible = "amlogic,meson-gxbb-sram", "mmio-sram";
+			reg = <0x0 0xc8000000 0x0 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x0 0xc8000000 0x14000>;
+		};
+
 		usb0: usb@c9000000 {
 			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
 			reg = <0x0 0xc9000000 0x0 0x40000>;
-- 
1.9.1
