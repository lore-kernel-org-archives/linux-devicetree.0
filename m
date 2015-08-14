From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Fri, 14 Aug 2015 09:43:22 +0200
Message-ID: <CAMuHMdX81zTEgnsNru8wa=q=6UEAby9cbGJcVMXgyqoqgQSK1A@mail.gmail.com>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
	<1438954951-13329-2-git-send-email-sjg@chromium.org>
	<CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
	<CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
	<55CCBFB2.7050301@wwwdotorg.org>
	<20150813181346.GS25532@bill-the-cat>
	<1439492679.242.35.camel@freebsd.org>
	<55CCF20C.9000104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55CCF20C.9000104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 13, 2015 at 9:37 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/13/2015 01:04 PM, Ian Lepore wrote:
>> As the FreeBSD person who got our first SoC (imx6, only partially
>> supported) converted to use the Linux DT files rather than our own
>> homebrew mess we started with, I would say that my opinion of the
>> existing DT information is that it is an extension of Linux device
>> drivers written in a different language.
>>
>> The information available is in no way independent of the Linux device
>> drivers, it is exactly the information those drivers need.  It is often
>> not the information needed in another OS with independently written
>> drivers.  And especially it is not ordered and structured in a way that
>> works well with the device enumeration and instantiation models used by
>> another OS.
>>
>> A great case in point would be i2c eeproms.  What a perfect opportunity
>> DT would be to describe everything about the eeprom parts (total
>> capacity, page read/write size, whether the page address bits extend
>> into the bus-slave address bits, etc).  It seems to me that anything
                                    ^^^
This is the important "etc" below.

>> claiming to be an independent description of the hardware would have to
>> include such things.  Instead, all the bindings define is the compatible
>> string.  That's crazy.  Why?  Well, when I went and looked at the Linux
>> eeprom drivers it became clear why:  that's all they need to know,
>> because everything else is hard-coded in tables in the driver source.
>>
>> So if I want to write a FreeBSD i2c eeprom driver that uses DT data,
>> what are my choices?  I have exactly one:  make my driver essentially a
>> clone of the Linux driver, with all the same data hard-coded in source.
>>
>> All in all, it's not impossible for another OS to work with the DT
>> information that begins its life in Linux, but it's not really easy.
>
> In fairness, that's got nothing to do with Linux, but it's a general
> decision re: the level of detail to put into DT. There's always a discussion
> about which level of detail to represent in DT when new bindings are
> created.
>
> The type of an I2C device completely defines all of its properties; the
> model name/... is enough to fully describe its behaviour. That's a good
> reason to put just that information into DT, to avoid redundancy.
>
> In some cases, bindings have tended towards placing just the compatible
> value into the DT (e.g. your example). This does require drivers to be able
> to look up that information from the compatible value.
>
> That case tends to be more common since what's really important about DT is
> cleanly representing the resource interactions between devices; let the
> drivers know all the details of the device's internals, and let DT describe
> any point where the device/driver has to interact with the system or other
> devices/drivers around it.

Exactly.

The important part in your i2c eeprom example is the "etc".
Suppose you use a generic compatible value, and lots of properties to
describe the device.

Over time, when adding support for new devices with new features, you will
add new properties. No problem, you can assume default values if a property
is missing.
One day, when adding new features, you will discover a slight difference in
behavior between two different i2c eeproms that were described the same before.
Oops.

P.S. I'd ike to point people to my presentation "Engaging Device Trees" at
     ELC2014 (http://elinux.org/File:Engaging_Device_Trees_0.pdf).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
