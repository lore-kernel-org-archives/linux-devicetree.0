From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for QCS404
Date: Sun, 7 Oct 2018 18:57:47 +0530
Message-ID: <20181007132747.GR2372@vkoul-mobl>
References: <20180921185936.9590-1-vkoul@kernel.org>
 <20180921185936.9590-2-vkoul@kernel.org>
 <153841434099.119890.3912925112860077471@swboyd.mtv.corp.google.com>
 <20181003062103.GN19792@vkoul-mobl>
 <6986bbb2-eb89-7758-7fac-d8ac79da55ec@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6986bbb2-eb89-7758-7fac-d8ac79da55ec@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tanya,

On 06-10-18, 23:19, Taniya Das wrote:

> > > > +static struct clk_branch gcc_pwm1_xo512_clk = {
> > > > +       .halt_reg = 0x49004,
> > > > +       .halt_check = BRANCH_HALT,
> > > > +       .clkr = {
> > > > +               .enable_reg = 0x49004,
> > > > +               .enable_mask = BIT(0),
> > > > +               .hw.init = &(struct clk_init_data){
> > > > +                       .name = "gcc_pwm1_xo512_clk",
> > > > +                       .ops = &clk_branch2_ops,
> > > 
> > > Do these pwm clks have a parent clk of the XO?
> > 
> > Yes they do
> 
> We do not need to specify the parent here.

Any specific reason for that?

> 
> > > > +       [GCC_USB_HS_PHY_CFG_AHB_CLK] = &gcc_usb_hs_phy_cfg_ahb_clk.clkr,
> > > > +       [GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
> > > > +       [GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
> > > > +       [GP1_CLK_SRC] = &gp1_clk_src.clkr,
> > > 
> > > Why are some of these missing GCC_ prefix?
> > 
> > will add..
> > 
> 
> These clocks in HW plans do not have GCC prefixed, so it better to leave
> them as they are represented in the HW.

That's right but I think Stephan wants this namespaced properly which IMO
makes sense. Btw looking at other examples I saw that drivers are using
GCC_ tag even if HW representation does not have that

> > > > +static int gcc_qcs404_probe(struct platform_device *pdev)
> > > > +{
> > > > +       struct regmap *regmap;
> > > > +       int ret;
> > > > +
> > > > +       ret = qcom_cc_register_board_clk(&pdev->dev,
> > > > +                                        "xo_board", "cxo", 19200000);
> > > 
> > > You shouldn't need to do this. This function is for transitioning DT
> > > that doesn't have the board clk in DT to something the driver wants to
> > > use, in this case "cxo". So you can either register a fixed factor 1/1
> > > clk to do the translation between board and cxo names, or use xo_board
> > > as the parent of things that can take crystal.
> > 
> > Okay will modify this. If I go about using xo_board as parent, I would
> > need to register that right? FWIW I see the same thing done in gcc-msm8916
> 
> As Stephen suggested it should be defined in DT till we use the
> clk-smd-rpm.c.

OK will check this

> > > > +#define GCC_GENI_IR_BCR                                        0
> > > > +#define GCC_USB_HS_BCR                                 1
> > > > +#define GCC_USB2_HS_PHY_ONLY_BCR                       2
> > > > +#define GCC_QUSB2_PHY_BCR                              3
> > > > +#define GCC_USB_HS_PHY_CFG_AHB_BCR                     4
> > > > +#define GCC_USB2A_PHY_BCR                              5
> > > > +#define GCC_USB3_PHY_BCR                               6
> > > > +#define GCC_USB_30_BCR                                 7
> > > > +#define GCC_USB3PHY_PHY_BCR                            8
> > > > +#define GCC_PCIE_0_BCR                                 9
> > > > +#define GCC_PCIE_0_PHY_BCR                             10
> > > > +#define GCC_PCIE_0_LINK_DOWN_BCR                       11
> > > > +#define GCC_PCIEPHY_0_PHY_BCR                          12
> > > > +#define GCC_EMAC_BCR                                   13
> > > 
> > > No GDSCs? Ok.
> > 
> > Downstream doesn't seem to have one, will recheck specs.
> > 
> 
> Downstream uses different way to handle GDSC, there are 2 GDSCs which have
> to be added 1 for MDSS and 1 OXILI_GX.

Okay will check and add

-- 
~Vinod
