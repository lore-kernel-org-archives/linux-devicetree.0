From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] clk: imx6sll: add GPIO LPCGs
Date: Wed, 11 Jul 2018 16:43:03 +0800
Message-ID: <20180711084302.GB6959@dragon>
References: <1529649154-5724-1-git-send-email-Anson.Huang@nxp.com>
 <153091072630.143105.2849049240391576710@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153091072630.143105.2849049240391576710@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com, fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com, mturquette@baylibre.com, ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 06, 2018 at 01:58:46PM -0700, Stephen Boyd wrote:
> Quoting Anson Huang (2018-06-21 23:32:33)
> > According to Reference Manual Rev.0, 06/2017,
> > there are GPIO LPCGs defined in CCM CCGRs,
> > add them into clock tree.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> 
> Applied to clk-next

Stephen,

If you can apply this patch to topic branch 'clk-imx-gpio-gates', I will
be able to pick up patch #2 for this cycle.

For future cycles, I think the topic branch can be named more generic,
so that any clk patches that DT ones have a dependency on can go there.
And then I can apply all those DT patches by pulling in this topic
branch.

Shawn
