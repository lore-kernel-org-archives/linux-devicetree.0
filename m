From: Sandeep Tripathy <sandeep.tripathy@broadcom.com>
Subject: Re: [PATCH 03/11] clk: bcm: Add clocks for Stingray SOC
Date: Mon, 22 May 2017 17:23:58 +0530
Message-ID: <CALf0Xcxv3QfgDLC9DaRc6c28FZzjARX+38KjSHfVftwhkh3Dcw@mail.gmail.com>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
 <1494071686-19098-4-git-send-email-anup.patel@broadcom.com> <20170519013709.GD20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170519013709.GD20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Anup Patel <anup.patel@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 7:07 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>
> On 05/06, Anup Patel wrote:
> > From: Sandeep Tripathy <sandeep.tripathy@broadcom.com>
> >
> > This patch adds support for Stingray clocks in iproc
> > ccf. The Stingray SOC has various plls based on iproc
> > pll architecture.
> >
>
> Does it have anything besides PLLs?
It describes various plls and soc specific details for the particular
SOC based on
bcm iproc architecture. the core functionality is implemented for all
Broadcom SOC
using iproc pll architecture in generic iproc drivers  eg: clk-iproc-pll.c
>
> > +CLK_OF_DECLARE(sr_genpll0_clk, "brcm,sr-genpll0",
> > +                             sr_genpll0_clk_init);
> > +
> > +static const struct iproc_pll_ctrl genpll3 = {
> > +     .flags = IPROC_CLK_AON | IPROC_CLK_PLL_HAS_NDIV_FRAC |
> > +             IPROC_CLK_PLL_NEEDS_SW_CFG,
> > +     .aon = AON_VAL(0x0, 1, 19, 18),
> > +     .reset = RESET_VAL(0x0, 12, 11),
> > +     .dig_filter = DF_VAL(0x0, 4, 3, 0, 4, 7, 3),
> > +     .sw_ctrl = SW_CTRL_VAL(0x10, 31),
> > +     .ndiv_int = REG_VAL(0x10, 20, 10),
> > +     .ndiv_frac = REG_VAL(0x10, 0, 20),
> > +     .pdiv = REG_VAL(0x14, 0, 4),
> > +     .status = REG_VAL(0x30, 12, 1),
> > +};
> > +
> > +static const struct iproc_clk_ctrl genpll3_clk[] = {
> > +     [BCM_SR_GENPLL3_HSLS_CLK] = {
> > +             .channel = BCM_SR_GENPLL3_HSLS_CLK,
> > +             .flags = IPROC_CLK_AON,
> > +             .enable = ENABLE_VAL(0x4, 6, 0, 12),
> > +             .mdiv = REG_VAL(0x18, 0, 9),
> > +     },
> > +     [BCM_SR_GENPLL3_SDIO_CLK] = {
> > +             .channel = BCM_SR_GENPLL3_SDIO_CLK,
> > +             .flags = IPROC_CLK_AON,
> > +             .enable = ENABLE_VAL(0x4, 7, 1, 13),
> > +             .mdiv = REG_VAL(0x18, 10, 9),
> > +     },
> > +};
> > +
> > +static void __init sr_genpll3_clk_init(struct device_node *node)
> > +{
> > +     iproc_pll_clk_setup(node, &genpll3, NULL, 0, genpll3_clk,
> > +                             ARRAY_SIZE(genpll3_clk));
> > +}
> > +CLK_OF_DECLARE(sr_genpll3_clk, "brcm,sr-genpll3",
> > +                     sr_genpll3_clk_init);
>
> Can you make this a platform driver instead? Are all these clks
> really used for getting the interrupt and timers running?
Not all clocks needed early except the genpll3. sp804 timer clks are derived
from genpll. we will send revised patch to have most of the clocks registered
via platform driver probe.
>
> > +
> > +static const struct iproc_pll_ctrl genpll4 = {
> > +     .flags = IPROC_CLK_AON | IPROC_CLK_PLL_HAS_NDIV_FRAC |
> > +             IPROC_CLK_PLL_NEEDS_SW_CFG,
> > +     .aon = AON_VAL(0x0, 1, 25, 24),
> > +     .reset = RESET_VAL(0x0, 12, 11),
> > +     .dig_filter = DF_VAL(0x0, 4, 3, 0, 4, 7, 3),
> > +     .sw_ctrl = SW_CTRL_VAL(0x10, 31),
> > +     .ndiv_int = REG_VAL(0x10, 20, 10),
> > +     .ndiv_frac = REG_VAL(0x10, 0, 20),
> > +     .pdiv = REG_VAL(0x14, 0, 4),
> > +     .status = REG_VAL(0x30, 12, 1),
> > +};
> > +
> > +static const struct iproc_clk_ctrl genpll4_clk[] = {
> > +     [BCM_SR_GENPLL4_CCN_CLK] = {
> > +             .channel = BCM_SR_GENPLL4_CCN_CLK,
> > +             .flags = IPROC_CLK_AON,
> > +             .enable = ENABLE_VAL(0x4, 6, 0, 12),
> > +             .mdiv = REG_VAL(0x18, 0, 9),
> > +     },
> > +};
> > +
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
regards
Sandeep
