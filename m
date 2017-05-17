From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH 3/3] arm: dts: rk322x: add watchdog device node.
Date: Wed, 17 May 2017 11:40:51 +0800
Message-ID: <1494992451-32542-4-git-send-email-frank.wang@rock-chips.com>
References: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, charles.chen@rock-chips.com, cody.xie@rock-chips.com, kevan.lan@rock-chips.com, huangtao@rock-chips.com, sugar.zhang@rock-chips.com, wmc@rock-chips.com, Frank Wang <frank.wang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add watchdog device node for rk322x SoC.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index ea1239a..221251a 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -280,6 +280,14 @@
 		status = "disabled";
 	};
 
+	wdt: watchdog@110a0000 {
+		compatible = "snps,dw-wdt";
+		reg = <0x110a0000 0x100>;
+		clocks = <&cru PCLK_CPU>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
 	pwm0: pwm@110b0000 {
 		compatible = "rockchip,rk3288-pwm";
 		reg = <0x110b0000 0x10>;
-- 
2.0.0
