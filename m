From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] usb: host: add a generic platform USB roothub driver
Date: Fri, 13 Jan 2017 21:21:36 +0100
Message-ID: <CAFBinCBm7bj84HweMSjq+pC7iTKbWo0WBd7gNxWdObX9uygv-g@mail.gmail.com>
References: <20170111152947.27088-1-martin.blumenstingl@googlemail.com>
 <20170111152947.27088-2-martin.blumenstingl@googlemail.com> <20170113200850.6z3i3b762pkjwlcc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170113200850.6z3i3b762pkjwlcc@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Jan 13, 2017 at 9:08 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jan 11, 2017 at 04:29:46PM +0100, Martin Blumenstingl wrote:
>> Many SoC platforms have separate devices for the USB PHY which are
>> registered through the generic PHY framework. These PHYs have to be
>> enabled to make the USB controller actually work. They also have to be
>> disabled again on shutdown/suspend.
>>
>> Currently (at least) the following HCI platform drivers are using custom
>> code to obtain all PHYs via devicetree for the roothub/controller and
>> disable/enable them when required:
>> - ehci-platform.c has ehci_platform_power_{on,off}
>> - xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
>> - ohci-platform.c has ohci_platform_power_{on,off}
>>
>> These drivers are not using the generic devicetree USB device bindings
>> yet which were only introduced recently (documentation is available in
>> devicetree/bindings/usb/usb-device.txt).
>> With this new driver the usb2-phy and usb3-phy can be specified directly
>> in the child-node of the corresponding port of the roothub via
>> devicetree. This can be extended by not just parsing PHYs (some of the
>> other drivers listed above are for example also parsing a list of clocks
>> as well) when required.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/usb/usb-roothub.txt        |  41 ++++++
>>  drivers/usb/host/Kconfig                           |   3 +
>>  drivers/usb/host/Makefile                          |   2 +
>>  drivers/usb/host/platform-roothub.c                | 146 +++++++++++++++++++++
>>  drivers/usb/host/platform-roothub.h                |  14 ++
>>  5 files changed, 206 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt
>>  create mode 100644 drivers/usb/host/platform-roothub.c
>>  create mode 100644 drivers/usb/host/platform-roothub.h
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-roothub.txt b/Documentation/devicetree/bindings/usb/usb-roothub.txt
>> new file mode 100644
>> index 000000000000..96e152d3901c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/usb-roothub.txt
>> @@ -0,0 +1,41 @@
>> +Generic USB root-hub Properties
>> +
>> +similar to the USB device bindings (documented in usb-device.txt from the
>> +current directory) this provides support for configuring the root-hub.
>> +
>> +Required properties:
>> +- compatible: should be at least one of "usb1d6b,3", "usb1d6b,2"
>> +- reg: must be 0.
>> +- address-cells: must be 1
>> +- size-cells: must be 0
>
>> +- a sub-node per port supports the following properties:
>
> Make this another section with required and optional sections.
I can do that, but let's wait for the results if we want the PHYs to
be specified at the grand-child or child level

>> +  - reg: the port number on the root-hub (mandatory)
>> +  - phys: optional, from the *Generic PHY* bindings (mandatory needed when
>> +    phy-names is given)
>> +  - phy-names: optional, from the *Generic PHY* bindings; supported names
>> +    are "usb2-phy" or "usb3-phy"
>> +
>> +Example:
>> +     &usb1 {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             roothub@0 {
>> +                     compatible = "usb1d6b,3", "usb1d6b,2";
>
> Is this discoverable? IIRC, we had decided that ports on the root hub
> are just children of the USB controller node (rather than
> grandchildren). Why does that not work?
if I understand you correctly you are thinking of something like this:
&usb1 {
    ...cells...

    port@1 {
        reg = <1>;
        phys = <&phy2>
    }

    port@2 {
        reg = <2>;
        phys = <&phy2>
    }
}

in that case we need a way to differentiate between "actual device at
port 1" and "configuration for root-hub port 1".
in that example I also cannot specify a compatible string since I
don't know which device might be plugged into that port.

>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +                     reg = <0>;
>> +
>> +                     port@1 {
>
> Wouldn't this normally be 0 and 1. This should probably be usb-port
> rather than port to avoid OF graph overlap.
the USB subsystem starts counting at 1, there can never be a "device
with device-number 0" - so I think we should stay with 1 and 2 for a
2-port roothub.
I'm fine with changing the name to "usb-port" though

>> +                             reg = <1>;
>> +                             usb-phy = <&usb2_phy1>, <&usb3_phy1>;
>
> s/usb-phy/phys/
thanks for spotting this

>> +                             phy-names = "usb2-phy", "usb3-phy";
>> +                     };
>> +
>> +                     port@2 {
>> +                             reg = <2>;
>> +                             usb-phy = <&usb2_phy2>, <&usb3_phy2>;
>> +                             phy-names = "usb2-phy", "usb3-phy";
>> +                     };
>> +             };
>> +     }
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
