From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/3] clk: imx6q: handle ENET PLL bypass
Date: Mon, 10 Dec 2018 11:41:14 -0800
Message-ID: <154447087417.17204.15229374543848791608@swboyd.mtv.corp.google.com>
References: <20181115143028.19087-1-l.stach@pengutronix.de>
 <20181115143028.19087-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181115143028.19087-3-l.stach@pengutronix.de>
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

Quoting Lucas Stach (2018-11-15 06:30:28)
> The ENET PLL is different from the other i.MX6 PLLs, as it has
> multiple outputs with different post-dividers, which are all
> bypassed if the single bypass bit is activated. The hardware setup
> looks something like this:
>                                 _
> refclk-o---PLL---o----DIV1-----| \

Applied to clk-next
