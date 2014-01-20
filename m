From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v7 4/7] ARM: rockchip: add snoop-control-unit
Date: Mon, 20 Jan 2014 16:44:22 +0100
Message-ID: <5116067.medjqilg2X@phil>
References: <4970034.fqvMoHdOyd@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4970034.fqvMoHdOyd@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: arm@kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

This adds the device-node and config select to enable the
scu in all Rockchip Cortex-A9 SoCs.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Ulrich Prinz <ulrich.prinz@googlemail.com>
---
 arch/arm/boot/dts/rk3xxx.dtsi  |    5 +++++
 arch/arm/mach-rockchip/Kconfig |    1 +
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 0fcbcfd..0a3d5b1 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -26,6 +26,11 @@
 		compatible = "simple-bus";
 		ranges;
 
+		scu@1013c000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0x1013c000 0x100>;
+		};
+
 		gic: interrupt-controller@1013d000 {
 			compatible = "arm,cortex-a9-gic";
 			interrupt-controller;
diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index cf073de..412cbcf 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -5,6 +5,7 @@ config ARCH_ROCKCHIP
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_GIC
 	select CACHE_L2X0
+	select HAVE_ARM_SCU
 	select HAVE_ARM_TWD if SMP
 	select HAVE_SMP
 	select COMMON_CLK
-- 
1.7.10.4
