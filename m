From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFCv2 usb-next 0/3] initialize (multiple) PHYs in xhci-plat
Date: Sat, 15 Jul 2017 14:11:13 +0200
Message-ID: <CAFBinCAw9yaaEO6Z9AdkBaPg9azGH4nqgdgoTir9U0eWZVu1DQ@mail.gmail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com> <1500111231.25536.18.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500111231.25536.18.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Jul 15, 2017 at 11:33 AM, Chunfeng Yun
<chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi Martin,
>
> On Thu, 2017-07-13 at 12:59 +0200, Martin Blumenstingl wrote:
>> This series is the outcome of a discussion with Felipe Balbi,
>> see [0] and [1].
>> The quick-summary of this is:
>> - dwc3 already takes one USB2 and one USB3 PHY and initializes these
>>   correct
>> - some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
>>   ohci-platform.c) do not have a limitation on the number of PHYs - they
>>   support one PHY per actual host port
>> - Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
>>   or three USB2 ports enabled on the internal root-hub. The SoCs also
>>   provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
>>   internally "connected" to the dwc3 roothub) need to be powered on,
>>   otherwise USB devices cannot be enumerated (even if just one PHY is
>>   disabled and if the device is plugged into another, enabled port)
>>
>> In my first attempt to get USB supported on the GXL and GXM SoCs I tried
>> to work-around the problem that I could not pass multiple PHYs to the
>> dwc3 controller.
>> This was rejected by Rob Herring (which was definitely the thing to do in
>> my opinion), see [2]
>>
>> This series adds a new "platform-roothub". This can be configured through
>> devicetree by passing a child-node with "reg = <0>" to the USB
>> controller. Additionally there has to be a child-node for each port on
>> the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
>> property. This allows modeling the root-hub in devicetree similar to the
>> USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
>> This avoids and backwards-compatibility problems (which was a concern
>> regardless of the solution, see [3]) since the binding for the root-hub
>> was previously not specified (and we're not using the "phys" property of
>> the controller, which might have served different purposes before,
>> depending on the drivers).
>>
>> Additionally this integrates the new platform-roothub into xhci-plat.c
>> which automatically enables it for the dwc3 driver (in host-mode).
>>
> How to handle the phy0(one u2phy and one u3phy) when port1 support
> dual-role mode? leave them to peripheral side as felipe suggested
> before? If so, no port1 node for roothub, is there any problem when
> change the port1 to host-only mode?
on Amlogic Meson GXL we have the following IP blocks:
- 2x USB2 PHYs, some external component has to tell them which mode
(host/device) they should operate in
- there is an additional (1x) USB3 PHY with built-in OTG detection logic

on Amlogic Meson GXL it could work like this:
USB2 and USB3 phy0 can be passed to the root-hub. Additionally the
USB2 phy0 could be passed to the USB3 PHY. The USB3 PHY would then
tell the USB2 PHY in which mode it should operate.

please note that device mode and OTG support on Amlogic Meson GXL is
more complicated, as it uses dwc2 and dwc3 controllers in combination:
- dwc3 is reponsible for host-only mode
- dwc2 is responsible for device-only mode
- OTG detection is done by the USB3 PHY

would you mind sharing a short overview of host/device/OTG support
works on Mediatek SoCs? I assume that the Amlogic Meson GXL
implementation is quite special, so comparing this with another
implementation (for example the Mediatek one) may help spotting
potential issues.

>>
>> Changes since RFCv1 at [4]:
>> - split the usb-xhci dt-binding documentation into a separate patch
>> - fixed a typo ("usb-phy" -> "phys" in the dt-binding example)
>> - rebased to apply against latest usb-next
>>
>>
>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001945.html
>> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001947.html
>> [2] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001818.html
>> [3] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001948.html
>> [4] http://marc.info/?l=linux-usb&m=148414866303604&w=2
>>
>>
>> Martin Blumenstingl (3):
>>   dt-bindings: usb: add the documentation for USB root-hub
>>   usb: host: add a generic platform USB roothub driver
>>   usb: host: xhci: plat: integrate the platform-roothub
>>
>>  .../devicetree/bindings/usb/usb-roothub.txt        |  46 +++++++
>>  Documentation/devicetree/bindings/usb/usb-xhci.txt |   7 +
>>  drivers/usb/host/Kconfig                           |   4 +
>>  drivers/usb/host/Makefile                          |   2 +
>>  drivers/usb/host/platform-roothub.c                | 146 +++++++++++++++++++++
>>  drivers/usb/host/platform-roothub.h                |  14 ++
>>  drivers/usb/host/xhci-plat.c                       |  27 +++-
>>  drivers/usb/host/xhci.h                            |   2 +
>>  8 files changed, 247 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt
>>  create mode 100644 drivers/usb/host/platform-roothub.c
>>  create mode 100644 drivers/usb/host/platform-roothub.h
>>
>
>


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
