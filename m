From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Fri, 12 May 2017 09:41:55 +0200
Message-ID: <20170512074155.oshpdio2hb7cz377@pengutronix.de>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
 <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
 <20170511184023.oi4bwwrutllexjen@pengutronix.de>
 <20170512034816.GA12908@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170512034816.GA12908-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello David,

On Fri, May 12, 2017 at 01:48:16PM +1000, David Gibson wrote:
> On Thu, May 11, 2017 at 08:40:23PM +0200, Uwe Kleine-König wrote:
> > On Thu, May 11, 2017 at 10:49:15AM -0500, Rob Herring wrote:
> > > On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-König
> > > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > > Hello,
> > > >
> > > > on an i.MX28 based machine I want to have the console on &duart with
> > > > 115200 Bd, 8 Bit, no parity.
> > > >
> > > > The options for that are AFAICT:
> > > >
> > > >  - use an alias, like:
> > > >
> > > >         stdout-path = "serialX:115200n8";
> > > >
> > > >    the problem here is, that the duart doesn't have an alias. I guess I
> > > >    shouldn't introduce a new one for my setup?
> > > >
> > > >  - use a label, like:
> > > >
> > > >         stdout-path = &duart, ":115200n8";
> > > >
> > > >    This would be the prettiest, but that doesn't work, because there is
> > > >    a '\0' separating the path and the options.
> > > 
> > > You could make that work changing the kernel parsing, but that's
> > > probably not a good option if we ever want to support more than 1 out
> > > path.
> > 
> > Good point. That's a good reason to not use this syntax.
> 
> Yes, changing the actual property format is a bad idea.
> 
> > > >  - use the full path, like:
> > > >
> > > >         stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
> > > >
> > > >    This is ugly.
> > > >
> > > > Do I miss something? Is that worth to introduce new syntax, maybe
> > > >
> > > >         stdout-path = &duart . ":115200n8";
> > > >
> > > > or similar?
> > > 
> > > Seems like we should make a comma be significant in splitting strings.
> > > I'm not sure if there's anything relying on "foo" "bar" and "foo",
> > > "bar" being the same. At least for numbers, a comma has no meaning, so
> > > it would complicate the parsing I'd imagine. Not really an area I'm
> > > familiar with.
> > 
> > "foo" "bar" is a syntax error now (and another obvious candidate for
> > string concatination). So writing in the dts
> 
> Right.  "foo" "bar" would be my preferred syntax for string
> concatenation (the main guiding principle for dts syntax is "be like C
> where possible").
> 
> > 
> > 	stdout-path = &duart ":115200n8";
> > 
> > and getting the same result as
> > 
> > 	stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
> > 
> > looks nicely and consistent with
> > 
> > 	stdout-path = &duart;
> > 
> > being equivalent to
> > 
> > 	stdout-path = "/apb@80000000/apbx@80040000/serial@80074000";
> > 
> > After a quick look into the dtc sources I imagine that wouldn't be too
> > hard to implement for someone being fluent in lex and yacc.
> 
> Unfortunately, there are two complications with this.  The more minor
> one is that an "implicit" operation like this (no actual operator
> symbol) can make things get a bit curly in the grammar - mostly by
> allowing potential ambiguity in situations which are obviously
> different to a human, but not to the parser.

/me remembers his algorithms courses about ambiguous grammars and
mumbles something about left and right recursion.
 
> The bigger problem is that during the parse which is when we're (for
> example) evaluating integer expressions, we haven't yet resolved
> labels.  So, we can't expand the reference, we just insert a "marker"
> in the property bytestring which says to insert the node path later.
> That means we can't just have simple code to do a string concatenation
> here.  That marker gets expanded later on, once we've resolved all
> references.
> 
> Note that this is the same reason you can do:
> 	prop = < (1+2+3) &foo >;
> But you can't do
> 	prop = < (&foo + 1) >;
> 
> There are two ways we could deal with this:
> 
>    1) The quick and dirty way: special case string append with a
>    reference, so that we insert a new type of marker which will be
>    expaned to the node path without the final \0.
> 
>    2) The complicated but powerful way: rather than (mostly)
>    constructing the property values as bytestrings at parse time, we
>    just construct the property values as expression trees at parse
>    time, then evaluate those expression trees later on, once we're
>    able to resolve references.
> 
> Approach (2) has been suggested before.  As well as this case it would
> be a necessary step for allowing defined "functions" (for integers or
> otherwise) in dtc.  It has some nice properties, but it's a rather a
> lot of work.

lex and yacc are great, but I'm not into them to be of help here :-|

> > And probably
> > it would be cheap to add the other obvious extensions like:
> > 
> > 	property = < 0x12 0x43 > "a string" &label /incbin/(filename);
> 
> Um.. what?  That's not an obvious extension at all.  The proposed
> change is to have (a b) be a string concatenation, but several of the
> things above aren't strings, so it's not clear what it should do.  If
> you want _bytestring_ concatenation, we already have syntax for that -
> that's exactly what ',' does in dtc.

When compiling and then decompiling a node that contains

	property = < 0x41424344 0x45464700 >;

I get

	property = "ABCDEFG";

in the dts output. So I assumed that strings and arrays are just
different syntactic ways to define a value and so concatenation would
work for both the same way. Now thinking a bit more there are some
problems that are likely solved best by not allowing concatenation for
arrays and binary data.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
