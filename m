From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: gpio-generic DT bindings?
Date: Wed, 20 Nov 2013 18:20:44 +0100
Message-ID: <CAMuHMdVriN6sOSOdyfU4rPQddqOo9E6QiArcfUXDooL2KBd4og@mail.gmail.com>
References: <CAMuHMdU9F_EjA+ZF0mn4PW3HDJ9rkM_84SHiDKkWwWr7MLJKJA@mail.gmail.com>
	<528BDF57.8080400@wwwdotorg.org>
	<CAMuHMdVuC5nJizr9Q2JXQCC=FtJkEvLa5iftBoa6Zd7B3XVojA@mail.gmail.com>
	<528BE85C.60101@wwwdotorg.org>
	<20131120154409.GM420@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120154409.GM420@bill-the-cat>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 4:44 PM, Tom Rini <trini-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, Nov 19, 2013 at 03:38:20PM -0700, Stephen Warren wrote:
>> On 11/19/2013 03:17 PM, Geert Uytterhoeven wrote:
>> > On Tue, Nov 19, 2013 at 10:59 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> >> On 11/19/2013 02:45 PM, Geert Uytterhoeven wrote:
>> >>> This topic seems to come up from time to time.
>> >>> Unfortunately the last time it coincided with the move of the mailing list
>> >>> from ozlabs to vger, causing the mailing list archives not to have captured
>> >>> the full discussion.
>> >>>
>> >>> Is there anything definitive/usable out there?
>> >>
>> >> What do you mean by "gpio-generic DT bindings"? A generic binding for a
>> >> controller, or something else? I think it's best to have a specific
>> >> binding for each individual controller, so it's always possible to know
>> >> exactly which controller is present. Now, all the binding definitions
>> >> should all look the same or as similar as possible for consistency...
>> >
>> > I mean DT bindings and DT support for drivers/gpio/gpio-generic.c.
>>
>> We should have DT bindings for particular HW, not for a driver. After
>> all, DT describes HW, not a particular OS's driver.
>>
>> The path to adding DT support to gpio-generic.c is to define a binding
>> for the particular HW you're interested in (which would quite likely
>> only contain compatible, reg, and perhaps some other standard properties
>> like interrupts, clocks, power domains, etc.). There would be one
>> binding and compatible value for each different HW block you want to
>> support, although they could all share the same schema and definition.
>> Then update gpio-generic.c to bind to that (those) compatible value(s),
>> and have some kind of table that maps from compatible value to whatever
>> configuration structure gpio-generic.c uses internally.
>
> This I think is the rub that Geert is getting at.  The driver is
> generic.  You feed it a little info and it Just Works.  Having to patch
> the generic driver N times for vendor,foo-gpio would be a step
> backwards.  How do we have a binding here that lets us be as flexible as
> we are today?

Indeed. Is there really a need to name all simple GPIO drivers that provide
two register banks ("data" and "data direction") differently using a
"vendor,ipblock" tuple? What about something like "linux,gpio-generic"?

In particular, I want to use it for openrisc GPIO. Currently it uses its own
very simple driver
(http://git.openrisc.net/cgit.cgi/jonas/linux/tree/drivers/gpio/jbtrivial.c),
while there already exists a simple driver called gpio-generic
in mainline. But gpio-generic doesn't have DT support yet.

People tried adding DT support before:
  - https://lkml.org/lkml/2013/2/26/70, which was shot down last year.
  - http://www.spinics.net/lists/devicetree/msg00696.html, which also refers
    to simple-gpio, but unfortunately I can't read the whole thread as most of
    it happened during the ozlabs->vger transition of the mailing list.

Thanks!

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
