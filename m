From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Add SYSREG block node for Exynos4 SoC series
Date: Mon, 25 Mar 2013 17:44:07 +0100
Message-ID: <1364229847-3594-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, myungjoo.ham@samsung.com, dh09.lee@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds device node for the SYSREG registers block
present in Exynos SoC series. The SYSREG block generates
control signals for the ARM CPU and various IP blocks and
buses. The SYSREG registers are exposed through APB bus
interface. The sysreg device tree node is to be associated
with the mfd syscon driver and all SYSREG clients should
use the regmap interface it provides. It allows to
eliminate any possible races and conflicts should different
drivers attempt to concurrently access same register.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/arm/exynos/sysreg.txt      |    7 +++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    5 +++++
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/exynos/sysreg.txt

diff --git a/Documentation/devicetree/bindings/arm/exynos/sysreg.txt b/Documentation/devicetree/bindings/arm/exynos/sysreg.txt
new file mode 100644
index 0000000..5b1f59d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/exynos/sysreg.txt
@@ -0,0 +1,7 @@
+SAMSUNG Exynos System Registers (SYSREG)
+
+Properties:
+ - name : should be 'sysreg';
+ - compatible : should contain "samsung,exynos<chip name>-sysreg", "syscon";
+   For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
+ - reg : offset and length of the register set.
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 9ac47d5..b4123ec 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -82,6 +82,11 @@
 		reg = <0x10440000 0x1000>;
 	};
 
+	sys_reg: sysreg {
+		compatible = "exynos4-sysreg", "syscon";
+		reg = <0x10010000 0x400>;
+	};
+
 	watchdog@10060000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x10060000 0x100>;
-- 
1.7.9.5
