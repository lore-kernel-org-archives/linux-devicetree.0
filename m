From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 4/4] clk: imx: add clock driver for i.MX8MQ CCM
Date: Thu, 15 Mar 2018 22:33:04 +0100
Message-ID: <20180315213304.ejvgpkhxtblr6xb3@pengutronix.de>
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
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 06:54:12PM +0100, Lucas Stach wrote:
> Add driver for the Clock Control Module found on i.MX8MQ.
> 
> This is largely based on the downstream driver from Anson Huang and
> Bai Ping at NXP, with only some small adaptions to mainline from me.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

A general thought: The i.MX8M finally has a consistent clock tree. We
have for example 70 Peripheral clock slices consisting of a mux, a gate
and two dividers, all 70 looking the same.
For these it might make sense to create a more complex clock type
providing mux, gate and set rate functionality in one clock. This would
drastically reduce the number of clocks we have to handle.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
