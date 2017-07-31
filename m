From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 11/14] ARM: dts: rockchip: add saradc support for rv1108
Date: Mon, 31 Jul 2017 18:19:19 +0800
Message-ID: <1501496359-22020-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add saradc device tree node for rv1108

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm/boot/dts/rv1108.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 1fc467e..958fecd 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -275,6 +275,18 @@
 		status = "disabled";
 	};
 
+	adc: adc@1038c000 {
+		compatible = "rockchip,rk3399-saradc";
+		reg = <0x1038c000 0x100>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		clock-frequency = <1000000>;
+		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
+		clock-names = "saradc", "apb_pclk";
+		status = "disabled";
+	};
+
 	i2c0: i2c@20000000 {
 		compatible = "rockchip,rv1108-i2c";
 		reg = <0x20000000 0x1000>;
-- 
2.7.4
