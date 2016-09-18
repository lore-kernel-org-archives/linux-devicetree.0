From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Sun, 18 Sep 2016 21:56:57 +0200
Message-ID: <CAFBinCC5fhbtkNdc6MJs7veD+xVGC6Qb-jgX_pwvraP1x2JrhQ@mail.gmail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 <m260q6jibf.fsf@baylibre.com> <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
 <e3b1f611-d6f6-c98b-a53b-98e94ef5bd96@codethink.co.uk> <m2eg4ui0nl.fsf@baylibre.com>
 <ffdd0188-72bc-4575-f997-e8547f4c31d2@codethink.co.uk> <CAFBinCC4gkMrJtertYevg_hXDLJEZ0PqfKKLL5UKXo8B=SXsPw@mail.gmail.com>
 <m2sht9gkau.fsf@baylibre.com> <CAFBinCCDDwydB+RP0CZKoAW5Suxotn224ZFVWvt2OGW3gNJR1g@mail.gmail.com>
 <57DBAB2F.3040905@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57DBAB2F.3040905-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Fri, Sep 16, 2016 at 10:19 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Friday 09 September 2016 09:44 PM, Martin Blumenstingl wrote:
>> On Fri, Sep 9, 2016 at 5:33 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>> However, the problem with all of the solutions proposed (runtime PM ones
>>> included) is that we're forcing a board-specific design issue (2 devices
>>> sharing a reset line) into a driver that should not have any
>>> board-specific assumptions in it.
>>>
>>> For example, if this driver is used on another platform where different
>>> PHYs have different reset lines, then one of them (the unlucky one who
>>> is not probed first) will never get reset.  So any form of per-device
>>> ref-counting is not a portable solution.
>> maybe we should also consider Ben's solution: he played with the USB
>> PHY on his Meson8b board. His approach was to have only one USB PHY
>> driver instance which exposes two PHYs.
>> The downside of this: the driver would have to know the offset of the
>> PHYs (0x0 for the first PHY, 0x20 for the second), but we could handle
>> the reset using runtime PM without any hacks.
>
> I think the offset information can come from the devicetree too. The phy can be
> modeled something like below.
>
>                 usb-phys@c0000000 {
>                         compatible = "amlogic,meson-gxbb-usb2-phy";
>                         reg = <0x0 0xc0000000 0x0 0x40>;
>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x40>;
>                         resets = <&reset 34>;
>
>                         usb0_phy: usb_phy@0 {
>                                 #phy-cells = <0>;
>                                 reg = <0x0 0x0 0x0 0x20>;
>                                 clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;
>                                 clock-names = "usb_general", "usb";
>                                 status = "disabled";
>                         };
>
>                         usb1_phy: usb_phy@20 {
>                                 #phy-cells = <0>;
>                                 reg = <0x0 0x20 0x0 0x20>;
>                                 clocks = <&clkc CLKID_USB &clkc CLKID_USB1>;
>                                 clock-names = "usb_general", "usb";
>                                 status = "disabled";
>                         };
>                 };
>
> This way the driver will be probed only once (the reset can be done during
> probe). The phy driver should scan the dt node and for every sub-node it
> invokes phy_create?
I'll recap what we have discussed so far (so you don't have to re-read
the whole thread):
The reference driver treats both USB PHYs as separate devices (the
datasheet has no information about the PHYs though). The only
"special" thing is the shared reset line -> together with Philipp
Zabel (the reset framework maintainer) we decided to make
reset_control_reset work for shared reset lines.

That means we can keep the two PHYs as separate devices inside the
.dts, while keeping everything else separate (just like the reference
driver)
Is this fine for you and Arnd?


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
