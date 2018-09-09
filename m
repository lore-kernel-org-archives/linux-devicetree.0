From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Sun, 9 Sep 2018 10:00:23 +0800
Message-ID: <20180909020021.GA18838@dragon>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
 <20180827014815.GD29208@dragon>
 <20180906101516.GA5360@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180906101516.GA5360@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, yibin.gong@nxp.com, Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 11:15:17AM +0100, Mark Brown wrote:
> On Mon, Aug 27, 2018 at 09:48:16AM +0800, Shawn Guo wrote:
> 
> > Can you ACK on those two regulator patches, so that I can queue this
> > series up on IMX tree?
> 
> I was expecting to get a pull request with the precursor patches in it -
> the regulator driver seems to get a moderate amount of development so
> there's a reasonable risk of conflicts.

What about you create a stable topic branch for regulator patches and I
pull it into IMX tree?

Shawn
