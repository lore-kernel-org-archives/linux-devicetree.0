From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 4/6] ARM: vexpress: DT-based support for Coretile Express A9x4
 (V2P-CA9)
Date: Tue,  8 Nov 2011 13:16:07 +0000
Message-ID: <1320758169-22668-5-git-send-email-pawel.moll@arm.com>
References: <1320758169-22668-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320758169-22668-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds Device Tree for ARM Ltd. Coretile Express A9x4
used with V2M motherboard and an initial implementation of the
DT machine support (this code is separate from the current core
tile code).

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress-v2m-legacy.dtsi |  196 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vexpress-v2p-ca9.dts     |  135 +++++++++++++++++++
 arch/arm/mach-vexpress/Kconfig             |    8 +
 arch/arm/mach-vexpress/Makefile            |    1 +
 arch/arm/mach-vexpress/v2p-ca9.c           |   97 ++++++++++++++
 5 files changed, 437 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/vexpress-v2m-legacy.dtsi
 create mode 100644 arch/arm/boot/dts/vexpress-v2p-ca9.dts
 create mode 100644 arch/arm/mach-vexpress/v2p-ca9.c

diff --git a/arch/arm/boot/dts/vexpress-v2m-legacy.dtsi b/arch/arm/boot/dts/vexpress-v2m-legacy.dtsi
new file mode 100644
index 0000000..984e917
--- /dev/null
+++ b/arch/arm/boot/dts/vexpress-v2m-legacy.dtsi
@@ -0,0 +1,196 @@
+/*
+ * ARM Ltd. Versatile Express
+ *
+ * Motherboard Express uATX
+ * V2M-P1
+ *
+ * HBI-0190D
+ *
+ * Legacy memory map
+ */
+
+/ {
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		timer01 = &timer01;
+		timer23 = &timer23;
+		sysreg = &sysreg;
+		sysctl = &sysctl;
+	};
+
+	motherboard {
+		compatible = "simple-bus";
+		#address-cells = <2>; /* SMB chipselect number and offset */
+		#size-cells = <1>;
+		#interrupt-cells = <1>;
+
+		flash@0,00000000 {
+			compatible = "arm,vexpress-flash", "cfi-flash";
+			reg = <0 0x00000000 0x04000000
+			       1 0x00000000 0x04000000>;
+			bank-width = <4>;
+		};
+
+		psram@2,00000000 {
+			compatible = "mtd-ram";
+			reg = <2 0x00000000 0x02000000>;
+			bank-width = <4>;
+		};
+
+		ethernet@3,02000000 {
+			compatible = "smsc,lan9118", "smsc,lan9115";
+			reg = <3 0x02000000 0x10000>;
+			interrupts = <15>;
+			phy-mode = "mii";
+			reg-io-width = <32>;
+			smsc,irq-active-high;
+			smsc,irq-push-pull;
+		};
+
+		usb@3,03000000 {
+			compatible = "nxp,usb-isp1761";
+			reg = <3 0x03000000 0x20000>;
+			interrupts = <16>;
+			port1-otg;
+		};
+
+		peripherals@7,00000000 {
+			compatible = "arm,amba-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 7 0 0x20000>;
+
+			sysreg: sysreg@00000 {
+				compatible = "arm,vexpress-sysreg";
+				reg = <0x00000 0x1000>;
+			};
+
+			sysctl: sysctl@01000 {
+				compatible = "arm,sp810";
+				reg = <0x01000 0x1000>;
+			};
+
+			/* PCI-E I2C bus */
+			i2c0: i2c@02000 {
+				compatible = "arm,versatile-i2c";
+				reg = <0x02000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				pcie-switch@60 {
+					compatible = "idt,89hpes32h8";
+					reg = <0x60>;
+				};
+			};
+
+			aaci@04000 {
+				compatible = "arm,pl041", "arm,primecell";
+				reg = <0x04000 0x1000>;
+				interrupts = <11>;
+			};
+
+			mmci@05000 {
+				compatible = "arm,pl180", "arm,primecell";
+				reg = <0x05000 0x1000>;
+				interrupts = <9 10>;
+			};
+
+			kmi@06000 {
+				compatible = "arm,pl050", "arm,primecell";
+				reg = <0x06000 0x1000>;
+				interrupts = <12>;
+			};
+
+			kmi@07000 {
+				compatible = "arm,pl050", "arm,primecell";
+				reg = <0x07000 0x1000>;
+				interrupts = <13>;
+			};
+
+			uart0: uart@09000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x09000 0x1000>;
+				interrupts = <5>;
+			};
+
+			uart1: uart@0a000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x0a000 0x1000>;
+				interrupts = <6>;
+			};
+
+			uart2: uart@0b000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x0b000 0x1000>;
+				interrupts = <7>;
+			};
+
+			uart3: uart@0c000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x0c000 0x1000>;
+				interrupts = <8>;
+			};
+
+			wdt@0f000 {
+				compatible = "arm,sp805", "arm,primecell";
+				reg = <0x0f000 0x1000>;
+				interrupts = <0>;
+			};
+
+			timer01: timer@11000 {
+				compatible = "arm,sp804", "arm,primecell";
+				reg = <0x11000 0x1000>;
+				interrupts = <2>;
+			};
+
+			timer23: timer@12000 {
+				compatible = "arm,sp804", "arm,primecell";
+				reg = <0x12000 0x1000>;
+			};
+
+			/* DVI I2C bus */
+			i2c1: i2c@16000 {
+				compatible = "arm,versatile-i2c";
+				reg = <0x16000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dvi-switch-a@39 {
+					compatible = "sil,sii9022";
+					reg = <0x39>;
+				};
+
+				dvi-switch-b@60 {
+					compatible = "sil,sii9022";
+					reg = <0x60>;
+				};
+			};
+
+			rtc@17000 {
+				compatible = "arm,pl031", "arm,primecell";
+				reg = <0x017000 0x1000>;
+				interrupts = <4>;
+			};
+
+			compact-flash@1a000 {
+				compatible = "ata-generic";
+				reg = <0x1a000 0x100
+				       0x1a100 0xf00>;
+				reg-shift = <2>;
+			};
+
+			clcd@1f000 {
+				compatible = "arm,pl111", "arm,primecell";
+				reg = <0x1f000 0x1000>;
+				interrupts = <14>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
new file mode 100644
index 0000000..fc9aa38
--- /dev/null
+++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
@@ -0,0 +1,135 @@
+/*
+ * ARM Ltd. Versatile Express
+ *
+ * Coretile Express A9x4
+ * Cortex-A9 MPCore (V2P-CA9)
+ *
+ * HBI-0191B
+ */
+
+/dts-v1/;
+
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "V2P-CA9";
+	compatible = "arm,vexpress-v2p-ca9", "arm,vexpress-legacy", "arm,vexpress";
+	interrupt-parent = <&gic>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
+	};
+
+	clcd@10020000 {
+		compatible = "arm,pl111", "arm,primecell";
+		reg = <0x10020000 0x1000>;
+		interrupts = <0 44 4>;
+	};
+
+	dmc@100e0000 {
+		compatible = "arm,pl341", "arm,primecell";
+		reg = <0x100e0000 0x1000>;
+	};
+
+	smc@100e1000 {
+		compatible = "arm,pl354", "arm,primecell";
+		reg = <0x100e1000 0x1000>;
+		interrupts = <0 45 4>,
+			     <0 46 4>;
+	};
+
+	timer@100e4000 {
+		compatible = "arm,sp804", "arm,primecell";
+		reg = <0x100e4000 0x1000>;
+		interrupts = <0 48 4>,
+			     <0 49 4>;
+	};
+
+	watchdog@100e5000 {
+		compatible = "arm,sp805", "arm,primecell";
+		reg = <0x100e5000 0x1000>;
+		interrupts = <0 51 4>;
+	};
+
+	gic: interrupt-controller@1e001000 {
+		compatible = "arm,cortex-a9-gic";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x1e001000 0x1000>,
+		      <0x1e000100 0x100>;
+	};
+
+	L2: cache-controller@1e00a000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x1e00a000 0x1000>;
+		interrupts = <0 43 4>;
+		cache-level = <2>;
+		arm,data-latency = <0>;
+		arm,tag-latency = <0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts = <0 60 4>,
+			     <0 61 4>,
+			     <0 62 4>,
+			     <0 63 4>;
+	};
+
+	motherboard {
+		ranges = <0 0 0x40000000 0x04000000>,
+			 <1 0 0x44000000 0x04000000>,
+			 <2 0 0x48000000 0x04000000>,
+			 <3 0 0x4c000000 0x04000000>,
+			 <7 0 0x10000000 0x00020000>;
+
+		interrupt-map-mask = <0 0 63>;
+		interrupt-map = <0 0  0 &gic 0  0 4>,
+				<0 0  1 &gic 0  1 4>,
+				<0 0  2 &gic 0  2 4>,
+				<0 0  3 &gic 0  3 4>,
+				<0 0  4 &gic 0  4 4>,
+				<0 0  5 &gic 0  5 4>,
+				<0 0  6 &gic 0  6 4>,
+				<0 0  7 &gic 0  7 4>,
+				<0 0  8 &gic 0  8 4>,
+				<0 0  9 &gic 0  9 4>,
+				<0 0 10 &gic 0 10 4>,
+				<0 0 11 &gic 0 11 4>,
+				<0 0 12 &gic 0 12 4>,
+				<0 0 13 &gic 0 13 4>,
+				<0 0 14 &gic 0 14 4>,
+				<0 0 15 &gic 0 15 4>,
+				<0 0 16 &gic 0 16 4>,
+				<0 0 17 &gic 0 17 4>,
+				<0 0 18 &gic 0 18 4>,
+				<0 0 19 &gic 0 19 4>,
+				<0 0 20 &gic 0 20 4>,
+				<0 0 21 &gic 0 21 4>,
+				<0 0 22 &gic 0 22 4>,
+				<0 0 23 &gic 0 23 4>,
+				<0 0 24 &gic 0 24 4>,
+				<0 0 25 &gic 0 25 4>,
+				<0 0 26 &gic 0 26 4>,
+				<0 0 27 &gic 0 27 4>,
+				<0 0 28 &gic 0 28 4>,
+				<0 0 29 &gic 0 29 4>,
+				<0 0 30 &gic 0 30 4>,
+				<0 0 31 &gic 0 31 4>,
+				<0 0 32 &gic 0 32 4>,
+				<0 0 33 &gic 0 33 4>,
+				<0 0 34 &gic 0 34 4>,
+				<0 0 35 &gic 0 35 4>,
+				<0 0 36 &gic 0 36 4>,
+				<0 0 37 &gic 0 37 4>,
+				<0 0 38 &gic 0 38 4>,
+				<0 0 39 &gic 0 39 4>,
+				<0 0 40 &gic 0 40 4>,
+				<0 0 41 &gic 0 41 4>,
+				<0 0 42 &gic 0 42 4>;
+	};
+};
+
+/include/ "vexpress-v2m-legacy.dtsi"
diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
index 9370f5b..27c1294 100644
--- a/arch/arm/mach-vexpress/Kconfig
+++ b/arch/arm/mach-vexpress/Kconfig
@@ -17,4 +17,12 @@ config ARCH_VEXPRESS_DT
 	bool
 	select OF
 
+config ARCH_VEXPRESS_V2P_CA9
+	bool "CoreTile Express A9x4 (V2P-CA9) - DT"
+	select ARCH_VEXPRESS_LEGACY
+	select ARCH_VEXPRESS_DT
+	select ARM_ERRATA_720789
+	select ARM_ERRATA_751472
+	select ARM_ERRATA_753970
+
 endmenu
diff --git a/arch/arm/mach-vexpress/Makefile b/arch/arm/mach-vexpress/Makefile
index 90551b9..9cc4a21 100644
--- a/arch/arm/mach-vexpress/Makefile
+++ b/arch/arm/mach-vexpress/Makefile
@@ -4,5 +4,6 @@
 
 obj-y					:= v2m.o
 obj-$(CONFIG_ARCH_VEXPRESS_CA9X4)	+= ct-ca9x4.o
+obj-$(CONFIG_ARCH_VEXPRESS_V2P_CA9)	+= v2p-ca9.o
 obj-$(CONFIG_SMP)			+= platsmp.o
 obj-$(CONFIG_HOTPLUG_CPU)		+= hotplug.o
diff --git a/arch/arm/mach-vexpress/v2p-ca9.c b/arch/arm/mach-vexpress/v2p-ca9.c
new file mode 100644
index 0000000..280236c
--- /dev/null
+++ b/arch/arm/mach-vexpress/v2p-ca9.c
@@ -0,0 +1,97 @@
+/*
+ * Device Tree based support for ARM Versatile Express board
+ * with CoreTile Express A9x4 (V2P-CA9)
+ */
+
+#include <linux/init.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+
+#include <asm/smp_scu.h>
+#include <asm/smp_twd.h>
+#include <asm/hardware/cache-l2x0.h>
+#include <asm/hardware/gic.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include "core.h"
+
+#define V2P_CA9_MPCORE_PERIPH	0x1e000000
+
+#define A9_MPCORE_SCU		0x0000
+#define A9_MPCORE_TWD		0x0600
+
+static struct map_desc v2p_ca9_io_desc[] __initdata = {
+	{
+		.virtual        = V2TILE_PERIPH,
+		.pfn            = __phys_to_pfn(V2P_CA9_MPCORE_PERIPH),
+		.length         = SZ_8K,
+		.type           = MT_DEVICE,
+	},
+};
+
+#ifdef CONFIG_SMP
+static void v2p_ca9_init_cpu_map(void)
+{
+	int i, ncores = scu_get_core_count(V2TILE_PERIPH_P2V(A9_MPCORE_SCU));
+
+	for (i = 0; i < ncores; ++i)
+		set_cpu_possible(i, true);
+
+	set_smp_cross_call(gic_raise_softirq);
+}
+
+static void v2p_ca9_smp_enable(unsigned int max_cpus)
+{
+	scu_enable(V2TILE_PERIPH_P2V(A9_MPCORE_SCU));
+}
+#endif
+
+static void __init v2p_ca9_map_io(void)
+{
+	v2m_dt_map_io(v2m_memory_map_legacy);
+	iotable_init(v2p_ca9_io_desc, ARRAY_SIZE(v2p_ca9_io_desc));
+#ifdef CONFIG_SMP
+	vexpress_init_cpu_map = v2p_ca9_init_cpu_map;
+	vexpress_smp_enable = v2p_ca9_smp_enable;
+#endif
+}
+
+static void __init v2p_ca9_init_early(void)
+{
+#ifdef CONFIG_LOCAL_TIMERS
+	twd_base = V2TILE_PERIPH_P2V(A9_MPCORE_TWD);
+#endif
+	v2m_dt_init_early();
+}
+
+const static struct of_device_id v2p_ca9_irq_match[] = {
+	{ .compatible = "arm,cortex-a9-gic", .data = gic_of_init, },
+	{}
+};
+
+static void __init v2p_ca9_init_irq(void)
+{
+	of_irq_init(v2p_ca9_irq_match);
+}
+
+static void __init v2p_ca9_init(void)
+{
+	l2x0_of_init(0x00400000, 0xfe0fffff);
+	of_platform_populate(NULL, of_default_bus_match_table,
+			v2m_dt_get_auxdata(v2m_memory_map_legacy), NULL);
+}
+
+static const char *v2p_ca9_dt_match[] __initdata = {
+	"arm,vexpress-v2p-ca9",
+	NULL,
+};
+
+DT_MACHINE_START(VEXPRESS_V2P_CA9, "ARM Versatile Express V2P-CA9")
+	.map_io		= v2p_ca9_map_io,
+	.init_early	= v2p_ca9_init_early,
+	.init_irq	= v2p_ca9_init_irq,
+	.timer		= &v2m_timer,
+	.init_machine	= v2p_ca9_init,
+	.dt_compat	= v2p_ca9_dt_match,
+MACHINE_END
-- 
1.6.3.3
