From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/2] clk: imx6: Add SPDIF_GCLK clock in clock tree
Date: Thu, 24 Sep 2015 04:57:37 -0700
Message-ID: <20150924115737.GM3529@tiger>
References: <cover.1442310569.git.shengjiu.wang@freescale.com>
 <113f1cecf1d83c6b96fd23ab9d7a73d1923e0d21.1442310569.git.shengjiu.wang@freescale.com>
 <20150923153340.GK3529@tiger>
 <20150924054321.GA32196@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150924054321.GA32196@shlinux2>
Sender: linux-clk-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@freescale.com>
Cc: mturquette@baylibre.com, kernel@pengutronix.de, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 01:43:24PM +0800, Shengjiu Wang wrote:
> On Wed, Sep 23, 2015 at 08:33:41AM -0700, Shawn Guo wrote:
> > On Tue, Sep 15, 2015 at 06:01:01PM +0800, Shengjiu Wang wrote:
> > > As spdif driver will register SPDIF clock to regmap, regmap will do
> > > clk_prepare in init function, so SPDIF clock is prepared in probe, then its
> > > root clock (pll clock) is prepared also, which cause the arm can't enter
> > > low power mode.
> > 
> > Can you help me understand why ARM cannot enter low power mode when pll
> > clock is prepared?
> > 
> > Shawn
> Hi Shawn
> 
>    In i.mx clock framework, when pll clk is prepared, it will be powerup. when
> enterring low power idle mode, the powerdown bit is checked, when pll is not
> powerdown state, chip will not enter low power idle mode.

So this is not a SPDIF specific problem, and any device driver preparing
its clock that is a child of pll clock will run into this problem,
right?  If so, we should purchase a more generic solution than such
device specific one.

Shawn
