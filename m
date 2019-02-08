From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH 2/2] drivers: xhci: Add quirk to reset xHCI port PHY
Date: Sat, 9 Feb 2019 00:18:20 +0530
Message-ID: <CABe79T5ptsgJVOiSZtsCKjOCSu+pTedvoCVvXaZ9Ph-PaL1k4w@mail.gmail.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
 <1549347534-11320-3-git-send-email-srinath.mannam@broadcom.com>
 <6392f206-9db2-5506-9e5d-cdf2b784d32e@linux.intel.com> <CABe79T4wLea8hBML4Xejv3YH3eAFfXqgnB8+udr-Xo_ZdTn0xA@mail.gmail.com>
 <d176e6bf-10b8-374c-1739-47bc98d12f09@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d176e6bf-10b8-374c-1739-47bc98d12f09@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mathias,

Thanks for comments, Please find my comments below inline.

On Fri, Feb 8, 2019 at 6:00 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 07.02.2019 17:17, Srinath Mannam wrote:
> > Hi Mathias,
> >
> > Thanks for review, please see my comments below inline.
> >
> > On Thu, Feb 7, 2019 at 8:32 PM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 05.02.2019 08:18, Srinath Mannam wrote:
> >>> Add a quirk to reset xHCI port PHY on port disconnect event.
> >>> Stingray USB HS PHY has an issue, that USB High Speed device detected
> >>> at Full Speed after the same port has connected to Full speed device.
> >>> This problem can be resolved with that port PHY reset on disconnect.
> >>>
> >>> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> >>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> >>> ---
> >>>    drivers/usb/core/hcd.c       |  6 ++++++
> >>>    drivers/usb/core/phy.c       | 21 +++++++++++++++++++++
> >>>    drivers/usb/core/phy.h       |  1 +
> >>>    drivers/usb/host/xhci-plat.c |  3 +++
> >>>    drivers/usb/host/xhci-ring.c |  9 ++++++---
> >>>    drivers/usb/host/xhci.h      |  1 +
> >>>    include/linux/usb/hcd.h      |  1 +
> >>>    7 files changed, 39 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> >>> index 015b126..e2b87a6 100644
> >>> --- a/drivers/usb/core/hcd.c
> >>> +++ b/drivers/usb/core/hcd.c
> >>> @@ -2663,6 +2663,12 @@ int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1)
> >>>        return hcd->driver->find_raw_port_number(hcd, port1);
> >>>    }
> >>>
> >>> +int usb_hcd_phy_port_reset(struct usb_hcd *hcd, int port)
> >>> +{
> >>> +     return usb_phy_roothub_port_reset(hcd->phy_roothub, port);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(usb_hcd_phy_port_reset);
> >>> +
> >>>    static int usb_hcd_request_irqs(struct usb_hcd *hcd,
> >>>                unsigned int irqnum, unsigned long irqflags)
> >>>    {
> >>> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> >>> index 38b2c77..c64767d 100644
> >>> --- a/drivers/usb/core/phy.c
> >>> +++ b/drivers/usb/core/phy.c
> >>> @@ -162,6 +162,27 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
> >>>
> >>> +int usb_phy_roothub_port_reset(struct usb_phy_roothub *phy_roothub, int port)
> >>> +{
> >>> +     struct usb_phy_roothub *roothub_entry;
> >>> +     struct list_head *head;
> >>> +     int i = 0;
> >>> +
> >>> +     if (!phy_roothub)
> >>> +             return -EINVAL;
> >>> +
> >>> +     head = &phy_roothub->list;
> >>> +
> >>> +     list_for_each_entry(roothub_entry, head, list) {
> >>> +             if (i == port)
> >>> +                     return phy_reset(roothub_entry->phy);
> >>> +             i++;
> >>> +     }
> >>
> >> I'm not that familiar with SoC's that have several PHYs per controller,
> >> but this looks odd.
> >>
> >> For the above code to work wouldn't it require that each port has their own PHY,
> >> and the PHYs are added to the list of usb_phy_roothub is in the same order as usb ports?
> >>
> >> Or is there something I don't understand here?
> >>
> > In our SOC (Stingray), xHCI controller has three ports and each port
> > connected to separate PHY.
> > Stingray xHCI controller supports both SS and HS ports and connected
> > separate PHYs.
> > We passed PHY phandlers in xHCI DT node in the order of port numbers.
> > as shown below xHCI DT node.
> > So that all PHYs added to usb_phy_roothub are in order of port numbers.
> >   xhci1: usb@11000 {
> >                          compatible = "generic-xhci";
> >                          reg = <0x00011000 0x1000>;
> >                          interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> >                          phys = <&usb1_phy1>, <&usbphy2>, <&usb1_phy0>;
> >                          phy-names = "phy0", "phy1", "phy2";
> >                          dma-coherent;
> >                          status = "disabled";
> > };
> > But we have issue with HS PHYs, so that those PHYs are required to reset.
>
> This is very specific to your SOC.
> A quick grep shows most xhci controllers have one or two PHYs in total.
>
> The suggested usb_phy_roothub_port_reset() above will only work for your SOC.
Yes, and Cavium SOC also has similar issue need to reset PLL.
> I think it would be better to have a stingray specific quirk/workaround where you
> can find the right PHY to reset based on somthing like port number and PHY name.
>
The tricky part is we need to reset HS PHY after port disconnect so
that PORT to PHY translation is required.
We have two xHCI controllers in our SOC, one has two ports with two
PHYs (SS + HS) and other has three ports with three PHYs (SS + HS +
HS).
All HS PHYs have this issue, we need to reset HS PHYs after disconnect
of its corresponding port.
In existing framework all phy pointers are listed in primary hcd based
on index using "devm_of_phy_get_by_index" so can rely on index number
rather PHY name?
> For a generic solution we would need a better way to map usb ports to the PHY it uses.
Can I add phy pointer and its details in "struct xhci_port" structure
while initialization to get phy pointer from xhci_port?
>
Regards,
Srinath.



> -Mathias
