From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 6/6] ARM: dts: imx6: RIoTboard provide standby on
 power off option
Date: Mon, 19 Jun 2017 17:19:36 -0700
Message-ID: <20170620001936.GU20170@codeaurora.org>
References: <20170619050245.2632-1-o.rempel@pengutronix.de>
 <20170619050245.2632-7-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170619050245.2632-7-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: devicetree@vger.kernel.org

On 06/19, Oleksij Rempel wrote:
> This board, as well as some other boards with i.MX6 and a PMIC, uses a
> "MPIC_STBY_REQ" line to notify the PMIC about a state change.

PMIC_STBY_REQ?

> The PMIC is programmed for a specific state change before triggering the
> line.
> In this case, PMIC_STBY_REQ can be used for stand by, sleep

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
