From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v6 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Fri, 9 Sep 2016 22:57:06 +0200
Message-ID: <CAFBinCAOQmk3KY1b+D1iKAOEBfasYyei681cae4PbD+201mzbQ@mail.gmail.com>
References: <20160821143105.27487-1-martin.blumenstingl@googlemail.com>
 <20160906214623.20424-1-martin.blumenstingl@googlemail.com>
 <20160906214623.20424-2-martin.blumenstingl@googlemail.com> <3b93ec95-ec7c-863a-06b7-fab4f2688855@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3b93ec95-ec7c-863a-06b7-fab4f2688855-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 9:48 AM, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org> wrote:
>> +Optional properties:
>> +- reg: Address and length of the register set for the device.
>> +- qca,clk-25mhz: Defines that a 25MHz clock is used
>
> Some SoCs even Atheros WiSoCs use WiFi clock for System Clock. In this
> case we need to use clock framework any way, so why not in this case too?
> Provide dummy static clock in DT and connect it with this node?
>
>         osc25m: oscillator {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 clock-frequency = <25000000>;
>                 clock-accuracy = <30000>;
>         };
>
>         acc: clock-controller@80040000 {
>                 compatible = "some-clock-controller";
>                 #clock-cells = <1>;
>                 clocks = <&osc25m>;
>                 reg = <0x80040000 0x204>;
>         };
>
>
> &pci0 {
>         ath9k@168c,002d {
>                 compatible = "pci168c,002d";
>                 reg = <0x7000 0 0 0 0x1000>;
>                 clocks = <&osc25m>;
>                 qca,disable-5ghz;
>         };
> };
>
>
> driver will need to use clk_get and compare frequency instead of
> of_property_read_bool(np, "qca,clk-25mhz"). In this case you will need
> to define source clock only one time and reuse it by all affected DT
> nodes. If we have 40MHz clock you will only need to change it in
> fixed-clock.
that does sound like a good idea, thanks for that input!
However, I will remove the property for the first version because I am
trying to get PCI(e) devices supported. OF support for AHB (WiSoC)
needs more work (in other places, like ahb.c) anyways.
But this suggestion should be remembered!

>> +- qca,no-eeprom: Indicates that there is no physical EEPROM connected to the
>> +                     ath9k wireless chip (in this case the calibration /
>> +                     EEPROM data will be loaded from userspace using the
>> +                     kernel firmware loader).
>> +- qca,disable-2ghz: Overrides the settings from the EEPROM and disables the
>> +                     2.4GHz band. Setting this property is only needed
>> +                     when the RF circuit does not support the 2.4GHz band
>> +                     while it is enabled nevertheless in the EEPROM.
>> +- qca,disable-5ghz: Overrides the settings from the EEPROM and disables the
>> +                     5GHz band. Setting this property is only needed when
>> +                     the RF circuit does not support the 5GHz band while
>> +                     it is enabled nevertheless in the EEPROM.
>
> This option can be reused for every WiFi controller. Not only for qca.
> So may be instead of adding vendor specific name, make it reusable for
> all vendors. Instead of qca,disable-5ghz and qca,disable-2ghz make
> disable-5ghz and disable-2ghz?
I am personally fine with anything that fits best into the grand
scheme of things.
There are three scenarios I can think of which may be influenced by
devicetree configuration:
a) let the driver decide automatically whether the 2.4GHz and/or 5GHz
band is/are enabled
b) explicitly disable either bands (because the driver thinks due to
whatever reason that a band is supported while in reality it isn't)
c) explicitly enable a band (for example because the driver cannot
automagically detect which band should be enabled)

for ath9k we default to a) but also allow b): the EEPROM (device
specific calibration data) contains information about which bands are
enabled (or not). But some manufacturers are shipping devices for
example with the 5G band enabled, while the actual hardware doesn't
support it.

Felix' mt76 driver for example defaults to case a) but allows
overriding (= forcefully enabling or disabling) a specific band.

If we decide how this should look like in the devicetree then I can go
ahead and implement it accordingly.


Regards,
Martin


[0] https://github.com/openwrt/mt76/blob/master/eeprom.c#L79
