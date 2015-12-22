From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v1 5/6] ARM: dts: rockchip: add reboot-mode node
Date: Tue, 22 Dec 2015 17:16:52 +0800
Message-ID: <1450775812-24244-1-git-send-email-andy.yan@rock-chips.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, heiko@sntech.de, arnd@arndb.de, john.stultz@linaro.org
Cc: sjg@chromium.org, alexandre.belloni@free-electrons.com, treding@nvidia.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, wxt@rock-chips.com, catalin.marinas@arm.com, olof@lixom.net, geert+renesas@glider.be, linux-rockchip@lists.infradead.org, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, pawel.moll@arm.com, will.deacon@arm.com, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, khilman@linaro.org, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add reboot mode driver DT node for rk3xxx,rk3288 platform

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v1:
- correct the maskrom magic number
- use macro defined in rockchip_boot-mode.h for reboot-mode DT node

 arch/arm/boot/dts/rk3288.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi | 26 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 04ea209..c6ea207 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -45,6 +45,7 @@
 #include <dt-bindings/clock/rk3288-cru.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/power/rk3288-power.h>
+#include <dt-bindings/soc/rockchip_boot-mode.h>
 #include "skeleton.dtsi"
 
 / {
@@ -170,6 +171,31 @@
 		};
 	};
 
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x94>;
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
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 4497d28..735eef4 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -43,6 +43,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/rockchip_boot-mode.h>
 #include "skeleton.dtsi"
 
 / {
@@ -103,6 +104,31 @@
 		};
 	};
 
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x40>;
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
 	xin24m: oscillator {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
-- 
1.9.1
