From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/4] phy: rockchip-usb: use rockchip_usb_phy_reset to
 reset phy during wakeup
Date: Mon, 22 Aug 2016 17:17:41 +0530
Message-ID: <57BAE65D.2090303@ti.com>
References: <7ca3b54d-e9d8-a137-79b6-d24f0b7065c7@synopsys.com>
 <1471725140-3833-1-git-send-email-ayaka@soulik.info>
 <1471725140-3833-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471725140-3833-3-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sunday 21 August 2016 02:02 AM, Randy Li wrote:
> It is a hardware bug in RK3288, the only way to solve it is to
> reset the phy.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  drivers/phy/phy-rockchip-usb.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
> index 2a7381f..734987f 100644
> --- a/drivers/phy/phy-rockchip-usb.c
> +++ b/drivers/phy/phy-rockchip-usb.c
> @@ -29,6 +29,7 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/delay.h>
>  
>  static int enable_usb_uart;
>  
> @@ -64,6 +65,7 @@ struct rockchip_usb_phy {
>  	struct clk_hw	clk480m_hw;
>  	struct phy	*phy;
>  	bool		uart_enabled;
> +	struct reset_control *reset;
>  };
>  
>  static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
> @@ -144,9 +146,23 @@ static int rockchip_usb_phy_power_on(struct phy *_phy)
>  	return clk_prepare_enable(phy->clk480m);
>  }
>  
> +static int rockchip_usb_phy_reset(struct phy *_phy)
> +{
> +	struct rockchip_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	if (phy->reset) {
> +		reset_control_assert(phy->reset);
> +		udelay(10);
> +		reset_control_deassert(phy->reset);
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct phy_ops ops = {
>  	.power_on	= rockchip_usb_phy_power_on,
>  	.power_off	= rockchip_usb_phy_power_off,
> +	.reset		= rockchip_usb_phy_reset,

why not just reuse the .init ops? reset can be done during initialization right?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
