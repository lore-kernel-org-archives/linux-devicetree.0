From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Mon, 27 Aug 2018 09:48:16 +0800
Message-ID: <20180827014815.GD29208@dragon>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180802113552.GJ9117@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 12:35:52PM +0100, Mark Brown wrote:
> On Thu, Aug 02, 2018 at 12:47:27PM +0200, Oleksij Rempel wrote:
> > On 02.08.2018 12:44, Mark Brown wrote:
> 
> > > I thought we'd got an ack for this from Raphael on a previous version or
> > > am I mistaken?
> 
> > No, we got an:
> > "Anyway, I have no particular problems with exporting
> > pm_power_off_prepare via EXPORT_SYMBOL_GPL()."
> 
> > Should i see it as ACK?

Mark,

Can you ACK on those two regulator patches, so that I can queue this
series up on IMX tree?

Shawn
