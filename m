From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] net: allwinner: emac: Claim our SRAM
Date: Fri, 20 Mar 2015 19:53:55 +0100
Message-ID: <550C6CC3.8010101@redhat.com>
References: <1426877569-11493-1-git-send-email-hdegoede@redhat.com> <1426877569-11493-6-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBR6ZWGUAKGQEAXTEVIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1426877569-11493-6-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 20-03-15 19:52, Hans de Goede wrote:
> From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> The SRAM the EMAC is using might not have been mapped accordingly by the
> bootloader, preventing the EMAC to work properly.
>
> Ask for that SRAM to be mapped at probe time to make sure that this never
> happens.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Make sure SUNXI_SRAM gets enabled in Kconfig]
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Note this patch is only included for completeness / as an example,
it should probably go upstream through the network-drivers tree
once the rest is merged.

Regards,

Hans

> ---
>   drivers/net/ethernet/allwinner/sun4i-emac.c | 13 +++++++++++--
>   drivers/net/ethernet/stmicro/stmmac/Kconfig |  1 +
>   2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
> index f3470d9..9d0136b 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -29,6 +29,8 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy.h>
>
> +#include <linux/soc/sunxi/sunxi_sram.h>
> +
>   #include "sun4i-emac.h"
>
>   #define DRV_NAME		"sun4i-emac"
> @@ -857,11 +859,15 @@ static int emac_probe(struct platform_device *pdev)
>
>   	clk_prepare_enable(db->clk);
>
> +	ret = sunxi_sram_claim(SUNXI_SRAM_EMAC, "emac");
> +	if (ret)
> +		dev_warn(&pdev->dev, "Couldn't map SRAM to device\n");
> +
>   	db->phy_node = of_parse_phandle(np, "phy", 0);
>   	if (!db->phy_node) {
>   		dev_err(&pdev->dev, "no associated PHY\n");
>   		ret = -ENODEV;
> -		goto out;
> +		goto out_release_sram;
>   	}
>
>   	/* Read MAC-address from DT */
> @@ -893,7 +899,7 @@ static int emac_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(&pdev->dev, "Registering netdev failed!\n");
>   		ret = -ENODEV;
> -		goto out;
> +		goto out_release_sram;
>   	}
>
>   	dev_info(&pdev->dev, "%s: at %p, IRQ %d MAC: %pM\n",
> @@ -901,6 +907,8 @@ static int emac_probe(struct platform_device *pdev)
>
>   	return 0;
>
> +out_release_sram:
> +	sunxi_sram_release(SUNXI_SRAM_EMAC);
>   out:
>   	dev_err(db->dev, "not found (%d).\n", ret);
>
> @@ -914,6 +922,7 @@ static int emac_remove(struct platform_device *pdev)
>   	struct net_device *ndev = platform_get_drvdata(pdev);
>
>   	unregister_netdev(ndev);
> +	sunxi_sram_release(SUNXI_SRAM_EMAC);
>   	free_netdev(ndev);
>
>   	dev_dbg(&pdev->dev, "released and freed device\n");
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 7d3af19..785ca22 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -16,6 +16,7 @@ if STMMAC_ETH
>   config STMMAC_PLATFORM
>   	tristate "STMMAC Platform bus support"
>   	depends on STMMAC_ETH
> +	select SUNXI_SRAM if ARCH_SUNXI
>   	default y
>   	---help---
>   	  This selects the platform specific bus support for the stmmac driver.
>
