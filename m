From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: imx6q: reset exclusive gates on init
Date: Mon, 10 Dec 2018 11:41:08 -0800
Message-ID: <154447086823.17204.18171176566068710285@swboyd.mtv.corp.google.com>
References: <20181115143028.19087-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181115143028.19087-1-l.stach@pengutronix.de>
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

Quoting Lucas Stach (2018-11-15 06:30:26)
> The exclusive gates may be set up in the wrong way by software running
> before the clock driver comes up. In that case the exclusive setup is
> locked in its initial state, as the complementary function can't be
> activated without disabling the initial setup first.
> 
> To avoid this lock situation, reset the exclusive gates to the off
> state and allow the kernel to provide the proper setup.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Dong Aisheng <Aisheng.dong@nxp.com>
> ---

Applied to clk-next
