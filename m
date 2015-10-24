From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Patches to fix remote wakeup on rk3288 dwc2 "host"
 port
Date: Sat, 24 Oct 2015 10:10:23 -0500
Message-ID: <562B9F5F.1080800@kernel.org>
References: <1445624891-31680-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445624891-31680-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/23/2015 01:28 PM, Douglas Anderson wrote:
> The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
> has a hardware errata that causes everything to get confused when we get
> a remote wakeup.  It appears that the "port reset" bit that's in the USB
> phy (located in the rk3288 GRF) fixes things up and appears safe to do.
> 
> This series of patches exports the "port reset" from the PHY and then
> hooks it up to dwc2 through a quirk.
> 
> I've tested this series atop a bit of a conglomeration of Heiko's github
> "somewhat stable" branch (v4.3-rc3-876-g6509232) but with Greg KH's
> usb-next merged in.
> 
> These patches currently conflict with patches that I posted previously
> to enable USB wakeup from S3, specifically:
> * https://patchwork.kernel.org/patch/6727081/
> * https://patchwork.kernel.org/patch/6727121/
> ...those patches no longer apply anyway, so presumably they need to be
> reposted and I can do so later atop these patches.
> 
> 
> Douglas Anderson (4):
>   phy: rockchip-usb: Support the PHY's "port reset"
>   usb: dwc2: optionally assert phy "port reset" when waking up
>   ARM: dts: rockchip: Enable the USB phys as reset providers on rk3288
>   ARM: dts: rockchip: Point rk3288 dwc2 usb at phy port reset
> 
>  .../devicetree/bindings/phy/rockchip-usb-phy.txt   |  6 ++
>  Documentation/devicetree/bindings/usb/dwc2.txt     |  7 ++
>  arch/arm/boot/dts/rk3288.dtsi                      |  8 +++
>  drivers/phy/phy-rockchip-usb.c                     | 74 ++++++++++++++++++++++
>  drivers/usb/dwc2/core.h                            |  5 ++
>  drivers/usb/dwc2/core_intr.c                       |  7 ++
>  drivers/usb/dwc2/platform.c                        | 13 ++++
>  7 files changed, 120 insertions(+)

A DT reset controller seems like a bit of an overkill here. I think this
would be much more simple if we just add a phy reset hook to the phy
subsystem.

Rob

> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
