From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 01/11] dm: serial: Update binding for PL01x serial UART
Date: Mon, 10 Aug 2015 22:11:16 -0600
Message-ID: <CAPnjgZ2XdOPGMfAPHGy4c7vuc+exrirXkZ5DF+wHKGmAPg8ZjA@mail.gmail.com>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
 <1438954951-13329-2-git-send-email-sjg@chromium.org> <55C972BA.5050706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C972BA.5050706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

HI Stephen,

On 10 August 2015 at 21:57, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/07/2015 07:42 AM, Simon Glass wrote:
>> This binding differs from that of Linux. Update it and change existing
>> users.
>
> Is that meant to imply that this patch fixes the copy of the binding doc
> in U-Boot so it does match the kernel's copy?
>
>> Changes in v3:
>> - Rename binding file to pl01x.txt
>
> The file is named pl011.txt in the kernel. Shouldn't U-Boot's copy be
> named the same?

In the previous discussion a reviewed asked for this change, since it
covers both drivers.

>
>
>> diff --git a/arch/arm/dts/stv0991.dts b/arch/arm/dts/stv0991.dts
>
>>       uart0: serial@0x80406000 {
>>               compatible = "arm,pl011", "arm,primecell";
>>               reg = <0x80406000 0x1000>;
>> -             clock = <2700000>;
>> +             clock-frequency = <2700000>;
>
> I don't see either "clock" or "clock-frequency" mentioned in the Linux
> binding doc.

This was also discussed on the previous patch thread, and I thought
this was the outcome of the discussion.

>
>> diff --git a/doc/device-tree-bindings/serial/pl01x.txt b/doc/device-tree-bindings/serial/pl01x.txt
>
>>  Required properties:
>> -- compatible: must be "arm,primecell", "arm,pl011" or "arm,pl010"
>> +- compatible: must be "arm,primecell", "arm,pl011"
>
> It'd be worth mentioning which version of Linux this binding doc came
> from; that text has changed in linux-next since v4.1 which is what I
> assume you're importing.

OK
>
>> diff --git a/drivers/serial/serial_pl01x.c b/drivers/serial/serial_pl01x.c
>
>> @@ -365,13 +365,15 @@ static int pl01x_serial_ofdata_to_platdata(struct udevice *dev)
>>       struct pl01x_serial_platdata *plat = dev_get_platdata(dev);
>>       fdt_addr_t addr;
>>
>> -     addr = fdtdec_get_addr(gd->fdt_blob, dev->of_offset, "reg");
>> +     addr = dev_get_addr(dev);
>>       if (addr == FDT_ADDR_T_NONE)
>>               return -EINVAL;
>
> That looks like an unrelated change.

Yes, it is not needed in this patch.

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
