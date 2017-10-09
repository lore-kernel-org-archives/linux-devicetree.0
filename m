From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4 2/3] usb: host: add a generic platform USB roothub
 driver
Date: Mon, 9 Oct 2017 16:43:08 +0300
Message-ID: <59DB7CEC.50006@linux.intel.com>
References: <20170903213829.6589-1-martin.blumenstingl@googlemail.com>
 <20170903213829.6589-3-martin.blumenstingl@googlemail.com>
 <59D4DC7E.6040003@linux.intel.com>
 <CAFBinCAerqdvhsTkLLd2t9W3d04F5wzQk5Zo2+h+HOHLdDeQZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCAerqdvhsTkLLd2t9W3d04F5wzQk5Zo2+h+HOHLdDeQZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07.10.2017 20:08, Martin Blumenstingl wrote:
> Hi Mathias,
>
> thank you for taking the time to go through my patch
>
> On Wed, Oct 4, 2017 at 3:05 PM, Mathias Nyman
> <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> On 04.09.2017 00:38, Martin Blumenstingl wrote:
>>>
>>> Many SoC platforms have separate devices for the USB PHY which are
>>> registered through the generic PHY framework. These PHYs have to be
>>> enabled to make the USB controller actually work. They also have to be
>>> disabled again on shutdown/suspend.
>>>
>>> Currently (at least) the following HCI platform drivers are using custom
>>> code to obtain all PHYs via devicetree for the roothub/controller and
>>> disable/enable them when required:
>>> - ehci-platform.c has ehci_platform_power_{on,off}
>>> - xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
>>> - ohci-platform.c has ohci_platform_power_{on,off}
>>>
>>> These drivers are not using the generic devicetree USB device bindings
>>> yet which were only introduced recently (documentation is available in
>>> devicetree/bindings/usb/usb-device.txt).
>>> With this new driver the usb2-phy and usb3-phy can be specified directly
>>> in the child-node of the corresponding port of the roothub via
>>> devicetree. This can be extended by not just parsing PHYs (some of the
>>> other drivers listed above are for example also parsing a list of clocks
>>> as well) when required.
>>
>>
>> usb_add_hcd() in usb/core/hcd.c is already finding, initializing and turning
>> on a phy, would it make sense to expand that one to support several phys
>> instead?
>>
>> xhci will add two hcd's one for USB2 and one for USB3
> that is a great suggestion - thank you for bringing this up!
> as a benefit we would add multiple PHY support for all the other
> use-cases I found (at least: ehci-platform.c, xhci-mtk.c,
> ohci-platform.c) - instead of just handling this in xhci-plat.c
>
> I have one quick question regarding usb/core/hcd.c:
> are hcd_bus_suspend() and hcd_bus_resume() the right places to
> power_{off,on} the PHYs during suspend?
> (currently usb/core/hcd.c doesn't touch the PHY during suspend/resume
> - xhci-mtk.c on the other hand seems to require it during a
> suspend/resume cycle)

I'm not sure what would be the correct place, hcd_bus_suspend() will be called
twice for xhci, oce for each hcd, so then we need to make sure we only turn off
phys related to that hcd. Host controller can still be running when bus is suspended.

xhci-mtk turns off phy when host controller is suspended and stopped.

>>
>>
>> So if the first 10 ports have the same phy, and 11th and 12th have an other
>> one, won't we end up
>> with a phy list with 12 entries for 2 phys, and initialize and turn on the
>> same first phy 10 times?
> indeed, we would call phy_init() and phy_power_on() multiple times on
> the same PHY.
> however, this is not an issue since the PHY framework is doing
> ref-counting for us (see [0] and [1] - the PHY driver's .init() and
> .power_on() callbacks will only be called once for each PHY in your
> scenario)

Ok

> do you see any other issues with this?
>

Not really, fine by me.

>> I'm also not sure I understand the reason for having the "usb3-phy" and
>> "usb2-phy" phy-names
>> for the ports if we anyways just add everything to one list.
> the PHY devicetree bindings state that the "phy-names" property is
> mandatory: [2]
>
> when moving the whole multiple PHY logic to usb_add_hcd() then it even
> makes sense to look for specific PHYs (imho):
> - let's assume we have a XHCI controller with two ports
> - both ports have a USB2 PHY, but only one has a USB3 PHY
> - (this basically describes the situation on the Amlogic Meson GXL
> SoCs, Mediatek uses similar designs)
>
> this would result in the following flow:
> 1. usb_add_hcd is called for the high-speed HCD
> 2. we would parse the PHYs for the high-speed HCD
> 3. usb_add_hcd is called for the super-speed HCD
> 4. we would parse the PHYs for the super-speed HCD
> depending on how we parse the PHYs (mapping the controller-type to
> phy-name "usb2-phy" or "usb3-phy") we either end up with:
> - 3 PHY handles (2x USB2, 1x USB3) if we take the
> controller-type/phy-name into account
> - 6 PHY handles (doubling the amount from the use-case above) if we don't
>
> please let me know if there is an easier solution - I prefer simple
> code myself, so I don't want to add complexity where it's not needed.

Ah, ok, I'm used to the ACPI tables way of listing ports where a physical USB3 connector
(HS & SS) is actually described as two separate ports. one HS and one SS.
With this layout one port can have only one PHY.

The Amlogic Meson GXL with two physical USB connectors (USB2&3 and USB2 only)
would look something like this in ACPI:

Device (RHUB) {
	...
	Device (HS01) {...}
	Device (HS02) {...}
	Device (SS01) {...}

xhci register layout is similar.
Each port has its own port status/control register.
Depending on if a USB2 or USB3 device is connected to a physical connector it will trigger
different port status registers.

Not sure which way is better.

-Mathias

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
