From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/3] clk: imx6q: reset exclusive gates on init
Date: Tue, 21 Aug 2018 08:01:25 +0000
Message-ID: <AM0PR04MB421125B3E115822BCA0B1C3E80310@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180731102009.6710-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180731102009.6710-1-l.stach@pengutronix.de>
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
To: Lucas Stach <l.stach@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Lucas Stach <l.stach@pengutronix.de>
> Sent: Tuesday, July 31, 2018 6:20 PM

[...]

> 
> The exclusive gates may be set up in the wrong way by software running
> before the clock driver comes up. In that case the exclusive setup is locked in
> its initial state, as the complementary function can't be activated without
> disabling the initial setup first.
> 
> To avoid this lock situation, reset the exclusive gates to the off state and
> allow the kernel to provide the proper setup.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Dong Aisheng <Aisheng.dong@nxp.com>

BTW, I'm just a bit curious what software may do a wrong setting before?

Regards
Dong Aisheng

> ---
>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c index
> b9ea7037e193..9059a369ae95 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -515,8 +515,12 @@ static void __init imx6q_clocks_init(struct
> device_node *ccm_node)
>  	 * lvds1_gate and lvds2_gate are pseudo-gates.  Both can be
>  	 * independently configured as clock inputs or outputs.  We treat
>  	 * the "output_enable" bit as a gate, even though it's really just
> -	 * enabling clock output.
> +	 * enabling clock output. Initially the gate bits are cleared, as
> +	 * otherwise the exclusive configuration gets locked in the setup
> done
> +	 * by software running before the clock driver, with no way to change
> +	 * it.
>  	 */
> +	writel(readl(base + 0x160) & ~0x3c00, base + 0x160);
>  	clk[IMX6QDL_CLK_LVDS1_GATE] =
> imx_clk_gate_exclusive("lvds1_gate", "lvds1_sel", base + 0x160, 10, BIT(12));
>  	clk[IMX6QDL_CLK_LVDS2_GATE] =
> imx_clk_gate_exclusive("lvds2_gate", "lvds2_sel", base + 0x160, 11, BIT(13));
> 
> --
> 2.18.0
