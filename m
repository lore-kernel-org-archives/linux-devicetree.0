From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: "Generic" MMIO ADC
Date: Thu, 6 Jul 2017 23:37:04 +0200
Message-ID: <CACRpkdaZ=qSbdVxgw4DH_tOeZb0pZBYhhJJOozFn2pn25F_Kag@mail.gmail.com>
References: <b60def9a-45dc-bf97-e059-abbe105648b2@topic.nl>
 <20170630145319.20ec3696@jic23.retrosnub.co.uk> <b9dc2313-53da-1566-c0e8-ac18599f59da@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b9dc2313-53da-1566-c0e8-ac18599f59da-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 3, 2017 at 2:37 PM, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org> wrote:

> I was thinking along these lines:
>
> ... {
>    compatible = "iio-adc-generic-mmio";
>    reg = <0x43210000 4096>;
>    interrupt = <&gic 42 0>;
>    iio,start-sequence = <0x0 0x3> <0x4 0xff>;
>    iio,stop-sequence = <0x0 0x0>;

Nope. We are not going to invent scripting languages inside device tree.
No sequences please. This is the start of what we call a jam table.

We had this discussion a long time ago when starting to convert all the ARM
platforms to device tree: sequences should be expressed in code, not in
the device tree. Because next thing that happens is that you want to encode
a for() loop or if() or while().

The reason is that device tree is already part of open firmware, which already
has a scripting language: FCode (based on forth). This is then used to create
BIOS routines along the lines of what you're suggesting. So if you insist on
writing a BIOS, by all means write a BIOS, but not inside DT, use FCode
and figure out how to bridge that.

But I think it's easier to just write a normal driver really.

Compare to ACPI, which has AML, for the very same purpose, and DSDT
for describing the hardware.

Since ACPI is now starting to share parts of the DT bindings), things would
get very weird if we did things like this. Should they also implement a
compatible interpreter, rather than call their (very much in-use) AML
snippets?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
