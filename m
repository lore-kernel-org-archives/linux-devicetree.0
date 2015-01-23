From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl: Broadcom Cygnus pinctrl device tree binding
Date: Thu, 22 Jan 2015 18:14:55 -0800
Message-ID: <54C1AE9F.3020407@broadcom.com>
References: <rjui@broadcom.com>	<1417131990-17954-1-git-send-email-rjui@broadcom.com>	<1417131990-17954-2-git-send-email-rjui@broadcom.com>	<CACRpkdb5pNMbXmWGjrGpAYNLLwv6pWWOJQy0C6BLetNcStFM6A@mail.gmail.com>	<54B01D44.5080601@broadcom.com> <CACRpkdbW5P=w0CPYYf_gfBuD7W0WOdAYCKpTXM5MsK9mdYDc5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbW5P=w0CPYYf_gfBuD7W0WOdAYCKpTXM5MsK9mdYDc5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 1/13/2015 12:20 AM, Linus Walleij wrote:
> On Fri, Jan 9, 2015 at 7:26 PM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> On 1/9/2015 2:12 AM, Linus Walleij wrote:
> 
>>> Just use "groups" and "function" and refer to
>>> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>>>
>>> Then "alt1", "alt2" etc are non-functional names of functions.
>>> Use the real function names, like "spi0" or so. This
>>> alt-business seems to be just a shortcut to make it
>>> simple, don't do that.
>>>
>>> Then you use e.g. "spi0" as a group name. I prefer you
>>> call that "spi0_grp" or something to say it is a group of
>>> pins associated with spi0, as spi0 is actually the
>>> function.
>>>
>> Hmmm, I did this by following brcm,bcm11351-pinctrl.txt:
>> - function: String. Specifies the pin mux selection. Values must be one
>> of: "alt1", "alt2", "alt3", "alt4"
>>
>> But you are right, in the pinctrl binding document it describes the
>> generic pin multiplexing nodes use "function" and "group".
> 
> Note "function" and "groups". Note groups is pluralis. You can
> select multiple groups for a single function.
> 
>> For example, the group "lcd" covers 30 pins. When I configure "lcd" to
>> alternate function 1, all 30 pins are muxed to LCD function. When
>> configured to function 2, all pins are muxed to SRAM function. Now, here
>> comes the issue, when configured to function 3, pins 1-15 and 20-30
>> become GPIO function, but pins 16-19 becomes SPI5 function. When it's
>> configured to function 4, all 30 pins become GPIO.
> 
> I would split the use case in two groups for LCD and SRAM,
> and three groups for GPIO:
> "lcd_grp", "sram_grp", "gpio-1-15_grp",
> "gpio-16-19_grp", "gpio-20-30_grp", "spi5_grp"
> 
> Valid combinations become
> 
> function = "lcd"
> groups = "lcd_grp";
> 
> function = "sram"
> groups = "sram_grp"
> 
> For all GPIO only this:
> 
> function = "gpio"
> groups = "gpio-1-16_grp", "gpio-16-19_grp", "gpio-20-30_grp"
> 
> For a combined GPIO+SPI:
> 
> function = "gpio"
> groups = "gpio-1-16_grp", "gpio-20-30_grp"
> 
> function = "spi5"
> groups = "spi5_grp"
> 
> The pinctrl runtile will protest if you try to combine spi5_grp
> with gpio-16-19_grp.
> 
>> In some other cases, when I configure a group to other functions, there
>> could be spare pins which become unused (not brought out to the pad).
>> Or, the spare pins may also become a separate function.
> 
> That's cool.
> 
>> Based on the LCD example, I'd assume I would do the following for the
>> default LCD function:
>>
>> lcd_node {
>>         group = "lcd_grp";
>>         function = "lcd";
>> };
>>
>> And in the case of function 3, I would call the function "spi5" and
>> assume the rest of pins become either GPIO (or unused)?
>>
>> spi5_node {
>>         group = "lcd_grp";
>>         function = "spi5";
>> };
> 
> Looks cool per above.
> 
> You need some clever code in the driver to handle double-configuration
> of registers and so on, but I think it can be done.
> 
> Using pin control as a GPIO backend can be a bit tricky and will need
> some testing and elaboration, but the subsystem will block collisions.
> 
> Yours,
> Linus Walleij
> 

Hi Linus,

I have another question here. In the B0 revision of our Cygnus chip, the
ASIC team added a feature to allow individual pins to be muxed to GPIO.
The pinmux controller can still only do group-based muxing in general,
but at the same time, you can override most (but not all) individual
pins to GPIO.

I believe this HW design actually forces us to mix use "groups" and
"pins" in DT.

For example, assuming we mux pins 1 - 10 as MMC (one cmd line, one clk
line, and 8 data lines). One might make the decision that he only needs
4 data lines instead of 8 data lines, and he wants to free up the 4 data
lines and uses as GPIO. Based on this example, is the following DT
configuration valid?

sd_node {
    function = "sd";
    groups = "sd_grps";
};

gpio_node {
    function = "gpio";
    pins = "gpio_7", "gpio_8", "gpio_9", "gpio_10"; /* assuming 1:1
mapping between gpio and pin number to make this example simple */
};

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
