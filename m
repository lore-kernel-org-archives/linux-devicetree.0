From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 5/8] ARM: dts: rockchip: add saradc support for rv1108
Date: Mon, 14 Aug 2017 16:41:57 +0800
Message-ID: <1502700117-8668-1-git-send-email-andy.yan@rock-chips.com>
References: <1502699477-8063-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502699477-8063-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add saradc device tree node for rv1108 soc

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v4:
- remove unnecessary property io-channel-ranges

Changes in v3: None
Changes in v2:
- add compatible string "rockchip,rv1108-saradc"

 arch/arm/boot/dts/rv1108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 75a0b1e..064cec3 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -275,6 +275,17 @@
 		status = "disabled";
 	};
 
+	adc: adc@1038c000 {
+		compatible = "rockchip,rv1108-saradc", "rockchip,rk3399-saradc";
+		reg = <0x1038c000 0x100>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		#io-channel-cells = <1>;
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
