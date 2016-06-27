From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 3/7] phy: Add set_mode callback
Date: Mon, 27 Jun 2016 18:17:49 +0530
Message-ID: <57712075.1090202@ti.com>
References: <1462837203-12125-1-git-send-email-david@lechnology.com>
 <1462837203-12125-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462837203-12125-4-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, nsekhar@ti.com, khilman@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 10 May 2016 05:09 AM, David Lechner wrote:
> The initial use for this is for PHYs that have a mode related to USB OTG.
> There are several SoCs (e.g. TI OMAP and DA8xx) that have a mode setting
> in the USB PHY to override OTG VBUS and ID signals.
> 
> Of course, the enum can be expaned in the future to include modes for
> other types of PHYs as well.
> 
> Suggested-by: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: David Lechner <david@lechnology.com>

I've created a immutable branch for this patch and it can be found here.
git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git
tags/phy-set-mode

I've merged this tag to my -next.

Thanks
Kishon

> ---
>  drivers/phy/phy-core.c  | 15 +++++++++++++++
>  include/linux/phy/phy.h | 17 +++++++++++++++++
>  2 files changed, 32 insertions(+)
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
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 8cf05e3..4248ade 100644
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
>  	return -ENOSYS;
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
>  	return -ENOSYS;
> 
