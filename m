Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00075.outbound.protection.outlook.com ([40.107.0.75]:34624
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728391AbfAHJQV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 8 Jan 2019 04:16:21 -0500
From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 3/3] clk: imx: Add clock driver support for imx8mm
Date: Tue, 8 Jan 2019 09:01:04 +0000
Message-ID: <1546938317-23203-3-git-send-email-ping.bai@nxp.com>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add clock driver support for i.MX8MM SOC.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clk/imx/Kconfig      |   6 +
 drivers/clk/imx/Makefile     |   1 +
 drivers/clk/imx/clk-imx8mm.c | 686 +++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 693 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8mm.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 4aae31a..0eaf418 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -8,6 +8,12 @@ config MXC_CLK_SCU
 	bool
 	depends on IMX_SCU
=20
+config CLK_IMX8MM
+	bool "IMX8MM CCM Clock Driver"
+	depends on ARCH_MXC && ARM64
+	help
+	    Build the driver for i.MX8MM CCM Clock Driver
+
 config CLK_IMX8MQ
 	bool "IMX8MQ CCM Clock Driver"
 	depends on ARCH_MXC && ARM64
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index ff74287..0d5180f 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
 	clk-lpcg-scu.o
=20
+obj-$(CONFIG_CLK_IMX8MM) +=3D clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MQ) +=3D clk-imx8mq.o
 obj-$(CONFIG_CLK_IMX8QXP) +=3D clk-imx8qxp.o clk-imx8qxp-lpcg.o
=20
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
new file mode 100644
index 0000000..7cd9e86
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -0,0 +1,686 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2017-2018 NXP.
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "clk.h"
+
+static u32 share_count_sai1;
+static u32 share_count_sai2;
+static u32 share_count_sai3;
+static u32 share_count_sai4;
+static u32 share_count_sai5;
+static u32 share_count_sai6;
+static u32 share_count_dcss;
+static u32 share_count_pdm;
+static u32 share_count_nand;
+
+#define PLL_1416X_RATE(_rate, _m, _p, _s)		\
+	{						\
+		.rate	=3D	(_rate),		\
+		.mdiv	=3D	(_m),			\
+		.pdiv	=3D	(_p),			\
+		.sdiv	=3D	(_s),			\
+	}
+
+#define PLL_1443X_RATE(_rate, _m, _p, _s, _k)		\
+	{						\
+		.rate	=3D	(_rate),		\
+		.mdiv	=3D	(_m),			\
+		.pdiv	=3D	(_p),			\
+		.sdiv	=3D	(_s),			\
+		.kdiv	=3D	(_k),			\
+	}
+
+static const struct imx_pll14xx_rate_table imx8mm_pll1416x_tbl[] =3D {
+	PLL_1416X_RATE(1800000000U, 225, 3, 0),
+	PLL_1416X_RATE(1600000000U, 200, 3, 0),
+	PLL_1416X_RATE(1200000000U, 300, 3, 1),
+	PLL_1416X_RATE(1000000000U, 250, 3, 1),
+	PLL_1416X_RATE(800000000U,  200, 3, 1),
+	PLL_1416X_RATE(750000000U,  250, 2, 2),
+	PLL_1416X_RATE(700000000U,  350, 3, 2),
+	PLL_1416X_RATE(600000000U,  300, 3, 2),
+};
+
+static const struct imx_pll14xx_rate_table imx8mm_audiopll_tbl[] =3D {
+	PLL_1443X_RATE(786432000U, 655, 5, 2, 23593),
+	PLL_1443X_RATE(722534400U, 301, 5, 1, 3670),
+};
+
+static const struct imx_pll14xx_rate_table imx8mm_videopll_tbl[] =3D {
+	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
+	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
+};
+
+static const struct imx_pll14xx_rate_table imx8mm_drampll_tbl[] =3D {
+	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
+};
+
+static struct imx_pll14xx_clk imx8mm_audio_pll __initdata =3D {
+		.type =3D PLL_1443X,
+		.rate_table =3D imx8mm_audiopll_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_video_pll __initdata =3D {
+		.type =3D PLL_1443X,
+		.rate_table =3D imx8mm_videopll_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_dram_pll __initdata =3D {
+		.type =3D PLL_1443X,
+		.rate_table =3D imx8mm_drampll_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_arm_pll __initdata =3D {
+		.type =3D PLL_1416X,
+		.rate_table =3D imx8mm_pll1416x_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_gpu_pll __initdata =3D {
+		.type =3D PLL_1416X,
+		.rate_table =3D imx8mm_pll1416x_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_vpu_pll __initdata =3D {
+		.type =3D PLL_1416X,
+		.rate_table =3D imx8mm_pll1416x_tbl,
+};
+
+static struct imx_pll14xx_clk imx8mm_sys_pll __initdata =3D {
+		.type =3D PLL_1416X,
+		.rate_table =3D imx8mm_pll1416x_tbl,
+};
+
+static const char *pll_ref_sels[] =3D { "osc_24m", "dummy", "dummy", "dumm=
y", };
+static const char *audio_pll1_bypass_sels[] =3D {"audio_pll1", "audio_pll1=
_ref_sel", };
+static const char *audio_pll2_bypass_sels[] =3D {"audio_pll2", "audio_pll2=
_ref_sel", };
+static const char *video_pll1_bypass_sels[] =3D {"video_pll1", "video_pll1=
_ref_sel", };
+static const char *dram_pll_bypass_sels[] =3D {"dram_pll", "dram_pll_ref_s=
el", };
+static const char *gpu_pll_bypass_sels[] =3D {"gpu_pll", "gpu_pll_ref_sel"=
, };
+static const char *vpu_pll_bypass_sels[] =3D {"vpu_pll", "vpu_pll_ref_sel"=
, };
+static const char *arm_pll_bypass_sels[] =3D {"arm_pll", "arm_pll_ref_sel"=
, };
+static const char *sys_pll1_bypass_sels[] =3D {"sys_pll1", "sys_pll1_ref_s=
el", };
+static const char *sys_pll2_bypass_sels[] =3D {"sys_pll2", "sys_pll2_ref_s=
el", };
+static const char *sys_pll3_bypass_sels[] =3D {"sys_pll3", "sys_pll3_ref_s=
el", };
+
+/* CCM ROOT */
+static const char *imx8mm_a53_sels[] =3D {"osc_24m", "arm_pll_out", "sys_p=
ll2_500m", "sys_pll2_1000m",
+					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "sys_pll3_out", }=
;
+
+static const char *imx8mm_m4_sels[] =3D {"osc_24m", "sys_pll2_200m", "sys_=
pll2_250m", "sys_pll1_266m",
+				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_=
out", };
+
+static const char *imx8mm_vpu_sels[] =3D {"osc_24m", "arm_pll_out", "sys_p=
ll2_500m", "sys_pll2_1000m",
+					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "vpu_pll_out", };
+
+static const char *imx8mm_gpu3d_sels[] =3D {"osc_24m", "gpu_pll_out", "sys=
_pll1_800m", "sys_pll3_out",
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_o=
ut", };
+
+static const char *imx8mm_gpu2d_sels[] =3D {"osc_24m", "gpu_pll_out", "sys=
_pll1_800m", "sys_pll3_out",
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_o=
ut", };
+
+static const char *imx8mm_main_axi_sels[] =3D {"osc_24m", "sys_pll2_333m",=
 "sys_pll1_800m", "sys_pll2_250m",
+					     "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "sys_pll1_=
100m",};
+
+static const char *imx8mm_enet_axi_sels[] =3D {"osc_24m", "sys_pll1_266m",=
 "sys_pll1_800m", "sys_pll2_250m",
+					     "sys_pll2_200m", "audio_pll1_out", "video_pll1_out", "sys_pll3_o=
ut", };
+
+static const char *imx8mm_nand_usdhc_sels[] =3D {"osc_24m", "sys_pll1_266m=
", "sys_pll1_800m", "sys_pll2_200m",
+					       "sys_pll1_133m", "sys_pll3_out", "sys_pll2_250m", "audio_pll1_=
out", };
+
+static const char *imx8mm_vpu_bus_sels[] =3D {"osc_24m", "sys_pll1_800m", =
"vpu_pll_out", "audio_pll2_out",
+					    "sys_pll3_out", "sys_pll2_1000m", "sys_pll2_200m", "sys_pll1_100m=
", };
+
+static const char *imx8mm_disp_axi_sels[] =3D {"osc_24m", "sys_pll2_1000m"=
, "sys_pll1_800m", "sys_pll3_out",
+					     "sys_pll1_40m", "audio_pll2_out", "clk_ext1", "clk_ext4", };
+
+static const char *imx8mm_disp_apb_sels[] =3D {"osc_24m", "sys_pll2_125m",=
 "sys_pll1_800m", "sys_pll3_out",
+					     "sys_pll1_40m", "audio_pll2_out", "clk_ext1", "clk_ext3", };
+
+static const char *imx8mm_disp_rtrm_sels[] =3D {"osc_24m", "sys_pll1_800m"=
, "sys_pll2_200m", "sys_pll2_1000m",
+					      "audio_pll1_out", "video_pll1_out", "clk_ext2", "clk_ext3", };
+
+static const char *imx8mm_usb_bus_sels[] =3D {"osc_24m", "sys_pll2_500m", =
"sys_pll1_800m", "sys_pll2_100m",
+					    "sys_pll2_200m", "clk_ext2", "clk_ext4", "audio_pll2_out", };
+
+static const char *imx8mm_gpu_axi_sels[] =3D {"osc_24m", "sys_pll1_800m", =
"gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
+					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+
+static const char *imx8mm_gpu_ahb_sels[] =3D {"osc_24m", "sys_pll1_800m", =
"gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
+					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+
+static const char *imx8mm_noc_sels[] =3D {"osc_24m", "sys_pll1_800m", "sys=
_pll3_out", "sys_pll2_1000m", "sys_pll2_500m",
+					"audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+
+static const char *imx8mm_noc_apb_sels[] =3D {"osc_24m", "sys_pll1_400m", =
"sys_pll3_out", "sys_pll2_333m", "sys_pll2_200m",
+					    "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", };
+
+static const char *imx8mm_ahb_sels[] =3D {"osc_24m", "sys_pll1_133m", "sys=
_pll1_800m", "sys_pll1_400m",
+					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", =
};
+
+static const char *imx8mm_audio_ahb_sels[] =3D {"osc_24m", "sys_pll2_500m"=
, "sys_pll1_800m", "sys_pll2_1000m",
+					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll1_=
out", };
+
+static const char *imx8mm_dram_alt_sels[] =3D {"osc_24m", "sys_pll1_800m",=
 "sys_pll1_100m", "sys_pll2_500m",
+					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll1_out", "sys_pll1_26=
6m", };
+
+static const char *imx8mm_dram_apb_sels[] =3D {"osc_24m", "sys_pll2_200m",=
 "sys_pll1_40m", "sys_pll1_160m",
+					     "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_ou=
t", };
+
+static const char *imx8mm_vpu_g1_sels[] =3D {"osc_24m", "vpu_pll_out", "sy=
s_pll1_800m", "sys_pll2_1000m",
+					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out"=
, };
+
+static const char *imx8mm_vpu_g2_sels[] =3D {"osc_24m", "vpu_pll_out", "sy=
s_pll1_800m", "sys_pll2_1000m",
+					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out"=
, };
+
+static const char *imx8mm_disp_dtrc_sels[] =3D {"osc_24m", "video_pll2_out=
", "sys_pll1_800m", "sys_pll2_1000m",
+					      "sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_=
out", };
+
+static const char *imx8mm_disp_dc8000_sels[] =3D {"osc_24m", "video_pll2_o=
ut", "sys_pll1_800m", "sys_pll2_1000m",
+						"sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out",=
 };
+
+static const char *imx8mm_pcie1_ctrl_sels[] =3D {"osc_24m", "sys_pll2_250m=
", "sys_pll2_200m", "sys_pll1_266m",
+					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_o=
ut", };
+
+static const char *imx8mm_pcie1_phy_sels[] =3D {"osc_24m", "sys_pll2_100m"=
, "sys_pll2_500m", "clk_ext1", "clk_ext2",
+					      "clk_ext3", "clk_ext4", "sys_pll1_400m", };
+
+static const char *imx8mm_pcie1_aux_sels[] =3D {"osc_24m", "sys_pll2_200m"=
, "sys_pll2_50m", "sys_pll3_out",
+					      "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_160m", "sys_pll1_200=
m", };
+
+static const char *imx8mm_dc_pixel_sels[] =3D {"osc_24m", "video_pll1_out"=
, "audio_pll2_out", "audio_pll1_out",
+					     "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", }=
;
+
+static const char *imx8mm_lcdif_pixel_sels[] =3D {"osc_24m", "video_pll1_o=
ut", "audio_pll2_out", "audio_pll1_out",
+						"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
+
+static const char *imx8mm_sai1_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
+
+static const char *imx8mm_sai2_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
+
+static const char *imx8mm_sai3_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
+
+static const char *imx8mm_sai4_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
+
+static const char *imx8mm_sai5_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
+
+static const char *imx8mm_sai6_sels[] =3D {"osc_24m", "audio_pll1_out", "a=
udio_pll2_out", "video_pll1_out",
+					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
+
+static const char *imx8mm_spdif1_sels[] =3D {"osc_24m", "audio_pll1_out", =
"audio_pll2_out", "video_pll1_out",
+					   "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
+
+static const char *imx8mm_spdif2_sels[] =3D {"osc_24m", "audio_pll1_out", =
"audio_pll2_out", "video_pll1_out",
+					   "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
+
+static const char *imx8mm_enet_ref_sels[] =3D {"osc_24m", "sys_pll2_125m",=
 "sys_pll2_50m", "sys_pll2_100m",
+					     "sys_pll1_160m", "audio_pll1_out", "video_pll1_out", "clk_ext4",=
 };
+
+static const char *imx8mm_enet_timer_sels[] =3D {"osc_24m", "sys_pll2_100m=
", "audio_pll1_out", "clk_ext1", "clk_ext2",
+					       "clk_ext3", "clk_ext4", "video_pll1_out", };
+
+static const char *imx8mm_enet_phy_sels[] =3D {"osc_24m", "sys_pll2_50m", =
"sys_pll2_125m", "sys_pll2_200m",
+					     "sys_pll2_500m", "video_pll1_out", "audio_pll2_out", };
+
+static const char *imx8mm_nand_sels[] =3D {"osc_24m", "sys_pll2_500m", "au=
dio_pll1_out", "sys_pll1_400m",
+					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll1_out",=
 };
+
+static const char *imx8mm_qspi_sels[] =3D {"osc_24m", "sys_pll1_400m", "sy=
s_pll1_800m", "sys_pll2_500m",
+					 "audio_pll2_out", "sys_pll1_266m", "sys_pll3_out", "sys_pll1_100m", =
};
+
+static const char *imx8mm_usdhc1_sels[] =3D {"osc_24m", "sys_pll1_400m", "=
sys_pll1_800m", "sys_pll2_500m",
+					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m"=
, };
+
+static const char *imx8mm_usdhc2_sels[] =3D {"osc_24m", "sys_pll1_400m", "=
sys_pll1_800m", "sys_pll2_500m",
+					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m"=
, };
+
+static const char *imx8mm_i2c1_sels[] =3D {"osc_24m", "sys_pll1_160m", "sy=
s_pll2_50m", "sys_pll3_out", "audio_pll1_out",
+					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+
+static const char *imx8mm_i2c2_sels[] =3D {"osc_24m", "sys_pll1_160m", "sy=
s_pll2_50m", "sys_pll3_out", "audio_pll1_out",
+					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+
+static const char *imx8mm_i2c3_sels[] =3D {"osc_24m", "sys_pll1_160m", "sy=
s_pll2_50m", "sys_pll3_out", "audio_pll1_out",
+					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+
+static const char *imx8mm_i2c4_sels[] =3D {"osc_24m", "sys_pll1_160m", "sy=
s_pll2_50m", "sys_pll3_out", "audio_pll1_out",
+					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+
+static const char *imx8mm_uart1_sels[] =3D {"osc_24m", "sys_pll1_80m", "sy=
s_pll2_200m", "sys_pll2_100m",
+					  "sys_pll3_out", "clk_ext2", "clk_ext4", "audio_pll2_out", };
+
+static const char *imx8mm_uart2_sels[] =3D {"osc_24m", "sys_pll1_80m", "sy=
s_pll2_200m", "sys_pll2_100m",
+					  "sys_pll3_out", "clk_ext2", "clk_ext3", "audio_pll2_out", };
+
+static const char *imx8mm_uart3_sels[] =3D {"osc_24m", "sys_pll1_80m", "sy=
s_pll2_200m", "sys_pll2_100m",
+					  "sys_pll3_out", "clk_ext2", "clk_ext4", "audio_pll2_out", };
+
+static const char *imx8mm_uart4_sels[] =3D {"osc_24m", "sys_pll1_80m", "sy=
s_pll2_200m", "sys_pll2_100m",
+					  "sys_pll3_out", "clk_ext2", "clk_ext3", "audio_pll2_out", };
+
+static const char *imx8mm_usb_core_sels[] =3D {"osc_24m", "sys_pll1_100m",=
 "sys_pll1_40m", "sys_pll2_100m",
+					     "sys_pll2_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
+
+static const char *imx8mm_usb_phy_sels[] =3D {"osc_24m", "sys_pll1_100m", =
"sys_pll1_40m", "sys_pll2_100m",
+					     "sys_pll2_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
+
+static const char *imx8mm_ecspi1_sels[] =3D {"osc_24m", "sys_pll2_200m", "=
sys_pll1_40m", "sys_pll1_160m",
+					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out"=
, };
+
+static const char *imx8mm_ecspi2_sels[] =3D {"osc_24m", "sys_pll2_200m", "=
sys_pll1_40m", "sys_pll1_160m",
+					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out"=
, };
+
+static const char *imx8mm_pwm1_sels[] =3D {"osc_24m", "sys_pll2_100m", "sy=
s_pll1_160m", "sys_pll1_40m",
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+
+static const char *imx8mm_pwm2_sels[] =3D {"osc_24m", "sys_pll2_100m", "sy=
s_pll1_160m", "sys_pll1_40m",
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+
+static const char *imx8mm_pwm3_sels[] =3D {"osc_24m", "sys_pll2_100m", "sy=
s_pll1_160m", "sys_pll1_40m",
+					 "sys3_pll2_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+
+static const char *imx8mm_pwm4_sels[] =3D {"osc_24m", "sys_pll2_100m", "sy=
s_pll1_160m", "sys_pll1_40m",
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+
+static const char *imx8mm_gpt1_sels[] =3D {"osc_24m", "sys_pll2_100m", "sy=
s_pll1_400m", "sys_pll1_40m",
+					 "video_pll1_out", "sys_pll1_800m", "audio_pll1_out", "clk_ext1" };
+
+static const char *imx8mm_wdog_sels[] =3D {"osc_24m", "sys_pll1_133m", "sy=
s_pll1_160m", "vpu_pll_out",
+					 "sys_pll2_125m", "sys_pll3_out", "sys_pll1_80m", "sys_pll2_166m", };
+
+static const char *imx8mm_wrclk_sels[] =3D {"osc_24m", "sys_pll1_40m", "vp=
u_pll_out", "sys_pll3_out", "sys_pll2_200m",
+					  "sys_pll1_266m", "sys_pll2_500m", "sys_pll1_100m", };
+
+static const char *imx8mm_dsi_core_sels[] =3D {"osc_24m", "sys_pll1_266m",=
 "sys_pll2_250m", "sys_pll1_800m",
+					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_=
out", };
+
+static const char *imx8mm_dsi_phy_sels[] =3D {"osc_24m", "sys_pll2_125m", =
"sys_pll2_100m", "sys_pll1_800m",
+					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out",=
 };
+
+static const char *imx8mm_dsi_dbi_sels[] =3D {"osc_24m", "sys_pll1_266m", =
"sys_pll2_100m", "sys_pll1_800m",
+					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_o=
ut", };
+
+static const char *imx8mm_usdhc3_sels[] =3D {"osc_24m", "sys_pll1_400m", "=
sys_pll1_800m", "sys_pll2_500m",
+					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_clk", "sys_pll1_100m"=
, };
+
+static const char *imx8mm_csi1_core_sels[] =3D {"osc_24m", "sys_pll1_266m"=
, "sys_pll2_250m", "sys_pll1_800m",
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1=
_out", };
+
+static const char *imx8mm_csi1_phy_sels[] =3D {"osc_24m", "sys_pll2_333m",=
 "sys_pll2_100m", "sys_pll1_800m",
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out"=
, };
+
+static const char *imx8mm_csi1_esc_sels[] =3D {"osc_24m", "sys_pll2_100m",=
 "sys_pll1_80m", "sys_pll1_800m",
+					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", =
};
+
+static const char *imx8mm_csi2_core_sels[] =3D {"osc_24m", "sys_pll1_266m"=
, "sys_pll2_250m", "sys_pll1_800m",
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1=
_out", };
+
+static const char *imx8mm_csi2_phy_sels[] =3D {"osc_24m", "sys_pll2_333m",=
 "sys_pll2_100m", "sys_pll1_800m",
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out"=
, };
+
+static const char *imx8mm_csi2_esc_sels[] =3D {"osc_24m", "sys_pll2_100m",=
 "sys_pll1_80m", "sys_pll1_800m",
+					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", =
};
+
+static const char *imx8mm_pcie2_ctrl_sels[] =3D {"osc_24m", "sys_pll2_250m=
", "sys_pll2_200m", "sys_pll1_266m",
+					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_o=
ut", };
+
+static const char *imx8mm_pcie2_phy_sels[] =3D {"osc_24m", "sys_pll2_100m"=
, "sys_pll2_500m", "clk_ext1",
+					      "clk_ext2", "clk_ext3", "clk_ext4", "sys_pll1_400m", };
+
+static const char *imx8mm_pcie2_aux_sels[] =3D {"osc_24m", "sys_pll2_200m"=
, "sys_pll2_50m", "sys_pll3_out",
+					      "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_160m", "sys_pll1_200=
m", };
+
+static const char *imx8mm_ecspi3_sels[] =3D {"osc_24m", "sys_pll2_200m", "=
sys_pll1_40m", "sys_pll1_160m",
+					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out"=
, };
+
+static const char *imx8mm_pdm_sels[] =3D {"osc_24m", "sys_pll2_100m", "aud=
io_pll1_out", "sys_pll1_800m",
+					"sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
+
+static const char *imx8mm_vpu_h1_sels[] =3D {"osc_24m", "vpu_pll_out", "sy=
s_pll1_800m", "sys_pll2_1000m",
+					   "audio_pll2_clk", "sys_pll2_125m", "sys_pll3_clk", "audio_pll1_out=
", };
+
+static const char *imx8mm_dram_core_sels[] =3D {"dram_pll_out", "dram_alt_=
root", };
+
+static const char *imx8mm_clko1_sels[] =3D {"osc_24m", "sys_pll1_800m", "o=
sc_27m", "sys_pll1_200m", "audio_pll2_clk",
+					 "vpu_pll", "sys_pll1_80m", };
+
+static struct clk *clks[IMX8MM_CLK_END];
+static struct clk_onecell_data clk_data;
+
+static struct clk ** const uart_clks[] __initconst =3D {
+	&clks[IMX8MM_CLK_UART1_ROOT],
+	&clks[IMX8MM_CLK_UART2_ROOT],
+	&clks[IMX8MM_CLK_UART3_ROOT],
+	&clks[IMX8MM_CLK_UART4_ROOT],
+	NULL
+};
+
+static int imx8mm_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	void __iomem *base;
+	int ret =3D 0;
+
+	clks[IMX8MM_CLK_DUMMY] =3D imx_clk_fixed("dummy", 0);
+	clks[IMX8MM_CLK_24M] =3D of_clk_get_by_name(np, "osc_24m");
+	clks[IMX8MM_CLK_32K] =3D of_clk_get_by_name(np, "osc_32k"); /* Check more=
 */
+	clks[IMX8MM_CLK_EXT1] =3D of_clk_get_by_name(np, "clk_ext1");
+	clks[IMX8MM_CLK_EXT2] =3D of_clk_get_by_name(np, "clk_ext2");
+	clks[IMX8MM_CLK_EXT3] =3D of_clk_get_by_name(np, "clk_ext3");
+	clks[IMX8MM_CLK_EXT4] =3D of_clk_get_by_name(np, "clk_ext4");
+
+	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
+	base =3D of_iomap(np, 0);
+	if (WARN_ON(!base))
+		return -ENOMEM;
+
+	clks[IMX8MM_AUDIO_PLL1_REF_SEL] =3D imx_clk_mux("audio_pll1_ref_sel", bas=
e + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_AUDIO_PLL2_REF_SEL] =3D imx_clk_mux("audio_pll2_ref_sel", bas=
e + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_VIDEO_PLL1_REF_SEL] =3D imx_clk_mux("video_pll1_ref_sel", bas=
e + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_DRAM_PLL_REF_SEL] =3D imx_clk_mux("dram_pll_ref_sel", base + =
0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_GPU_PLL_REF_SEL] =3D imx_clk_mux("gpu_pll_ref_sel", base + 0x=
64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_VPU_PLL_REF_SEL] =3D imx_clk_mux("vpu_pll_ref_sel", base + 0x=
74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_ARM_PLL_REF_SEL] =3D imx_clk_mux("arm_pll_ref_sel", base + 0x=
84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_SYS_PLL1_REF_SEL] =3D imx_clk_mux("sys_pll1_ref_sel", base + =
0x94, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_SYS_PLL2_REF_SEL] =3D imx_clk_mux("sys_pll2_ref_sel", base + =
0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clks[IMX8MM_SYS_PLL3_REF_SEL] =3D imx_clk_mux("sys_pll3_ref_sel", base + =
0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	clks[IMX8MM_AUDIO_PLL1] =3D imx_clk_pll14xx("audio_pll1", "audio_pll1_ref=
_sel", base, &imx8mm_audio_pll);
+	clks[IMX8MM_AUDIO_PLL2] =3D imx_clk_pll14xx("audio_pll2", "audio_pll2_ref=
_sel", base + 0x14, &imx8mm_audio_pll);
+	clks[IMX8MM_VIDEO_PLL1] =3D imx_clk_pll14xx("video_pll1", "video_pll1_ref=
_sel", base + 0x28, &imx8mm_video_pll);
+	clks[IMX8MM_DRAM_PLL] =3D imx_clk_pll14xx("dram_pll", "dram_pll_ref_sel",=
 base + 0x50, &imx8mm_dram_pll);
+	clks[IMX8MM_GPU_PLL] =3D imx_clk_pll14xx("gpu_pll", "gpu_pll_ref_sel", ba=
se + 0x64, &imx8mm_gpu_pll);
+	clks[IMX8MM_VPU_PLL] =3D imx_clk_pll14xx("vpu_pll", "vpu_pll_ref_sel", ba=
se + 0x74, &imx8mm_vpu_pll);
+	clks[IMX8MM_ARM_PLL] =3D imx_clk_pll14xx("arm_pll", "arm_pll_ref_sel", ba=
se + 0x84, &imx8mm_arm_pll);
+	clks[IMX8MM_SYS_PLL1] =3D imx_clk_pll14xx("sys_pll1", "sys_pll1_ref_sel",=
 base + 0x94, &imx8mm_sys_pll);
+	clks[IMX8MM_SYS_PLL2] =3D imx_clk_pll14xx("sys_pll2", "sys_pll2_ref_sel",=
 base + 0x104, &imx8mm_sys_pll);
+	clks[IMX8MM_SYS_PLL3] =3D imx_clk_pll14xx("sys_pll3", "sys_pll3_ref_sel",=
 base + 0x114, &imx8mm_sys_pll);
+
+	/* PLL bypass out */
+	clks[IMX8MM_AUDIO_PLL1_BYPASS] =3D imx_clk_mux_flags("audio_pll1_bypass",=
 base, 4, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CL=
K_SET_RATE_PARENT);
+	clks[IMX8MM_AUDIO_PLL2_BYPASS] =3D imx_clk_mux_flags("audio_pll2_bypass",=
 base + 0x14, 4, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_se=
ls), CLK_SET_RATE_PARENT);
+	clks[IMX8MM_VIDEO_PLL1_BYPASS] =3D imx_clk_mux_flags("video_pll1_bypass",=
 base + 0x28, 4, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_se=
ls), CLK_SET_RATE_PARENT);
+	clks[IMX8MM_DRAM_PLL_BYPASS] =3D imx_clk_mux_flags("dram_pll_bypass", bas=
e + 0x50, 4, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK=
_SET_RATE_PARENT);
+	clks[IMX8MM_GPU_PLL_BYPASS] =3D imx_clk_mux_flags("gpu_pll_bypass", base =
+ 0x64, 4, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET=
_RATE_PARENT);
+	clks[IMX8MM_VPU_PLL_BYPASS] =3D imx_clk_mux_flags("vpu_pll_bypass", base =
+ 0x74, 4, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET=
_RATE_PARENT);
+	clks[IMX8MM_ARM_PLL_BYPASS] =3D imx_clk_mux_flags("arm_pll_bypass", base =
+ 0x84, 4, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET=
_RATE_PARENT);
+	clks[IMX8MM_SYS_PLL1_BYPASS] =3D imx_clk_mux_flags("sys_pll1_bypass", bas=
e + 0x94, 4, 1, sys_pll1_bypass_sels, ARRAY_SIZE(sys_pll1_bypass_sels), CLK=
_SET_RATE_PARENT);
+	clks[IMX8MM_SYS_PLL2_BYPASS] =3D imx_clk_mux_flags("sys_pll2_bypass", bas=
e + 0x104, 4, 1, sys_pll2_bypass_sels, ARRAY_SIZE(sys_pll2_bypass_sels), CL=
K_SET_RATE_PARENT);
+	clks[IMX8MM_SYS_PLL3_BYPASS] =3D imx_clk_mux_flags("sys_pll3_bypass", bas=
e + 0x114, 4, 1, sys_pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CL=
K_SET_RATE_PARENT);
+
+	/* unbypass all the plls */
+	clk_set_parent(clks[IMX8MM_AUDIO_PLL1_BYPASS], clks[IMX8MM_AUDIO_PLL1]);
+	clk_set_parent(clks[IMX8MM_AUDIO_PLL2_BYPASS], clks[IMX8MM_AUDIO_PLL2]);
+	clk_set_parent(clks[IMX8MM_VIDEO_PLL1_BYPASS], clks[IMX8MM_VIDEO_PLL1]);
+	clk_set_parent(clks[IMX8MM_DRAM_PLL_BYPASS], clks[IMX8MM_DRAM_PLL]);
+	clk_set_parent(clks[IMX8MM_GPU_PLL_BYPASS], clks[IMX8MM_GPU_PLL]);
+	clk_set_parent(clks[IMX8MM_VPU_PLL_BYPASS], clks[IMX8MM_VPU_PLL]);
+	clk_set_parent(clks[IMX8MM_ARM_PLL_BYPASS], clks[IMX8MM_ARM_PLL]);
+	clk_set_parent(clks[IMX8MM_SYS_PLL1_BYPASS], clks[IMX8MM_SYS_PLL1]);
+	clk_set_parent(clks[IMX8MM_SYS_PLL2_BYPASS], clks[IMX8MM_SYS_PLL2]);
+	clk_set_parent(clks[IMX8MM_SYS_PLL3_BYPASS], clks[IMX8MM_SYS_PLL3]);
+
+	/* PLL out gate */
+	clks[IMX8MM_AUDIO_PLL1_OUT] =3D imx_clk_gate("audio_pll1_out", "audio_pll=
1_bypass", base, 13);
+	clks[IMX8MM_AUDIO_PLL2_OUT] =3D imx_clk_gate("audio_pll2_out", "audio_pll=
2_bypass", base + 0x14, 13);
+	clks[IMX8MM_VIDEO_PLL1_OUT] =3D imx_clk_gate("video_pll1_out", "video_pll=
1_bypass", base + 0x28, 13);
+	clks[IMX8MM_DRAM_PLL_OUT] =3D imx_clk_gate("dram_pll_out", "dram_pll_bypa=
ss", base + 0x50, 13);
+	clks[IMX8MM_GPU_PLL_OUT] =3D imx_clk_gate("gpu_pll_out", "gpu_pll_bypass"=
, base + 0x64, 13);
+	clks[IMX8MM_VPU_PLL_OUT] =3D imx_clk_gate("vpu_pll_out", "vpu_pll_bypass"=
, base + 0x74, 13);
+	clks[IMX8MM_ARM_PLL_OUT] =3D imx_clk_gate("arm_pll_out", "arm_pll_bypass"=
, base + 0x84, 13);
+	clks[IMX8MM_SYS_PLL1_OUT] =3D imx_clk_gate("sys_pll1_out", "sys_pll1_bypa=
ss", base + 0x94, 13);
+	clks[IMX8MM_SYS_PLL2_OUT] =3D imx_clk_gate("sys_pll2_out", "sys_pll2_bypa=
ss", base + 0x104, 13);
+	clks[IMX8MM_SYS_PLL3_OUT] =3D imx_clk_gate("sys_pll3_out", "sys_pll3_bypa=
ss", base + 0x114, 13);
+
+	/* SYS PLL fixed output */
+	clks[IMX8MM_SYS_PLL1_40M] =3D imx_clk_fixed_factor("sys_pll1_40m", "sys_p=
ll1_out", 1, 20);
+	clks[IMX8MM_SYS_PLL1_80M] =3D imx_clk_fixed_factor("sys_pll1_80m", "sys_p=
ll1_out", 1, 10);
+	clks[IMX8MM_SYS_PLL1_100M] =3D imx_clk_fixed_factor("sys_pll1_100m", "sys=
_pll1_out", 1, 8);
+	clks[IMX8MM_SYS_PLL1_133M] =3D imx_clk_fixed_factor("sys_pll1_133m", "sys=
_pll1_out", 1, 6);
+	clks[IMX8MM_SYS_PLL1_160M] =3D imx_clk_fixed_factor("sys_pll1_160m", "sys=
_pll1_out", 1, 5);
+	clks[IMX8MM_SYS_PLL1_200M] =3D imx_clk_fixed_factor("sys_pll1_200m", "sys=
_pll1_out", 1, 4);
+	clks[IMX8MM_SYS_PLL1_266M] =3D imx_clk_fixed_factor("sys_pll1_266m", "sys=
_pll1_out", 1, 3);
+	clks[IMX8MM_SYS_PLL1_400M] =3D imx_clk_fixed_factor("sys_pll1_400m", "sys=
_pll1_out", 1, 2);
+	clks[IMX8MM_SYS_PLL1_800M] =3D imx_clk_fixed_factor("sys_pll1_800m", "sys=
_pll1_out", 1, 1);
+
+	clks[IMX8MM_SYS_PLL2_50M] =3D imx_clk_fixed_factor("sys_pll2_50m", "sys_p=
ll2_out", 1, 20);
+	clks[IMX8MM_SYS_PLL2_100M] =3D imx_clk_fixed_factor("sys_pll2_100m", "sys=
_pll2_out", 1, 10);
+	clks[IMX8MM_SYS_PLL2_125M] =3D imx_clk_fixed_factor("sys_pll2_125m", "sys=
_pll2_out", 1, 8);
+	clks[IMX8MM_SYS_PLL2_166M] =3D imx_clk_fixed_factor("sys_pll2_166m", "sys=
_pll2_out", 1, 6);
+	clks[IMX8MM_SYS_PLL2_200M] =3D imx_clk_fixed_factor("sys_pll2_200m", "sys=
_pll2_out", 1, 5);
+	clks[IMX8MM_SYS_PLL2_250M] =3D imx_clk_fixed_factor("sys_pll2_250m", "sys=
_pll2_out", 1, 4);
+	clks[IMX8MM_SYS_PLL2_333M] =3D imx_clk_fixed_factor("sys_pll2_333m", "sys=
_pll2_out", 1, 3);
+	clks[IMX8MM_SYS_PLL2_500M] =3D imx_clk_fixed_factor("sys_pll2_500m", "sys=
_pll2_out", 1, 2);
+	clks[IMX8MM_SYS_PLL2_1000M] =3D imx_clk_fixed_factor("sys_pll2_1000m", "s=
ys_pll2_out", 1, 1);
+
+	np =3D dev->of_node;
+	base =3D of_iomap(np, 0);
+	if (WARN_ON(!base))
+		return -ENOMEM;
+
+	/* Core Slice */
+	clks[IMX8MM_CLK_A53_SRC] =3D imx_clk_mux2("arm_a53_src", base + 0x8000, 2=
4, 3, imx8mm_a53_sels, ARRAY_SIZE(imx8mm_a53_sels));
+	clks[IMX8MM_CLK_M4_SRC] =3D imx_clk_mux2("arm_m4_src", base + 0x8080, 24,=
 3, imx8mm_m4_sels, ARRAY_SIZE(imx8mm_m4_sels));
+	clks[IMX8MM_CLK_VPU_SRC] =3D imx_clk_mux2("vpu_src", base + 0x8100, 24, 3=
, imx8mm_vpu_sels, ARRAY_SIZE(imx8mm_vpu_sels));
+	clks[IMX8MM_CLK_GPU3D_SRC] =3D imx_clk_mux2("gpu3d_src", base + 0x8180, 2=
4, 3,  imx8mm_gpu3d_sels, ARRAY_SIZE(imx8mm_gpu3d_sels));
+	clks[IMX8MM_CLK_GPU2D_SRC] =3D imx_clk_mux2("gpu2d_src", base + 0x8200, 2=
4, 3, imx8mm_gpu2d_sels,  ARRAY_SIZE(imx8mm_gpu2d_sels));
+	clks[IMX8MM_CLK_A53_CG] =3D imx_clk_gate3("arm_a53_cg", "arm_a53_src", ba=
se + 0x8000, 28);
+	clks[IMX8MM_CLK_M4_CG] =3D imx_clk_gate3("arm_m4_cg", "arm_m4_src", base =
+ 0x8080, 28);
+	clks[IMX8MM_CLK_VPU_CG] =3D imx_clk_gate3("vpu_cg", "vpu_src", base + 0x8=
100, 28);
+	clks[IMX8MM_CLK_GPU3D_CG] =3D imx_clk_gate3("gpu3d_cg", "gpu3d_src", base=
 + 0x8180, 28);
+	clks[IMX8MM_CLK_GPU2D_CG] =3D imx_clk_gate3("gpu2d_cg", "gpu2d_src", base=
 + 0x8200, 28);
+
+	clks[IMX8MM_CLK_A53_DIV] =3D imx_clk_divider2("arm_a53_div", "arm_a53_cg"=
, base + 0x8000, 0, 3);
+	clks[IMX8MM_CLK_M4_DIV] =3D imx_clk_divider2("arm_m4_div", "arm_m4_cg", b=
ase + 0x8080, 0, 3);
+	clks[IMX8MM_CLK_VPU_DIV] =3D imx_clk_divider2("vpu_div", "vpu_cg", base +=
 0x8100, 0, 3);
+	clks[IMX8MM_CLK_GPU3D_DIV] =3D imx_clk_divider2("gpu3d_div", "gpu3d_cg", =
base + 0x8180, 0, 3);
+	clks[IMX8MM_CLK_GPU2D_DIV] =3D imx_clk_divider2("gpu2d_div", "gpu2d_cg", =
base + 0x8200, 0, 3);
+
+	/* BUS */
+	clks[IMX8MM_CLK_MAIN_AXI] =3D imx8m_clk_composite_critical("main_axi",  i=
mx8mm_main_axi_sels, base + 0x8800);
+	clks[IMX8MM_CLK_ENET_AXI] =3D imx8m_clk_composite("enet_axi", imx8mm_enet=
_axi_sels, base + 0x8880);
+	clks[IMX8MM_CLK_NAND_USDHC_BUS] =3D imx8m_clk_composite_critical("nand_us=
dhc_bus", imx8mm_nand_usdhc_sels, base + 0x8900);
+	clks[IMX8MM_CLK_VPU_BUS] =3D imx8m_clk_composite("vpu_bus", imx8mm_vpu_bu=
s_sels, base + 0x8980);
+	clks[IMX8MM_CLK_DISP_AXI] =3D imx8m_clk_composite("disp_axi", imx8mm_disp=
_axi_sels, base + 0x8a00);
+	clks[IMX8MM_CLK_DISP_APB] =3D imx8m_clk_composite("disp_apb", imx8mm_disp=
_apb_sels, base + 0x8a80);
+	clks[IMX8MM_CLK_DISP_RTRM] =3D imx8m_clk_composite("disp_rtrm", imx8mm_di=
sp_rtrm_sels, base + 0x8b00);
+	clks[IMX8MM_CLK_USB_BUS] =3D imx8m_clk_composite("usb_bus", imx8mm_usb_bu=
s_sels, base + 0x8b80);
+	clks[IMX8MM_CLK_GPU_AXI] =3D imx8m_clk_composite("gpu_axi", imx8mm_gpu_ax=
i_sels, base + 0x8c00);
+	clks[IMX8MM_CLK_GPU_AHB] =3D imx8m_clk_composite("gpu_ahb", imx8mm_gpu_ah=
b_sels, base + 0x8c80);
+	clks[IMX8MM_CLK_NOC] =3D imx8m_clk_composite_critical("noc", imx8mm_noc_s=
els, base + 0x8d00);
+	clks[IMX8MM_CLK_NOC_APB] =3D imx8m_clk_composite_critical("noc_apb", imx8=
mm_noc_apb_sels, base + 0x8d80);
+
+	/* AHB */
+	clks[IMX8MM_CLK_AHB] =3D imx8m_clk_composite_critical("ahb", imx8mm_ahb_s=
els, base + 0x9000);
+	clks[IMX8MM_CLK_AUDIO_AHB] =3D imx8m_clk_composite("audio_ahb", imx8mm_au=
dio_ahb_sels, base + 0x9100);
+
+	/* IPG */
+	clks[IMX8MM_CLK_IPG_ROOT] =3D imx_clk_divider2("ipg_root", "ahb", base + =
0x9080, 0, 1);
+	clks[IMX8MM_CLK_IPG_AUDIO_ROOT] =3D imx_clk_divider2("ipg_audio_root", "a=
udio_ahb", base + 0x9180, 0, 1);
+
+	/* IP */
+	clks[IMX8MM_CLK_DRAM_ALT] =3D imx8m_clk_composite("dram_alt", imx8mm_dram=
_alt_sels, base + 0xa000);
+	clks[IMX8MM_CLK_DRAM_APB] =3D imx8m_clk_composite("dram_apb", imx8mm_dram=
_apb_sels, base + 0xa080);
+	clks[IMX8MM_CLK_VPU_G1] =3D imx8m_clk_composite("vpu_g1", imx8mm_vpu_g1_s=
els, base + 0xa100);
+	clks[IMX8MM_CLK_VPU_G2] =3D imx8m_clk_composite("vpu_g2", imx8mm_vpu_g2_s=
els, base + 0xa180);
+	clks[IMX8MM_CLK_DISP_DTRC] =3D imx8m_clk_composite("disp_dtrc", imx8mm_di=
sp_dtrc_sels, base + 0xa200);
+	clks[IMX8MM_CLK_DISP_DC8000] =3D imx8m_clk_composite("disp_dc8000", imx8m=
m_disp_dc8000_sels, base + 0xa280);
+	clks[IMX8MM_CLK_PCIE1_CTRL] =3D imx8m_clk_composite("pcie1_ctrl", imx8mm_=
pcie1_ctrl_sels, base + 0xa300);
+	clks[IMX8MM_CLK_PCIE1_PHY] =3D imx8m_clk_composite("pcie1_phy", imx8mm_pc=
ie1_phy_sels, base + 0xa380);
+	clks[IMX8MM_CLK_PCIE1_AUX] =3D imx8m_clk_composite("pcie1_aux", imx8mm_pc=
ie1_aux_sels, base + 0xa400);
+	clks[IMX8MM_CLK_DC_PIXEL] =3D imx8m_clk_composite("dc_pixel", imx8mm_dc_p=
ixel_sels, base + 0xa480);
+	clks[IMX8MM_CLK_LCDIF_PIXEL] =3D imx8m_clk_composite("lcdif_pixel", imx8m=
m_lcdif_pixel_sels, base + 0xa500);
+	clks[IMX8MM_CLK_SAI1] =3D imx8m_clk_composite("sai1", imx8mm_sai1_sels, b=
ase + 0xa580);
+	clks[IMX8MM_CLK_SAI2] =3D imx8m_clk_composite("sai2", imx8mm_sai2_sels, b=
ase + 0xa600);
+	clks[IMX8MM_CLK_SAI3] =3D imx8m_clk_composite("sai3", imx8mm_sai3_sels, b=
ase + 0xa680);
+	clks[IMX8MM_CLK_SAI4] =3D imx8m_clk_composite("sai4", imx8mm_sai4_sels, b=
ase + 0xa700);
+	clks[IMX8MM_CLK_SAI5] =3D imx8m_clk_composite("sai5", imx8mm_sai5_sels, b=
ase + 0xa780);
+	clks[IMX8MM_CLK_SAI6] =3D imx8m_clk_composite("sai6", imx8mm_sai6_sels, b=
ase + 0xa800);
+	clks[IMX8MM_CLK_SPDIF1] =3D imx8m_clk_composite("spdif1", imx8mm_spdif1_s=
els, base + 0xa880);
+	clks[IMX8MM_CLK_SPDIF2] =3D imx8m_clk_composite("spdif2", imx8mm_spdif2_s=
els, base + 0xa900);
+	clks[IMX8MM_CLK_ENET_REF] =3D imx8m_clk_composite("enet_ref", imx8mm_enet=
_ref_sels, base + 0xa980);
+	clks[IMX8MM_CLK_ENET_TIMER] =3D imx8m_clk_composite("enet_timer", imx8mm_=
enet_timer_sels, base + 0xaa00);
+	clks[IMX8MM_CLK_ENET_PHY_REF] =3D imx8m_clk_composite("enet_phy", imx8mm_=
enet_phy_sels, base + 0xaa80);
+	clks[IMX8MM_CLK_NAND] =3D imx8m_clk_composite("nand", imx8mm_nand_sels, b=
ase + 0xab00);
+	clks[IMX8MM_CLK_QSPI] =3D imx8m_clk_composite("qspi", imx8mm_qspi_sels, b=
ase + 0xab80);
+	clks[IMX8MM_CLK_USDHC1] =3D imx8m_clk_composite("usdhc1", imx8mm_usdhc1_s=
els, base + 0xac00);
+	clks[IMX8MM_CLK_USDHC2] =3D imx8m_clk_composite("usdhc2", imx8mm_usdhc2_s=
els, base + 0xac80);
+	clks[IMX8MM_CLK_I2C1] =3D imx8m_clk_composite("i2c1", imx8mm_i2c1_sels, b=
ase + 0xad00);
+	clks[IMX8MM_CLK_I2C2] =3D imx8m_clk_composite("i2c2", imx8mm_i2c2_sels, b=
ase + 0xad80);
+	clks[IMX8MM_CLK_I2C3] =3D imx8m_clk_composite("i2c3", imx8mm_i2c3_sels, b=
ase + 0xae00);
+	clks[IMX8MM_CLK_I2C4] =3D imx8m_clk_composite("i2c4", imx8mm_i2c4_sels, b=
ase + 0xae80);
+	clks[IMX8MM_CLK_UART1] =3D imx8m_clk_composite("uart1", imx8mm_uart1_sels=
, base + 0xaf00);
+	clks[IMX8MM_CLK_UART2] =3D imx8m_clk_composite("uart2", imx8mm_uart2_sels=
, base + 0xaf80);
+	clks[IMX8MM_CLK_UART3] =3D imx8m_clk_composite("uart3", imx8mm_uart3_sels=
, base + 0xb000);
+	clks[IMX8MM_CLK_UART4] =3D imx8m_clk_composite("uart4", imx8mm_uart4_sels=
, base + 0xb080);
+	clks[IMX8MM_CLK_USB_CORE_REF] =3D imx8m_clk_composite("usb_core_ref", imx=
8mm_usb_core_sels, base + 0xb100);
+	clks[IMX8MM_CLK_USB_PHY_REF] =3D imx8m_clk_composite("usb_phy_ref", imx8m=
m_usb_phy_sels, base + 0xb180);
+	clks[IMX8MM_CLK_ECSPI1] =3D imx8m_clk_composite("ecspi1", imx8mm_ecspi1_s=
els, base + 0xb280);
+	clks[IMX8MM_CLK_ECSPI2] =3D imx8m_clk_composite("ecspi2", imx8mm_ecspi2_s=
els, base + 0xb300);
+	clks[IMX8MM_CLK_PWM1] =3D imx8m_clk_composite("pwm1", imx8mm_pwm1_sels, b=
ase + 0xb380);
+	clks[IMX8MM_CLK_PWM2] =3D imx8m_clk_composite("pwm2", imx8mm_pwm2_sels, b=
ase + 0xb400);
+	clks[IMX8MM_CLK_PWM3] =3D imx8m_clk_composite("pwm3", imx8mm_pwm3_sels, b=
ase + 0xb480);
+	clks[IMX8MM_CLK_PWM4] =3D imx8m_clk_composite("pwm4", imx8mm_pwm4_sels, b=
ase + 0xb500);
+	clks[IMX8MM_CLK_GPT1] =3D imx8m_clk_composite("gpt1", imx8mm_gpt1_sels, b=
ase + 0xb580);
+	clks[IMX8MM_CLK_WDOG] =3D imx8m_clk_composite("wdog", imx8mm_wdog_sels, b=
ase + 0xb900);
+	clks[IMX8MM_CLK_WRCLK] =3D imx8m_clk_composite("wrclk", imx8mm_wrclk_sels=
, base + 0xb980);
+	clks[IMX8MM_CLK_CLKO1] =3D imx8m_clk_composite("clko1", imx8mm_clko1_sels=
, base + 0xba00);
+	clks[IMX8MM_CLK_DSI_CORE] =3D imx8m_clk_composite("dsi_core", imx8mm_dsi_=
core_sels, base + 0xbb00);
+	clks[IMX8MM_CLK_DSI_PHY_REF] =3D imx8m_clk_composite("dsi_phy_ref", imx8m=
m_dsi_phy_sels, base + 0xbb80);
+	clks[IMX8MM_CLK_DSI_DBI] =3D imx8m_clk_composite("dsi_dbi", imx8mm_dsi_db=
i_sels, base + 0xbc00);
+	clks[IMX8MM_CLK_USDHC3] =3D imx8m_clk_composite("usdhc3", imx8mm_usdhc3_s=
els, base + 0xbc80);
+	clks[IMX8MM_CLK_CSI1_CORE] =3D imx8m_clk_composite("csi1_core", imx8mm_cs=
i1_core_sels, base + 0xbd00);
+	clks[IMX8MM_CLK_CSI1_PHY_REF] =3D imx8m_clk_composite("csi1_phy_ref", imx=
8mm_csi1_phy_sels, base + 0xbd80);
+	clks[IMX8MM_CLK_CSI1_ESC] =3D imx8m_clk_composite("csi1_esc", imx8mm_csi1=
_esc_sels, base + 0xbe00);
+	clks[IMX8MM_CLK_CSI2_CORE] =3D imx8m_clk_composite("csi2_core", imx8mm_cs=
i2_core_sels, base + 0xbe80);
+	clks[IMX8MM_CLK_CSI2_PHY_REF] =3D imx8m_clk_composite("csi2_phy_ref", imx=
8mm_csi2_phy_sels, base + 0xbf00);
+	clks[IMX8MM_CLK_CSI2_ESC] =3D imx8m_clk_composite("csi2_esc", imx8mm_csi2=
_esc_sels, base + 0xbf80);
+	clks[IMX8MM_CLK_PCIE2_CTRL] =3D imx8m_clk_composite("pcie2_ctrl", imx8mm_=
pcie2_ctrl_sels, base + 0xc000);
+	clks[IMX8MM_CLK_PCIE2_PHY] =3D imx8m_clk_composite("pcie2_phy", imx8mm_pc=
ie2_phy_sels, base + 0xc080);
+	clks[IMX8MM_CLK_PCIE2_AUX] =3D imx8m_clk_composite("pcie2_aux", imx8mm_pc=
ie2_aux_sels, base + 0xc100);
+	clks[IMX8MM_CLK_ECSPI3] =3D imx8m_clk_composite("ecspi3", imx8mm_ecspi3_s=
els, base + 0xc180);
+	clks[IMX8MM_CLK_PDM] =3D imx8m_clk_composite("pdm", imx8mm_pdm_sels, base=
 + 0xc200);
+	clks[IMX8MM_CLK_VPU_H1] =3D imx8m_clk_composite("vpu_h1", imx8mm_vpu_h1_s=
els, base + 0xc280);
+
+	/* CCGR */
+	clks[IMX8MM_CLK_ECSPI1_ROOT] =3D imx_clk_gate4("ecspi1_root_clk", "ecspi1=
", base + 0x4070, 0);
+	clks[IMX8MM_CLK_ECSPI2_ROOT] =3D imx_clk_gate4("ecspi2_root_clk", "ecspi2=
", base + 0x4080, 0);
+	clks[IMX8MM_CLK_ECSPI3_ROOT] =3D imx_clk_gate4("ecspi3_root_clk", "ecspi3=
", base + 0x4090, 0);
+	clks[IMX8MM_CLK_ENET1_ROOT] =3D imx_clk_gate4("enet1_root_clk", "enet_axi=
", base + 0x40a0, 0);
+	clks[IMX8MM_CLK_GPT1_ROOT] =3D imx_clk_gate4("gpt1_root_clk", "gpt1", bas=
e + 0x4100, 0);
+	clks[IMX8MM_CLK_I2C1_ROOT] =3D imx_clk_gate4("i2c1_root_clk", "i2c1", bas=
e + 0x4170, 0);
+	clks[IMX8MM_CLK_I2C2_ROOT] =3D imx_clk_gate4("i2c2_root_clk", "i2c2", bas=
e + 0x4180, 0);
+	clks[IMX8MM_CLK_I2C3_ROOT] =3D imx_clk_gate4("i2c3_root_clk", "i2c3", bas=
e + 0x4190, 0);
+	clks[IMX8MM_CLK_I2C4_ROOT] =3D imx_clk_gate4("i2c4_root_clk", "i2c4", bas=
e + 0x41a0, 0);
+	clks[IMX8MM_CLK_MU_ROOT] =3D imx_clk_gate4("mu_root_clk", "ipg_root", bas=
e + 0x4210, 0);
+	clks[IMX8MM_CLK_OCOTP_ROOT] =3D imx_clk_gate4("ocotp_root_clk", "ipg_root=
", base + 0x4220, 0);
+	clks[IMX8MM_CLK_PCIE1_ROOT] =3D imx_clk_gate4("pcie1_root_clk", "pcie1_ct=
rl", base + 0x4250, 0);
+	clks[IMX8MM_CLK_PWM1_ROOT] =3D imx_clk_gate4("pwm1_root_clk", "pwm1", bas=
e + 0x4280, 0);
+	clks[IMX8MM_CLK_PWM2_ROOT] =3D imx_clk_gate4("pwm2_root_clk", "pwm2", bas=
e + 0x4290, 0);
+	clks[IMX8MM_CLK_PWM3_ROOT] =3D imx_clk_gate4("pwm3_root_clk", "pwm3", bas=
e + 0x42a0, 0);
+	clks[IMX8MM_CLK_PWM4_ROOT] =3D imx_clk_gate4("pwm4_root_clk", "pwm4", bas=
e + 0x42b0, 0);
+	clks[IMX8MM_CLK_QSPI_ROOT] =3D imx_clk_gate4("qspi_root_clk", "qspi", bas=
e + 0x42f0, 0);
+	clks[IMX8MM_CLK_NAND_ROOT] =3D imx_clk_gate2_shared2("nand_root_clk", "na=
nd", base + 0x4300, 0, &share_count_nand);
+	clks[IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK] =3D imx_clk_gate2_shared2("na=
nd_usdhc_rawnand_clk", "nand_usdhc_bus", base + 0x4300, 0, &share_count_nan=
d);
+	clks[IMX8MM_CLK_SAI1_ROOT] =3D imx_clk_gate2_shared2("sai1_root_clk", "sa=
i1", base + 0x4330, 0, &share_count_sai1);
+	clks[IMX8MM_CLK_SAI1_IPG] =3D imx_clk_gate2_shared2("sai1_ipg_clk", "ipg_=
audio_root", base + 0x4330, 0, &share_count_sai1);
+	clks[IMX8MM_CLK_SAI2_ROOT] =3D imx_clk_gate2_shared2("sai2_root_clk", "sa=
i2", base + 0x4340, 0, &share_count_sai2);
+	clks[IMX8MM_CLK_SAI2_IPG] =3D imx_clk_gate2_shared2("sai2_ipg_clk", "ipg_=
audio_root", base + 0x4340, 0, &share_count_sai2);
+	clks[IMX8MM_CLK_SAI3_ROOT] =3D imx_clk_gate2_shared2("sai3_root_clk", "sa=
i3", base + 0x4350, 0, &share_count_sai3);
+	clks[IMX8MM_CLK_SAI3_IPG] =3D imx_clk_gate2_shared2("sai3_ipg_clk", "ipg_=
audio_root", base + 0x4350, 0, &share_count_sai3);
+	clks[IMX8MM_CLK_SAI4_ROOT] =3D imx_clk_gate2_shared2("sai4_root_clk", "sa=
i4", base + 0x4360, 0, &share_count_sai4);
+	clks[IMX8MM_CLK_SAI4_IPG] =3D imx_clk_gate2_shared2("sai4_ipg_clk", "ipg_=
audio_root", base + 0x4360, 0, &share_count_sai4);
+	clks[IMX8MM_CLK_SAI5_ROOT] =3D imx_clk_gate2_shared2("sai5_root_clk", "sa=
i5", base + 0x4370, 0, &share_count_sai5);
+	clks[IMX8MM_CLK_SAI5_IPG] =3D imx_clk_gate2_shared2("sai5_ipg_clk", "ipg_=
audio_root", base + 0x4370, 0, &share_count_sai5);
+	clks[IMX8MM_CLK_SAI6_ROOT] =3D imx_clk_gate2_shared2("sai6_root_clk", "sa=
i6", base + 0x4380, 0, &share_count_sai6);
+	clks[IMX8MM_CLK_SAI6_IPG] =3D imx_clk_gate2_shared2("sai6_ipg_clk", "ipg_=
audio_root", base + 0x4380, 0, &share_count_sai6);
+	clks[IMX8MM_CLK_UART1_ROOT] =3D imx_clk_gate4("uart1_root_clk", "uart1", =
base + 0x4490, 0);
+	clks[IMX8MM_CLK_UART2_ROOT] =3D imx_clk_gate4("uart2_root_clk", "uart2", =
base + 0x44a0, 0);
+	clks[IMX8MM_CLK_UART3_ROOT] =3D imx_clk_gate4("uart3_root_clk", "uart3", =
base + 0x44b0, 0);
+	clks[IMX8MM_CLK_UART4_ROOT] =3D imx_clk_gate4("uart4_root_clk", "uart4", =
base + 0x44c0, 0);
+	clks[IMX8MM_CLK_USB1_CTRL_ROOT] =3D imx_clk_gate4("usb1_ctrl_root_clk", "=
usb_core_ref", base + 0x44d0, 0);
+	clks[IMX8MM_CLK_GPU3D_ROOT] =3D imx_clk_gate4("gpu3d_root_clk", "gpu3d_di=
v", base + 0x44f0, 0);
+	clks[IMX8MM_CLK_USDHC1_ROOT] =3D imx_clk_gate4("usdhc1_root_clk", "usdhc1=
", base + 0x4510, 0);
+	clks[IMX8MM_CLK_USDHC2_ROOT] =3D imx_clk_gate4("usdhc2_root_clk", "usdhc2=
", base + 0x4520, 0);
+	clks[IMX8MM_CLK_WDOG1_ROOT] =3D imx_clk_gate4("wdog1_root_clk", "wdog", b=
ase + 0x4530, 0);
+	clks[IMX8MM_CLK_WDOG2_ROOT] =3D imx_clk_gate4("wdog2_root_clk", "wdog", b=
ase + 0x4540, 0);
+	clks[IMX8MM_CLK_WDOG3_ROOT] =3D imx_clk_gate4("wdog3_root_clk", "wdog", b=
ase + 0x4550, 0);
+	clks[IMX8MM_CLK_VPU_G1_ROOT] =3D imx_clk_gate4("vpu_g1_root_clk", "vpu_g1=
", base + 0x4560, 0);
+	clks[IMX8MM_CLK_GPU_BUS_ROOT] =3D imx_clk_gate4("gpu_root_clk", "gpu_axi"=
, base + 0x4570, 0);
+	clks[IMX8MM_CLK_VPU_H1_ROOT] =3D imx_clk_gate4("vpu_h1_root_clk", "vpu_h1=
", base + 0x4590, 0);
+	clks[IMX8MM_CLK_VPU_G2_ROOT] =3D imx_clk_gate4("vpu_g2_root_clk", "vpu_g2=
", base + 0x45a0, 0);
+	clks[IMX8MM_CLK_PDM_ROOT] =3D imx_clk_gate2_shared2("pdm_root_clk", "pdm"=
, base + 0x45b0, 0, &share_count_pdm);
+	clks[IMX8MM_CLK_PDM_IPG]  =3D imx_clk_gate2_shared2("pdm_ipg_clk", "ipg_a=
udio_root", base + 0x45b0, 0, &share_count_pdm);
+	clks[IMX8MM_CLK_DISP_ROOT] =3D imx_clk_gate2_shared2("disp_root_clk", "di=
sp_dc8000", base + 0x45d0, 0, &share_count_dcss);
+	clks[IMX8MM_CLK_DISP_AXI_ROOT]  =3D imx_clk_gate2_shared2("disp_axi_root_=
clk", "disp_axi", base + 0x45d0, 0, &share_count_dcss);
+	clks[IMX8MM_CLK_DISP_APB_ROOT]  =3D imx_clk_gate2_shared2("disp_apb_root_=
clk", "disp_apb", base + 0x45d0, 0, &share_count_dcss);
+	clks[IMX8MM_CLK_DISP_RTRM_ROOT] =3D imx_clk_gate2_shared2("disp_rtrm_root=
_clk", "disp_rtrm", base + 0x45d0, 0, &share_count_dcss);
+	clks[IMX8MM_CLK_USDHC3_ROOT] =3D imx_clk_gate4("usdhc3_root_clk", "usdhc3=
", base + 0x45e0, 0);
+	clks[IMX8MM_CLK_TMU_ROOT] =3D imx_clk_gate4("tmu_root_clk", "ipg_root", b=
ase + 0x4620, 0);
+	clks[IMX8MM_CLK_VPU_DEC_ROOT] =3D imx_clk_gate4("vpu_dec_root_clk", "vpu_=
bus", base + 0x4630, 0);
+	clks[IMX8MM_CLK_SDMA1_ROOT] =3D imx_clk_gate4("sdma1_clk", "ipg_root", ba=
se + 0x43a0, 0);
+	clks[IMX8MM_CLK_SDMA2_ROOT] =3D imx_clk_gate4("sdma2_clk", "ipg_audio_roo=
t", base + 0x43b0, 0);
+	clks[IMX8MM_CLK_SDMA3_ROOT] =3D imx_clk_gate4("sdma3_clk", "ipg_audio_roo=
t", base + 0x45f0, 0);
+	clks[IMX8MM_CLK_GPU2D_ROOT] =3D imx_clk_gate4("gpu2d_root_clk", "gpu2d_di=
v", base + 0x4660, 0);
+	clks[IMX8MM_CLK_CSI1_ROOT] =3D imx_clk_gate4("csi1_root_clk", "csi1_core"=
, base + 0x4650, 0);
+
+	clks[IMX8MM_CLK_GPT_3M] =3D imx_clk_fixed_factor("gpt_3m", "osc_24m", 1, =
8);
+
+	clks[IMX8MM_CLK_DRAM_ALT_ROOT] =3D imx_clk_fixed_factor("dram_alt_root", =
"dram_alt", 1, 4);
+	clks[IMX8MM_CLK_DRAM_CORE] =3D imx_clk_mux2_flags("dram_core_clk", base +=
 0x9800, 24, 1, imx8mm_dram_core_sels, ARRAY_SIZE(imx8mm_dram_core_sels), C=
LK_IS_CRITICAL);
+
+	clks[IMX8MM_CLK_ARM] =3D imx_clk_cpu("arm", "arm_a53_div",
+					   clks[IMX8MM_CLK_A53_DIV],
+					   clks[IMX8MM_CLK_A53_SRC],
+					   clks[IMX8MM_ARM_PLL_OUT],
+					   clks[IMX8MM_CLK_24M]);
+
+	imx_check_clocks(clks, ARRAY_SIZE(clks));
+
+	clk_data.clks =3D clks;
+	clk_data.clk_num =3D ARRAY_SIZE(clks);
+	ret =3D of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	if (ret < 0) {
+		dev_err(dev, "failed to register clks for i.MX8MM\n");
+		return -EINVAL;
+	}
+
+	imx_register_uart_clocks(uart_clks);
+
+	pr_info("i.MX8MM clock driver init done\n");
+
+	return 0;
+}
+
+static const struct of_device_id imx8mm_clk_of_match[] =3D {
+	{ .compatible =3D "fsl,imx8mm-ccm" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mm_clk_of_match);
+
+static struct platform_driver imx8mm_clk_driver =3D {
+	.probe =3D imx8mm_clocks_probe,
+	.driver =3D {
+		.name =3D "imx8mm-ccm",
+		.of_match_table =3D of_match_ptr(imx8mm_clk_of_match),
+	},
+};
+module_platform_driver(imx8mm_clk_driver);
--=20
1.9.1
