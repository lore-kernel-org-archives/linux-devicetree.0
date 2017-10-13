From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [RFC usb-next v5 3/3] usb: core: hcd: integrate the PHY roothub
 wrapper
Date: Fri, 13 Oct 2017 10:07:55 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1710131005420.1364-100000@iolanthe.rowland.org>
References: <CAFBinCC4qseHoEkTtNa4NtVXgrcV=NRrOf2BBKvQRbhaZeEzsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCC4qseHoEkTtNa4NtVXgrcV=NRrOf2BBKvQRbhaZeEzsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 12 Oct 2017, Martin Blumenstingl wrote:

> Hi Alan,
> 
> On Mon, Oct 9, 2017 at 7:18 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> > On Sun, 8 Oct 2017, Martin Blumenstingl wrote:
> >
> >> This integrates the PHY roothub wrapper into the core hcd
> >> infrastructure. Multiple PHYs which are part of the roothub devicetree
> >> node (which is a sub-node of the sysdev's node) are now managed
> >> (= powered on/off when needed), by the new usb_phy_roothub code.
> >>
> >> One example where this is required is the Amlogic GXL and GXM SoCs:
> >> They are using a dwc3 USB controller with up to three ports enabled on
> >> the internal roothub. Using only the top-level "phy" properties does not
> >> work here since one can only specify one "usb2-phy" and one "usb3-phy",
> >> while actually at least two "usb2-phy" have to be specified.
> >>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> >> ---
> >>  drivers/usb/core/hcd.c  | 30 +++++++++++++++++++++++++++++-
> >>  include/linux/usb/hcd.h |  1 +
> >>  2 files changed, 30 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> >> index 67aa3d039b9b..56704dd10c15 100644
> >> --- a/drivers/usb/core/hcd.c
> >> +++ b/drivers/usb/core/hcd.c
> >> @@ -50,6 +50,7 @@
> >>  #include <linux/usb/otg.h>
> >>
> >>  #include "usb.h"
> >> +#include "phy.h"
> >>
> >>
> >>  /*-------------------------------------------------------------------------*/
> >> @@ -2292,7 +2293,11 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
> >>               dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
> >>                               "suspend", status);
> >>       }
> >> -     return status;
> >> +
> >> +     if (status == 0)
> >> +             return usb_phy_roothub_power_off(hcd->phy_roothub);
> >
> > Is this really the right thing to do?  If usb_phy_roothub_power_off()
> > fails, what condition does this leave the bus in?  And what condition
> > does the kernel _think_ the bus is in?
> indeed, thank you for spotting this!
> 
> do you have any suggestions how to improve this?
> maybe I should move usb_phy_roothub_power_off a few lines up and only
> call it after the "rhdev->do_remote_wakeup" block if status is 0. if
> usb_phy_roothub_power_off then returns an error I could call
> "hcd_bus_resume(rhdev, PMSG_AUTO_RESUME);". what do you think about
> this?

Or you could just throw away the return code from 
usb_phy_roothub_power_off().  Maybe print it out in a warning message, 
but do not report it to the caller.

After all, given the choice between leaving the entire USB bus at full 
power and leaving just the phy at full power, which would you prefer?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
