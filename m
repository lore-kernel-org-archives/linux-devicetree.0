From: Tixy <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>
Subject: [PATCH] ARM: device-tree: Add basic device tree support for Beagleboad
Date: Tue, 29 Mar 2011 07:50:47 +0100
Message-ID: <1301381447-2829-2-git-send-email-tixy@yxit.co.uk>
References: <1301381447-2829-1-git-send-email-tixy@yxit.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1301381447-2829-1-git-send-email-tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jon Medhurst <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>

Signed-off-by: Jon Medhurst <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>
---
 arch/arm/boot/dts/omap3-beagle.dts      |   19 +++++++++++++++++++
 arch/arm/mach-omap2/board-omap3beagle.c |    6 ++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-beagle.dts

diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
new file mode 100644
index 0000000..2bf5967
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+
+/ {
+	model = "TI OMAP3 BeagleBoard";
+	compatible = "ti,omap3-beagle";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	chosen {
+	};
+};
\ No newline at end of file
diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
index caf6c8a..09aa467 100644
--- a/arch/arm/mach-omap2/board-omap3beagle.c
+++ b/arch/arm/mach-omap2/board-omap3beagle.c
@@ -629,6 +629,11 @@ static void __init omap3_beagle_init(void)
 	beagle_display_init();
 }
 
+static const char *omap3_beagle_dt_match[] __initdata = {
+       "ti,omap3-beagle",
+       NULL
+};
+
 MACHINE_START(OMAP3_BEAGLE, "OMAP3 Beagle Board")
 	/* Maintainer: Syed Mohammed Khasim - http://beagleboard.org */
 	.boot_params	= 0x80000100,
@@ -637,4 +642,5 @@ MACHINE_START(OMAP3_BEAGLE, "OMAP3 Beagle Board")
 	.init_irq	= omap3_beagle_init_irq,
 	.init_machine	= omap3_beagle_init,
 	.timer		= &omap_timer,
+	.dt_compat	= omap3_beagle_dt_match,
 MACHINE_END
-- 
1.7.2.5
