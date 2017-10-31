From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 usb-next 3/4] usb: core: hcd: integrate the PHY
 roothub wrapper
Date: Tue, 31 Oct 2017 19:30:24 +0800
Message-ID: <1509449424.17567.142.camel@mhfsdcap03>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
         <20171023215718.3446-4-martin.blumenstingl@googlemail.com>
         <89fc89e9-4510-2283-aad4-59eacf5cf925@codeaurora.org>
         <CAFBinCD0kMkoWT4veoH8ZM7Rj2XwdvuE+tr7mM4n0J86eaOL-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCD0kMkoWT4veoH8ZM7Rj2XwdvuE+tr7mM4n0J86eaOL-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Tue, 2017-10-31 at 00:10 +0100, Martin Blumenstingl wrote:
> Hi Manu,
> 
> thank you for reviewing this!
> 
> On Thu, Oct 26, 2017 at 7:42 AM, Manu Gautam <mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > Hi,
> >
> >
> > On 10/24/2017 3:27 AM, Martin Blumenstingl wrote:
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
> >> Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> >> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> >> ---
> >>  drivers/usb/core/hcd.c  | 26 ++++++++++++++++++++++++++
> >>  include/linux/usb/hcd.h |  1 +
> >>  2 files changed, 27 insertions(+)
> >>
> >> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> >> index 67aa3d039b9b..6ee97222cdad 100644
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
> >> @@ -2271,6 +2272,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
> >>               usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
> >>               hcd->state = HC_STATE_SUSPENDED;
> >>
> >> +             usb_phy_roothub_power_off(hcd->phy_roothub);
> >> +
> >
> > For system-suspend it should be ok.
> > But, in case of runtime/auto suspend, I think PHYs shouldn't be powered off.
> > Should we have check for that like-
> >
> > if (!PMSG_IS_AUTO(msg))
> >     usb_phy_roothub_power_off()
> >
I test it after adding "if (!PMSG_IS_AUTO(msg)) ...", the PHYS are not
powered off in the case of runtime/auto suspend (hcd-bus automatically
suspend if no devices are attached), but powered off when system enter
suspend mode by "echo mem > /sys/power/state" etc. 
So the behavior is the same as the earlier version that the PHYs are
directly controlled by the host driver, maybe this is a better way for
backward compatibility.

> > Similar check in hcd_bus_resume?
> disclaimer: I must admit that I am not very familiar with the PM code
> and even worse: the platform I'm developing with does not have suspend support
> 
> can I take your suggestion and include it in the next version of this
> series or should we wait for feedback from another developer on this
> topic?
> 
> >
> >>               /* Did we race with a root-hub wakeup event? */
> >>               if (rhdev->do_remote_wakeup) {
> >>                       char    buffer[6];
> >> @@ -2307,6 +2310,11 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
> >>               dev_dbg(&rhdev->dev, "skipped %s of dead bus\n", "resume");
> >>               return 0;
> >>       }
> >> +
> >> +     status = usb_phy_roothub_power_on(hcd->phy_roothub);
> >> +     if (status)
> >> +             return status;
> >> +
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
> 
> 
> Regards
> Martin


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
