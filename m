From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V4 4/6] ARM: imx: add suspend in ocram support on i.mx6dl
Date: Mon, 13 Jan 2014 19:53:49 +0800
Message-ID: <1389614031-7253-4-git-send-email-b20788@freescale.com>
References: <1389614031-7253-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389614031-7253-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

i.MX6DL's suspend in ocram function is derived from i.MX6Q,
the only difference is the offset of DDR IO pins. It can
lower the DDR IO power from ~26mA@1.5V to ~15mA@1.5V,
measured on i.MX6Q/DL SabreSD board, R25.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/pm-imx6q.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/mach-imx/pm-imx6q.c b/arch/arm/mach-imx/pm-imx6q.c
index 42ac301..826bf8a 100644
--- a/arch/arm/mach-imx/pm-imx6q.c
+++ b/arch/arm/mach-imx/pm-imx6q.c
@@ -100,6 +100,18 @@ static const u32 imx6q_mmdc_io_dsm_offset[] __initconst = {
 	0x74c			    /* GPR_ADDS */
 };
 
+static const u32 imx6dl_mmdc_io_dsm_offset[] __initconst = {
+	0x470, 0x474, 0x478, 0x47c, /* DQM0 ~ DQM3 */
+	0x480, 0x484, 0x488, 0x48c, /* DQM4 ~ DQM7 */
+	0x464, 0x490, 0x4ac, 0x4b0, /* CAS, RAS, SDCLK_0, SDCLK_1 */
+	0x4bc, 0x4c0, 0x4c4, 0x4c8, /* DRAM_SDQS0 ~ DRAM_SDQS3 */
+	0x4cc, 0x4d0, 0x4d4, 0x4d8, /* DRAM_SDQS4 ~ DRAM_SDQS7 */
+	0x764, 0x770, 0x778, 0x77c, /* GPR_B0DS ~ GPR_B3DS */
+	0x780, 0x784, 0x78c, 0x748, /* GPR_B4DS ~ GPR_B7DS */
+	0x4b4, 0x4b8, 0x750, 0x760, /* SODT0, SODT1, DDRMODE_CTL, DDRMODE */
+	0x74c			    /* GPR_ADDS */
+};
+
 /*
  * This structure is for passing necessary data for low level ocram
  * suspend code(arch/arm/mach-imx/suspend-imx6.S), if this struct
@@ -413,6 +425,10 @@ static int __init imx6q_ocram_suspend_init(void)
 		pm_info->cpu_type = MXC_CPU_IMX6Q;
 		pm_info->mmdc_io_num = ARRAY_SIZE(imx6q_mmdc_io_dsm_offset);
 		mmdc_offset_array = imx6q_mmdc_io_dsm_offset;
+	} else if (cpu_is_imx6dl()) {
+		pm_info->cpu_type = MXC_CPU_IMX6DL;
+		pm_info->mmdc_io_num = ARRAY_SIZE(imx6dl_mmdc_io_dsm_offset);
+		mmdc_offset_array = imx6dl_mmdc_io_dsm_offset;
 	}
 
 	if (!mmdc_offset_array) {
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
