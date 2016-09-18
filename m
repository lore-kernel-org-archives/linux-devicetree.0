From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: imx5: Add clocks configuration
Date: Sun, 18 Sep 2016 08:21:59 +0800
Message-ID: <20160918002159.GD15478@tiger>
References: <1473934403-2726-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1473961353.68713919@f429.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473961353.68713919@f429.i.mail.ru>
Sender: linux-clk-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kalle Kankare <kalle.kankare@vincit.fi>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2016 at 08:42:33PM +0300, Alexander Shiyan wrote:
> >Четверг, 15 сентября 2016, 13:13 +03:00 от Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>:
> >
> >From: Kalle Kankare < kalle.kankare@vincit.fi >
> >
> >Add clocks configuration for CSI, FIRI and IEEE1588.
> >
> >Signed-off-by: Fabien Lahoudere < fabien.lahoudere@collabora.co.uk >
> >---
> > drivers/clk/imx/clk-imx51-imx53.c      | 20 ++++++++++++++++++++
> > include/dt-bindings/clock/imx5-clock.h | 15 ++++++++++++++-
> > 2 files changed, 34 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx51-imx53.c
> >index 29d4c44..1e3c9ea 100644
> >--- a/drivers/clk/imx/clk-imx51-imx53.c
> >+++ b/drivers/clk/imx/clk-imx51-imx53.c
> >@@ -126,6 +126,7 @@ static const char *spdif0_com_sel[] = { "spdif0_podf", "ssi1_root_gate", };
> > static const char *mx51_spdif1_com_sel[] = { "spdif1_podf", "ssi2_root_gate", };
> > static const char *step_sels[] = { "lp_apm", };
> > static const char *cpu_podf_sels[] = { "pll1_sw", "step_sel" };
> >+static const char *ieee1588_sels[] = { "pll3_sw", "pll4_sw", "dummy" /* usbphy2_clk */, "dummy" /* fec_phy_clk */ };
> > 
> > static struct clk *clk[IMX5_CLK_END];
> > static struct clk_onecell_data clk_data;
> >@@ -543,6 +544,25 @@ static void __init mx53_clocks_init(struct device_node *np)
> ...
> 
> 2 Shawn Guo: Since the change affects only on i.MX53 architecture,
> I would ask to change the subject to i.MX53 if it possible.

Yes.  Actually, since clock driver is not moved to drivers/clk, we
shouldn't prefix it with "ARM: " any longer.

Shawn
