From: =?UTF-8?B?6ZmI6LGq?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Sat, 15 Oct 2016 23:07:36 +0800
Message-ID: <CAFLEztRLJbMj-ttGBsCWCMW=+0N3bbMQ0c4YcgDyvUDYs1SSkA@mail.gmail.com>
References: <1474743019-1050-1-git-send-email-ayaka@soulik.info> <1474743019-1050-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474743019-1050-3-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

2016-09-25 2:50 GMT+08:00 Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>:
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
> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_=
hsotg *hsotg)
>  static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  {
>         int ret;
> +       struct device_node *np =3D hsotg->dev->of_node;
>
>         /* Clear interrupt */
>         dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct =
dwc2_hsotg *hsotg)
>                         /* Restart the Phy Clock */
>                         pcgcctl &=3D ~PCGCTL_STOPPCLK;
>                         dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
> +
> +                       /*
> +                        * It is a quirk in Rockchip RK3288, causing by
> +                        * a hardware bug. This will propagate out and
> +                        * eventually we'll re-enumerate the device.
> +                        * Not great but the best we can do.
> +                        */
> +                       if (of_device_is_compatible(np, "rockchip,rk3288-=
usb"))
> +                               phy_reset(hsotg->phy);

It will call mutex_lock in phy_reset.


> +
>                         mod_timer(&hsotg->wkp_timer,
>                                   jiffies + msecs_to_jiffies(71));
>                 } else {
> --
> 2.7.4
>

What is the status of this patch=EF=BC=9F
Sleeping calls(phy_reset =3D=3D> mutex) shouldn't be used in irq handler.
Randy will correct that=EF=BC=9F
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
