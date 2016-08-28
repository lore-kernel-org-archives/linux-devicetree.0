From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v5 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Sun, 28 Aug 2016 22:51:54 +0200
Message-ID: <CAFBinCAj0gFnKkqBrmUxCwXjsv6NY4KuWGRA4_mnXjq_boYx8w@mail.gmail.com>
References: <20160709232834.31654-1-martin.blumenstingl@googlemail.com>
 <20160821143105.27487-1-martin.blumenstingl@googlemail.com>
 <20160821143105.27487-2-martin.blumenstingl@googlemail.com> <2913835.hr5kg63Vcv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2913835.hr5kg63Vcv@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 11:08 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday, August 21, 2016 4:31:03 PM CEST Martin Blumenstingl wrote:
>> +pci {
>> +       pcie@0 {
>> +               reg = <0 0 0 0 0>;
>
> It's not clear what these two nodes refer to in the example. Is the top-level
> node the PCI host bridge, and the second node the first PCIe port?
>
> Maybe add the properties from a real system here to make this a little
> clearer.
>
> The unit address for the slot should be "00,0", not "0" here.
good point - I'll skip the part where I am describing the bridge as
well and keep it simple.

>> +               ath9k@0,0 {
>
> According to the PCI binding, the name should be the same as the
> compatible string here, or match the class code in the table.
The original example was from an actual system (where an ath9k is
connected to the PCIe bug). Unfortunately the PCIe driver contains
some hacks, so I'm not sure if these values serve as a good example.
Thus I took an example from a device where the ath9k chip is connected
via PCI (no "express" - found in sysfs at:
/sys/bus/pci/devices/0000:00:0e.0):
&pci0 {
    ath9k@168c,002d {
        compatible = "pci168c,002d";
        reg = <0x7000 0 0 0 0>;
        qca,disable-5ghz;
    };
};

>> +                       compatible = "pci168c,0030";
>> +                       reg = <0 0 0 0 0>;
>
> Are the device/fn numbers all zero on your system? This is a bit
> confusing, as it's not immediately clear what the reg properties
> refers to. Also, I think the length should reflect the actual length
> of the config space, either 0x100 or 0x1000.
The first issue is solved with the updated example (see above).
Where would the size go (is it the second-last or last value)?


Thanks for your patience!
Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
