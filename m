From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 3/3] ARM: dts: add intmem node for rk3288 smp support
Date: Tue, 16 Sep 2014 18:44:30 +0800
Message-ID: <1410864271-9277-4-git-send-email-kever.yang@rock-chips.com>
References: <1410864271-9277-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410864271-9277-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add intmem node des which is needed by platsmp.c
and enable the smp.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- adjust the alignment

 arch/arm/boot/dts/rk3288.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index dca586e..bcc4dad 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -40,6 +40,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		enable-method = "rockchip,rk3288-smp";
 		cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a12";
@@ -353,6 +354,23 @@
 		status = "disabled";
 	};
 
+	bus_intmem@ff700000 {
+		compatible = "mmio-sram";
+		reg = <0xff700000 0x18000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xff700000 0x18000>;
+		smp-sram@0 {
+			compatible = "rockchip,rk3066-smp-sram";
+			reg = <0x00 0x10>;
+		};
+	};
+
+	pmu_intmem@ff720000 {
+		compatible = "mmio-sram";
+		reg = <0xff720000 0x4000>;
+	};
+
 	pmu: power-management@ff730000 {
 		compatible = "rockchip,rk3288-pmu", "syscon";
 		reg = <0xff730000 0x100>;
-- 
1.9.1
