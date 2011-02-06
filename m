From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] ARM: DT: Add a basic dts file for SMDKV310 machine
Date: Sun, 06 Feb 2011 18:47:28 +0530
Message-ID: <1296998250-21856-3-git-send-email-thomas.abraham@linaro.org>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1296998250-21856-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

This patch adds a basic dts file for Samsung's SMDKV310 machine.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-s5pv310/mach-smdkv310.dts |   38 +++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts

diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
new file mode 100755
index 0000000..74d80bf
--- /dev/null
+++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/ {
+	model = "smdkv310";
+	compatible = "samsung,smdkv310";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x40000000 0x08000000>;
+	};
+
+	chosen {
+		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;
+
+		GIC:gic@0x10500000 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x10500000 0x1000>;
+			compatible = "arm,gic";
+		};
+
+		watchdog@0x10060000 {
+			reg = <0x10060000 0x400>;
+			interrupts = <552>;
+			interrupt-parent = <&GIC>;
+			compatible = "samsung,s3c2410-wdt";
+		};
+	};
+};
-- 
1.6.6.rc2
