From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dts: bindings: trivial clock bindings doc fixes
Date: Mon, 2 Dec 2013 21:13:58 +0100
Message-ID: <20131202201358.GY2982@book.gsilab.sittig.org>
References: <1385999579-3184-1-git-send-email-gsi@denx.de>
 <20131202161843.GM12952@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131202161843.GM12952-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 16:18 +0000, Mark Rutland wrote:
> 
> On Mon, Dec 02, 2013 at 03:52:59PM +0000, Gerhard Sittig wrote:
> > fix a typo in the "clock specifiers" discussion,
> > clarify that clock specifiers (the integer cells
> > part that goes with the phandle) may be empty
> > 
> > [ ... Cc: list ... ]
> > ---
> > 
> > this may sound like nit picking, but from an earlier explanation by Mark
> > Rutland I learned that a reference always consists of a phandle and a
> > specifier, that the specifier is the sequence of integer cells that
> > accompany the phandle, and that the phandle "by intuition might be
> > expected to" be part of the specifier but specificly is not (and shall
> > not, to keep the existing documentation consistent)
> > 
> > since I was fixing the typo, and had the above information, I could not
> > resist but had to add the "may be zero cells" detail in bypassing
> 
> It would be nice to move a bit of this into the patch title and
> description that'll survive as the commit (the title's a bit vague).

Here is what I could come up with, without exceeding the acceptable
title length.  The title then becomes less generic than "trivial clock
bindings doc fixes", and better reflects the change in terse listings.
Agreed on that this is a necessary improvement.

The more verbose commit message still feels a bit lengthy with all the
details squeezed into it, yet should no longer be as clumsy and "weird"
as the original message was.


I'm citing the text here instead of re-submitting the patch in a rapid
followup.  Will create v2 when this suggested text turns out to be more
acceptable.

  dts: bindings: doc fix, zero cell clock specifiers are valid

  fix a typo in the common clock binding's "clock specifiers" discussion,
  and clarify the fact that the sequence of integer cells that go with the
  clock provider's phandle and form "the clock specifier" may be empty


> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -5,7 +5,7 @@ Sources of clock signal can be represented by any node in the device
> >  tree.  Those nodes are designated as clock providers.  Clock consumer
> >  nodes use a phandle and clock specifier pair to connect clock provider
> >  outputs to clock inputs.  Similar to the gpio specifiers, a clock
> > -specifier is an array of one more more cells identifying the clock
> > +specifier is an array of zero, one or more cells identifying the clock
> >  output on a device.  The length of a clock specifier is defined by the
> >  value of a #clock-cells property in the clock provider node.
> 
> To nit pick slightly further, how about just "zero or more"?

Can't tell how the "zero or more" escaped me.  Thank you, took it!  Will
be in the patch upon re-submission.

Everything else from the above "motivation, background" comment already
was in the binding document.  The context of my change has all of it:
Consumers referencing items by phandle and specifiers, specifiers
consisting of a variable number of cells including zero, the number of
cells being a property of the clock provider.


> Otherwise, this looks good to me!
> 
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks!


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
