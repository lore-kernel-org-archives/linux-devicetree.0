From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 23/23] ARM: dts: rockchip: add accelerometer bma250e dt node for rv1108 evb
Date: Wed,  2 Aug 2017 17:00:38 +0800
Message-ID: <1501664438-13046-1-git-send-email-andy.yan@rock-chips.com>
References: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add dt node of bosch accelerometer bma250e on rv1108 evb.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v2: None

 arch/arm/boot/dts/rv1108-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index a1bd95e..6690083 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -110,6 +110,13 @@
 	i2c-scl-falling-time-ns = <16>;
 	clock-frequency = <400000>;
 
+	bma250: accelerometer@19 {
+		compatible = "bosch,bma250e";
+		reg = <0x19>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB3 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	rk805: pmic@18 {
 		compatible = "rockchip,rk805";
 		reg = <0x18>;
-- 
2.7.4
