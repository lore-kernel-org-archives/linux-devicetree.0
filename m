From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc2: optionally assert phy "full reset" when
 waking up
Date: Mon, 15 Aug 2016 15:19:13 -0700
Message-ID: <38019f37-8d68-b7c1-a5b1-b34ffbadf461@synopsys.com>
References: <1446236275-12698-2-git-send-email-dianders@chromium.org>
 <1468929933-6971-1-git-send-email-randy.li@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468929933-6971-1-git-send-email-randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org" <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, "eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/19/2016 5:06 AM, Randy Li wrote:
> From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> On the rk3288 USB host-only port (the one that's not the OTG-enabled
> port) the PHY can get into a bad state when a wakeup is asserted (not
> just a wakeup from full system suspend but also a wakeup from
> autosuspend). The problem is caused by a design fault in IC, Rockchip
> have confirmed it and fix this problem in the future IC model.
> 
> We can get the PHY out of its bad state by asserting its "port reset",
> but unfortunately that seems to assert a reset onto the USB bus so it
> could confuse things if we don't actually deenumerate / reenumerate the
> device.
> 
> We can also get the PHY out of its bad state by fully resetting it using
> the reset from the CRU (clock reset unit), which does a more full
> reset.  The CRU-based reset appears to actually cause devices on the bus
> to be removed and reinserted, which fixes the problem (albeit in a hacky
> way).
> 
> It's unfortunate that we need to do a full re-enumeration of devices at
> wakeup time, but this is better than alternative of letting the bus get
> wedged.
> 
> Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  7 +++++++
>  drivers/usb/dwc2/core.h                        |  5 +++++
>  drivers/usb/dwc2/core_intr.c                   | 14 ++++++++++++++
>  drivers/usb/dwc2/platform.c                    | 13 +++++++++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 20a68bf..40c63ae 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -20,6 +20,13 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
>  Optional properties:
>  - phys: phy provider specifier
>  - phy-names: shall be "usb2-phy"
> +- snps,need-phy-full-reset-on-wake: if present indicates that we need to reset
> +  the PHY when we detect a wakeup due to a hardware errata.  If present you
> +  must specify a "phy-full-reset" reset.
> +
> +Resets:
> +- phy-full-reset (optional): Fully resets the PHY (Only used by rk3288 Soc).
> +
>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>    Refer to usb/generic.txt
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index dec0b21..951abe0 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -719,8 +719,11 @@ struct dwc2_hregs_backup {
>   * @hcd_enabled		Host mode sub-driver initialization indicator.
>   * @gadget_enabled	Peripheral mode sub-driver initialization indicator.
>   * @ll_hw_enabled	Status of low-level hardware resources.
> + * @need_phy_full_reset_on_wake: Quirk saying that we should assert
> + *                               phy_full_reset on a remote wakeup.
>   * @phy:                The otg phy transceiver structure for phy control.
>   * @uphy:               The otg phy transceiver structure for old USB phy control.
> + * @phy_full_reset:     Reset control for the PHY's "full reset".
>   * @plat:               The platform specific configuration data. This can be removed once
>   *                      all SoCs support usb transceiver.
>   * @supplies:           Definition of USB power supplies
> @@ -853,9 +856,11 @@ struct dwc2_hsotg {
>  	unsigned int hcd_enabled:1;
>  	unsigned int gadget_enabled:1;
>  	unsigned int ll_hw_enabled:1;
> +	unsigned int need_phy_full_reset_on_wake:1;
>  
>  	struct phy *phy;
>  	struct usb_phy *uphy;
> +	struct reset_control *phy_full_reset;
>  	struct dwc2_hsotg_plat *plat;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
>  	u32 phyif;
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index d85c5c9..53d8327 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -45,6 +45,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> +#include <linux/reset.h>
>  #include <linux/usb.h>
>  
>  #include <linux/usb/hcd.h>
> @@ -379,6 +380,19 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  			/* Restart the Phy Clock */
>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
> +
> +			/*
> +			 * If we've got this quirk then the PHY is stuck upon
> +			 * wakeup.  Assert reset.  This will propagate out and
> +			 * eventually we'll re-enumerate the device.  Not great
> +			 * but the best we can do.
> +			 */
> +			if (hsotg->need_phy_full_reset_on_wake) {
> +				reset_control_assert(hsotg->phy_full_reset);
> +				udelay(50);
> +				reset_control_deassert(hsotg->phy_full_reset);
> +			}
> +
>  			mod_timer(&hsotg->wkp_timer,
>  				  jiffies + msecs_to_jiffies(71));
>  		} else {
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index fc6f525..d8894a1 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -45,6 +45,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> +#include <linux/reset.h>
>  
>  #include <linux/usb/of.h>
>  
> @@ -529,6 +530,18 @@ static int dwc2_driver_probe(struct platform_device *dev)
>  	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
>  		(unsigned long)res->start, hsotg->regs);
>  
> +	hsotg->need_phy_full_reset_on_wake =
> +		of_property_read_bool(dev->dev.of_node,
> +				"snps,need-phy-full-reset-on-wake");
> +	hsotg->phy_full_reset = devm_reset_control_get(hsotg->dev,
> +				"phy-full-reset");
> +	if (IS_ERR(hsotg->phy_full_reset) &&
> +			hsotg->need_phy_full_reset_on_wake) {

Should use the devm_reset_control_get_optional() variant so that we
can check whether it is a legitimate error, or the PHY is not
specified or !CONFIG_OF.

> +		dev_warn(hsotg->dev, "Missing phy full reset (%ld); skipping\n",
> +				PTR_ERR(hsotg->phy_full_reset));
> +		hsotg->need_phy_full_reset_on_wake = false;
> +	}
> +

Also this code can go into the dwc2_lowlevel_hw_init() function so as
not to clutter up the probe() function futher.

A similar patch adding a reset was submitted by Dinh which you can use
as a reference:

http://marc.info/?l=linux-usb&m=147085447403019&w=2

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
