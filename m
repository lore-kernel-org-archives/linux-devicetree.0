From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: gpio-generic DT bindings?
Date: Tue, 19 Nov 2013 23:17:46 +0100
Message-ID: <CAMuHMdVuC5nJizr9Q2JXQCC=FtJkEvLa5iftBoa6Zd7B3XVojA@mail.gmail.com>
References: <CAMuHMdU9F_EjA+ZF0mn4PW3HDJ9rkM_84SHiDKkWwWr7MLJKJA@mail.gmail.com>
	<528BDF57.8080400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528BDF57.8080400-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 10:59 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/19/2013 02:45 PM, Geert Uytterhoeven wrote:
>> This topic seems to come up from time to time.
>> Unfortunately the last time it coincided with the move of the mailing list
>> from ozlabs to vger, causing the mailing list archives not to have captured
>> the full discussion.
>>
>> Is there anything definitive/usable out there?
>
> What do you mean by "gpio-generic DT bindings"? A generic binding for a
> controller, or something else? I think it's best to have a specific
> binding for each individual controller, so it's always possible to know
> exactly which controller is present. Now, all the binding definitions
> should all look the same or as similar as possible for consistency...

I mean DT bindings and DT support for drivers/gpio/gpio-generic.c.

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
