From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/4] phy: Add reset callback
Date: Thu, 08 Sep 2016 17:30:31 +0200
Message-ID: <5873862.22XnObgB2W@phil>
References: <1473344836-26707-1-git-send-email-ayaka@soulik.info> <1473344836-26707-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473344836-26707-2-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: linux-usb@vger.kernel.org, John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, randy.li@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 8. September 2016, 22:27:13 CEST schrieb Randy Li:
> The only use for this is for solving a hardware design problem in
> usb of Rockchip RK3288.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>

to me this looks good.

Although Kishon suggested earlier to have the init callback do the reset and 
simply call it again in the reset-case, the whole refcounting done in phy_init 
and phy_exit (phy->init_count) really shows that init and exit should be 
called pairwise, so that extra reset callback seems justified, so from my phy-
noob-pov

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

with one minor style nitpick below

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

I think a blank line between declarations and code is customary.

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

Heiko
