From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 3/7] phy: Add set_mode callback
Date: Wed, 4 May 2016 13:10:30 -0500
Message-ID: <20160504181030.GA4327@uda0271908>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460658919-4965-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 14, 2016 at 01:35:14PM -0500, David Lechner wrote:
> The initial use for this is for PHYs that have a mode related to USB OTG.
> There are several SoCs (e.g. TI OMAP and DA8xx) that have a mode setting
> in the USB PHY to override OTG VBUS and ID signals.
> 
> Of course, the enum can be expaned in the future to include modes for
> other types of PHYs as well.
> 
> Suggested-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
> 
> v4 changes:
> 
> * This is a new patch to avoid exporting a symbol from the phy-da8xx-usb driver.
> 
> 
>  drivers/phy/phy-core.c  | 15 +++++++++++++++
>  include/linux/phy/phy.h | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index e7e574d..fe0344c 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -342,6 +342,21 @@ int phy_power_off(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(phy_power_off);
>  
> +int phy_set_mode(struct phy *phy, enum phy_mode mode)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->set_mode)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->set_mode(phy, mode);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_set_mode);

Sorry for my late comments, have been busy on other things.

As I commented in v2, isn't it a better idea to not adding this callback
and let the da8xx phy driver set the mode register in _probe() based on
DT dr_mode?

musb core only calls the *optional* _set_mode() during init, so I don't
see any problem if the phy set the mode in its probe. 

Regards,
-Bin.

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 8cf05e3..d66f4d9 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -22,12 +22,20 @@
>  
>  struct phy;
>  
> +enum phy_mode {
> +	PHY_MODE_INVALID,
> +	PHY_MODE_USB_HOST,
> +	PHY_MODE_USB_DEVICE,
> +	PHY_MODE_USB_OTG,
> +};
> +
>  /**
>   * struct phy_ops - set of function pointers for performing phy operations
>   * @init: operation to be performed for initializing phy
>   * @exit: operation to be performed while exiting
>   * @power_on: powering on the phy
>   * @power_off: powering off the phy
> + * @set_mode: set the mode of the phy
>   * @owner: the module owner containing the ops
>   */
>  struct phy_ops {
> @@ -35,6 +43,7 @@ struct phy_ops {
>  	int	(*exit)(struct phy *phy);
>  	int	(*power_on)(struct phy *phy);
>  	int	(*power_off)(struct phy *phy);
> +	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
>  	struct module *owner;
>  };
>  
> @@ -119,6 +128,7 @@ int phy_init(struct phy *phy);
>  int phy_exit(struct phy *phy);
>  int phy_power_on(struct phy *phy);
>  int phy_power_off(struct phy *phy);
> +int phy_set_mode(struct phy *phy, enum phy_mode mode);
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return phy->attrs.bus_width;
> @@ -224,6 +234,13 @@ static inline int phy_power_off(struct phy *phy)
>     return -ENOSYS;
>  }
>  
> +static inline int phy_set_mode(struct phy *phy, enum phy_mode mode)
> +{
> +	if (!phy)
> +		return 0;
> +	return -ENOSYS;
> +}
> +
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>     return -ENOSYS;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
