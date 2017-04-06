From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] phy: rockchip-usb: Add vbus regulator support.
Date: Thu, 6 Apr 2017 16:07:55 +0530
Message-ID: <59ed8834-75d4-2001-73d4-6081d42d2aeb@ti.com>
References: <20170405140613.4444-1-sjoerd.simons@collabora.co.uk>
 <20170405140613.4444-2-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170405140613.4444-2-sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Wednesday 05 April 2017 07:36 PM, Sjoerd Simons wrote:
> On rockchip devices vbus is supplied by a separate power supply, often
> through a regulator. Add support for describing the the regulator in
> device-tree following the same convention as several other usb phy's.
> 
merged, thanks.

-Kishon
> Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
> 
>  .../devicetree/bindings/phy/rockchip-usb-phy.txt      |  1 +
>  drivers/phy/phy-rockchip-usb.c                        | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
> index 57dc388e2fa2..4ed569046daf 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
> @@ -30,6 +30,7 @@ Optional Properties:
>  - reset-names: Only allow the following entries:
>   - phy-reset
>  - resets: Must contain an entry for each entry in reset-names.
> +- vbus-supply: power-supply phandle for vbus power source
>  
>  Example:
>  
> diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
> index 734987fa0ad7..3378eeb7a562 100644
> --- a/drivers/phy/phy-rockchip-usb.c
> +++ b/drivers/phy/phy-rockchip-usb.c
> @@ -66,6 +66,7 @@ struct rockchip_usb_phy {
>  	struct phy	*phy;
>  	bool		uart_enabled;
>  	struct reset_control *reset;
> +	struct regulator *vbus;
>  };
>  
>  static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
> @@ -88,6 +89,9 @@ static void rockchip_usb_phy480m_disable(struct clk_hw *hw)
>  						    struct rockchip_usb_phy,
>  						    clk480m_hw);
>  
> +	if (phy->vbus)
> +		regulator_disable(phy->vbus);
> +
>  	/* Power down usb phy analog blocks by set siddq 1 */
>  	rockchip_usb_phy_power(phy, 1);
>  }
> @@ -143,6 +147,14 @@ static int rockchip_usb_phy_power_on(struct phy *_phy)
>  	if (phy->uart_enabled)
>  		return -EBUSY;
>  
> +	if (phy->vbus) {
> +		int ret;
> +
> +		ret = regulator_enable(phy->vbus);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return clk_prepare_enable(phy->clk480m);
>  }
>  
> @@ -268,6 +280,13 @@ static int rockchip_usb_phy_init(struct rockchip_usb_phy_base *base,
>  	}
>  	phy_set_drvdata(rk_phy->phy, rk_phy);
>  
> +	rk_phy->vbus = devm_regulator_get_optional(&rk_phy->phy->dev, "vbus");
> +	if (IS_ERR(rk_phy->vbus)) {
> +		if (PTR_ERR(rk_phy->vbus) == -EPROBE_DEFER)
> +			return PTR_ERR(rk_phy->vbus);
> +		rk_phy->vbus = NULL;
> +	}
> +
>  	/*
>  	 * When acting as uart-pipe, just keep clock on otherwise
>  	 * only power up usb phy when it use, so disable it when init
> 
