From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v9 6/6] ARM: dts: imx6: RIoTboard provide standby on
 power off option
Date: Wed, 12 Sep 2018 09:11:19 +0800
Message-ID: <20180912011118.GC28469@dragon>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-7-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180802103425.3053-7-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 12:34:25PM +0200, Oleksij Rempel wrote:
> This board, as well as some other boards with i.MX6 and a PMIC, uses a
> "PMIC_STBY_REQ" line to notify the PMIC about a state change.
> The PMIC is programmed for a specific state change before triggering the
> line.
> In this case, PMIC_STBY_REQ can be used for stand by, sleep
> and power off modes.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks.
