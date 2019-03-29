From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: meson-gxl: add g12a support
Date: Fri, 29 Mar 2019 20:22:56 +0100
Message-ID: <0b7df4e8-8db2-a028-bd1d-6d77cac67110@gmail.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com>
 <20190329141512.29867-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329141512.29867-4-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29.03.2019 15:15, Jerome Brunet wrote:
> The g12a SoC family uses the type of internal PHY that was used on the
> gxl family. The quirks of gxl family, like the LPA register corruption,
> appear to have been resolved on this new SoC generation.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/net/phy/meson-gxl.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index 0eec2913c289..49cad0f4c79b 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -237,11 +237,25 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.config_intr	= meson_gxl_config_intr,
>  		.suspend        = genphy_suspend,
>  		.resume         = genphy_resume,
> +	}, {
> +		.phy_id		= 0x01803301,
> +		.phy_id_mask	= 0xffffffff,

Here you could use the PHY_ID_MATCH_EXACT() macro, see realtek PHY
driver for an example.

> +		.name		= "Meson G12A Internal PHY",
> +		.features	= PHY_BASIC_FEATURES,
> +		.flags		= PHY_IS_INTERNAL,
> +		.soft_reset     = genphy_soft_reset,
> +		.aneg_done      = genphy_aneg_done,
> +		.read_status	= genphy_read_status,

genphy_aneg_done() and genphy_read_status() are used automatically
as fallback if no callback is defined. You can omit these two lines.

> +		.ack_interrupt	= meson_gxl_ack_interrupt,
> +		.config_intr	= meson_gxl_config_intr,
> +		.suspend        = genphy_suspend,
> +		.resume         = genphy_resume,
>  	},
>  };
>  
>  static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
>  	{ 0x01814400, 0xfffffff0 },
> +	{ 0x01803301, 0xffffffff },

Also a candidate for PHY_ID_MATCH_EXACT. In the line before
PHY_ID_MATCH_MODEL could be used.

>  	{ }
>  };
>  
> 
