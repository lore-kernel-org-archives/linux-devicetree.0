From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: add binding for i.MX8MQ CCM
Date: Fri, 23 Feb 2018 12:05:02 +0800
Message-ID: <20180223040500.GN3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180201175412.9480-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 06:54:09PM +0100, Lucas Stach wrote:
> +/* ENET AXI */
> +#define IMX8MQ_CLK_ENET_AXI_SRC		107
> +#define IMX8MQ_CLK_ENET_AXI_CG		108
> +#define IMX8MQ_CLK_ENET_AXI_PRE_DIV	109
> +#define IMX8MQ_CLK_ENET_AXI_DIV		110

The indentation changes from here.  Since these defines are added in one
time, the indentation can be unified.

Shawn

> +/* NAND_USDHC_BUS */
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_SRC		111
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_CG		112
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_PRE_DIV	113
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_DIV		114
