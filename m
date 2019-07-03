From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 7/7] net: phy: realtek: configure RTL8211E LEDs
Date: Wed, 3 Jul 2019 22:28:17 +0200
Message-ID: <189ec367-2085-056b-61a9-90f0044b55ba@gmail.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-7-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703193724.246854-7-mka@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 03.07.2019 21:37, Matthias Kaehlcke wrote:
> Configure the RTL8211E LEDs behavior when the device tree property
> 'realtek,led-modes' is specified.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - patch added to the series
> ---
>  drivers/net/phy/realtek.c | 63 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index 45fee4612031..559aec547738 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -9,6 +9,7 @@
>   * Copyright (c) 2004 Freescale Semiconductor, Inc.
>   */
>  #include <linux/bitops.h>
> +#include <linux/bits.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -35,6 +36,15 @@
>  #define RTL8211E_EEE_LED_MODE1			0x05
>  #define RTL8211E_EEE_LED_MODE2			0x06
>  
> +/* RTL8211E extension page 44 */
> +#define RTL8211E_LACR				0x1a
> +#define RLT8211E_LACR_LEDACTCTRL_SHIFT		4
> +#define RLT8211E_LACR_LEDACTCTRL_MASK		GENMASK(6, 4)
> +#define RTL8211E_LCR				0x1c
> +#define RTL8211E_LCR_LEDCTRL_MASK		(GENMASK(2, 0) | \
> +						 GENMASK(6, 4) | \
> +						 GENMASK(10, 8))
> +
>  /* RTL8211E extension page 160 */
>  #define RTL8211E_SCR				0x1a
>  #define RTL8211E_SCR_DISABLE_RXC_SSC		BIT(2)
> @@ -124,6 +134,56 @@ static int rtl8211e_disable_eee_led_mode(struct phy_device *phydev)
>  	return phy_restore_page(phydev, oldpage, ret);
>  }
>  
> +static int rtl8211e_config_leds(struct phy_device *phydev)
> +{
> +	struct device *dev = &phydev->mdio.dev;
> +	int count, i, oldpage, ret;
> +	u16 lacr_bits = 0, lcr_bits = 0;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	if (of_property_read_bool(dev->of_node, "realtek,eee-led-mode-disable"))
> +		rtl8211e_disable_eee_led_mode(phydev);
> +
> +	count = of_property_count_elems_of_size(dev->of_node,
> +						"realtek,led-modes",
> +						sizeof(u32));
> +	if (count < 0 || count > 3)
> +		return -EINVAL;
> +
> +	for (i = 0; i < count; i++) {
> +		u32 val;
> +
> +		of_property_read_u32_index(dev->of_node,
> +					   "realtek,led-modes", i, &val);
> +		lacr_bits |= (u16)(val >> 16) <<
> +			(RLT8211E_LACR_LEDACTCTRL_SHIFT + i);

This may be done in an easier to read way:

if (val & RTL8211E_LINK_ACTIVITY)
	lacr_bits |= BIT(RLT8211E_LACR_LEDACTCTRL_SHIFT + i);


> +		lcr_bits |= (u16)(val & 0xf) << (i * 4);
> +	}
> +
> +	oldpage = rtl8211e_select_ext_page(phydev, 44);
> +	if (oldpage < 0) {
> +		dev_err(dev, "failed to select extended page: %d\n", oldpage);

In a PHY driver it may be more appropriate to use phydev_err() et al,
even though effectively it's the same.

> +		goto err;
> +	}
> +
> +	ret = __phy_modify(phydev, RTL8211E_LACR,
> +			   RLT8211E_LACR_LEDACTCTRL_MASK, lacr_bits);
> +	if (ret) {
> +		dev_err(dev, "failed to write LACR reg: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = __phy_modify(phydev, RTL8211E_LCR,
> +			   RTL8211E_LCR_LEDCTRL_MASK, lcr_bits);
> +	if (ret)
> +		dev_err(dev, "failed to write LCR reg: %d\n", ret);
> +
> +err:
> +	return phy_restore_page(phydev, oldpage, ret);
> +}
> +
>  static int rtl8211e_config_init(struct phy_device *phydev)
>  {
>  	struct device *dev = &phydev->mdio.dev;
> @@ -137,8 +197,7 @@ static int rtl8211e_config_init(struct phy_device *phydev)
>  			dev_err(dev, "failed to enable SSC on RXC: %d\n", ret);
>  	}
>  
> -	if (of_property_read_bool(dev->of_node, "realtek,eee-led-mode-disable"))
> -		rtl8211e_disable_eee_led_mode(phydev);
> +	rtl8211e_config_leds(phydev);
>  
>  	return 0;
>  }
> 
