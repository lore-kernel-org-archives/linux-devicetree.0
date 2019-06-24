From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 08/11] thermal: sun8i: support ahb clocks
Date: Mon, 24 Jun 2019 20:23:33 +0200
Message-ID: <20190624182333.di7avywtdvzwukms@flea>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
 <20190623164206.7467-9-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623164206.7467-9-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 23, 2019 at 12:42:03PM -0400, Yangtao Li wrote:
> H3 has extra clock, so introduce something in ths_thermal_chip/ths_device
> and adds the process of the clock.
>
> This is pre-work for supprt it.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index ed1c19bb27cf..04f53ffb6a14 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -54,6 +54,7 @@ struct tsensor {
>  };
>
>  struct ths_thermal_chip {
> +	bool            has_ahb_clk;
>  	int		sensor_num;
>  	int		offset;
>  	int		scale;
> @@ -69,6 +70,7 @@ struct ths_device {
>  	struct regmap				*regmap;
>  	struct reset_control			*reset;
>  	struct clk				*bus_clk;
> +	struct clk                              *ahb_clk;

Hmm, thinking a bit about this, the name of those two clocks doesn't
make sense. AHB is the bus being used to access that device, so the
bus clock is the AHB clock.

What is that clock being used for?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
