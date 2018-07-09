From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
Date: Mon, 9 Jul 2018 08:18:40 +0000
Message-ID: <AM0PR04MB4211C3AFCCF832121B88492B80440@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180615095107.24610-2-o.rempel@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> Sent: Friday, June 15, 2018 5:51 PM
> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> clk@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
> 
> This clock is needed for iMX mailbox driver
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

I think this can go separately through CLK tree.

Regards
Dong Aisheng

> ---
>  drivers/clk/imx/clk-imx7d.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c index
> 975a20d3cc94..c7159bfac77a 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -795,6 +795,7 @@ static void __init imx7d_clocks_init(struct
> device_node *ccm_node)
>  	clks[IMX7D_DRAM_ALT_ROOT_CLK] =
> imx_clk_gate4("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0);
>  	clks[IMX7D_OCOTP_CLK] = imx_clk_gate4("ocotp_clk",
> "ipg_root_clk", base + 0x4230, 0);
>  	clks[IMX7D_SNVS_CLK] = imx_clk_gate4("snvs_clk", "ipg_root_clk",
> base + 0x4250, 0);
> +	clks[IMX7D_MU_ROOT_CLK] = imx_clk_gate4("mu_root_clk",
> "ipg_root_clk",
> +base + 0x4270, 0);
>  	clks[IMX7D_CAAM_CLK] = imx_clk_gate4("caam_clk", "ipg_root_clk",
> base + 0x4240, 0);
>  	clks[IMX7D_USB_HSIC_ROOT_CLK] =
> imx_clk_gate4("usb_hsic_root_clk", "usb_hsic_post_div", base + 0x4690, 0);
>  	clks[IMX7D_SDMA_CORE_CLK] = imx_clk_gate4("sdma_root_clk",
> "ahb_root_clk", base + 0x4480, 0);
> --
> 2.17.1
