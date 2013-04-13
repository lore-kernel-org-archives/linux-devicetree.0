From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 5/6] DT: MIPS: ralink: add RT3883 dts files
Date: Sat, 13 Apr 2013 10:50:25 +0200
Message-ID: <1365843026-11015-5-git-send-email-blogic@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, John Crispin <blogic@openwrt.org>
List-Id: devicetree@vger.kernel.org

Add a dtsi file for RT3883 SoC and a sample dts file.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 arch/mips/ralink/Kconfig             |    4 +++
 arch/mips/ralink/dts/Makefile        |    1 +
 arch/mips/ralink/dts/rt3883.dtsi     |   58 ++++++++++++++++++++++++++++++++++
 arch/mips/ralink/dts/rt3883_eval.dts |   18 +++++++++++
 4 files changed, 81 insertions(+)
 create mode 100644 arch/mips/ralink/dts/rt3883.dtsi
 create mode 100644 arch/mips/ralink/dts/rt3883_eval.dts

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 2f6fbb8..493411f 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -42,6 +42,10 @@ choice
 		bool "RT305x eval kit"
 		depends on SOC_RT305X
 
+	config DTB_RT3883_EVAL
+		bool "RT3883 eval kit"
+		depends on SOC_RT3883
+
 endchoice
 
 endif
diff --git a/arch/mips/ralink/dts/Makefile b/arch/mips/ralink/dts/Makefile
index f635a01..040a986 100644
--- a/arch/mips/ralink/dts/Makefile
+++ b/arch/mips/ralink/dts/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DTB_RT2880_EVAL) := rt2880_eval.dtb.o
 obj-$(CONFIG_DTB_RT305X_EVAL) := rt3052_eval.dtb.o
+obj-$(CONFIG_DTB_RT3883_EVAL) := rt3883_eval.dtb.o
diff --git a/arch/mips/ralink/dts/rt3883.dtsi b/arch/mips/ralink/dts/rt3883.dtsi
new file mode 100644
index 0000000..3b131dd
--- /dev/null
+++ b/arch/mips/ralink/dts/rt3883.dtsi
@@ -0,0 +1,58 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ralink,rt3883-soc";
+
+	cpus {
+		cpu@0 {
+			compatible = "mips,mips74Kc";
+		};
+	};
+
+	cpuintc: cpuintc@0 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	palmbus@10000000 {
+		compatible = "palmbus";
+		reg = <0x10000000 0x200000>;
+		ranges = <0x0 0x10000000 0x1FFFFF>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		sysc@0 {
+			compatible = "ralink,rt3883-sysc", "ralink,rt3050-sysc";
+			reg = <0x0 0x100>;
+		};
+
+		intc: intc@200 {
+			compatible = "ralink,rt3883-intc", "ralink,rt2880-intc";
+			reg = <0x200 0x100>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+		};
+
+		memc@300 {
+			compatible = "ralink,rt3883-memc", "ralink,rt3050-memc";
+			reg = <0x300 0x100>;
+		};
+
+		uartlite@c00 {
+			compatible = "ralink,rt3883-uart", "ralink,rt2880-uart", "ns16550a";
+			reg = <0xc00 0x100>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <12>;
+
+			reg-shift = <2>;
+		};
+	};
+};
diff --git a/arch/mips/ralink/dts/rt3883_eval.dts b/arch/mips/ralink/dts/rt3883_eval.dts
new file mode 100644
index 0000000..0297f20
--- /dev/null
+++ b/arch/mips/ralink/dts/rt3883_eval.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/include/ "rt3883.dtsi"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ralink,rt3883-eval-board", "ralink,rt3883-soc";
+	model = "Ralink RT3883 evaluation board";
+
+	memory@0 {
+		reg = <0x0 0x2000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,57600";
+	};
+};
-- 
1.7.10.4
