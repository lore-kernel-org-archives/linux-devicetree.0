From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 2/2] DTS: CI20: Add CPU nodes and L2 cache nodes.
Date: Wed, 30 Jan 2019 21:14:04 +0800
Message-ID: <1548854044-56483-3-git-send-email-zhouyanjie@zoho.com>
References: <1548854044-56483-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548854044-56483-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, ezequiel@collabora.co.uk, paul@crapouillou.net, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com, ulf.hansson@linaro.org, malat@debian.org
List-Id: devicetree@vger.kernel.org

Current kernels complain when booting on CI20:
[    0.329630] cacheinfo: Failed to find cpu0 device node
[    0.335023] cacheinfo: Unable to detect cache hierarchy for CPU 0
Add the CPU node and the L2 cache node, then let each CPU point to it.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b03cdec..7c0a853 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -7,6 +7,31 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4780";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
+			reg = <0>;
+			next-level-cache = <&l2c>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
+			reg = <1>;
+			next-level-cache = <&l2c>;
+			clocks = <&cgu JZ4780_CLK_CORE1>;
+		};
+
+		l2c: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
-- 
2.7.4
