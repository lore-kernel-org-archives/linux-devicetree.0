From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm/dt: Add basic device tree support for mx51 babbage board
Date: Tue, 29 Mar 2011 15:17:36 +0800
Message-ID: <1301383056-17962-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
No uboot patch since uboot patch already in linaro uboot git

Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/mx51-babbage.dts     |   30 ++++++++++++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig              |    6 ++++++
 arch/arm/mach-mx5/board-mx51_babbage.c |    6 ++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/mx51-babbage.dts b/arch/arm/boot/dts/mx51-babbage.dts
new file mode 100644
index 0000000..179f745
--- /dev/null
+++ b/arch/arm/boot/dts/mx51-babbage.dts
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2011 Linaro Ltd.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+
+/ {
+	model = "Freescale i.MX51 Babbage";
+	compatible = "fsl,mx51-babbage";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x90000000 0x20000000>;
+	};
+
+	chosen {
+	};
+};
diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
index 83ee088..aae51ee 100644
--- a/arch/arm/mach-mx5/Kconfig
+++ b/arch/arm/mach-mx5/Kconfig
@@ -38,6 +38,7 @@ comment "MX5 platforms:"
 config MACH_MX51_BABBAGE
 	bool "Support MX51 BABBAGE platforms"
 	select SOC_IMX51
+	select MX5_DT_COMMON
 	select IMX_HAVE_PLATFORM_IMX2_WDT
 	select IMX_HAVE_PLATFORM_IMX_I2C
 	select IMX_HAVE_PLATFORM_IMX_UART
@@ -114,6 +115,11 @@ config MACH_EUKREA_MBIMXSD51_BASEBOARD
 
 endchoice
 
+config MX5_DT_COMMON
+	bool
+	select USE_OF
+	select PROC_DEVICETREE
+
 config MX51_EFIKA_COMMON
 	bool
 	select SOC_IMX51
diff --git a/arch/arm/mach-mx5/board-mx51_babbage.c b/arch/arm/mach-mx5/board-mx51_babbage.c
index b2ecd19..30b92ca 100644
--- a/arch/arm/mach-mx5/board-mx51_babbage.c
+++ b/arch/arm/mach-mx5/board-mx51_babbage.c
@@ -399,6 +399,11 @@ static struct sys_timer mx51_babbage_timer = {
 	.init = mx51_babbage_timer_init,
 };
 
+static const char *mx51_babbage_dt_match[] __initdata = {
+	"fsl,mx51-babbage",
+	NULL
+};
+
 MACHINE_START(MX51_BABBAGE, "Freescale MX51 Babbage Board")
 	/* Maintainer: Amit Kucheria <amit.kucheria-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> */
 	.boot_params = MX51_PHYS_OFFSET + 0x100,
@@ -407,4 +412,5 @@ MACHINE_START(MX51_BABBAGE, "Freescale MX51 Babbage Board")
 	.init_irq = mx51_init_irq,
 	.timer = &mx51_babbage_timer,
 	.init_machine = mx51_babbage_init,
+	.dt_compat = mx51_babbage_dt_match,
 MACHINE_END
-- 
1.7.1
