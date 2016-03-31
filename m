From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: st_sensors: support open drain mode
Date: Thu, 31 Mar 2016 10:15:08 +0200
Message-ID: <CACRpkdZ37dpKsHr01M0+waXgP4xZJjxxFrNQW13Zxi1a9H+-Rg@mail.gmail.com>
References: <1458825486-17188-1-git-send-email-linus.walleij@linaro.org>
	<1458825486-17188-4-git-send-email-linus.walleij@linaro.org>
	<56F8F592.9010807@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F8F592.9010807-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Giuseppe Barba <giuseppe.barba-qxv4g6HH51o@public.gmane.org>, Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2016 at 11:12 AM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 24/03/16 13:18, Linus Walleij wrote:

>> +- st,int-pin-open-drain: the interrupt/data ready line will be configured
>> +  as open drain, which is useful if several sensors share the same
>> +  interrupt line.
>
> Really feels like this one ought to be more generic.. Mind you so does
> drdy-int-pin!

Sorry about drdy-int-pin, it wasn't me ;)

That one is a mux kind of thing: interrupt goes out on IRQ line
INT1 or INT2, select one...

> Hmm. Looks like most open drain controls are chip specific - other than
> your pinctrl ones and that doesn't really map to here I guess.

Both the muxing and the OD setting can be done with pin control,
it's just that it is like swatting a fly with a skyscraper - vast overkill
for two interrupt lines.

I came to the conclusion that with small chips or IP blocks just
randomly doing some muxing or biasing of a few pins isn't necessarily
worth all the trouble of implementing pin control, the latter was
conceived for real big arrays of pins really. There are already a
few of these all over the kernel, e.g. the ST Multi-Purpose expander
drivers/mfd/stmpe.c - could be pin control muxed but it'd be overkill.

So as pin control maintainer when this kind of hardware comes up
I usually just "think it over" and then "OK then".

>> +     if (sdata->int_pin_open_drain) {
>> +             dev_info(&indio_dev->dev,
>> +                      "set interrupt line to open drain mode\n");
>
> Hmm. Curriously I have a board with an lis3l02dq on it where the interrupt
> is shared, but doesn't explicitly support open drain. In that case it
> is done with some external circuitry.

That should run fine with just the status read patch from earlier
in the series I guess?

> Anyhow - I guess when I actually add support for that I'll just add a sanity
> check in here that addr_od and mask_od are specified :)

Hm, yeah. Otherwise just patch out my enforcement of the
OD flag for a shared line and add a comment in.

Yours,
Linus Walleij
