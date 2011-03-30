From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm/dt: Add basic device tree support for genesi mx board
Date: Wed, 30 Mar 2011 21:15:14 +0800
Message-ID: <1301490914-2279-1-git-send-email-jason.hui@linaro.org>
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

This patch add support for Genesi Efika MX Smarttop and Smartbook

Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
Grant, uboot patch has been included in your uboot patchset.
And mx51_efika build break, need pull in the patch to fix it
http://git.pengutronix.de/?p=imx/linux-2.6.git;a=commitdiff;
h=251290a6078cb88382344b3ee535ae8c6254c1b5
---
 arch/arm/boot/dts/genesi-efikamx.dts   |   30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/genesi-efikasb.dts   |   30 ++++++++++++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig              |    1 +
 arch/arm/mach-mx5/board-mx51_efikamx.c |    6 ++++++
 arch/arm/mach-mx5/board-mx51_efikasb.c |    6 ++++++
 5 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/genesi-efikamx.dts b/arch/arm/boot/dts/genesi-efikamx.dts
new file mode 100644
index 0000000..eca9616
--- /dev/null
+++ b/arch/arm/boot/dts/genesi-efikamx.dts
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
+	model = "Genesi EfikaMX nettop";
+	compatible = "genesi,efikamx";
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
diff --git a/arch/arm/boot/dts/genesi-efikasb.dts b/arch/arm/boot/dts/genesi-efikasb.dts
new file mode 100644
index 0000000..fc60baf
--- /dev/null
+++ b/arch/arm/boot/dts/genesi-efikasb.dts
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
+	model = "Genesi Efika Smartbook";
+	compatible = "genesi,efikasb";
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
index a61e01e..8aba7ea 100644
--- a/arch/arm/mach-mx5/Kconfig
+++ b/arch/arm/mach-mx5/Kconfig
@@ -123,6 +123,7 @@ config MX5_DT_COMMON
 config MX51_EFIKA_COMMON
 	bool
 	select SOC_IMX51
+	select MX5_DT_COMMON
 	select IMX_HAVE_PLATFORM_IMX_UART
 	select IMX_HAVE_PLATFORM_SDHCI_ESDHC_IMX
 	select IMX_HAVE_PLATFORM_SPI_IMX
diff --git a/arch/arm/mach-mx5/board-mx51_efikamx.c b/arch/arm/mach-mx5/board-mx51_efikamx.c
index acab191..1e9ed26 100644
--- a/arch/arm/mach-mx5/board-mx51_efikamx.c
+++ b/arch/arm/mach-mx5/board-mx51_efikamx.c
@@ -286,6 +286,11 @@ static struct sys_timer mx51_efikamx_timer = {
 	.init = mx51_efikamx_timer_init,
 };
 
+static const char *mx51_efikamx_dt_match[] __initdata = {
+	"genesi,efikamx",
+	NULL
+};
+
 MACHINE_START(MX51_EFIKAMX, "Genesi EfikaMX nettop")
 	/* Maintainer: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> */
 	.boot_params = MX51_PHYS_OFFSET + 0x100,
@@ -294,4 +299,5 @@ MACHINE_START(MX51_EFIKAMX, "Genesi EfikaMX nettop")
 	.init_irq = mx51_init_irq,
 	.timer = &mx51_efikamx_timer,
 	.init_machine = mx51_efikamx_init,
+	.dt_compat = mx51_efikamx_dt_match,
 MACHINE_END
diff --git a/arch/arm/mach-mx5/board-mx51_efikasb.c b/arch/arm/mach-mx5/board-mx51_efikasb.c
index db04ce8..6b80fce 100644
--- a/arch/arm/mach-mx5/board-mx51_efikasb.c
+++ b/arch/arm/mach-mx5/board-mx51_efikasb.c
@@ -273,6 +273,11 @@ static struct sys_timer mx51_efikasb_timer = {
 	.init	= mx51_efikasb_timer_init,
 };
 
+static const char *mx51_efikasb_dt_match[] __initdata = {
+	"genesi,efikasb",
+	NULL
+};
+
 MACHINE_START(MX51_EFIKASB, "Genesi Efika Smartbook")
 	.boot_params = MX51_PHYS_OFFSET + 0x100,
 	.map_io = mx51_map_io,
@@ -280,4 +285,5 @@ MACHINE_START(MX51_EFIKASB, "Genesi Efika Smartbook")
 	.init_irq = mx51_init_irq,
 	.init_machine =  efikasb_board_init,
 	.timer = &mx51_efikasb_timer,
+	.dt_compat = mx51_efikasb_dt_match,
 MACHINE_END
-- 
1.7.1
