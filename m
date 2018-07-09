From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
Date: Sun, 08 Jul 2018 23:22:00 -0700
Message-ID: <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180615095107.24610-2-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Oleksij Rempel (2018-06-15 02:51:04)
> This clock is needed for iMX mailbox driver
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

but I think you'll want some imx maintainer to review it still.
