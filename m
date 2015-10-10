From: Shengjiu Wang <shengjiu.wang@freescale.com>
Subject: Re: [PATCH V2 1/2] clk: imx6: Add SPDIF_GCLK clock in clock tree
Date: Sat, 10 Oct 2015 09:45:54 +0800
Message-ID: <20151010014553.GB25804@shlinux2>
References: <cover.1442310569.git.shengjiu.wang@freescale.com>
 <113f1cecf1d83c6b96fd23ab9d7a73d1923e0d21.1442310569.git.shengjiu.wang@freescale.com>
 <20150923153340.GK3529@tiger>
 <20150924054321.GA32196@shlinux2>
 <20150924115737.GM3529@tiger>
 <20151009091528.GA25804@shlinux2>
 <20151010011155.GH22673@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151010011155.GH22673@tiger>
Sender: linux-clk-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 10, 2015 at 09:11:55AM +0800, Shawn Guo wrote:
> On Fri, Oct 09, 2015 at 05:15:30PM +0800, Shengjiu Wang wrote:
> > SPDIF_GCLK is also spdif's clock, it use a same enable bit with SPDIF_ROOT_CLK,
> > We didn't separate them in clock tree before.
> 
> Is it the clock described as "Global clock" in Reference Manual, SPDIF
Yes.
> chapter?  If that's the case, you are just adding a missing SPDIF clock
> rather than fixing a low power mode issue, and I will be fine.  But
> still you should reword the commit log to make it clear, that the patch
> is to correct a SPDIF clock setting issue, which is just discovered by
> low power mode support.
> 
Ok, I will refine the patch comments, and send it later.

> Shawn
