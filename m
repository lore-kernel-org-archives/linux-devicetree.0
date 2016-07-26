From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 2/4] arm64: dts: rockchip: add the saradc for rk3399
Date: Tue, 26 Jul 2016 20:13:13 +0800
Message-ID: <1469535195-5227-2-git-send-email-wxt@rock-chips.com>
References: <1469535195-5227-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469535195-5227-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, john@metanate.com, dianders@chromium.org, linux@roeck-us.net, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch adds saradc needed information on rk3399 SoCs.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4c84229..b81f84b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -299,6 +299,18 @@
 		};
 	};
 
+	saradc: saradc@ff100000 {
+		compatible = "rockchip,rk3399-saradc";
+		reg = <0x0 0xff100000 0x0 0x100>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		#io-channel-cells = <1>;
+		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
+		clock-names = "saradc", "apb_pclk";
+		resets = <&cru SRST_P_SARADC>;
+		reset-names = "saradc-apb";
+		status = "disabled";
+	};
+
 	i2c1: i2c@ff110000 {
 		compatible = "rockchip,rk3399-i2c";
 		reg = <0x0 0xff110000 0x0 0x1000>;
-- 
1.9.1
