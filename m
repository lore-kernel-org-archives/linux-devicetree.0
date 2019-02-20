From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string
 support
Date: Wed, 20 Feb 2019 07:09:57 +0000
Message-ID: <AM6PR04MB42151CA6852C4EEA0FECC93C807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-6-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548335800-6438-6-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Can you help picked this one?
SCU clock is likely to be common, so we add a common
compatible string to handle it.

BTW Patch 1~2 already picked up by Shawn.
Patch 3~4 dropped.

Regards
Dong Aisheng

> -----Original Message-----
> From: Aisheng Dong
> Sent: Thursday, January 24, 2019 9:23 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; sboyd@kernel.org;
> mturquette@baylibre.com; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; robh+dt@kernel.org; devicetree@vger.kernel.org;
> Aisheng Dong <aisheng.dong@nxp.com>
> Subject: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string support
> 
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Make the driver support "fsl,scu-clk" fallback compatible string to allow other
> SoCs to reuse the common part.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8qxp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c index
> 83e2ef9..5e2903e 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -138,6 +138,7 @@ static int imx8qxp_clk_probe(struct platform_device
> *pdev)  }
> 
>  static const struct of_device_id imx8qxp_match[] = {
> +	{ .compatible = "fsl,scu-clk", },
>  	{ .compatible = "fsl,imx8qxp-clk", },
>  	{ /* sentinel */ }
>  };
> --
> 2.7.4
