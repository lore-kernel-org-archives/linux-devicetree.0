From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] clk: imx6ul: add GPIO clock gates
Date: Tue, 5 Jun 2018 15:10:09 -0600
Message-ID: <20180605211009.GA28373@rob-hp-laptop>
References: <1527990245-13619-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527990245-13619-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, michael@amarulasolutions.com, matteo.lisi@engicam.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 03, 2018 at 09:44:04AM +0800, Anson Huang wrote:
> i.MX6UL has GPIO clock gates in CCM CCGR,
> add them into clock tree for clock management.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V1:
> 	Move IMX6UL_CLK_GPIOx definition to end of clock table;
> 	Based on Fabio's patch "[v2] dt-bindings: clock: imx6ul: Do not change the clock definition order".
>  drivers/clk/imx/clk-imx6ul.c             | 5 +++++
>  include/dt-bindings/clock/imx6ul-clock.h | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
