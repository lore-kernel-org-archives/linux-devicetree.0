From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 6/6] ARM64: dts: rockchip: add reboot mode node
Date: Mon, 21 Dec 2015 19:45:23 +0800
Message-ID: <1450698323-30312-1-git-send-email-andy.yan@rock-chips.com>
References: <1450697249-29994-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450697249-29994-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, heiko@sntech.de, arnd@arndb.de, john.stultz@linaro.org
Cc: sjg@chromium.org, alexandre.belloni@free-electrons.com, treding@nvidia.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, wxt@rock-chips.com, catalin.marinas@arm.com, olof@lixom.net, geert+renesas@glider.be, linux-rockchip@lists.infradead.org, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, pawel.moll@arm.com, will.deacon@arm.com, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, khilman@linaro.org, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add reboot mode driver DT node for rk3368 platform

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index cc093a4..776f1be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -45,6 +45,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip_boot-mode.h>
 
 / {
 	compatible = "rockchip,rk3368";
@@ -202,6 +203,31 @@
 		method = "smc";
 	};
 
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmugrf>;
+		offset = <0x200>;
+		loader {
+			linux,mode = "loader";
+			linux,magic = <BOOT_LOADER>;
+		};
+
+		maskrom {
+			linux,mode = "maskrom";
+			linux,magic = <BOOT_MASKROM>;
+		};
+
+		recovery {
+			linux,mode = "recovery";
+			linux,magic = <BOOT_RECOVERY>;
+		};
+
+		fastboot {
+			linux,mode = "fastboot";
+			linux,magic = <BOOT_FASTBOOT>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
1.9.1
