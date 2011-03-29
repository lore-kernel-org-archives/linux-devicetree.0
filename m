From: Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] arm/dt: Add basic device tree support for mx53 loco board
Date: Tue, 29 Mar 2011 10:34:12 +0000
Message-ID: <2CF7613B9822A943BEF13EF7ACEC5BD1173561@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1301387820-18299-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1301387820-18299-1-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Grant,
The two patches for mx51/mx53 DT support have the same issue, which 
is the S-O-B will be missed when you git am. Let me know if you want me
re-send the two patches or you would take care when you am it? Thanks,

Best Regards,
Jason Liu


>-----Original Message-----
>From: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org [mailto:linaro-dev-
>bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org] On Behalf Of Jason Liu
>Sent: Tuesday, March 29, 2011 4:37 PM
>To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org; patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
>Subject: [PATCH] arm/dt: Add basic device tree support for mx53 loco board
>
>---
>grant, uboot patches has been send to u-boot maillist Test OK on mx53 loco
>board
>
>Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>---
> arch/arm/boot/dts/mx53-loco.dts     |   30
>++++++++++++++++++++++++++++++
> arch/arm/mach-mx5/Kconfig           |    1 +
> arch/arm/mach-mx5/board-mx53_loco.c |    5 +++++
> 3 files changed, 36 insertions(+), 0 deletions(-)
>
>diff --git a/arch/arm/boot/dts/mx53-loco.dts b/arch/arm/boot/dts/mx53-
>loco.dts new file mode 100644 index 0000000..7347456
>--- /dev/null
>+++ b/arch/arm/boot/dts/mx53-loco.dts
>@@ -0,0 +1,30 @@
>+/*
>+ * Copyright 2011 Linaro Ltd.
>+ *
>+ * The code contained herein is licensed under the GNU General Public
>+ * License. You may obtain a copy of the GNU General Public License
>+ * Version 2 or later at the following locations:
>+ *
>+ * http://www.opensource.org/licenses/gpl-license.html
>+ * http://www.gnu.org/copyleft/gpl.html
>+ */
>+
>+/dts-v1/;
>+
>+/ {
>+	model = "Freescale i.MX53 LOCO";
>+	compatible = "fsl,mx53-loco";
>+	#address-cells = <1>;
>+	#size-cells = <1>;
>+
>+	aliases {
>+	};
>+
>+	memory {
>+		device_type = "memory";
>+		reg = <0x70000000 0x40000000>;
>+	};
>+
>+	chosen {
>+	};
>+};
>diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig index
>aae51ee..a61e01e 100644
>--- a/arch/arm/mach-mx5/Kconfig
>+++ b/arch/arm/mach-mx5/Kconfig
>@@ -167,6 +167,7 @@ config MACH_MX53_SMD  config MACH_MX53_LOCO
> 	bool "Support MX53 LOCO platforms"
> 	select SOC_IMX53
>+	select MX5_DT_COMMON
> 	select IMX_HAVE_PLATFORM_IMX2_WDT
> 	select IMX_HAVE_PLATFORM_IMX_I2C
> 	select IMX_HAVE_PLATFORM_IMX_UART
>diff --git a/arch/arm/mach-mx5/board-mx53_loco.c b/arch/arm/mach-
>mx5/board-mx53_loco.c
>index 0a18f8d..6ffc591 100644
>--- a/arch/arm/mach-mx5/board-mx53_loco.c
>+++ b/arch/arm/mach-mx5/board-mx53_loco.c
>@@ -226,10 +226,15 @@ static struct sys_timer mx53_loco_timer = {
> 	.init	= mx53_loco_timer_init,
> };
>
>+static const char *mx53_loco_dt_match[] __initdata = {
>+	"fsl,mx53-loco",
>+	NULL
>+};
> MACHINE_START(MX53_LOCO, "Freescale MX53 LOCO Board")
> 	.map_io = mx53_map_io,
> 	.init_early = imx53_init_early,
> 	.init_irq = mx53_init_irq,
> 	.timer = &mx53_loco_timer,
> 	.init_machine = mx53_loco_board_init,
>+	.dt_compat = mx53_loco_dt_match,
> MACHINE_END
>--
>1.7.1
>
>
>_______________________________________________
>linaro-dev mailing list
>linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
>http://lists.linaro.org/mailman/listinfo/linaro-dev
