From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 4/4] clk: imx: add clock driver for i.MX8MQ CCM
Date: Sat, 24 Feb 2018 11:54:05 +0800
Message-ID: <20180224035404.GZ3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
 <20180201175412.9480-4-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180201175412.9480-4-l.stach@pengutronix.de>
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

On Thu, Feb 01, 2018 at 06:54:12PM +0100, Lucas Stach wrote:
> +	for (i = 0; i < IMX8MQ_CLK_END; i++)
> +		if (IS_ERR(clks[i]))
> +			pr_err("i.MX8mq clk %u register failed with %ld\n",
> +			       i, PTR_ERR(clks[i]));

We have a helper imx_check_clocks() for this.

Shawn
