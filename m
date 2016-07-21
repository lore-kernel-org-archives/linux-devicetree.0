From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc2: optionally assert phy "full reset" when
 waking up
Date: Thu, 21 Jul 2016 15:48:39 -0500
Message-ID: <20160721204839.GA6911@rob-hp-laptop>
References: <1446236275-12698-2-git-send-email-dianders@chromium.org>
 <1468929933-6971-1-git-send-email-randy.li@rock-chips.com>
 <20160720013614.GA12210@rob-hp-laptop>
 <0c61cf90-6fea-19ce-ce74-91648cb2d921@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0c61cf90-6fea-19ce-ce74-91648cb2d921-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 10:54:33AM +0800, Randy Li wrote:
> Thank you for reviewing, if you agree with my opinion, I would implement a
> new version as soon as  possible.
> 
> 
> On 07/20/2016 09:36 AM, Rob Herring wrote:
> >On Tue, Jul 19, 2016 at 08:05:33PM +0800, Randy Li wrote:
> >>From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>
> >>On the rk3288 USB host-only port (the one that's not the OTG-enabled
> >>port) the PHY can get into a bad state when a wakeup is asserted (not
> >>just a wakeup from full system suspend but also a wakeup from
> >>autosuspend). The problem is caused by a design fault in IC, Rockchip
> >>have confirmed it and fix this problem in the future IC model.
> >>
> >>We can get the PHY out of its bad state by asserting its "port reset",
> >>but unfortunately that seems to assert a reset onto the USB bus so it
> >>could confuse things if we don't actually deenumerate / reenumerate the
> >>device.
> >>
> >>We can also get the PHY out of its bad state by fully resetting it using
> >>the reset from the CRU (clock reset unit), which does a more full
> >>reset.  The CRU-based reset appears to actually cause devices on the bus
> >>to be removed and reinserted, which fixes the problem (albeit in a hacky
> >>way).
> >>
> >>It's unfortunate that we need to do a full re-enumeration of devices at
> >>wakeup time, but this is better than alternative of letting the bus get
> >>wedged.
> >>
> >>Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>Signed-off-by: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>Reviewed-by: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/usb/dwc2.txt |  7 +++++++
> >>  drivers/usb/dwc2/core.h                        |  5 +++++
> >>  drivers/usb/dwc2/core_intr.c                   | 14 ++++++++++++++
> >>  drivers/usb/dwc2/platform.c                    | 13 +++++++++++++
> >>  4 files changed, 39 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> >>index 20a68bf..40c63ae 100644
> >>--- a/Documentation/devicetree/bindings/usb/dwc2.txt
> >>+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> >>@@ -20,6 +20,13 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
> >>  Optional properties:
> >>  - phys: phy provider specifier
> >>  - phy-names: shall be "usb2-phy"
> >>+- snps,need-phy-full-reset-on-wake: if present indicates that we need to reset
> >Bikeshedding, but 'snps,full-phy-reset-on-wake' is slightly shorter.
> >
> >However, this isn't really even needed. It should be implied by the SoC
> >specific compatible string.
> I would.
> >
> >>+  the PHY when we detect a wakeup due to a hardware errata.  If present you
> >>+  must specify a "phy-full-reset" reset.
> >>+
> >>+Resets:
> >>+- phy-full-reset (optional): Fully resets the PHY (Only used by rk3288 Soc).
> >This property belows in the phy node as that is where the reset is
> >attached to and why is it not using the standard binding "resets"?
> Because the struct phy_ops doesn't have something like reset method. It is
> impossible to make a phy reset now. Also maybe it is not need to define a
> reset at dts, just implied do that reset that in code(as the way to reset is
> always same and only used by rk3288).

Either the controller can retrieve the phy reset from the phy node or 
add a reset fn to struct phy_ops. The latter would be cleaner.

If you don't put in DT at all and hard code in the driver, then I don't 
have an opinion.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
