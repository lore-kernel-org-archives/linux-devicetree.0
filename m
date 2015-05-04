From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document OCTEON USB bindings
Date: Mon, 4 May 2015 17:37:40 -0500
Message-ID: <CAL_JsqJSJFxXGEZ688NRYijjXkTnM2y+VHHWF77gMA86t0xzzw@mail.gmail.com>
References: <1430423040-2088-1-git-send-email-aaro.koskinen@iki.fi>
 <CAL_JsqJbebtb6z2WOXfs8DUBsb=oGhFAh+qUQaR0yndGvWgSGg@mail.gmail.com> <20150501161548.GB595@fuloong-minipc.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150501161548.GB595-+UqvGBo8NkiJ/SmVcN9c7yH8jP4CeeTLqBW4ids5wwA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 1, 2015 at 11:15 AM, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org> wrote:
> Hi,
>
> On Fri, May 01, 2015 at 09:39:19AM -0500, Rob Herring wrote:
>> > +   - refclk-frequency: speed of the USB reference clock. Allowed values are
>> > +     12000000, 24000000 or 48000000.
>>
>> We already have a standard property for this if you only have 1 clock:
>> clock-frequency.
>>
>> > +   - refclk-type: type of the USB reference clock. Allowed values are
>> > +     "crystal" or "external".
>>
>> Should be prefixed with "cavium,".
>
> Both of these are already used in
> Documentation/devicetree/bindings/mips/cavium/uctl.txt (the USB
> controller for newer OCTEONs). These bindings are unfortunately
> just "reverse-engineered" from products that are already shipping
> and likely not perfect, but shouldn't we still try to be compatible
> for the sake of users?

Well, generally we don't just accept whatever crap people came up with
behind closed doors. But for this case, I'm not going to bikeshed it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
