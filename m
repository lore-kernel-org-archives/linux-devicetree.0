From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [Question] DT-Bindings for run-time configurable bus?
Date: Fri, 4 Dec 2015 14:49:08 +0900
Message-ID: <CAK7LNAQc3KHJEGCpXEcN8XZvyvGa_BTAzeN4OHbuT8QRqg=dKQ@mail.gmail.com>
References: <CAK7LNATGi4isAaG0XS13ZnfFQKCxzaxeJvusSg3RYn7z29BF9A@mail.gmail.com>
	<9491984.N5sK0AKL2L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9491984.N5sK0AKL2L@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,



2015-12-01 20:29 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Tuesday 01 December 2015 13:30:25 Masahiro Yamada wrote:
>> Hello experts,
>>
>> I am tackling on a new bus driver, but I am worndering
>> what the DT-binding specification should be.
>>
>> Here is my hardware situation:
>>
>> My SoC has an external bus (it is called UniPhier System Bus).
>> This is a simple parallel bus with address, data,
>> chip-selects, and some other control signals.
>> It supports up to 8 chip-selects.
>>
>> Each CS address space can be mapped onto the CPU view,
>> and it must be configured run-time via the bus controller registers.
>>
>> Let's assume this situation:
>>
>>  - An ethernet device is connected at the offset address 0x01f00000 of CS1
>>  - A UART device is connected at the offset address 0x00200000 of CS5
>>
>>
>> A quick draft of device tree would be as follows:
>>
>>
>> amba {
>>      compatible = "simple-bus";
>>      #address-cells = <1>;
>>      #size-cells = <1>;
>>      ranges;
>>
>>      extbus {
>>            compatible = "socionext,uniphier-system-bus";
>>            reg = <0x58c00000 0x400>; /* registers of bus controller */
>>            #address-cells = <2>;
>>            #size-cells = <1>;
>>
>>            ethernet@1,01f00000 {
>>                  compatible = "smsc,lan9115";
>>                  reg = <1 0x01f00000 0x1000>;
>>                  interrupts = <0 48 4>
>>                  phy-mode = "mii";
>>            };
>>
>>            uart@5,00200000 {
>>                  compatible = "ns16550a";
>>                  reg = <5 0x00200000 0x20>;
>>                  interrupts = <0 49 4>
>>                  clock-frequency = <12288000>;
>>            };
>>      };
>> };
>>
>
> That looks reasonable.
>
>> Please note "ranges" property is missing from the extbus node.
>>
>> As mentioned above, the address translation from the external bus
>> to the parent bus is run-time configurable.
>>
>>
>> It is possible to map
>>   CS1 of extbus  to  0x40000000-0x41ffffff of CPU view
>>   CS5 of extbus  to  0x42000000-0x43ffffff of CPU view
>>
>> It is also possible to map
>>   CS1 of extbus  to  0x46000000-0x47ffffff of CPU view
>>   CS5 of extbus  to  0x44000000-0x45ffffff of CPU view
>>
>> There is nothing preventing us from a particular
>> address mapping.
>> It is completely up to the software (driver)
>> to choose one mapping from another.
>
> Ok.
>
>> And I notice a conflict between the followings.
>>
>> [1] Device Tree is a hardware description language.
>> It should not describe the software configuration.
>>
>> So, ranges such as
>>    ranges = <1 0 0x40000000 0x02000000
>>              5 0 0x42000000 0x02000000>;
>>
>>    or
>>
>>    ranges = <1 0 0x46000000 0x02000000
>>              5 0 0x44000000 0x02000000>;
>>
>> are configuration information, which should not be
>> included in the device tree.
>>
>> Any address mapping is OK as long as no region overlap occurs.
>> No point to specify "ranges" from the device tree.
>>
>>
>> [2] of_translate_address() expects "ranges" in every bus node
>>
>> When we need to translate the "reg" property into the CPU-viewed address,
>> we call of_translate_address().  It translates addresses,
>> parsing "ranges" property when crossing buses.
>> It potentially means, "ranges" properties are statically defined
>> in the device tree.
>>
>>
>> I have not been able to find a good way
>> to solve the conflict between [1] and [2].
>>
>>
>> To sum up, what I want is:
>>
>>  - Let the driver to configure the address translation on run-time
>>  - Once the bus is configured, I want the sub nodes to be accessed
>>    from the CPU, like the other statically instantiated devices.
>>
>>
>> Any comment is welcome!
>>
>>
>> BTW, perhaps Marvell Mbus has a similar situation (run-time configurable)?
>> (Documentation/devicetree/bindings/bus/mvebu-mbus.txt)
>> I am not familiar with such SoCs, though.
>
> Yes, this is the example I was thinking of. For mbus, we decided that
> doing the full dynamic reassignment of addresses is too bothersome
> for the OS, so the DT contains a "reasonable" default that the OS can
> use. This is also what we do for most PCI host controllers on embedded
> systems. They tend to have programmable translations, and the DT contains
> the settings that are known to work and that the driver uses to set up
> the I/O windows even if a lot of other settings would work just as
> well.
>
> A more traditional setup that we use on server-class machines is that
> the bootloader decides what the windows should be, sets them up and
> documents them in DT. The OS can still change them if it wants to,
> but it doesn't actually have to worry about the fact that those are
> programmable, or what registers are used for programming them.
>


Thanks,
I managed to submit v2.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
