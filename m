From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/7] ARM: s5pv310-dt: Add a basic dts file for SMDKV310 machine
Date: Sat, 12 Feb 2011 18:17:00 +0530
Message-ID: <1297514825-10345-3-git-send-email-thomas.abraham@linaro.org>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1297514825-10345-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a basic dts file for Samsung's SMDKV310 board which
is based on the s5pv310 machine.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-s5pv310/mach-smdkv310.dts |   78 +++++++++++++++++++++++++++++++
 1 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts

diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
new file mode 100755
index 0000000..75aa76d
--- /dev/null
+++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
@@ -0,0 +1,78 @@
+/dts-v1/;
+
+/ {
+	model = "smdkv310";
+	compatible = "samsung,s5pv310","samsung,smdkv310";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		cpu@0{
+			compatible = "arm,cortex-a9";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a9";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x40000000 0x08000000>;
+	};
+
+	chosen {
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
+		console-defaults = <0x3c5 0x3 0x111>;
+		xtal-frequency = <24000000>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&GIC>;
+		compatible = "samsung,s5pv310-soc","simple-bus";
+		ranges;
+
+		GIC:gic@0x10500000 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x10500000 0x1000>;
+			compatible = "samsung,s5pv310-gic","arm,gic";
+		};
+
+		watchdog@0x10060000 {
+			reg = <0x10060000 0x400>;
+			interrupts = <552>;
+			compatible = "samsung,s5pv310-wdt","samsung,s3c2410-wdt";
+		};
+
+		serial@0x13800000 {
+			reg = <0x13800000 0x100>;
+			interrupts = <16 18 17>;
+			reg-defaults = <0x3c5 0x3 0x111>;
+			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
+		};
+
+		serial@0x13810000 {
+			reg = <0x13810000 0x100>;
+			interrupts = <20 22 21>;
+			reg-defaults = <0x3c5 0x3 0x111>;
+			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
+		};
+
+		serial@0x13820000 {
+			reg = <0x13820000 0x100>;
+			interrupts = <24 26 25>;
+			reg-defaults = <0x3c5 0x3 0x111>;
+			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
+		};
+
+		serial@0x13830000 {
+			reg = <0x13830000 0x100>;
+			interrupts = <28 30 29>;
+			reg-defaults = <0x3c5 0x3 0x111>;
+			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
+		};
+	};
+};
-- 
1.6.6.rc2
