From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFCv2 usb-next 0/3] initialize (multiple) PHYs in xhci-plat
Date: Mon, 17 Jul 2017 11:27:22 +0200
Message-ID: <CAFBinCA8o0DzExJOKdh_7zmfJhLwu_hsAHp_POyNO7-ifdPUqQ@mail.gmail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
 <1500111231.25536.18.camel@mhfsdcap03> <CAFBinCAw9yaaEO6Z9AdkBaPg9azGH4nqgdgoTir9U0eWZVu1DQ@mail.gmail.com>
 <1500276067.25536.58.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500276067.25536.58.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jul 17, 2017 at 9:21 AM, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi,
> On Sat, 2017-07-15 at 14:11 +0200, Martin Blumenstingl wrote:
>> Hi,
>>
>> On Sat, Jul 15, 2017 at 11:33 AM, Chunfeng Yun
>> <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> > Hi Martin,
>> >
>> > On Thu, 2017-07-13 at 12:59 +0200, Martin Blumenstingl wrote:
>> >> This series is the outcome of a discussion with Felipe Balbi,
>> >> see [0] and [1].
>> >> The quick-summary of this is:
>> >> - dwc3 already takes one USB2 and one USB3 PHY and initializes these
>> >>   correct
>> >> - some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
>> >>   ohci-platform.c) do not have a limitation on the number of PHYs - they
>> >>   support one PHY per actual host port
>> >> - Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
>> >>   or three USB2 ports enabled on the internal root-hub. The SoCs also
>> >>   provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
>> >>   internally "connected" to the dwc3 roothub) need to be powered on,
>> >>   otherwise USB devices cannot be enumerated (even if just one PHY is
>> >>   disabled and if the device is plugged into another, enabled port)
>> >>
>> >> In my first attempt to get USB supported on the GXL and GXM SoCs I tried
>> >> to work-around the problem that I could not pass multiple PHYs to the
>> >> dwc3 controller.
>> >> This was rejected by Rob Herring (which was definitely the thing to do in
>> >> my opinion), see [2]
>> >>
>> >> This series adds a new "platform-roothub". This can be configured through
>> >> devicetree by passing a child-node with "reg = <0>" to the USB
>> >> controller. Additionally there has to be a child-node for each port on
>> >> the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
>> >> property. This allows modeling the root-hub in devicetree similar to the
>> >> USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
>> >> This avoids and backwards-compatibility problems (which was a concern
>> >> regardless of the solution, see [3]) since the binding for the root-hub
>> >> was previously not specified (and we're not using the "phys" property of
>> >> the controller, which might have served different purposes before,
>> >> depending on the drivers).
>> >>
>> >> Additionally this integrates the new platform-roothub into xhci-plat.c
>> >> which automatically enables it for the dwc3 driver (in host-mode).
>> >>
>> > How to handle the phy0(one u2phy and one u3phy) when port1 support
>> > dual-role mode? leave them to peripheral side as felipe suggested
>> > before? If so, no port1 node for roothub, is there any problem when
>> > change the port1 to host-only mode?
>> on Amlogic Meson GXL we have the following IP blocks:
>> - 2x USB2 PHYs, some external component has to tell them which mode
>> (host/device) they should operate in
>> - there is an additional (1x) USB3 PHY with built-in OTG detection logic
>>
>> on Amlogic Meson GXL it could work like this:
>> USB2 and USB3 phy0 can be passed to the root-hub. Additionally the
>> USB2 phy0 could be passed to the USB3 PHY. The USB3 PHY would then
>> tell the USB2 PHY in which mode it should operate.
>>
>> please note that device mode and OTG support on Amlogic Meson GXL is
>> more complicated, as it uses dwc2 and dwc3 controllers in combination:
>> - dwc3 is reponsible for host-only mode
>> - dwc2 is responsible for device-only mode
>> - OTG detection is done by the USB3 PHY
>>
>> would you mind sharing a short overview of host/device/OTG support
>> works on Mediatek SoCs? I assume that the Amlogic Meson GXL
>> implementation is quite special, so comparing this with another
>> implementation (for example the Mediatek one) may help spotting
>> potential issues.
>>
> MTK's mtu3 IP supports at most 5x USB2 phys and 4x USB3 phys. They work
> as following:
thank you for sharing this!

> 1. device mode works as HS only:
>
> u2phy0 --- dual-role/OTG
>
> u2phy1 ---|
>           +  U3 host-only
> u3phy0 ---|
>
> ...
> u2phy4 ---|
>           +  U3 host-only
> u3phy3 ---|
> (e.g. MT8173 supports 2x u2phys and 1x u3phy, u2phy0 can work as
> dual-role mode, u2phy1 & u3phy0 are host-only)
>
> 2. device mode works as HS & SS, or host only:
>
> u2phy0 ---|
>           + dual-role or host-only
> u3phy0 ---|
>
> ...
> u2phy3 ---|
>           + U3 host-only
> u3phy3 ---|
>
> u2phy4 --- U2 host-only
> (e.g. on MT2701, u2phy0 and u3phy0 work as host-only mode)
OK, so in both cases only one port (with one u2phy and one u3phy) is
dual-role capable

> mtu3 driver supports host-only, device-only and dual-role mode(use IDDIG
> pin), and will take all phys it needed, include host-only phys;
> But if just host-only mode is supported, we can skip mtu3 driver and
> make use of xhci-mtk driver directly, then xhci-mtk will take all phys.
I see, in your example it's the mtu3
(Documentation/devicetree/bindings/usb/mt8173-mtu3.txt) which does the
mode switching. I assume that you're doing the host/device mode
switching through the extcon phandle (for example together with the
extcon-usb-gpio driver).

in you example: can't we *always* describe the roothub via devicetree
(just like in my example: [0])?
this means that (as you already mentioned) USB host-only support is now covered.
to handle dual-role (host/device switching) we now need to pass the
dual-role capable PHYs to whatever IP can detect the mode it should
operate in (in your case: mtu3, in Amlogic's case: the u3phy with
built-in mode detection logic -> the driver for this IP block should
call phy_set_mode(phy, PHY_MODE_USB_{HOST,DEVICE,OTG} accordingly).
here's a skeleton (stripped-down) of how the .dts could look like:
mtu3: usb@11271000 {
    compatible = "mediatek,mt8173-mtu3";
...
    /* MT2701 = 2nd example, for MT8173 = 1st example we would skip
the u3phy0 */
    /* only list the dual role capable PHYs here */
    phys = <&u3phy0>, <&u2phy0>;
    phy-names = "usb3-phy", "usb2-phy";

    usb_host: xhci@11270000 {
        compatible = "mediatek,mt8173-xhci";
        ...
        roothub@0 {
            /* includes all PHYs, including the dual role capable ones */
        };
    };
};

do you think that this would work for the Mediatek SoCs?
I've seen that the phy-mt65xx-usb3.c PHY driver does not have any
.set_mode callback - I assume it's simply because it doesn't need it
(as this is either managed by the hardware/IP block internally, or
through some firmware/mailbox mechanism).


Regards,
Mart

[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004305.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
