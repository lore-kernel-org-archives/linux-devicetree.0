From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT include files
Date: Mon, 13 Jan 2014 00:16:10 +0100
Message-ID: <CACRpkdYPrso7KSfWPhZC6chA4z=+YSjKb_SCLx4B-aMmYZYb4A@mail.gmail.com>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
	<201401111415.29395.arnd@arndb.de>
	<20140112032516.GA23525@S2101-09.ap.freescale.net>
	<201401122121.20084.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401122121.20084.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 12, 2014 at 9:21 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 12 January 2014, Shawn Guo wrote:

>> , and then code these numbers in their <board>.dts by hand.  It's
>> boring and error prone.  As a comparison, we generate these numbers
>> from reference manual database using a tool and define a macro
>> MX6QDL_PAD_GPIO_17__SPDIF_OUT for these numbers.  The authors only need
>> to find out this macro from imx6q-pinfunc.dtsi and fill it into his dts.
>> Isn't the macro use here helping to ease everyone's life and make the
>> coding less error prone, since the macro is generated from database?
>
> I was under the impression that the generic pinctrl binding was designed
> in a way to let you assign labels to each possible (reasonable)
> configuration so you didn't have get to this level of detail at the
> driver.

There is a binding for handles and states tied to a device.

There is no generic pinctrl binding for the definition of groups
and functions and how they map, i.e. muxing.

The discussion around this ended up with everyone disagreeing
and eventually everybody started writing their own bindings and
have them merged.

There is a generic pin config binding, not everyone uses it,
as they defined their bindings before I got that in place. It
is mostly a requirement for newer drivers.

This Freescale driver does not use the generic binding but
instead it's homebrew thing. The reason being that there was
no generic binding around when it was defined and written.

It is possible to migrate it to generic pinconf, which would
be nice.

> I'm also surprised that you have to know multiple constants
> (mux register, input register, config register offsets) to select a
> particular pin. I would have expected that you could have one constant
> from which the driver is able to compute the other ones.

I might have merged this but I was younger then :-/

Now I don't like the looks of this. I think the DT typically shall not
store register offsets and bitfield information. I think doing
so is taking away the responsibility of the driver knowing the
hardware and moving too close to Open Firmware.

pinctrl-single does store such things, the reason being that
the OMAP people did not even have a datasheet for these regs,
all they get is datafiles from the ASIC engineers, so there is
nothing sensible to encode in the driver in C. But I'm reluctant
also about this driver.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
