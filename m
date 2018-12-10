From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: imx6q: optionally get CCM inputs via standard
 clock handles
Date: Mon, 10 Dec 2018 11:41:11 -0800
Message-ID: <154447087143.17204.14938556723783178565@swboyd.mtv.corp.google.com>
References: <20181115143028.19087-1-l.stach@pengutronix.de>
 <20181115143028.19087-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181115143028.19087-2-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Lucas Stach (2018-11-15 06:30:27)
> When specifying external clock inputs to the CCM the current code
> requires the clocks to be in a "clocks" child node of the DT root.
> This is not really conformant with DT best practices.
> 
> To avoid the need to deviate from those best practices, allow the
> clock inputs to be specified via standard clock handles. This is
> in line with how drivers of the later CCM driver revisions on
> newer i.MX SoCs handle this.
> 
> As we can't retroactively change the DT binding, allow this as an
> option with a fallback to the old way of how this has been handled.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next
