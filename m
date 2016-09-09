From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [RESEND PATCH v7 3/4] usb: dwc2: assert phy reset when waking up
 in rk3288 platform
Date: Fri, 9 Sep 2016 22:40:08 +0300
Message-ID: <278fe308-fd6a-357a-5fc8-ae67ef11faf2@cogentembedded.com>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info>
 <1473447580-10369-4-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473447580-10369-4-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 09/09/2016 09:59 PM, Randy Li wrote:

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
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  drivers/usb/dwc2/core_intr.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index d85c5c9..af27edc 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
[...]
> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  			/* Restart the Phy Clock */
>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
> +
> +			/*
> +			 * It is a quirk in Rockchip RK3288, causing by

    Caused.

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
