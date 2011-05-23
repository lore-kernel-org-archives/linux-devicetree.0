From: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: mmp: add device tree support on ttc dkb board
Date: Mon, 23 May 2011 19:05:38 +0800
Message-ID: <1306148738-1013-1-git-send-email-haojian.zhuang@marvell.com>
References: <2011052302>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2011052302>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The board support of ttc dkb is minimal to system boot.

Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/ttc-dkb.dts   |   12 ++++++++++++
 arch/arm/mach-mmp/Makefile.boot |    2 ++
 arch/arm/mach-mmp/ttc_dkb.c     |    6 ++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/ttc-dkb.dts

diff --git a/arch/arm/boot/dts/ttc-dkb.dts b/arch/arm/boot/dts/ttc-dkb.dts
new file mode 100644
index 0000000..f41d666
--- /dev/null
+++ b/arch/arm/boot/dts/ttc-dkb.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "Marvell TTC DKB";
+	compatible = "mrvl,ttc-dkb", "mrvl,pxa910-dkb";
+
+	memory {
+		reg = <0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm/mach-mmp/Makefile.boot b/arch/arm/mach-mmp/Makefile.boot
index 574a4aa..d6fe1fc 100644
--- a/arch/arm/mach-mmp/Makefile.boot
+++ b/arch/arm/mach-mmp/Makefile.boot
@@ -1 +1,3 @@
    zreladdr-y	:= 0x00008000
+
+dtb-$(CONFIG_MACH_TTC_DKB)	+= mmp-dkb.dtb
diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index e411039..7f7e7fe 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -124,10 +124,16 @@ static void __init ttc_dkb_init(void)
 	platform_add_devices(ARRAY_AND_SIZE(ttc_dkb_devices));
 }
 
+static const char *ttc_dkb_dt_match[] __initdata = {
+	"mrvl,ttc-dkb",
+	NULL,
+};
+
 MACHINE_START(TTC_DKB, "PXA910-based TTC_DKB Development Platform")
 	.map_io		= mmp_map_io,
 	.nr_irqs	= TTCDKB_NR_IRQS,
 	.init_irq       = pxa910_init_irq,
 	.timer          = &pxa910_timer,
 	.init_machine   = ttc_dkb_init,
+	.dt_compat	= ttc_dkb_dt_match,
 MACHINE_END
-- 
1.7.4.1
