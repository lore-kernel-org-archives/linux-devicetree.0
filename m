From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH v5 6/6] ARM: dts: imx6: RIoTboard provide standby on power
 off option
Date: Tue, 20 Jun 2017 06:02:06 +0200
Message-ID: <e1cd6a98-479c-b188-1417-5ead29a89273@pengutronix.de>
References: <20170619050245.2632-1-o.rempel@pengutronix.de>
 <20170619050245.2632-7-o.rempel@pengutronix.de>
 <20170620001936.GU20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170620001936.GU20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 20.06.2017 02:19, Stephen Boyd wrote:
> On 06/19, Oleksij Rempel wrote:
>> This board, as well as some other boards with i.MX6 and a PMIC, uses a
>> "MPIC_STBY_REQ" line to notify the PMIC about a state change.
>
> PMIC_STBY_REQ?

Ok, thanks.
