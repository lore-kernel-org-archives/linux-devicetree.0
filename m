From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Mon, 17 Aug 2015 09:46:22 +0200
Message-ID: <CACRpkdZc9WOJ00mvf3s1sqVqNOtQnYPyYuk8uqEvoB0AD5KCjw@mail.gmail.com>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
	<1438954951-13329-2-git-send-email-sjg@chromium.org>
	<CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
	<CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
	<55CCBFB2.7050301@wwwdotorg.org>
	<20150813181346.GS25532@bill-the-cat>
	<1439492679.242.35.camel@freebsd.org>
	<CAL_JsqL8tcECpdwCxatd6ULS8z0UU160OXr8S0ZGTTRRrUaeSQ@mail.gmail.com>
	<1439574356.242.60.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439574356.242.60.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 14, 2015 at 7:45 PM, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> On Fri, 2015-08-14 at 09:27 -0500, Rob Herring wrote:
>> Ian:
>> > So if I want to write a FreeBSD i2c eeprom driver that uses DT data,
>> > what are my choices?  I have exactly one:  make my driver essentially a
>> > clone of the Linux driver, with all the same data hard-coded in source.
>>
>> Don't you already have these drivers w/o using DT? If you did, you
>> would have this information already in the drivers. It wouldn't be a
>> question of the binding being Linux specific, but rather can we move
>> more of the data out of drivers and into DT. That is fundamentally a
>> different issue than is a binding Linux specific.
>
> This last paragraph most eloquently illustrates the point I was trying
> to make:  From the point of view of someone who only knows about the
> existing linux driver and how it is written, the current DT data is
> perfect.  It's exactly what that existing driver needs to know, and from
> that position you can argue that it is thus the ONLY thing any driver
> written by anyone would need to know.  That assumes that everyone wants
> to just clone the linux drivers (or in our case, because of licensing,
> rewrite the drivers in a completely linux-compatible way that somehow
> isn't simply copying them in violation of the GPL).

For some reason I just get the feeling that the relationship between
*BSD and Linux is lacking in communication. Or that the timing is
wrong. The OS:es don't hate each other but they don't really understand
each other either.

So whenever some shared asset needs management there is a
statement like "if you really love me, you should involve me more",
from either side.

And yes, it is the common human mistake of simply assuming
everyone else in the world works exactly like me (and in worst case
we assume others are plain stupid or a lesser imperfect version of
ourselves if they don't). But as always, they are usually just thinking
differently, smart in another way.

So I think these communities need some relationship therapy.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
