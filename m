From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESEND PATCH v7 1/4] phy: Add reset callback
Date: Sat, 10 Sep 2016 10:51:00 +0200
Message-ID: <8774766.IvFq1IoyNk@phil>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info> <1473447580-10369-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473447580-10369-2-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Randy,

Am Samstag, 10. September 2016, 02:59:37 CEST schrieb Randy Li:
> The only use for this is for solving a hardware design problem in
> usb of Rockchip RK3288.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>

When sending new versions, please carry over received Reviewed- / Tested- / 
Acked-by tags received on old versions.

So again, to me this looks good.

Although Kishon suggested earlier to have the init callback do the reset and 
simply call it again in the reset-case, the whole refcounting done in phy_init 
and phy_exit (phy->init_count) really shows that init and exit should be 
called pairwise, so that extra reset callback seems justified, so from my phy-
noob-pov

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  drivers/phy/phy-core.c  | 14 ++++++++++++++
>  include/linux/phy/phy.h |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8eca906..32e838d 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -357,6 +357,20 @@ int phy_set_mode(struct phy *phy, enum phy_mode mode)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_mode);
> 
> +int phy_reset(struct phy *phy)
> +{
> +	int ret;
> +	if (!phy || !phy->ops->reset)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->reset(phy);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_reset);
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index f08b672..7978df6 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -36,6 +36,7 @@ enum phy_mode {
>   * @power_on: powering on the phy
>   * @power_off: powering off the phy
>   * @set_mode: set the mode of the phy
> + * @reset: reseting the phy
>   * @owner: the module owner containing the ops
>   */
>  struct phy_ops {
> @@ -44,6 +45,7 @@ struct phy_ops {
>  	int	(*power_on)(struct phy *phy);
>  	int	(*power_off)(struct phy *phy);
>  	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
> +	int	(*reset)(struct phy *phy);
>  	struct module *owner;
>  };
> 
> @@ -136,6 +138,7 @@ int phy_exit(struct phy *phy);
>  int phy_power_on(struct phy *phy);
>  int phy_power_off(struct phy *phy);
>  int phy_set_mode(struct phy *phy, enum phy_mode mode);
> +int phy_reset(struct phy *phy);
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return phy->attrs.bus_width;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
