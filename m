From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 2/4] net: phy: Add function to retrieve LED
 configuration from the DT
Date: Fri, 2 Aug 2019 18:38:10 +0200
Message-ID: <20190802163810.GL2099@lunn.ch>
References: <20190801190759.28201-1-mka@chromium.org>
 <20190801190759.28201-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190801190759.28201-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 01, 2019 at 12:07:57PM -0700, Matthias Kaehlcke wrote:
> Add a phylib function for retrieving PHY LED configuration that
> is specified in the device tree using the generic binding. LEDs
> can be configured to be 'on' for a certain link speed or to blink
> when there is TX/RX activity.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v4:
> - patch added to the series
> ---
>  drivers/net/phy/phy_device.c | 50 ++++++++++++++++++++++++++++++++++++
>  include/linux/phy.h          | 15 +++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 6b5cb87f3866..b4b48de45712 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -2188,6 +2188,56 @@ static bool phy_drv_supports_irq(struct phy_driver *phydrv)
>  	return phydrv->config_intr && phydrv->ack_interrupt;
>  }
>  
> +int of_get_phy_led_cfg(struct phy_device *phydev, int led,
> +		       struct phy_led_config *cfg)
> +{
> +	struct device_node *np, *child;
> +	const char *trigger;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_OF_MDIO))
> +		return -ENOENT;
> +
> +	np = of_find_node_by_name(phydev->mdio.dev.of_node, "leds");
> +	if (!np)
> +		return -ENOENT;
> +
> +	for_each_child_of_node(np, child) {
> +		u32 val;
> +
> +		if (!of_property_read_u32(child, "reg", &val)) {
> +			if (val == (u32)led)
> +				break;
> +		}
> +	}

Hi Matthias

This is leaking references to np and child. In the past we have not
cared about this too much, but we are now getting patches adding the
missing releases. So it would be good to fix this.

	Andrew
