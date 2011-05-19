From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] arm/dt: Add ST-Ericsson u8500 device tree support
Date: Thu, 19 May 2011 17:34:49 -0600
Message-ID: <20110519233232.19042.44284.stgit@ponder>
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
To: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Deepak Saxena <dsaxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Per Forlin <per.forlin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds support for passing a device tree for booting the u8500 board.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Completely untested.  Not even compiled.  Per, this should be all you
need to change in the kernel to get DT support working on the u8500.

g.


 arch/arm/boot/dts/u8500-hrefv60.dts |    7 +++++++
 arch/arm/mach-ux500/Makefile.boot   |    1 +
 arch/arm/mach-ux500/board-mop500.c  |    6 ++++++
 3 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/u8500-hrefv60.dts

diff --git a/arch/arm/boot/dts/u8500-hrefv60.dts b/arch/arm/boot/dts/u8500-hrefv60.dts
new file mode 100644
index 0000000..3e12e8b
--- /dev/null
+++ b/arch/arm/boot/dts/u8500-hrefv60.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "ST-Ericsson U8500 HREFv60+ Reference Platform";
+	compatible = "stericsson,hrefv60plus";
+};
diff --git a/arch/arm/mach-ux500/Makefile.boot b/arch/arm/mach-ux500/Makefile.boot
index c7e75ac..9c83bfb 100644
--- a/arch/arm/mach-ux500/Makefile.boot
+++ b/arch/arm/mach-ux500/Makefile.boot
@@ -2,3 +2,4 @@
 params_phys-y	:= 0x00000100
 initrd_phys-y	:= 0x00800000
 
+dtb-$(CONFIG_MACH_U8500) += u8500-hrefv60.dtb
diff --git a/arch/arm/mach-ux500/board-mop500.c b/arch/arm/mach-ux500/board-mop500.c
index cc64bf4..59b7ddb 100644
--- a/arch/arm/mach-ux500/board-mop500.c
+++ b/arch/arm/mach-ux500/board-mop500.c
@@ -468,10 +468,16 @@ MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
 	.init_machine	= mop500_init_machine,
 MACHINE_END
 
+static const char *u8500_dt_match[] __initdata = {
+	"stericsson,hrefv60plus",
+	NULL
+};
+
 MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
 	.boot_params	= 0x100,
 	.map_io		= u8500_map_io,
 	.init_irq	= ux500_init_irq,
 	.timer		= &ux500_timer,
 	.init_machine	= mop500_init_machine,
+	.dt_match	= u8500_dt_match,
 MACHINE_END
