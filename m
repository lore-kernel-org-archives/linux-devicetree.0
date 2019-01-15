From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 5/6] clk: actions: Add clock driver for S500 SoC
Date: Tue, 15 Jan 2019 08:45:35 +0530
Message-ID: <20190115031535.GA18089@Mani-XPS-13-9360>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
 <20181231185517.18517-6-manivannan.sadhasivam@linaro.org>
 <154725097174.169631.1773315055825741424@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154725097174.169631.1773315055825741424@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: afaerber@suse.de, mturquette@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Jan 11, 2019 at 03:56:11PM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2018-12-31 10:55:16)
> > diff --git a/drivers/clk/actions/owl-s500.c b/drivers/clk/actions/owl-s500.c
> > new file mode 100644
> > index 000000000000..93feea8d71e2
> > --- /dev/null
> > +++ b/drivers/clk/actions/owl-s500.c
> > @@ -0,0 +1,524 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> 
> Please make the reset of these the typical /* type of comments.
> 

Okay. I will do separate patchset for converting S700 and S900.

> > +// Actions Semi Owl S500 SoC clock driver
> > +//
> > +// Copyright (c) 2014 Actions Semi Inc.
> > +// Author: David Liu <liuwei@actions-semi.com>
> > +//
> > +// Copyright (c) 2018 Linaro Ltd.
> > +// Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +//
> > +// Copyright (c) 2018 LSI-TEC - Caninos Loucos
> > +// Author: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/platform_device.h>
> 
> I'm amazed nothing else is required to be included.
> 

Most of the generic includes are added in the local header files. But
yeah, we need to declare those here also. Will do it as an incremental
patchset.

> [..]
> > +#define CMU_NANDPLLDEBUG               (0x00E4)
> > +#define CMU_DISPLAYPLLDEBUG            (0x00E8)
> > +#define CMU_TVOUTPLLDEBUG              (0x00EC)
> > +#define CMU_DEEPCOLORPLLDEBUG          (0x00F4)
> > +#define CMU_AUDIOPLL_ETHPLLDEBUG       (0x00F8)
> > +#define CMU_CVBSPLLDEBUG               (0x00FC)
> > +
> > +#define OWL_S500_COREPLL_DELAY         (150)
> > +#define OWL_S500_DDRPLL_DELAY          (63)
> > +#define OWL_S500_DEVPLL_DELAY          (28)
> > +#define OWL_S500_NANDPLL_DELAY         (44)
> > +#define OWL_S500_DISPLAYPLL_DELAY      (57)
> > +#define OWL_S500_ETHERNETPLL_DELAY     (25)
> > +#define OWL_S500_AUDIOPLL_DELAY                (100)
> > +
> > +static const struct clk_pll_table clk_audio_pll_table[] = {
> > +       { 0, 45158400 }, { 1, 49152000 },
> > +       { 0, 0 },
> > +};
> > +
> > +/* pll clocks */
> > +static OWL_PLL_NO_PARENT_DELAY(ethernet_pll_clk, "ethernet_pll_clk", CMU_ETHERNETPLL, 500000000, 0, 0, 0, 0, 0, OWL_S500_ETHERNETPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(core_pll_clk, "core_pll_clk", CMU_COREPLL, 12000000, 9, 0, 8, 4, 134, OWL_S500_COREPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(ddr_pll_clk, "ddr_pll_clk", CMU_DDRPLL, 12000000, 8, 0, 8, 1, 67, OWL_S500_DDRPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(nand_pll_clk, "nand_pll_clk", CMU_NANDPLL, 6000000, 8, 0, 7, 2, 86, OWL_S500_NANDPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(display_pll_clk, "display_pll_clk", CMU_DISPLAYPLL, 6000000, 8, 0, 8, 2, 126, OWL_S500_DISPLAYPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(dev_pll_clk, "dev_pll_clk", CMU_DEVPLL, 6000000, 8, 0, 7, 8, 126, OWL_S500_DEVPLL_DELAY, NULL, CLK_IGNORE_UNUSED);
> > +static OWL_PLL_NO_PARENT_DELAY(audio_pll_clk, "audio_pll_clk", CMU_AUDIOPLL, 0, 4, 0, 1, 0, 0, OWL_S500_AUDIOPLL_DELAY, clk_audio_pll_table, CLK_IGNORE_UNUSED);
> > +
> > +static const char *dev_clk_mux_p[] = { "hosc", "dev_pll_clk" };
> 
> These can't be const char * const ?
> 

Ack.

> > +static const char *bisp_clk_mux_p[] = { "display_pll_clk", "dev_clk" };
> > +static const char *sensor_clk_mux_p[] = { "hosc", "bisp_clk" };
> > +static const char *sd_clk_mux_p[] = { "dev_clk", "nand_pll_clk" };
> > +static const char *pwm_clk_mux_p[] = { "losc", "hosc" };
> > +static const char *ahbprediv_clk_mux_p[] = { "dev_clk", "display_pll_clk", "nand_pll_clk", "ddr_pll_clk" };
> > +static const char *uart_clk_mux_p[] = { "hosc", "dev_pll_clk" };
> > +static const char *de_clk_mux_p[] = { "display_pll_clk", "dev_clk" };
> > +static const char *i2s_clk_mux_p[] = { "audio_pll_clk" };
> > +static const char *hde_clk_mux_p[] = { "dev_clk", "display_pll_clk", "nand_pll_clk", "ddr_pll_clk" };
> > +static const char *nand_clk_mux_p[] = { "nand_pll_clk", "display_pll_clk", "dev_clk", "ddr_pll_clk" };
> > +
> > +static struct clk_factor_table sd_factor_table[] = {
> 
> Can these tables be const?
> 

They can but sadly const will get discarded during assignments. I will
fix that in incremental patchset.

> > +       /* bit0 ~ 4 */
> > +       { 0, 1, 1 }, { 1, 1, 2 }, { 2, 1, 3 }, { 3, 1, 4 },
> > +       { 4, 1, 5 }, { 5, 1, 6 }, { 6, 1, 7 }, { 7, 1, 8 },
> > +       { 8, 1, 9 }, { 9, 1, 10 }, { 10, 1, 11 }, { 11, 1, 12 },
> > +       { 12, 1, 13 }, { 13, 1, 14 }, { 14, 1, 15 }, { 15, 1, 16 },
> > +       { 16, 1, 17 }, { 17, 1, 18 }, { 18, 1, 19 }, { 19, 1, 20 },
> > +       { 20, 1, 21 }, { 21, 1, 22 }, { 22, 1, 23 }, { 23, 1, 24 },
> > +       { 24, 1, 25 }, { 25, 1, 26 }, { 26, 1, 27 }, { 27, 1, 28 },
> > +       { 28, 1, 29 }, { 29, 1, 30 }, { 30, 1, 31 }, { 31, 1, 32 },
> > +
> > +       /* bit8: /128 */
> > +       { 256, 1, 1 * 128 }, { 257, 1, 2 * 128 }, { 258, 1, 3 * 128 }, { 259, 1, 4 * 128 },
> > +       { 260, 1, 5 * 128 }, { 261, 1, 6 * 128 }, { 262, 1, 7 * 128 }, { 263, 1, 8 * 128 },
> > +       { 264, 1, 9 * 128 }, { 265, 1, 10 * 128 }, { 266, 1, 11 * 128 }, { 267, 1, 12 * 128 },
> > +       { 268, 1, 13 * 128 }, { 269, 1, 14 * 128 }, { 270, 1, 15 * 128 }, { 271, 1, 16 * 128 },
> > +       { 272, 1, 17 * 128 }, { 273, 1, 18 * 128 }, { 274, 1, 19 * 128 }, { 275, 1, 20 * 128 },
> > +       { 276, 1, 21 * 128 }, { 277, 1, 22 * 128 }, { 278, 1, 23 * 128 }, { 279, 1, 24 * 128 },
> > +       { 280, 1, 25 * 128 }, { 281, 1, 26 * 128 }, { 282, 1, 27 * 128 }, { 283, 1, 28 * 128 },
> > +       { 284, 1, 29 * 128 }, { 285, 1, 30 * 128 }, { 286, 1, 31 * 128 }, { 287, 1, 32 * 128 },
> > +       { 0, 0, 0 },
> > +};
> > +
> > +static struct clk_factor_table bisp_factor_table[] = {
> > +       { 0, 1, 1 }, { 1, 1, 2 }, { 2, 1, 3 }, { 3, 1, 4 },
> > +       { 4, 1, 5 }, { 5, 1, 6 }, { 6, 1, 7 }, { 7, 1, 8 },
> > +       { 0, 0, 0 },
> > +};
> > +
> > +static struct clk_factor_table ahb_factor_table[] = {
> > +       { 1, 1, 2 }, { 2, 1, 3 },
> > +       { 0, 0, 0 },
> > +};
> > +
> > +static struct clk_div_table rmii_ref_div_table[] = {
> > +       { 0, 4 }, { 1, 10 },
> > +       { 0, 0 },
> > +};
> > +
> > +static struct clk_div_table i2s_div_table[] = {
> > +       { 0, 1 }, { 1, 2 }, { 2, 3 }, { 3, 4 },
> > +       { 4, 6 }, { 5, 8 }, { 6, 12 }, { 7, 16 },
> > +       { 8, 24 },
> > +       { 0, 0 },
> > +};
> > +
> > +static struct clk_div_table nand_div_table[] = {
> > +       { 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 6 },
> > +       { 4, 8 }, { 5, 10 }, { 6, 12 }, { 7, 14 },
> > +       { 8, 16 }, { 9, 18 }, { 10, 20 }, { 11, 22 },
> > +       { 0, 0 },
> > +};
> > +
> > +/* mux clock */
> > +static OWL_MUX(dev_clk, "dev_clk", dev_clk_mux_p, CMU_DEVPLL, 12, 1, CLK_SET_RATE_PARENT);
> > +static OWL_MUX(ahbprediv_clk, "ahbprediv_clk", ahbprediv_clk_mux_p, CMU_BUSCLK1, 8, 3, CLK_SET_RATE_PARENT);
> > +
> > +/* gate clocks */
> > +static OWL_GATE(spi0_clk, "spi0_clk", "ahb_clk", CMU_DEVCLKEN1, 10, 0, CLK_IGNORE_UNUSED);
> > +static OWL_GATE(spi1_clk, "spi1_clk", "ahb_clk", CMU_DEVCLKEN1, 11, 0, CLK_IGNORE_UNUSED);
> [...]
> > +               [CLK_HDMI]              = &hdmi_clk.common.hw,
> > +               [CLK_VDE]               = &vde_clk.common.hw,
> > +               [CLK_VCE]               = &vce_clk.common.hw,
> > +               [CLK_SPDIF]             = &spdif_clk.common.hw,
> > +               [CLK_NAND]              = &nand_clk.common.hw,
> > +               [CLK_ECC]               = &ecc_clk.common.hw,
> > +       },
> > +       .num = CLK_NR_CLKS,
> > +};
> > +
> > +static struct owl_clk_desc s500_clk_desc = {
> 
> This can't be const?
> 

Same as above.

Thanks,
Mani

> > +       .clks       = s500_clks,
> > +       .num_clks   = ARRAY_SIZE(s500_clks),
> > +
> > +       .hw_clks    = &s500_hw_clks,
> > +};
> > +
