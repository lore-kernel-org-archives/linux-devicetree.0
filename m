From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 03/15] clk: imx7d: fix mipi dphy div parent
Date: Thu, 3 May 2018 01:50:16 +0000
Message-ID: <AM0PR04MB4211B3698E0111312A192C0A80870@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180423134750.30403-1-rui.silva@linaro.org>
 <20180423134750.30403-4-rui.silva@linaro.org> <20180503010810.GN3443@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180503010810.GN3443@dragon>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Shawn Guo <shawnguo@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Anson Huang <anson.huang@nxp.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, May 3, 2018 9:08 AM
> To: Rui Miguel Silva <rui.silva@linaro.org>; Anson Huang
> <anson.huang@nxp.com>
> Cc: mchehab@kernel.org; sakari.ailus@linux.intel.com; Steve Longerbeam
> <slongerbeam@gmail.com>; Philipp Zabel <p.zabel@pengutronix.de>; Rob
> Herring <robh+dt@kernel.org>; linux-media@vger.kernel.org;
> devel@driverdev.osuosl.org; Fabio Estevam <fabio.estevam@nxp.com>;
> devicetree@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Ryan Harkin <ryan.harkin@linaro.org>;
> linux-clk@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v2 03/15] clk: imx7d: fix mipi dphy div parent
> 
> Anson,
> 
> Please have a look at this change.
> 
> Shawn
> 
> On Mon, Apr 23, 2018 at 02:47:38PM +0100, Rui Miguel Silva wrote:
> > Fix the mipi dphy root divider to mipi_dphy_pre_div, this would remove
> > a orphan clock and set the correct parent.
> >
> > before:
> > cat clk_orphan_summary
> >                                  enable  prepare  protect
> >    clock                          count    count    count        rate   accuracy   phase
> > ----------------------------------------------------------------------------------------
> >  mipi_dphy_post_div                   1        1        0           0          0 0
> >     mipi_dphy_root_clk                1        1        0           0          0 0
> >
> > cat clk_dump | grep mipi_dphy
> > mipi_dphy_post_div                    1        1        0           0          0 0
> >     mipi_dphy_root_clk                1        1        0           0          0 0
> >
> > after:
> > cat clk_dump | grep mipi_dphy
> >    mipi_dphy_src                     1        1        0    24000000          0 0
> >        mipi_dphy_cg                  1        1        0    24000000          0 0
> >           mipi_dphy_pre_div          1        1        0    24000000          0 0
> >              mipi_dphy_post_div      1        1        0    24000000          0 0
> >                 mipi_dphy_root_clk   1        1        0    24000000          0 0
> >
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> >
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>

Two sign-off?

Otherwise, the patch looks ok to me.
Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>

Regards
Dong Aisheng

> > ---
> >  drivers/clk/imx/clk-imx7d.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> > index 975a20d3cc94..f7f4db2e6fa6 100644
> > --- a/drivers/clk/imx/clk-imx7d.c
> > +++ b/drivers/clk/imx/clk-imx7d.c
> > @@ -729,7 +729,7 @@ static void __init imx7d_clocks_init(struct
> device_node *ccm_node)
> >  	clks[IMX7D_LCDIF_PIXEL_ROOT_DIV] =
> imx_clk_divider2("lcdif_pixel_post_div", "lcdif_pixel_pre_div", base +
> 0xa300, 0, 6);
> >  	clks[IMX7D_MIPI_DSI_ROOT_DIV] =
> imx_clk_divider2("mipi_dsi_post_div", "mipi_dsi_pre_div", base + 0xa380, 0,
> 6);
> >  	clks[IMX7D_MIPI_CSI_ROOT_DIV] =
> imx_clk_divider2("mipi_csi_post_div", "mipi_csi_pre_div", base + 0xa400, 0,
> 6);
> > -	clks[IMX7D_MIPI_DPHY_ROOT_DIV] =
> imx_clk_divider2("mipi_dphy_post_div", "mipi_csi_dphy_div", base +
> 0xa480, 0, 6);
> > +	clks[IMX7D_MIPI_DPHY_ROOT_DIV] =
> > +imx_clk_divider2("mipi_dphy_post_div", "mipi_dphy_pre_div", base +
> > +0xa480, 0, 6);
> >  	clks[IMX7D_SAI1_ROOT_DIV] = imx_clk_divider2("sai1_post_div",
> "sai1_pre_div", base + 0xa500, 0, 6);
> >  	clks[IMX7D_SAI2_ROOT_DIV] = imx_clk_divider2("sai2_post_div",
> "sai2_pre_div", base + 0xa580, 0, 6);
> >  	clks[IMX7D_SAI3_ROOT_DIV] = imx_clk_divider2("sai3_post_div",
> > "sai3_pre_div", base + 0xa600, 0, 6);
> > --
> > 2.17.0
> >
