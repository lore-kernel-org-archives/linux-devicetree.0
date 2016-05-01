From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] gpio: of: make it possible to name GPIO lines
Date: Sun, 1 May 2016 10:56:57 +0200
Message-ID: <CACRpkdbBah92TcAEquSL1HR4CdHx94MwdhBCcgu=p3-EUoHoTg@mail.gmail.com>
References: <1461236901-28626-1-git-send-email-linus.walleij@linaro.org>
	<1595634.pn7WvaDMTh@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595634.pn7WvaDMTh@adelgunde>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Lee Campbell <leecam-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Bamvor Jian Zhang <bamvor.zhangjian-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Mandala <david.mandala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 10:12 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Thursday 21 April 2016 13:08:21 Linus Walleij wrote:

>> +Optionally, a GPIO controller may have a "gpio-line-names" property. This is
>> +an array of strings defining the names of the GPIO lines going out of the
>> +GPIO controller. This name should be the most meaningful producer name
>> +for the system, such as a rail name indicating the usage. Package names
>> +such as pin name are discouraged: such lines have opaque names (since they
>> +are by definition generic purpose) and such names are usually not very
>> +helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
>> +reasonable line names as they describe what the line is used for. "GPIO0"
>> +is not a good name to give to a GPIO line. Placeholders are discouraged:
>
> "GPIO0" may not be a good name, but there are plenty of boards out there
> that use just this line name in their schematic for GPIOs that are not
> used otherwise. For example the riotboard has line-names "GPIO_1",
> "GPIO4_31", "GPIO5_05", ...

That is what is referred to as "rail name" above. If they really choose
that name on a schematic, then it is the right name for it.

>> +     gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
>> +             "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
>> +             "Row A", "Row B", "Row C", "Row D", "NMI button",
>> +             "poweroff", "reset";
>
> As many GPIO controllers have something like 32 GPIO lines, it can be
> difficult to read which GPIO number the line "reset" is on.
> But I think you can get around that by writing one name per file-line or
> something similar. Also it should be immediately visible by listing all
> gpio names in the userspace.

Yeah well, the problem goes for clk-output-names that it's derived
from as well, it comes from the DT syntactic limitations.

>> +             /* Empty strings are OK */
>> +             if (ret < 0 && ret != -ENODATA)
>> +                     dev_err(&gdev->dev, "unable to name line %d\n",
>> +                             i);
>> +     }
>
> Maybe a warning for nstrings > ngpio here?

Sure. Just waiting for DT maintainers and other stakeholders' input at
this point.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
