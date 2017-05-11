From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Thu, 11 May 2017 20:40:23 +0200
Message-ID: <20170511184023.oi4bwwrutllexjen@pengutronix.de>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
 <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, May 11, 2017 at 10:49:15AM -0500, Rob Herring wrote:
> +dtc list because labels are purely dts syntax.

Ah, I wasn't aware that there is a separate list for that. Thanks.

> On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-König
> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Hello,
> >
> > on an i.MX28 based machine I want to have the console on &duart with
> > 115200 Bd, 8 Bit, no parity.
> >
> > The options for that are AFAICT:
> >
> >  - use an alias, like:
> >
> >         stdout-path = "serialX:115200n8";
> >
> >    the problem here is, that the duart doesn't have an alias. I guess I
> >    shouldn't introduce a new one for my setup?
> >
> >  - use a label, like:
> >
> >         stdout-path = &duart, ":115200n8";
> >
> >    This would be the prettiest, but that doesn't work, because there is
> >    a '\0' separating the path and the options.
> 
> You could make that work changing the kernel parsing, but that's
> probably not a good option if we ever want to support more than 1 out
> path.

Good point. That's a good reason to not use this syntax.
 
> >  - use the full path, like:
> >
> >         stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
> >
> >    This is ugly.
> >
> > Do I miss something? Is that worth to introduce new syntax, maybe
> >
> >         stdout-path = &duart . ":115200n8";
> >
> > or similar?
> 
> Seems like we should make a comma be significant in splitting strings.
> I'm not sure if there's anything relying on "foo" "bar" and "foo",
> "bar" being the same. At least for numbers, a comma has no meaning, so
> it would complicate the parsing I'd imagine. Not really an area I'm
> familiar with.

"foo" "bar" is a syntax error now (and another obvious candidate for
string concatination). So writing in the dts

	stdout-path = &duart ":115200n8";

and getting the same result as

	stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";

looks nicely and consistent with

	stdout-path = &duart;

being equivalent to

	stdout-path = "/apb@80000000/apbx@80040000/serial@80074000";

After a quick look into the dtc sources I imagine that wouldn't be too
hard to implement for someone being fluent in lex and yacc. And probably
it would be cheap to add the other obvious extensions like:

	property = < 0x12 0x43 > "a string" &label /incbin/(filename);

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
