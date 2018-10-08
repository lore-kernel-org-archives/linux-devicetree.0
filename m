Return-Path: <SRS0=MVkY=MU=gmail.com=ctatlor97@kernel.org>
Date: Mon, 08 Oct 2018 07:49:52 +0100
In-Reply-To: <20180925173603.2274-1-ctatlor97@gmail.com>
References: <20180810202123.29238-1-ctatlor97@gmail.com> <20180925173603.2274-1-ctatlor97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----X0ARA7UYLSOKTS3KMNR1NJ4LFOY2SP"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] clk: qcom: Add Global Clock controller (GCC) driver for SDM660
From: Craig <ctatlor97@gmail.com>
Message-ID: <6DF05BA1-FA9D-47A1-BB69-E694B73B367A@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

------X0ARA7UYLSOKTS3KMNR1NJ4LFOY2SP
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Can someone take a look at this?

On 25 September 2018 18:35:58 BST, Craig Tatlor <ctatlor97@gmail=2Ecom> wr=
ote:
>From: Taniya Das <tdas@codeaurora=2Eorg>
>
>Add support for the global clock controller found on SDM660
>based devices=2E This should allow most non-multimedia device
>drivers to probe and control their clocks=2E
>Based on CAF implementation=2E
>
>Signed-off-by: Taniya Das <tdas@codeaurora=2Eorg>
>[craig: rename parents to fit upstream, and other cleanups]
>Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>---
>Changes from V1:
>    Change authorship
>    Add sdm630 compatible
> =2E=2E=2E/devicetree/bindings/clock/qcom,gcc=2Etxt    |    1 +
> drivers/clk/qcom/Kconfig                      |    9 +
> drivers/clk/qcom/Makefile                     |    1 +
> drivers/clk/qcom/gcc-sdm660=2Ec                 | 2480 +++++++++++++++++
> include/dt-bindings/clock/qcom,gcc-sdm660=2Eh   |  159 ++
> 5 files changed, 2650 insertions(+)
> create mode 100644 drivers/clk/qcom/gcc-sdm660=2Ec
> create mode 100644 include/dt-bindings/clock/qcom,gcc-sdm660=2Eh
>
>diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt
>b/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt
>index 664ea1fd6c76=2E=2Ee498ad2e8db8 100644
>--- a/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt
>+++ b/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt
>@@ -38,6 +38,8 @@ Required properties :
> 			"qcom,gcc-msm8996"
> 			"qcom,gcc-msm8998"
> 			"qcom,gcc-mdm9615"
>+			"qcom,gcc-sdm630"
>+			"qcom,gcc-sdm660"
> 			"qcom,gcc-sdm845"
>=20
> - reg : shall contain base register location and length
>diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>index 5b181b182f40=2E=2E4d478b261dfe 100644
>--- a/drivers/clk/qcom/Kconfig
>+++ b/drivers/clk/qcom/Kconfig
>@@ -243,6 +243,15 @@ config SDM_CAMCC_845
> 	  Support for the camera clock controller on SDM845 devices=2E
>	  Say Y if you want to support camera devices and camera
>functionality=2E
>=20
>+config SDM_GCC_660
>+	tristate "SDM660 Global Clock Controller"
>+	select QCOM_GDSC
>+	depends on COMMON_CLK_QCOM
>+	help
>+	  Support for the global clock controller on SDM660 devices=2E
>+	  Say Y if you want to use peripheral devices such as UART, SPI,
>+	  i2C, USB, UFS, SDDC, PCIe, etc=2E
>+
> config SDM_GCC_845
> 	tristate "SDM845 Global Clock Controller"
> 	select QCOM_GDSC
>diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>index 935f142bc155=2E=2Eab892f6d847c 100644
>--- a/drivers/clk/qcom/Makefile
>+++ b/drivers/clk/qcom/Makefile
>@@ -41,6 +41,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) +=3D clk-rpmh=2Eo
> obj-$(CONFIG_QCOM_CLK_SMD_RPM) +=3D clk-smd-rpm=2Eo
> obj-$(CONFIG_SDM_CAMCC_845) +=3D camcc-sdm845=2Eo
> obj-$(CONFIG_SDM_DISPCC_845) +=3D dispcc-sdm845=2Eo
>+obj-$(CONFIG_SDM_GCC_660) +=3D gcc-sdm660=2Eo
> obj-$(CONFIG_SDM_GCC_845) +=3D gcc-sdm845=2Eo
> obj-$(CONFIG_SDM_VIDEOCC_845) +=3D videocc-sdm845=2Eo
> obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div=2Eo
>diff --git a/drivers/clk/qcom/gcc-sdm660=2Ec
>b/drivers/clk/qcom/gcc-sdm660=2Ec
>new file mode 100644
>index 000000000000=2E=2E641bba611b5f
>--- /dev/null
>+++ b/drivers/clk/qcom/gcc-sdm660=2Ec
>@@ -0,0 +1,2480 @@
>+// SPDX-License-Identifier: GPL-2=2E0
>+/*
>+ * Copyright (c) 2016-2017, The Linux Foundation=2E All rights reserved=
=2E
>+ * Copyright (c) 2018, Craig Tatlor=2E
>+ */
>+
>+#include <linux/kernel=2Eh>
>+#include <linux/bitops=2Eh>
>+#include <linux/err=2Eh>
>+#include <linux/platform_device=2Eh>
>+#include <linux/module=2Eh>
>+#include <linux/of=2Eh>
>+#include <linux/of_device=2Eh>
>+#include <linux/clk-provider=2Eh>
>+#include <linux/regmap=2Eh>
>+#include <linux/reset-controller=2Eh>
>+
>+#include <dt-bindings/clock/qcom,gcc-sdm660=2Eh>
>+
>+#include "common=2Eh"
>+#include "clk-regmap=2Eh"
>+#include "clk-alpha-pll=2Eh"
>+#include "clk-rcg=2Eh"
>+#include "clk-branch=2Eh"
>+#include "reset=2Eh"
>+#include "gdsc=2Eh"
>+
>+#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
>+
>+enum {
>+	P_XO,
>+	P_SLEEP_CLK,
>+	P_GPLL0,
>+	P_GPLL1,
>+	P_GPLL4,
>+	P_GPLL0_EARLY_DIV,
>+	P_GPLL1_EARLY_DIV,
>+};
>+
>+static const struct parent_map
>gcc_parent_map_xo_gpll0_gpll0_early_div[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+	{ P_GPLL0_EARLY_DIV, 6 },
>+};
>+
>+static const char * const gcc_parent_names_xo_gpll0_gpll0_early_div[]
>=3D {
>+	"xo",
>+	"gpll0",
>+	"gpll0_early_div",
>+};
>+
>+static const struct parent_map gcc_parent_map_xo_gpll0[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+};
>+
>+static const char * const gcc_parent_names_xo_gpll0[] =3D {
>+	"xo",
>+	"gpll0",
>+};
>+
>+static const struct parent_map
>gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+	{ P_SLEEP_CLK, 5 },
>+	{ P_GPLL0_EARLY_DIV, 6 },
>+};
>+
>+static const char * const
>gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div[] =3D {
>+	"xo",
>+	"gpll0",
>+	"sleep_clk",
>+	"gpll0_early_div",
>+};
>+
>+static const struct parent_map gcc_parent_map_xo_sleep_clk[] =3D {
>+	{ P_XO, 0 },
>+	{ P_SLEEP_CLK, 5 },
>+};
>+
>+static const char * const gcc_parent_names_xo_sleep_clk[] =3D {
>+	"xo",
>+	"sleep_clk",
>+};
>+
>+static const struct parent_map gcc_parent_map_xo_gpll4[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL4, 5 },
>+};
>+
>+static const char * const gcc_parent_names_xo_gpll4[] =3D {
>+	"xo",
>+	"gpll4",
>+};
>+
>+static const struct parent_map
>gcc_parent_map_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[] =3D
>{
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+	{ P_GPLL0_EARLY_DIV, 3 },
>+	{ P_GPLL1, 4 },
>+	{ P_GPLL4, 5 },
>+	{ P_GPLL1_EARLY_DIV, 6 },
>+};
>+
>+static const char * const
>gcc_parent_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[]
>=3D {
>+	"xo",
>+	"gpll0",
>+	"gpll0_early_div",
>+	"gpll1",
>+	"gpll4",
>+	"gpll1_early_div",
>+};
>+
>+static const struct parent_map
>gcc_parent_map_xo_gpll0_gpll4_gpll0_early_div[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+	{ P_GPLL4, 5 },
>+	{ P_GPLL0_EARLY_DIV, 6 },
>+};
>+
>+static const char * const
>gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div[] =3D {
>+	"xo",
>+	"gpll0",
>+	"gpll4",
>+	"gpll0_early_div",
>+};
>+
>+static const struct parent_map
>gcc_parent_map_xo_gpll0_gpll0_early_div_gpll4[] =3D {
>+	{ P_XO, 0 },
>+	{ P_GPLL0, 1 },
>+	{ P_GPLL0_EARLY_DIV, 2 },
>+	{ P_GPLL4, 5 },
>+};
>+
>+static const char * const
>gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4[] =3D {
>+	"xo",
>+	"gpll0",
>+	"gpll0_early_div",
>+	"gpll4",
>+};
>+
>+static struct clk_fixed_factor xo =3D {
>+	=2Emult =3D 1,
>+	=2Ediv =3D 1,
>+	=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "xo",
>+		=2Eparent_names =3D (const char *[]){ "xo_board" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_fixed_factor_ops,
>+	},
>+};
>+
>+static struct clk_alpha_pll gpll0_early =3D {
>+	=2Eoffset =3D 0x0,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x52000,
>+		=2Eenable_mask =3D BIT(0),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gpll0_early",
>+			=2Eparent_names =3D (const char *[]){ "xo" },
>+			=2Enum_parents =3D 1,
>+			=2Eops =3D &clk_alpha_pll_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_fixed_factor gpll0_early_div =3D {
>+	=2Emult =3D 1,
>+	=2Ediv =3D 2,
>+	=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gpll0_early_div",
>+		=2Eparent_names =3D (const char *[]){ "gpll0_early" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_fixed_factor_ops,
>+	},
>+};
>+
>+static struct clk_alpha_pll_postdiv gpll0 =3D {
>+	=2Eoffset =3D 0x00000,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gpll0",
>+		=2Eparent_names =3D (const char *[]){ "gpll0_early" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_alpha_pll_postdiv_ops,
>+	},
>+};
>+
>+static struct clk_alpha_pll gpll1_early =3D {
>+	=2Eoffset =3D 0x1000,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x52000,
>+		=2Eenable_mask =3D BIT(1),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gpll1_early",
>+			=2Eparent_names =3D (const char *[]){ "xo" },
>+			=2Enum_parents =3D 1,
>+			=2Eops =3D &clk_alpha_pll_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_fixed_factor gpll1_early_div =3D {
>+	=2Emult =3D 1,
>+	=2Ediv =3D 2,
>+	=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gpll1_early_div",
>+		=2Eparent_names =3D (const char *[]){ "gpll1_early" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_fixed_factor_ops,
>+	},
>+};
>+
>+static struct clk_alpha_pll_postdiv gpll1 =3D {
>+	=2Eoffset =3D 0x1000,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gpll1",
>+		=2Eparent_names =3D (const char *[]){ "gpll1_early" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_alpha_pll_postdiv_ops,
>+	},
>+};
>+
>+static struct clk_alpha_pll gpll4_early =3D {
>+	=2Eoffset =3D 0x77000,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x52000,
>+		=2Eenable_mask =3D BIT(4),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gpll4_early",
>+			=2Eparent_names =3D (const char *[]){ "xo" },
>+			=2Enum_parents =3D 1,
>+			=2Eops =3D &clk_alpha_pll_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_alpha_pll_postdiv gpll4 =3D {
>+	=2Eoffset =3D 0x77000,
>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data)
>+	{
>+		=2Ename =3D "gpll4",
>+		=2Eparent_names =3D (const char *[]) { "gpll4_early" },
>+		=2Enum_parents =3D 1,
>+		=2Eops =3D &clk_alpha_pll_postdiv_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(50000000, P_GPLL0, 12, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x19020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup1_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] =3D {
>+	F(960000, P_XO, 10, 1, 2),
>+	F(4800000, P_XO, 4, 0, 0),
>+	F(9600000, P_XO, 2, 0, 0),
>+	F(15000000, P_GPLL0, 10, 1, 4),
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(25000000, P_GPLL0, 12, 1, 2),
>+	F(50000000, P_GPLL0, 12, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1900c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup1_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1b020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup2_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1b00c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup2_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1d020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup3_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1d00c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup3_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1f020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup4_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1f00c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_qup4_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_blsp1_uart1_apps_clk_src[] =3D {
>+	F(3686400, P_GPLL0, 1, 96, 15625),
>+	F(7372800, P_GPLL0, 1, 192, 15625),
>+	F(14745600, P_GPLL0, 1, 384, 15625),
>+	F(16000000, P_GPLL0, 5, 2, 15),
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(24000000, P_GPLL0, 5, 1, 5),
>+	F(32000000, P_GPLL0, 1, 4, 75),
>+	F(40000000, P_GPLL0, 15, 0, 0),
>+	F(46400000, P_GPLL0, 1, 29, 375),
>+	F(48000000, P_GPLL0, 12=2E5, 0, 0),
>+	F(51200000, P_GPLL0, 1, 32, 375),
>+	F(56000000, P_GPLL0, 1, 7, 75),
>+	F(58982400, P_GPLL0, 1, 1536, 15625),
>+	F(60000000, P_GPLL0, 10, 0, 0),
>+	F(63157895, P_GPLL0, 9=2E5, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 blsp1_uart1_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1a00c,
>+	=2Emnd_width =3D 16,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_uart1_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_uart1_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp1_uart2_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1c00c,
>+	=2Emnd_width =3D 16,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_uart1_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp1_uart2_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x26020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup1_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2600c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup1_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x28020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup2_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2800c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup2_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2a020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup3_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2a00c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup3_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2c020,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup4_i2c_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2c00c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_qup4_spi_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_uart1_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2700c,
>+	=2Emnd_width =3D 16,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_uart1_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_uart1_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 blsp2_uart2_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2900c,
>+	=2Emnd_width =3D 16,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_blsp1_uart1_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "blsp2_uart2_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_gp1_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(100000000, P_GPLL0, 6, 0, 0),
>+	F(200000000, P_GPLL0, 3, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 gp1_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x64004,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gp1_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_di=
v,
>+		=2Enum_parents =3D 4,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 gp2_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x65004,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gp2_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_di=
v,
>+		=2Enum_parents =3D 4,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 gp3_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x66004,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "gp3_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_di=
v,
>+		=2Enum_parents =3D 4,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_hmss_gpll0_clk_src[] =3D {
>+	F(300000000, P_GPLL0, 2, 0, 0),
>+	F(600000000, P_GPLL0, 1, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 hmss_gpll0_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x4805c,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_hmss_gpll0_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "hmss_gpll0_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_hmss_gpll4_clk_src[] =3D {
>+	F(384000000, P_GPLL4, 4, 0, 0),
>+	F(768000000, P_GPLL4, 2, 0, 0),
>+	F(1536000000, P_GPLL4, 1, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 hmss_gpll4_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x48074,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll4,
>+	=2Efreq_tbl =3D ftbl_hmss_gpll4_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "hmss_gpll4_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll4,
>+		=2Enum_parents =3D 2,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_hmss_rbcpr_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 hmss_rbcpr_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x48044,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_hmss_rbcpr_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "hmss_rbcpr_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0,
>+		=2Enum_parents =3D 2,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_pdm2_clk_src[] =3D {
>+	F(60000000, P_GPLL0, 10, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 pdm2_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x33010,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_pdm2_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "pdm2_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_qspi_ser_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(80200000, P_GPLL1_EARLY_DIV, 5, 0, 0),
>+	F(160400000, P_GPLL1, 5, 0, 0),
>+	F(267333333, P_GPLL1, 3, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 qspi_ser_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x4d00c,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D
>gcc_parent_map_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
>+	=2Efreq_tbl =3D ftbl_qspi_ser_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "qspi_ser_clk_src",
>+		=2Eparent_names =3D
>gcc_parent_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
>+		=2Enum_parents =3D 6,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_sdcc1_apps_clk_src[] =3D {
>+	F(144000, P_XO, 16, 3, 25),
>+	F(400000, P_XO, 12, 1, 4),
>+	F(20000000, P_GPLL0_EARLY_DIV, 5, 1, 3),
>+	F(25000000, P_GPLL0_EARLY_DIV, 6, 1, 2),
>+	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
>+	F(100000000, P_GPLL0, 6, 0, 0),
>+	F(192000000, P_GPLL4, 8, 0, 0),
>+	F(384000000, P_GPLL4, 4, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 sdcc1_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x1602c,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll4_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_sdcc1_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "sdcc1_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div,
>+		=2Enum_parents =3D 4,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] =3D {
>+	F(75000000, P_GPLL0_EARLY_DIV, 4, 0, 0),
>+	F(150000000, P_GPLL0, 4, 0, 0),
>+	F(200000000, P_GPLL0, 3, 0, 0),
>+	F(300000000, P_GPLL0, 2, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 sdcc1_ice_core_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x16010,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_sdcc1_ice_core_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "sdcc1_ice_core_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_sdcc2_apps_clk_src[] =3D {
>+	F(144000, P_XO, 16, 3, 25),
>+	F(400000, P_XO, 12, 1, 4),
>+	F(20000000, P_GPLL0_EARLY_DIV, 5, 1, 3),
>+	F(25000000, P_GPLL0_EARLY_DIV, 6, 1, 2),
>+	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
>+	F(100000000, P_GPLL0, 6, 0, 0),
>+	F(192000000, P_GPLL4, 8, 0, 0),
>+	F(200000000, P_GPLL0, 3, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 sdcc2_apps_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x14010,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div_gpll4,
>+	=2Efreq_tbl =3D ftbl_sdcc2_apps_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "sdcc2_apps_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4,
>+		=2Enum_parents =3D 4,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_ufs_axi_clk_src[] =3D {
>+	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
>+	F(100000000, P_GPLL0, 6, 0, 0),
>+	F(150000000, P_GPLL0, 4, 0, 0),
>+	F(200000000, P_GPLL0, 3, 0, 0),
>+	F(240000000, P_GPLL0, 2=2E5, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 ufs_axi_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x75018,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_ufs_axi_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "ufs_axi_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_ufs_ice_core_clk_src[] =3D {
>+	F(75000000, P_GPLL0_EARLY_DIV, 4, 0, 0),
>+	F(150000000, P_GPLL0, 4, 0, 0),
>+	F(300000000, P_GPLL0, 2, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 ufs_ice_core_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x76010,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_ufs_ice_core_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "ufs_ice_core_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_rcg2 ufs_phy_aux_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x76044,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_sleep_clk,
>+	=2Efreq_tbl =3D ftbl_hmss_rbcpr_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "ufs_phy_aux_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_sleep_clk,
>+		=2Enum_parents =3D 2,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_ufs_unipro_core_clk_src[] =3D {
>+	F(37500000, P_GPLL0_EARLY_DIV, 8, 0, 0),
>+	F(75000000, P_GPLL0, 8, 0, 0),
>+	F(150000000, P_GPLL0, 4, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 ufs_unipro_core_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x76028,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_ufs_unipro_core_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "ufs_unipro_core_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_usb20_master_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(60000000, P_GPLL0, 10, 0, 0),
>+	F(120000000, P_GPLL0, 5, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 usb20_master_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2f010,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_usb20_master_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "usb20_master_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_usb20_mock_utmi_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(60000000, P_GPLL0, 10, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 usb20_mock_utmi_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x2f024,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_usb20_mock_utmi_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "usb20_mock_utmi_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_usb30_master_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(66666667, P_GPLL0_EARLY_DIV, 4=2E5, 0, 0),
>+	F(120000000, P_GPLL0, 5, 0, 0),
>+	F(133333333, P_GPLL0, 4=2E5, 0, 0),
>+	F(150000000, P_GPLL0, 4, 0, 0),
>+	F(200000000, P_GPLL0, 3, 0, 0),
>+	F(240000000, P_GPLL0, 2=2E5, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 usb30_master_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0xf014,
>+	=2Emnd_width =3D 8,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_usb30_master_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "usb30_master_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_usb30_mock_utmi_clk_src[] =3D {
>+	F(19200000, P_XO, 1, 0, 0),
>+	F(40000000, P_GPLL0_EARLY_DIV, 7=2E5, 0, 0),
>+	F(60000000, P_GPLL0, 10, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 usb30_mock_utmi_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0xf028,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,
>+	=2Efreq_tbl =3D ftbl_usb30_mock_utmi_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "usb30_mock_utmi_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,
>+		=2Enum_parents =3D 3,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static const struct freq_tbl ftbl_usb3_phy_aux_clk_src[] =3D {
>+	F(1200000, P_XO, 16, 0, 0),
>+	F(19200000, P_XO, 1, 0, 0),
>+	{ }
>+};
>+
>+static struct clk_rcg2 usb3_phy_aux_clk_src =3D {
>+	=2Ecmd_rcgr =3D 0x5000c,
>+	=2Emnd_width =3D 0,
>+	=2Ehid_width =3D 5,
>+	=2Eparent_map =3D gcc_parent_map_xo_sleep_clk,
>+	=2Efreq_tbl =3D ftbl_usb3_phy_aux_clk_src,
>+	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>+		=2Ename =3D "usb3_phy_aux_clk_src",
>+		=2Eparent_names =3D gcc_parent_names_xo_sleep_clk,
>+		=2Enum_parents =3D 2,
>+		=2Eops =3D &clk_rcg2_ops,
>+	},
>+};
>+
>+static struct clk_branch gcc_aggre2_ufs_axi_clk =3D {
>+	=2Ehalt_reg =3D 0x75034,
>+	=2Ehalt_check =3D BRANCH_HALT,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x75034,
>+		=2Eenable_mask =3D BIT(0),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_aggre2_ufs_axi_clk",
>+			=2Eparent_names =3D (const char *[]){
>+				"ufs_axi_clk_src",
>+			},
>+			=2Enum_parents =3D 1,
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_aggre2_usb3_axi_clk =3D {
>+	=2Ehalt_reg =3D 0xf03c,
>+	=2Ehalt_check =3D BRANCH_HALT,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0xf03c,
>+		=2Eenable_mask =3D BIT(0),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_aggre2_usb3_axi_clk",
>+			=2Eparent_names =3D (const char *[]){
>+				"usb30_master_clk_src",
>+			},
>+			=2Enum_parents =3D 1,
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_bimc_gfx_clk =3D {
>+	=2Ehalt_reg =3D 0x7106c,
>+	=2Ehalt_check =3D BRANCH_VOTED,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x7106c,
>+		=2Eenable_mask =3D BIT(0),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_bimc_gfx_clk",
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_bimc_hmss_axi_clk =3D {
>+	=2Ehalt_reg =3D 0x48004,
>+	=2Ehalt_check =3D BRANCH_HALT_VOTED,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x52004,
>+		=2Eenable_mask =3D BIT(22),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_bimc_hmss_axi_clk",
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_bimc_mss_q6_axi_clk =3D {
>+	=2Ehalt_reg =3D 0x4401c,
>+	=2Ehalt_check =3D BRANCH_HALT,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x4401c,
>+		=2Eenable_mask =3D BIT(0),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_bimc_mss_q6_axi_clk",
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_blsp1_ahb_clk =3D {
>+	=2Ehalt_reg =3D 0x17004,
>+	=2Ehalt_check =3D BRANCH_HALT_VOTED,
>+	=2Eclkr =3D {
>+		=2Eenable_reg =3D 0x52004,
>+		=2Eenable_mask =3D BIT(17),
>+		=2Ehw=2Einit =3D &(struct clk_init_data){
>+			=2Ename =3D "gcc_blsp1_ahb_clk",
>+			=2Eops =3D &clk_branch2_ops,
>+		},
>+	},
>+};
>+
>+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------X0ARA7UYLSOKTS3KMNR1NJ4LFOY2SP
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Can someone take a look at this?<br><br><div class=
=3D"gmail_quote">On 25 September 2018 18:35:58 BST, Craig Tatlor &lt;ctatlo=
r97@gmail=2Ecom&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-l=
eft: 1ex;">
<pre class=3D"k9mail">From: Taniya Das &lt;tdas@codeaurora=2Eorg&gt;<br><b=
r>Add support for the global clock controller found on SDM660<br>based devi=
ces=2E This should allow most non-multimedia device<br>drivers to probe and=
 control their clocks=2E<br>Based on CAF implementation=2E<br><br>Signed-of=
f-by: Taniya Das &lt;tdas@codeaurora=2Eorg&gt;<br>[craig: rename parents to=
 fit upstream, and other cleanups]<br>Signed-off-by: Craig Tatlor &lt;ctatl=
or97@gmail=2Ecom&gt;<hr>Changes from V1:<br>    Change authorship<br>    Ad=
d sdm630 compatible<br> =2E=2E=2E/devicetree/bindings/clock/qcom,gcc=2Etxt =
   |    1 +<br> drivers/clk/qcom/Kconfig                      |    9 +<br> =
drivers/clk/qcom/Makefile                     |    1 +<br> drivers/clk/qcom=
/gcc-sdm660=2Ec                 | 2480 +++++++++++++++++<br> include/dt-bin=
dings/clock/qcom,gcc-sdm660=2Eh   |  159 ++<br> 5 files changed, 2650 inser=
tions(+)<br> create mode 100644 drivers/clk/qcom/gcc-sdm660=2Ec<br> create =
mode 100644 include/dt-bindings/clock/qcom,gcc-sdm660=2Eh<br><br>diff --git=
 a/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt b/Documentation/d=
evicetree/bindings/clock/qcom,gcc=2Etxt<br>index 664ea1fd6c76=2E=2Ee498ad2e=
8db8 100644<br>--- a/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt=
<br>+++ b/Documentation/devicetree/bindings/clock/qcom,gcc=2Etxt<br>@@ -38,=
6 +38,8 @@ Required properties :<br> 			"qcom,gcc-msm8996"<br> 			"qcom,gcc=
-msm8998"<br> 			"qcom,gcc-mdm9615"<br>+			"qcom,gcc-sdm630"<br>+			"qcom,g=
cc-sdm660"<br> 			"qcom,gcc-sdm845"<br> <br> - reg : shall contain base reg=
ister location and length<br>diff --git a/drivers/clk/qcom/Kconfig b/driver=
s/clk/qcom/Kconfig<br>index 5b181b182f40=2E=2E4d478b261dfe 100644<br>--- a/=
drivers/clk/qcom/Kconfig<br>+++ b/drivers/clk/qcom/Kconfig<br>@@ -243,6 +24=
3,15 @@ config SDM_CAMCC_845<br> 	  Support for the camera clock controller=
 on SDM845 devices=2E<br> 	  Say Y if you want to support camera devices an=
d camera functionality=2E<br> <br>+config SDM_GCC_660<br>+	tristate "SDM660=
 Global Clock Controller"<br>+	select QCOM_GDSC<br>+	depends on COMMON_CLK_=
QCOM<br>+	help<br>+	  Support for the global clock controller on SDM660 dev=
ices=2E<br>+	  Say Y if you want to use peripheral devices such as UART, SP=
I,<br>+	  i2C, USB, UFS, SDDC, PCIe, etc=2E<br>+<br> config SDM_GCC_845<br>=
 	tristate "SDM845 Global Clock Controller"<br> 	select QCOM_GDSC<br>diff -=
-git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile<br>index 935f1=
42bc155=2E=2Eab892f6d847c 100644<br>--- a/drivers/clk/qcom/Makefile<br>+++ =
b/drivers/clk/qcom/Makefile<br>@@ -41,6 +41,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH=
) +=3D clk-rpmh=2Eo<br> obj-$(CONFIG_QCOM_CLK_SMD_RPM) +=3D clk-smd-rpm=2Eo=
<br> obj-$(CONFIG_SDM_CAMCC_845) +=3D camcc-sdm845=2Eo<br> obj-$(CONFIG_SDM=
_DISPCC_845) +=3D dispcc-sdm845=2Eo<br>+obj-$(CONFIG_SDM_GCC_660) +=3D gcc-=
sdm660=2Eo<br> obj-$(CONFIG_SDM_GCC_845) +=3D gcc-sdm845=2Eo<br> obj-$(CONF=
IG_SDM_VIDEOCC_845) +=3D videocc-sdm845=2Eo<br> obj-$(CONFIG_SPMI_PMIC_CLKD=
IV) +=3D clk-spmi-pmic-div=2Eo<br>diff --git a/drivers/clk/qcom/gcc-sdm660=
=2Ec b/drivers/clk/qcom/gcc-sdm660=2Ec<br>new file mode 100644<br>index 000=
000000000=2E=2E641bba611b5f<br>--- /dev/null<br>+++ b/drivers/clk/qcom/gcc-=
sdm660=2Ec<br>@@ -0,0 +1,2480 @@<br>+// SPDX-License-Identifier: GPL-2=2E0<=
br>+/*<br>+ * Copyright (c) 2016-2017, The Linux Foundation=2E All rights r=
eserved=2E<br>+ * Copyright (c) 2018, Craig Tatlor=2E<br>+ */<br>+<br>+#inc=
lude &lt;linux/kernel=2Eh&gt;<br>+#include &lt;linux/bitops=2Eh&gt;<br>+#in=
clude &lt;linux/err=2Eh&gt;<br>+#include &lt;linux/platform_device=2Eh&gt;<=
br>+#include &lt;linux/module=2Eh&gt;<br>+#include &lt;linux/of=2Eh&gt;<br>=
+#include &lt;linux/of_device=2Eh&gt;<br>+#include &lt;linux/clk-provider=
=2Eh&gt;<br>+#include &lt;linux/regmap=2Eh&gt;<br>+#include &lt;linux/reset=
-controller=2Eh&gt;<br>+<br>+#include &lt;dt-bindings/clock/qcom,gcc-sdm660=
=2Eh&gt;<br>+<br>+#include "common=2Eh"<br>+#include "clk-regmap=2Eh"<br>+#=
include "clk-alpha-pll=2Eh"<br>+#include "clk-rcg=2Eh"<br>+#include "clk-br=
anch=2Eh"<br>+#include "reset=2Eh"<br>+#include "gdsc=2Eh"<br>+<br>+#define=
 F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }<br>+<br>+enum {<br>=
+	P_XO,<br>+	P_SLEEP_CLK,<br>+	P_GPLL0,<br>+	P_GPLL1,<br>+	P_GPLL4,<br>+	P_=
GPLL0_EARLY_DIV,<br>+	P_GPLL1_EARLY_DIV,<br>+};<br>+<br>+static const struc=
t parent_map gcc_parent_map_xo_gpll0_gpll0_early_div[] =3D {<br>+	{ P_XO, 0=
 },<br>+	{ P_GPLL0, 1 },<br>+	{ P_GPLL0_EARLY_DIV, 6 },<br>+};<br>+<br>+sta=
tic const char * const gcc_parent_names_xo_gpll0_gpll0_early_div[] =3D {<br=
>+	"xo",<br>+	"gpll0",<br>+	"gpll0_early_div",<br>+};<br>+<br>+static const=
 struct parent_map gcc_parent_map_xo_gpll0[] =3D {<br>+	{ P_XO, 0 },<br>+	{=
 P_GPLL0, 1 },<br>+};<br>+<br>+static const char * const gcc_parent_names_x=
o_gpll0[] =3D {<br>+	"xo",<br>+	"gpll0",<br>+};<br>+<br>+static const struc=
t parent_map gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div[] =3D {<br>+=
	{ P_XO, 0 },<br>+	{ P_GPLL0, 1 },<br>+	{ P_SLEEP_CLK, 5 },<br>+	{ P_GPLL0_=
EARLY_DIV, 6 },<br>+};<br>+<br>+static const char * const gcc_parent_names_=
xo_gpll0_sleep_clk_gpll0_early_div[] =3D {<br>+	"xo",<br>+	"gpll0",<br>+	"s=
leep_clk",<br>+	"gpll0_early_div",<br>+};<br>+<br>+static const struct pare=
nt_map gcc_parent_map_xo_sleep_clk[] =3D {<br>+	{ P_XO, 0 },<br>+	{ P_SLEEP=
_CLK, 5 },<br>+};<br>+<br>+static const char * const gcc_parent_names_xo_sl=
eep_clk[] =3D {<br>+	"xo",<br>+	"sleep_clk",<br>+};<br>+<br>+static const s=
truct parent_map gcc_parent_map_xo_gpll4[] =3D {<br>+	{ P_XO, 0 },<br>+	{ P=
_GPLL4, 5 },<br>+};<br>+<br>+static const char * const gcc_parent_names_xo_=
gpll4[] =3D {<br>+	"xo",<br>+	"gpll4",<br>+};<br>+<br>+static const struct =
parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_=
div[] =3D {<br>+	{ P_XO, 0 },<br>+	{ P_GPLL0, 1 },<br>+	{ P_GPLL0_EARLY_DIV=
, 3 },<br>+	{ P_GPLL1, 4 },<br>+	{ P_GPLL4, 5 },<br>+	{ P_GPLL1_EARLY_DIV, =
6 },<br>+};<br>+<br>+static const char * const gcc_parent_names_xo_gpll0_gp=
ll0_early_div_gpll1_gpll4_gpll1_early_div[] =3D {<br>+	"xo",<br>+	"gpll0",<=
br>+	"gpll0_early_div",<br>+	"gpll1",<br>+	"gpll4",<br>+	"gpll1_early_div",=
<br>+};<br>+<br>+static const struct parent_map gcc_parent_map_xo_gpll0_gpl=
l4_gpll0_early_div[] =3D {<br>+	{ P_XO, 0 },<br>+	{ P_GPLL0, 1 },<br>+	{ P_=
GPLL4, 5 },<br>+	{ P_GPLL0_EARLY_DIV, 6 },<br>+};<br>+<br>+static const cha=
r * const gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div[] =3D {<br>+	"xo"=
,<br>+	"gpll0",<br>+	"gpll4",<br>+	"gpll0_early_div",<br>+};<br>+<br>+stati=
c const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll4[] =
=3D {<br>+	{ P_XO, 0 },<br>+	{ P_GPLL0, 1 },<br>+	{ P_GPLL0_EARLY_DIV, 2 },=
<br>+	{ P_GPLL4, 5 },<br>+};<br>+<br>+static const char * const gcc_parent_=
names_xo_gpll0_gpll0_early_div_gpll4[] =3D {<br>+	"xo",<br>+	"gpll0",<br>+	=
"gpll0_early_div",<br>+	"gpll4",<br>+};<br>+<br>+static struct clk_fixed_fa=
ctor xo =3D {<br>+	=2Emult =3D 1,<br>+	=2Ediv =3D 1,<br>+	=2Ehw=2Einit =3D =
&amp;(struct clk_init_data){<br>+		=2Ename =3D "xo",<br>+		=2Eparent_names =
=3D (const char *[]){ "xo_board" },<br>+		=2Enum_parents =3D 1,<br>+		=2Eop=
s =3D &amp;clk_fixed_factor_ops,<br>+	},<br>+};<br>+<br>+static struct clk_=
alpha_pll gpll0_early =3D {<br>+	=2Eoffset =3D 0x0,<br>+	=2Eregs =3D clk_al=
pha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],<br>+	=2Eclkr =3D {<br>+		=2Eenabl=
e_reg =3D 0x52000,<br>+		=2Eenable_mask =3D BIT(0),<br>+		=2Ehw=2Einit =3D =
&amp;(struct clk_init_data){<br>+			=2Ename =3D "gpll0_early",<br>+			=2Epa=
rent_names =3D (const char *[]){ "xo" },<br>+			=2Enum_parents =3D 1,<br>+	=
		=2Eops =3D &amp;clk_alpha_pll_ops,<br>+		},<br>+	},<br>+};<br>+<br>+stati=
c struct clk_fixed_factor gpll0_early_div =3D {<br>+	=2Emult =3D 1,<br>+	=
=2Ediv =3D 2,<br>+	=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2En=
ame =3D "gpll0_early_div",<br>+		=2Eparent_names =3D (const char *[]){ "gpl=
l0_early" },<br>+		=2Enum_parents =3D 1,<br>+		=2Eops =3D &amp;clk_fixed_fa=
ctor_ops,<br>+	},<br>+};<br>+<br>+static struct clk_alpha_pll_postdiv gpll0=
 =3D {<br>+	=2Eoffset =3D 0x00000,<br>+	=2Eregs =3D clk_alpha_pll_regs[CLK_=
ALPHA_PLL_TYPE_DEFAULT],<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init=
_data){<br>+		=2Ename =3D "gpll0",<br>+		=2Eparent_names =3D (const char *[=
]){ "gpll0_early" },<br>+		=2Enum_parents =3D 1,<br>+		=2Eops =3D &amp;clk_=
alpha_pll_postdiv_ops,<br>+	},<br>+};<br>+<br>+static struct clk_alpha_pll =
gpll1_early =3D {<br>+	=2Eoffset =3D 0x1000,<br>+	=2Eregs =3D clk_alpha_pll=
_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =
=3D 0x52000,<br>+		=2Eenable_mask =3D BIT(1),<br>+		=2Ehw=2Einit =3D &amp;(=
struct clk_init_data){<br>+			=2Ename =3D "gpll1_early",<br>+			=2Eparent_n=
ames =3D (const char *[]){ "xo" },<br>+			=2Enum_parents =3D 1,<br>+			=2Eo=
ps =3D &amp;clk_alpha_pll_ops,<br>+		},<br>+	},<br>+};<br>+<br>+static stru=
ct clk_fixed_factor gpll1_early_div =3D {<br>+	=2Emult =3D 1,<br>+	=2Ediv =
=3D 2,<br>+	=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D=
 "gpll1_early_div",<br>+		=2Eparent_names =3D (const char *[]){ "gpll1_earl=
y" },<br>+		=2Enum_parents =3D 1,<br>+		=2Eops =3D &amp;clk_fixed_factor_op=
s,<br>+	},<br>+};<br>+<br>+static struct clk_alpha_pll_postdiv gpll1 =3D {<=
br>+	=2Eoffset =3D 0x1000,<br>+	=2Eregs =3D clk_alpha_pll_regs[CLK_ALPHA_PL=
L_TYPE_DEFAULT],<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<=
br>+		=2Ename =3D "gpll1",<br>+		=2Eparent_names =3D (const char *[]){ "gpl=
l1_early" },<br>+		=2Enum_parents =3D 1,<br>+		=2Eops =3D &amp;clk_alpha_pl=
l_postdiv_ops,<br>+	},<br>+};<br>+<br>+static struct clk_alpha_pll gpll4_ea=
rly =3D {<br>+	=2Eoffset =3D 0x77000,<br>+	=2Eregs =3D clk_alpha_pll_regs[C=
LK_ALPHA_PLL_TYPE_DEFAULT],<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x52=
000,<br>+		=2Eenable_mask =3D BIT(4),<br>+		=2Ehw=2Einit =3D &amp;(struct c=
lk_init_data){<br>+			=2Ename =3D "gpll4_early",<br>+			=2Eparent_names =3D=
 (const char *[]){ "xo" },<br>+			=2Enum_parents =3D 1,<br>+			=2Eops =3D &=
amp;clk_alpha_pll_ops,<br>+		},<br>+	},<br>+};<br>+<br>+static struct clk_a=
lpha_pll_postdiv gpll4 =3D {<br>+	=2Eoffset =3D 0x77000,<br>+	=2Eregs =3D c=
lk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],<br>+	=2Eclkr=2Ehw=2Einit =3D=
 &amp;(struct clk_init_data)<br>+	{<br>+		=2Ename =3D "gpll4",<br>+		=2Epar=
ent_names =3D (const char *[]) { "gpll4_early" },<br>+		=2Enum_parents =3D =
1,<br>+		=2Eops =3D &amp;clk_alpha_pll_postdiv_ops,<br>+	},<br>+};<br>+<br>=
+static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] =3D {<br>+=
	F(19200000, P_XO, 1, 0, 0),<br>+	F(50000000, P_GPLL0, 12, 0, 0),<br>+	{ }<=
br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src =3D {<br=
>+	=2Ecmd_rcgr =3D 0x19020,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D =
5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2E=
freq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D=
 &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp1_qup1_i2c_apps_clk_sr=
c",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br=
>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+}=
;<br>+<br>+static const struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] =
=3D {<br>+	F(960000, P_XO, 10, 1, 2),<br>+	F(4800000, P_XO, 4, 0, 0),<br>+	=
F(9600000, P_XO, 2, 0, 0),<br>+	F(15000000, P_GPLL0, 10, 1, 4),<br>+	F(1920=
0000, P_XO, 1, 0, 0),<br>+	F(25000000, P_GPLL0, 12, 1, 2),<br>+	F(50000000,=
 P_GPLL0, 12, 0, 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 blsp1_=
qup1_spi_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x1900c,<br>+	=2Emnd_width=
 =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_g=
pll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src=
,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =
=3D "blsp1_qup1_spi_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_nam=
es_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &=
amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup2=
_i2c_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x1b020,<br>+	=2Emnd_width =3D=
 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0=
_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br=
>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "=
blsp1_qup2_i2c_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo=
_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;c=
lk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup2_spi_=
apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x1b00c,<br>+	=2Emnd_width =3D 8,<b=
r>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll=
0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,<br>+	=
=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "bls=
p1_qup2_spi_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gp=
ll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_=
rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup3_i2c_app=
s_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x1d020,<br>+	=2Emnd_width =3D 0,<br>+=
	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_e=
arly_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br>+	=2Ecl=
kr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp1_qu=
p3_i2c_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_g=
pll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_=
ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup3_spi_apps_clk=
_src =3D {<br>+	=2Ecmd_rcgr =3D 0x1d00c,<br>+	=2Emnd_width =3D 8,<br>+	=2Eh=
id_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_=
div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,<br>+	=2Eclkr=2E=
hw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp1_qup3_sp=
i_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_=
early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<=
br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src =
=3D {<br>+	=2Ecmd_rcgr =3D 0x1f020,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_wi=
dth =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<=
br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br>+	=2Eclkr=2Ehw=2E=
init =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp1_qup4_i2c_app=
s_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early=
_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	=
},<br>+};<br>+<br>+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src =3D {=
<br>+	=2Ecmd_rcgr =3D 0x1f00c,<br>+	=2Emnd_width =3D 8,<br>+	=2Ehid_width =
=3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+=
	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit=
 =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp1_qup4_spi_apps_cl=
k_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div=
,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<b=
r>+};<br>+<br>+static const struct freq_tbl ftbl_blsp1_uart1_apps_clk_src[]=
 =3D {<br>+	F(3686400, P_GPLL0, 1, 96, 15625),<br>+	F(7372800, P_GPLL0, 1, =
192, 15625),<br>+	F(14745600, P_GPLL0, 1, 384, 15625),<br>+	F(16000000, P_G=
PLL0, 5, 2, 15),<br>+	F(19200000, P_XO, 1, 0, 0),<br>+	F(24000000, P_GPLL0,=
 5, 1, 5),<br>+	F(32000000, P_GPLL0, 1, 4, 75),<br>+	F(40000000, P_GPLL0, 1=
5, 0, 0),<br>+	F(46400000, P_GPLL0, 1, 29, 375),<br>+	F(48000000, P_GPLL0, =
12=2E5, 0, 0),<br>+	F(51200000, P_GPLL0, 1, 32, 375),<br>+	F(56000000, P_GP=
LL0, 1, 7, 75),<br>+	F(58982400, P_GPLL0, 1, 1536, 15625),<br>+	F(60000000,=
 P_GPLL0, 10, 0, 0),<br>+	F(63157895, P_GPLL0, 9=2E5, 0, 0),<br>+	{ }<br>+}=
;<br>+<br>+static struct clk_rcg2 blsp1_uart1_apps_clk_src =3D {<br>+	=2Ecm=
d_rcgr =3D 0x1a00c,<br>+	=2Emnd_width =3D 16,<br>+	=2Ehid_width =3D 5,<br>+=
	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tb=
l =3D ftbl_blsp1_uart1_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(str=
uct clk_init_data){<br>+		=2Ename =3D "blsp1_uart1_apps_clk_src",<br>+		=2E=
parent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_pa=
rents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+st=
atic struct clk_rcg2 blsp1_uart2_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x=
1c00c,<br>+	=2Emnd_width =3D 16,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_ma=
p =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_bl=
sp1_uart1_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_=
data){<br>+		=2Ename =3D "blsp1_uart2_apps_clk_src",<br>+		=2Eparent_names =
=3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<=
br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct c=
lk_rcg2 blsp2_qup1_i2c_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x26020,<br>=
+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_p=
arent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2=
c_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<b=
r>+		=2Ename =3D "blsp2_qup1_i2c_apps_clk_src",<br>+		=2Eparent_names =3D g=
cc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+	=
	=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rc=
g2 blsp2_qup1_spi_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2600c,<br>+	=2E=
mnd_width =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent=
_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_app=
s_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=
=2Ename =3D "blsp2_qup1_spi_apps_clk_src",<br>+		=2Eparent_names =3D gcc_pa=
rent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eo=
ps =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 bl=
sp2_qup2_i2c_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x28020,<br>+	=2Emnd_w=
idth =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_=
xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk=
_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ena=
me =3D "blsp2_qup2_i2c_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_=
names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =
=3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2=
_qup2_spi_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2800c,<br>+	=2Emnd_widt=
h =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_=
gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_sr=
c,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =
=3D "blsp2_qup2_spi_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_nam=
es_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &=
amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2_qup3=
_i2c_apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2a020,<br>+	=2Emnd_width =3D=
 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0=
_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br=
>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "=
blsp2_qup3_i2c_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo=
_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;c=
lk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2_qup3_spi_=
apps_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2a00c,<br>+	=2Emnd_width =3D 8,<b=
r>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll=
0_early_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,<br>+	=
=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "bls=
p2_qup3_spi_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gp=
ll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_=
rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2_qup4_i2c_app=
s_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2c020,<br>+	=2Emnd_width =3D 0,<br>+=
	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_e=
arly_div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_i2c_apps_clk_src,<br>+	=2Ecl=
kr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp2_qu=
p4_i2c_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_g=
pll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_=
ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2_qup4_spi_apps_clk=
_src =3D {<br>+	=2Ecmd_rcgr =3D 0x2c00c,<br>+	=2Emnd_width =3D 8,<br>+	=2Eh=
id_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_=
div,<br>+	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,<br>+	=2Eclkr=2E=
hw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp2_qup4_sp=
i_apps_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_=
early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<=
br>+	},<br>+};<br>+<br>+static struct clk_rcg2 blsp2_uart1_apps_clk_src =3D=
 {<br>+	=2Ecmd_rcgr =3D 0x2700c,<br>+	=2Emnd_width =3D 16,<br>+	=2Ehid_widt=
h =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br=
>+	=2Efreq_tbl =3D ftbl_blsp1_uart1_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =
=3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "blsp2_uart1_apps_clk_sr=
c",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br=
>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+}=
;<br>+<br>+static struct clk_rcg2 blsp2_uart2_apps_clk_src =3D {<br>+	=2Ecm=
d_rcgr =3D 0x2900c,<br>+	=2Emnd_width =3D 16,<br>+	=2Ehid_width =3D 5,<br>+=
	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tb=
l =3D ftbl_blsp1_uart1_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(str=
uct clk_init_data){<br>+		=2Ename =3D "blsp2_uart2_apps_clk_src",<br>+		=2E=
parent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_pa=
rents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+st=
atic const struct freq_tbl ftbl_gp1_clk_src[] =3D {<br>+	F(19200000, P_XO, =
1, 0, 0),<br>+	F(100000000, P_GPLL0, 6, 0, 0),<br>+	F(200000000, P_GPLL0, 3=
, 0, 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 gp1_clk_src =3D {<=
br>+	=2Ecmd_rcgr =3D 0x64004,<br>+	=2Emnd_width =3D 8,<br>+	=2Ehid_width =
=3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early=
_div,<br>+	=2Efreq_tbl =3D ftbl_gp1_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &=
amp;(struct clk_init_data){<br>+		=2Ename =3D "gp1_clk_src",<br>+		=2Eparen=
t_names =3D gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,<br>+		=2En=
um_parents =3D 4,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<b=
r>+static struct clk_rcg2 gp2_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x65004,<b=
r>+	=2Emnd_width =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc=
_parent_map_xo_gpll0_sleep_clk_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_g=
p1_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+	=
	=2Ename =3D "gp2_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_g=
pll0_sleep_clk_gpll0_early_div,<br>+		=2Enum_parents =3D 4,<br>+		=2Eops =
=3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_rcg2 gp3_c=
lk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x66004,<br>+	=2Emnd_width =3D 8,<br>+	=
=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_sleep_cl=
k_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_gp1_clk_src,<br>+	=2Eclkr=2Ehw=
=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "gp3_clk_src",<b=
r>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_di=
v,<br>+		=2Enum_parents =3D 4,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<=
br>+};<br>+<br>+static const struct freq_tbl ftbl_hmss_gpll0_clk_src[] =3D =
{<br>+	F(300000000, P_GPLL0, 2, 0, 0),<br>+	F(600000000, P_GPLL0, 1, 0, 0),=
<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 hmss_gpll0_clk_src =3D {<b=
r>+	=2Ecmd_rcgr =3D 0x4805c,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D=
 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=
=2Efreq_tbl =3D ftbl_hmss_gpll0_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;=
(struct clk_init_data){<br>+		=2Ename =3D "hmss_gpll0_clk_src",<br>+		=2Epa=
rent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_pare=
nts =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+stat=
ic const struct freq_tbl ftbl_hmss_gpll4_clk_src[] =3D {<br>+	F(384000000, =
P_GPLL4, 4, 0, 0),<br>+	F(768000000, P_GPLL4, 2, 0, 0),<br>+	F(1536000000, =
P_GPLL4, 1, 0, 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 hmss_gpl=
l4_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x48074,<br>+	=2Emnd_width =3D 0,<br>=
+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll4,<br>+	=
=2Efreq_tbl =3D ftbl_hmss_gpll4_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;=
(struct clk_init_data){<br>+		=2Ename =3D "hmss_gpll4_clk_src",<br>+		=2Epa=
rent_names =3D gcc_parent_names_xo_gpll4,<br>+		=2Enum_parents =3D 2,<br>+	=
	=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static const struct =
freq_tbl ftbl_hmss_rbcpr_clk_src[] =3D {<br>+	F(19200000, P_XO, 1, 0, 0),<b=
r>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 hmss_rbcpr_clk_src =3D {<br>=
+	=2Ecmd_rcgr =3D 0x48044,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5=
,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Ef=
req_tbl =3D ftbl_hmss_rbcpr_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(str=
uct clk_init_data){<br>+		=2Ename =3D "hmss_rbcpr_clk_src",<br>+		=2Eparent=
_names =3D gcc_parent_names_xo_gpll0,<br>+		=2Enum_parents =3D 2,<br>+		=2E=
ops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static const struct freq=
_tbl ftbl_pdm2_clk_src[] =3D {<br>+	F(60000000, P_GPLL0, 10, 0, 0),<br>+	{ =
}<br>+};<br>+<br>+static struct clk_rcg2 pdm2_clk_src =3D {<br>+	=2Ecmd_rcg=
r =3D 0x33010,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Epa=
rent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D =
ftbl_pdm2_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data)=
{<br>+		=2Ename =3D "pdm2_clk_src",<br>+		=2Eparent_names =3D gcc_parent_na=
mes_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D =
&amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static const struct freq_tbl ftb=
l_qspi_ser_clk_src[] =3D {<br>+	F(19200000, P_XO, 1, 0, 0),<br>+	F(80200000=
, P_GPLL1_EARLY_DIV, 5, 0, 0),<br>+	F(160400000, P_GPLL1, 5, 0, 0),<br>+	F(=
267333333, P_GPLL1, 3, 0, 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rc=
g2 qspi_ser_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x4d00c,<br>+	=2Emnd_width =
=3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gp=
ll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,<br>+	=2Efreq_tbl =3D ftbl_=
qspi_ser_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){=
<br>+		=2Ename =3D "qspi_ser_clk_src",<br>+		=2Eparent_names =3D gcc_parent=
_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,<br>+		=2Enum_p=
arents =3D 6,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+s=
tatic const struct freq_tbl ftbl_sdcc1_apps_clk_src[] =3D {<br>+	F(144000, =
P_XO, 16, 3, 25),<br>+	F(400000, P_XO, 12, 1, 4),<br>+	F(20000000, P_GPLL0_=
EARLY_DIV, 5, 1, 3),<br>+	F(25000000, P_GPLL0_EARLY_DIV, 6, 1, 2),<br>+	F(5=
0000000, P_GPLL0_EARLY_DIV, 6, 0, 0),<br>+	F(100000000, P_GPLL0, 6, 0, 0),<=
br>+	F(192000000, P_GPLL4, 8, 0, 0),<br>+	F(384000000, P_GPLL4, 4, 0, 0),<b=
r>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 sdcc1_apps_clk_src =3D {<br>=
+	=2Ecmd_rcgr =3D 0x1602c,<br>+	=2Emnd_width =3D 8,<br>+	=2Ehid_width =3D 5=
,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll4_gpll0_early_div,<br>=
+	=2Efreq_tbl =3D ftbl_sdcc1_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &am=
p;(struct clk_init_data){<br>+		=2Ename =3D "sdcc1_apps_clk_src",<br>+		=2E=
parent_names =3D gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div,<br>+		=2E=
num_parents =3D 4,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<=
br>+static const struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] =3D {<br>+	F=
(75000000, P_GPLL0_EARLY_DIV, 4, 0, 0),<br>+	F(150000000, P_GPLL0, 4, 0, 0)=
,<br>+	F(200000000, P_GPLL0, 3, 0, 0),<br>+	F(300000000, P_GPLL0, 2, 0, 0),=
<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 sdcc1_ice_core_clk_src =3D=
 {<br>+	=2Ecmd_rcgr =3D 0x16010,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width=
 =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>=
+	=2Efreq_tbl =3D ftbl_sdcc1_ice_core_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D=
 &amp;(struct clk_init_data){<br>+		=2Ename =3D "sdcc1_ice_core_clk_src",<b=
r>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=
=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br=
>+<br>+static const struct freq_tbl ftbl_sdcc2_apps_clk_src[] =3D {<br>+	F(=
144000, P_XO, 16, 3, 25),<br>+	F(400000, P_XO, 12, 1, 4),<br>+	F(20000000, =
P_GPLL0_EARLY_DIV, 5, 1, 3),<br>+	F(25000000, P_GPLL0_EARLY_DIV, 6, 1, 2),<=
br>+	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),<br>+	F(100000000, P_GPLL0, 6,=
 0, 0),<br>+	F(192000000, P_GPLL4, 8, 0, 0),<br>+	F(200000000, P_GPLL0, 3, =
0, 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 sdcc2_apps_clk_src =
=3D {<br>+	=2Ecmd_rcgr =3D 0x14010,<br>+	=2Emnd_width =3D 8,<br>+	=2Ehid_wi=
dth =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div_g=
pll4,<br>+	=2Efreq_tbl =3D ftbl_sdcc2_apps_clk_src,<br>+	=2Eclkr=2Ehw=2Eini=
t =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "sdcc2_apps_clk_src",<=
br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4,<=
br>+		=2Enum_parents =3D 4,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>=
+};<br>+<br>+static const struct freq_tbl ftbl_ufs_axi_clk_src[] =3D {<br>+=
	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),<br>+	F(100000000, P_GPLL0, 6, 0, =
0),<br>+	F(150000000, P_GPLL0, 4, 0, 0),<br>+	F(200000000, P_GPLL0, 3, 0, 0=
),<br>+	F(240000000, P_GPLL0, 2=2E5, 0, 0),<br>+	{ }<br>+};<br>+<br>+static=
 struct clk_rcg2 ufs_axi_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x75018,<br>+	=
=2Emnd_width =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_par=
ent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_ufs_axi_clk_src=
,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =
=3D "ufs_axi_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_=
gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2=
_ops,<br>+	},<br>+};<br>+<br>+static const struct freq_tbl ftbl_ufs_ice_cor=
e_clk_src[] =3D {<br>+	F(75000000, P_GPLL0_EARLY_DIV, 4, 0, 0),<br>+	F(1500=
00000, P_GPLL0, 4, 0, 0),<br>+	F(300000000, P_GPLL0, 2, 0, 0),<br>+	{ }<br>=
+};<br>+<br>+static struct clk_rcg2 ufs_ice_core_clk_src =3D {<br>+	=2Ecmd_=
rcgr =3D 0x76010,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=
=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl=
 =3D ftbl_ufs_ice_core_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct c=
lk_init_data){<br>+		=2Ename =3D "ufs_ice_core_clk_src",<br>+		=2Eparent_na=
mes =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D=
 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static stru=
ct clk_rcg2 ufs_phy_aux_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0x76044,<br>+	=
=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_par=
ent_map_xo_sleep_clk,<br>+	=2Efreq_tbl =3D ftbl_hmss_rbcpr_clk_src,<br>+	=
=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "ufs=
_phy_aux_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_xo_sleep_clk,=
<br>+		=2Enum_parents =3D 2,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br=
>+};<br>+<br>+static const struct freq_tbl ftbl_ufs_unipro_core_clk_src[] =
=3D {<br>+	F(37500000, P_GPLL0_EARLY_DIV, 8, 0, 0),<br>+	F(75000000, P_GPLL=
0, 8, 0, 0),<br>+	F(150000000, P_GPLL0, 4, 0, 0),<br>+	{ }<br>+};<br>+<br>+=
static struct clk_rcg2 ufs_unipro_core_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0=
x76028,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_ma=
p =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_uf=
s_unipro_core_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_d=
ata){<br>+		=2Ename =3D "ufs_unipro_core_clk_src",<br>+		=2Eparent_names =
=3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<=
br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static const st=
ruct freq_tbl ftbl_usb20_master_clk_src[] =3D {<br>+	F(19200000, P_XO, 1, 0=
, 0),<br>+	F(60000000, P_GPLL0, 10, 0, 0),<br>+	F(120000000, P_GPLL0, 5, 0,=
 0),<br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 usb20_master_clk_src =
=3D {<br>+	=2Ecmd_rcgr =3D 0x2f010,<br>+	=2Emnd_width =3D 8,<br>+	=2Ehid_wi=
dth =3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<=
br>+	=2Efreq_tbl =3D ftbl_usb20_master_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =
=3D &amp;(struct clk_init_data){<br>+		=2Ename =3D "usb20_master_clk_src",<=
br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=
=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br=
>+<br>+static const struct freq_tbl ftbl_usb20_mock_utmi_clk_src[] =3D {<br=
>+	F(19200000, P_XO, 1, 0, 0),<br>+	F(60000000, P_GPLL0, 10, 0, 0),<br>+	{ =
}<br>+};<br>+<br>+static struct clk_rcg2 usb20_mock_utmi_clk_src =3D {<br>+=
	=2Ecmd_rcgr =3D 0x2f024,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,=
<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efr=
eq_tbl =3D ftbl_usb20_mock_utmi_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;=
(struct clk_init_data){<br>+		=2Ename =3D "usb20_mock_utmi_clk_src",<br>+		=
=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=2Enum=
_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>=
+static const struct freq_tbl ftbl_usb30_master_clk_src[] =3D {<br>+	F(1920=
0000, P_XO, 1, 0, 0),<br>+	F(66666667, P_GPLL0_EARLY_DIV, 4=2E5, 0, 0),<br>=
+	F(120000000, P_GPLL0, 5, 0, 0),<br>+	F(133333333, P_GPLL0, 4=2E5, 0, 0),<=
br>+	F(150000000, P_GPLL0, 4, 0, 0),<br>+	F(200000000, P_GPLL0, 3, 0, 0),<b=
r>+	F(240000000, P_GPLL0, 2=2E5, 0, 0),<br>+	{ }<br>+};<br>+<br>+static str=
uct clk_rcg2 usb30_master_clk_src =3D {<br>+	=2Ecmd_rcgr =3D 0xf014,<br>+	=
=2Emnd_width =3D 8,<br>+	=2Ehid_width =3D 5,<br>+	=2Eparent_map =3D gcc_par=
ent_map_xo_gpll0_gpll0_early_div,<br>+	=2Efreq_tbl =3D ftbl_usb30_master_cl=
k_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+		=2En=
ame =3D "usb30_master_clk_src",<br>+		=2Eparent_names =3D gcc_parent_names_=
xo_gpll0_gpll0_early_div,<br>+		=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp=
;clk_rcg2_ops,<br>+	},<br>+};<br>+<br>+static const struct freq_tbl ftbl_us=
b30_mock_utmi_clk_src[] =3D {<br>+	F(19200000, P_XO, 1, 0, 0),<br>+	F(40000=
000, P_GPLL0_EARLY_DIV, 7=2E5, 0, 0),<br>+	F(60000000, P_GPLL0, 10, 0, 0),<=
br>+	{ }<br>+};<br>+<br>+static struct clk_rcg2 usb30_mock_utmi_clk_src =3D=
 {<br>+	=2Ecmd_rcgr =3D 0xf028,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =
=3D 5,<br>+	=2Eparent_map =3D gcc_parent_map_xo_gpll0_gpll0_early_div,<br>+=
	=2Efreq_tbl =3D ftbl_usb30_mock_utmi_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D=
 &amp;(struct clk_init_data){<br>+		=2Ename =3D "usb30_mock_utmi_clk_src",<=
br>+		=2Eparent_names =3D gcc_parent_names_xo_gpll0_gpll0_early_div,<br>+		=
=2Enum_parents =3D 3,<br>+		=2Eops =3D &amp;clk_rcg2_ops,<br>+	},<br>+};<br=
>+<br>+static const struct freq_tbl ftbl_usb3_phy_aux_clk_src[] =3D {<br>+	=
F(1200000, P_XO, 16, 0, 0),<br>+	F(19200000, P_XO, 1, 0, 0),<br>+	{ }<br>+}=
;<br>+<br>+static struct clk_rcg2 usb3_phy_aux_clk_src =3D {<br>+	=2Ecmd_rc=
gr =3D 0x5000c,<br>+	=2Emnd_width =3D 0,<br>+	=2Ehid_width =3D 5,<br>+	=2Ep=
arent_map =3D gcc_parent_map_xo_sleep_clk,<br>+	=2Efreq_tbl =3D ftbl_usb3_p=
hy_aux_clk_src,<br>+	=2Eclkr=2Ehw=2Einit =3D &amp;(struct clk_init_data){<b=
r>+		=2Ename =3D "usb3_phy_aux_clk_src",<br>+		=2Eparent_names =3D gcc_pare=
nt_names_xo_sleep_clk,<br>+		=2Enum_parents =3D 2,<br>+		=2Eops =3D &amp;cl=
k_rcg2_ops,<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_aggre2_ufs=
_axi_clk =3D {<br>+	=2Ehalt_reg =3D 0x75034,<br>+	=2Ehalt_check =3D BRANCH_=
HALT,<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x75034,<br>+		=2Eenable_m=
ask =3D BIT(0),<br>+		=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+			=
=2Ename =3D "gcc_aggre2_ufs_axi_clk",<br>+			=2Eparent_names =3D (const cha=
r *[]){<br>+				"ufs_axi_clk_src",<br>+			},<br>+			=2Enum_parents =3D 1,<b=
r>+			=2Eops =3D &amp;clk_branch2_ops,<br>+		},<br>+	},<br>+};<br>+<br>+sta=
tic struct clk_branch gcc_aggre2_usb3_axi_clk =3D {<br>+	=2Ehalt_reg =3D 0x=
f03c,<br>+	=2Ehalt_check =3D BRANCH_HALT,<br>+	=2Eclkr =3D {<br>+		=2Eenabl=
e_reg =3D 0xf03c,<br>+		=2Eenable_mask =3D BIT(0),<br>+		=2Ehw=2Einit =3D &=
amp;(struct clk_init_data){<br>+			=2Ename =3D "gcc_aggre2_usb3_axi_clk",<b=
r>+			=2Eparent_names =3D (const char *[]){<br>+				"usb30_master_clk_src",=
<br>+			},<br>+			=2Enum_parents =3D 1,<br>+			=2Eops =3D &amp;clk_branch2_=
ops,<br>+		},<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_bimc_gfx=
_clk =3D {<br>+	=2Ehalt_reg =3D 0x7106c,<br>+	=2Ehalt_check =3D BRANCH_VOTE=
D,<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x7106c,<br>+		=2Eenable_mask=
 =3D BIT(0),<br>+		=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+			=2E=
name =3D "gcc_bimc_gfx_clk",<br>+			=2Eops =3D &amp;clk_branch2_ops,<br>+		=
},<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_bimc_hmss_axi_clk =
=3D {<br>+	=2Ehalt_reg =3D 0x48004,<br>+	=2Ehalt_check =3D BRANCH_HALT_VOTE=
D,<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x52004,<br>+		=2Eenable_mask=
 =3D BIT(22),<br>+		=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+			=
=2Ename =3D "gcc_bimc_hmss_axi_clk",<br>+			=2Eops =3D &amp;clk_branch2_ops=
,<br>+		},<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_bimc_mss_q6=
_axi_clk =3D {<br>+	=2Ehalt_reg =3D 0x4401c,<br>+	=2Ehalt_check =3D BRANCH_=
HALT,<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x4401c,<br>+		=2Eenable_m=
ask =3D BIT(0),<br>+		=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+			=
=2Ename =3D "gcc_bimc_mss_q6_axi_clk",<br>+			=2Eops =3D &amp;clk_branch2_o=
ps,<br>+		},<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_blsp1_ahb=
_clk =3D {<br>+	=2Ehalt_reg =3D 0x17004,<br>+	=2Ehalt_check =3D BRANCH_HALT=
_VOTED,<br>+	=2Eclkr =3D {<br>+		=2Eenable_reg =3D 0x52004,<br>+		=2Eenable=
_mask =3D BIT(17),<br>+		=2Ehw=2Einit =3D &amp;(struct clk_init_data){<br>+=
			=2Ename =3D "gcc_blsp1_ahb_clk",<br>+			=2Eops =3D &amp;clk_branch2_ops,=
<br>+		},<br>+	},<br>+};<br>+<br>+static struct clk_branch gcc_blsp1_qup1_i=
2c_apps_clk</pre></blockquote></div><br>-- <br>Sent from my Android device =
with K-9 Mail=2E Please excuse my brevity=2E</body></html>
------X0ARA7UYLSOKTS3KMNR1NJ4LFOY2SP--
