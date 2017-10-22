From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH usb-next v6 0/3] initialize (multiple) PHYs on the
 roothub
Date: Sun, 22 Oct 2017 11:16:03 +0800
Message-ID: <1508642163.17567.110.camel@mhfsdcap03>
References: <20171017212100.10544-1-martin.blumenstingl@googlemail.com>
         <CAFBinCCMxdg=P3ods02mweetykQvgmmaL+GtKmuYEdivTZUofw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCCMxdg=P3ods02mweetykQvgmmaL+GtKmuYEdivTZUofw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 2017-10-19 at 23:32 +0200, Martin Blumenstingl wrote:
> Hi Chunfeng Yun,
> 
> many thanks for your efforts (testing and explaining the Mediatek SoC
> implementatino) on the earlier versions of this series!
> 
> On Tue, Oct 17, 2017 at 11:20 PM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > This series is the outcome of a discussion with Felipe Balbi,
> > see [0] and [1] as well as Mathias Nyman, see [7] and [8].
> > The quick-summary of this is:
> > - dwc3 already takes one USB2 and one USB3 PHY and initializes these
> >   correct
> > - some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
> >   ohci-platform.c) do not have a limitation on the number of PHYs - they
> >   support one PHY per actual host port
> > - Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
> >   or three USB2 ports enabled on the internal root-hub. The SoCs also
> >   provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
> >   internally "connected" to the dwc3 roothub) need to be powered on,
> >   otherwise USB devices cannot be enumerated (even if just one PHY is
> >   disabled and if the device is plugged into another, enabled port)
> >
> > In my first attempt to get USB supported on the GXL and GXM SoCs I tried
> > to work-around the problem that I could not pass multiple PHYs to the
> > dwc3 controller.
> > This was rejected by Rob Herring (which was definitely the thing to do in
> > my opinion), see [2]
> >
> > This series adds a new "roothub PHY wrapper". This can be configured
> > through devicetree by passing a child-node with "reg = <0>" (in other
> > words: it describes the roothub) to the USB controller.
> > Additionally there has to be a child-node for each port on
> > the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
> > property. This allows modeling the root-hub in devicetree similar to the
> > USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
> > This avoids and backwards-compatibility problems (which was a concern
> > regardless of the solution, see [3]) since the binding for the root-hub
> > was previously not specified (and we're not using the "phys" property of
> > the controller, which might have served different purposes before,
> > depending on the drivers).
> >
> > Additionally this integrates the new roothub PHY wrapper into hcd.c
> > which automatically enables it for all USB controller drivers (tested
> > on an Amlogic Meson GXL SoC which uses a dwc3 controller).
> >
> > Changes since RfC v5 at [10]:
> > - dropped RfC prefix
> > - removed noisy dev_err if no roothub node was found (spotted by
> >   Xiaolong Ye's kbuild test robot - thank you for that!)
> > - moved the call to usb_phy_roothub_power_off() within
> >   hcd_bus_suspend() to make sure that the PHYs are turned off
> >   if the "race with a root-hub wakeup event" condition is met (in
> >   this case the PHYs are turned on again, with the old code we did
> >   break the PHYs internal ref-counting because we never turned the
> >   PHYs off before turning them on again in case of that special
> >   "race with a root-hub wakeup event").
> >   additionally we're not handling the status returned by
> >   usb_phy_roothub_power_off() anymore (the bus is already turned off
> >   and we tried to turn off all PHYs as well - only the PHYs which
> >   failed to power off will stay in the current state).
> >   thanks to Alan Stern for the suggestion
> > - removed return value from usb_phy_roothub_power_off() because none
> >   of my code uses it anymore. thanks to Alan Stern for the suggestion
> >
> > Changes since v4 at [9]:
> > - renamed the subject of the cover-letter (old name was:
> >   "initialize (multiple) PHYs in xhci-plat")
> > - back into RFC status (see below for the reasons)
> > - dropped Tested-by from Chunfeng Yun (same reasons as RFC status)
> > - reworded cover-letter and commit messages from "platform-roothub"
> >   to "roothub PHY wrapper"
> is there a chance you can test v6 of this series on the Mediatek SoCs
> one more time?
> in v5 the code was moved from xhci-plat.c to drivers/usb/core/hub.c
> which should even enable it on non-xHCI controllers.
> however, I cannot test suspend/resume support on my Meson GXL SoCs -
> and in addition to that it would be awesome to have confirmation from
> you that the latest version still works fine on the Mediatek SoCs
> 
Sorry for the late reply.

I tested it last week.
It works well, and will consume less power than the current way of
xhci-mtk's, because when no devices are attached, hcd_bus_suspend is
also called and power off phys even though the system doesn't enter
suspend mode. 
And is there any side effect if the phys are powered off/on on runtime
for other Vendor platform?

I find a problem, xhci adds a usb2 hcd and a usb3 hcd, each one will
parse all phys, including usb2-phys and usb3-phys, but in fact, ideally,
usb2 hcd only needs usb2-phys, and usb3 one only needs usb3-phys too,
that's right? so is it necessary to separate those phys into proper hcd?


> thank you in advance!
> 
> > - moved code from drivers/usb/host/platform-roothub.* to
> >   drivers/usb/core/phy.* and the changes to
> >   drivers/usb/host/xhci-plat.c to drivers/usb/core/hcd.c as suggested
> >   by Mathias Nyman (as a benefit this will enable the new logic for
> >   non-xHCI controllers as well - however this was not tested yet)
> > - rename the structs, function names, etc from platform_roothub_* to
> >   usb_phy_roothub*
> >
> > Changes since RFCv3 at [6]:
> > - moved the DT binding change from patch #3 to patch #1 as suggested
> >   by Rob Herring (and slightly adjusted the commit message to account
> >   for that)
> > - added Tested-by from Chunfeng Yun (who confirmed that the whole
> >   concept and implementation works fine on Mediatek SoCs - many thanks
> >   again!) to patch #2
> > - added Rob Herring's ACK to patches 1 and 3
> > - dropped RFC status (RFCv3 -> PATCH v4)
> >
> > Changes since RFCv2 at [5]:
> > - split phy_{init,exit} and phy_power_{on,off} handling. up until RFCv2
> >   I called phy_init plus phy_power_on in platform_roothub_power_on and
> >   phy_power_off plus phy_exit in platform_roothub_power_off. However,
> >   Chunfeng Yun (a Mediatek SoC developer - many thanks for testing my
> >   series and providing great feedback) reported that only using
> >   phy_power_off (and omitting phy_exit) during system suspend fixes an
> >   issue where USB devices would be re-enumerated when resuming. His
> >   original problem description: "In order to keep link state on mt8173,
> >   we just power off all phys(not exit) when system enter suspend, then
> >   power on them again (needn't init, otherwise device will be
> >   disconnected) when system resume, this can avoid re-enumerating
> >   device.". This fix affects patch #2 and #3 as we now have
> >   platform_roothub_init (which calls phy_init internally),
> >   platform_roothub_power_on (which calls phy_power_on internally),
> >   platform_roothub_power_off (which calls phy_power_off internally) and
> >   platform_roothub_exit (which calls phy_exit internally). suspend and
> >   resume only call platform_roothub_power_{on,off} to prevent the issue
> >   described by Chunfeng Yun (unfortunately I cannot test this because
> >   the Amlogic platform currently does not support system suspend).
> > - dropped two struct forward declarations from platform-roothub.h which
> >   are not used in the header file (thanks to Chunfeng Yun for spotting
> >   this)
> >
> > Changes since RFCv1 at [4]:
> > - split the usb-xhci dt-binding documentation into a separate patch
> > - fixed a typo ("usb-phy" -> "phys" in the dt-binding example)
> > - rebased to apply against latest usb-next
> >
> >
> > [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001945.html
> > [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001947.html
> > [2] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001818.html
> > [3] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001948.html
> > [4] http://marc.info/?l=linux-usb&m=148414866303604&w=2
> > [5] https://www.spinics.net/lists/linux-usb/msg158967.html
> > [6] https://www.spinics.net/lists/devicetree/msg190426.html
> > [7] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004881.html
> > [8] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004920.html
> > [9] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004685.html
> > [10] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004924.html
> >
> > Martin Blumenstingl (3):
> >   dt-bindings: usb: add the documentation for USB root-hub
> >   usb: core: add a wrapper for the USB PHYs on the root-hub
> >   usb: core: hcd: integrate the PHY roothub wrapper
> >
> >  .../devicetree/bindings/usb/usb-roothub.txt        |  46 ++++++
> >  Documentation/devicetree/bindings/usb/usb-xhci.txt |   7 +
> >  drivers/usb/core/Makefile                          |   2 +-
> >  drivers/usb/core/hcd.c                             |  27 ++++
> >  drivers/usb/core/phy.c                             | 176 +++++++++++++++++++++
> >  drivers/usb/core/phy.h                             |   7 +
> >  include/linux/usb/hcd.h                            |   1 +
> >  7 files changed, 265 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt
> >  create mode 100644 drivers/usb/core/phy.c
> >  create mode 100644 drivers/usb/core/phy.h
> >
> > --
> > 2.14.2
> >
> 
> Regards,
> Martin


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
