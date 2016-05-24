From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: is there any value in unreferenced <linux,phandle>
 assignments?
Date: Tue, 24 May 2016 07:08:23 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1605240707160.32028@localhost.localdomain>
References: <alpine.LFD.2.20.1605240643210.31752@localhost.localdomain> <20160524105731.GA25374@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160524105731.GA25374@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 May 2016, Mark Rutland wrote:

> On Tue, May 24, 2016 at 06:49:40AM -0400, Robert P. J. Day wrote:
> >
> >   apologies for what i'm sure is a trivial question, but is there
> > any point in a .dts file having "linux,phandle" assignments that
> > are unreferenced from anywhere in the final source file?
> >
> >   i ask only because i've been handed a .dts file that admittedly
> > works just fine, but it contains a number of lines of the form:
> >
> >   linux,phandle = <some-number>;
> >
> > where none of those numeric phandles are referenced from anywhere
> > else in the source file (even after processing any .dtsi files).
> >
> >   one possibility is that those are leftovers before someone
> > started adding labels to nodes, and referring to them like that,
> > but in my case, the nodes defining those phandles don't even have
> > labels, so that seems fairly pointless.
> >
> >   is there any other explanation for them? thanks.
>
> It sounds like the dts file has been decompiled from a DTB, ...

  ah, suddenly it makes perfect sense, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
