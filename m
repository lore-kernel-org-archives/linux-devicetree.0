From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 3/4] usb: dwc2: assert phy reset when waking up in rk3288
 platform
Date: Thu, 8 Sep 2016 11:09:17 -0700
Message-ID: <80dc63ab-d27b-017a-c0e5-c0b192880cc1@synopsys.com>
References: <1473344836-26707-1-git-send-email-ayaka@soulik.info>
 <1473344836-26707-4-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473344836-26707-4-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "John.Youn@synopsys.com" <John.Youn@synopsys.com>, "kishon@ti.com" <kishon@ti.com>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "randy.li@rock-chips.com" <randy.li@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On 9/8/2016 7:27 AM, Randy Li wrote:
> On the rk3288 USB host-only port (the one that's not the OTG-enabled
> port) the PHY can get into a bad state when a wakeup is asserted (not
> just a wakeup from full system suspend but also a wakeup from
> autosuspend).
> 
> We can get the PHY out of its bad state by asserting its "port reset",
> but unfortunately that seems to assert a reset onto the USB bus so it
> could confuse things if we don't actually deenumerate / reenumerate the
> device.
> 
> We can also get the PHY out of its bad state by fully resetting it using
> the reset from the CRU (clock reset unit) in chip, which does a more full
> reset.  The CRU-based reset appears to actually cause devices on the bus
> to be removed and reinserted, which fixes the problem (albeit in a hacky
> way).
> 
> It's unfortunate that we need to do a full re-enumeration of devices at
> wakeup time, but this is better than alternative of letting the bus get
> wedged.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  drivers/usb/dwc2/core_intr.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index d85c5c9..5b9b671 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>  static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  {
>  	int ret;
> +	struct device_node *np = hsotg->dev->of_node;
>  
>  	/* Clear interrupt */
>  	dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  			/* Restart the Phy Clock */
>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
> +
> +			/*
> +			 * It is a quirk in Rockchip RK3288, causing by
> +			 * a hardware bug. This will propagate out and
> +			 * eventually we'll re-enumerate the device. 
> +			 * Not great but the best we can do 

Hi Randy,

Please run ./scripts/checkpatch.pl on your patches and fix trailing
whitespace in above two lines.

Thanks,
John
