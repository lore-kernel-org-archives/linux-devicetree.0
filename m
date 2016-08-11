From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings
Date: Thu, 11 Aug 2016 15:54:53 +0200
Message-ID: <08a9662d-d021-335f-27b5-0e1968954289@gmail.com>
References: <1470225957-5692-1-git-send-email-noltari@gmail.com>
 <CACRpkdYfApcW6M1DV4tKiBuX18eAbjWAJB-1K_-dUYx=T1xT4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYfApcW6M1DV4tKiBuX18eAbjWAJB-1K_-dUYx=T1xT4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

El 11/08/2016 a las 13:45, Linus Walleij escribió:
> All devicetree binding patches must be sent to the devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> mailing list so include them on subsequent posts of this patch.
> 
> On Wed, Aug 3, 2016 at 2:05 PM, Álvaro Fernández Rojas
> <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> This patch adds the device tree bindings for the Broadcom's BCM6345
>> memory-mapped GPIO controllers.
>>
>> The gpios will be supported by gpio-mmio code of the
>> GPIO generic library.
>>
>> Signed-off-by: Álvaro Fernández Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  v2: add improvements suggested by Jonas Gorski:
>>   - use native-endian instead of big-endian.
> 
> What is this? Does it come from some other existing binding?
> I was feeling native endian is the default unless LE or BE is
> explicitly specified...
Not really, even if the kernel is configured as big endian, either native-endian or big-endian are needed.
The default is little-endian if nothing else is specified:
https://github.com/torvalds/linux/blob/master/drivers/of/base.c#L598

> 
>> +Required properties:
>> +       - compatible: should be "brcm,bcm6345-gpio"
>> +       - reg-names: must contain
>> +               "dat" - data register
>> +               "dirout" - direction (output) register
> 
> I don't like this and don't understand why you can't just cover
> all GPIO registers with a single reg property.
Because we want to add a simple gpio driver for these old SoCs with the newer ones having a different and more complex gpio/pinctrl driver.

> 
>> +       - reg: address + size pairs describing the GPIO register sets;
>> +               order must correspond with the order of entries in reg-names
>> +       - #gpio-cells: must be set to 2. The first cell is the pin number and
>> +                       the second cell is used to specify the gpio polarity:
>> +                       0 = active high
>> +                       1 = active low
>> +       - gpio-controller: Marks the device node as a gpio controller.
> 
> Reference the standard bindings in gpio.txt for cells and controller.
Sure, I just copy & pasted this from the other gpio mmio driver:
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpio/wd%2Cmbl-gpio.txt#L17

> 
>> +Optional properties:
>> +       - native-endian: use native endian memory.
> 
> That is weird. Explain why this is needed.
(explained above)

> 
>> +       - BCM6345:
>> +       gpio: gpio-controller@fffe0406 {
>> +               compatible = "brcm,bcm6345-gpio";
>> +               reg-names = "dirout", "dat";
>> +               reg = <0xfffe0406 2>, <0xfffe040a 2>;
> 
> Also I do not understand this at all. Why pick out two 16bit registers?
> Surely the rest of the registers at 0xfffe0400 must be GPIO registers
> as well? Are they not?
This is the layout for BCM6345:
https://gitlab.labs.nic.cz/turris/openwrt/blob/8bfda76892a39c033b5abf2c17035a444fffad08/target/linux/brcm63xx-2.6/files/include/asm-mips/mach-bcm963xx/6345_map_part.h#L141
And this is the layout for BCM6338:
https://gitlab.labs.nic.cz/turris/openwrt/blob/8bfda76892a39c033b5abf2c17035a444fffad08/target/linux/brcm63xx-2.6/files/include/asm-mips/mach-bcm963xx/6338_map_part.h#L202

> 
> If they are, cover them all with a single reg property.
> 
> If they are not all GPIO registers, use MFD syscon for this and access
> the constituent parts through that.
I don't think that's the case since we're using a generic mmio binding.

> 
> Yours,
> Linus Walleij
> 

Regards,
Álvaro.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
