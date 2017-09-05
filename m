From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: more pedantic proofing of DTSpec version 0.1
Date: Tue, 5 Sep 2017 17:20:12 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1709051719460.5307@localhost.localdomain>
References: <alpine.LFD.2.20.1708210705090.28188@localhost.localdomain> <20170831205659.67fvxjdgggbifuy6@rob-hp-laptop> <59AF139B.5090501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59AF139B.5090501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 5 Sep 2017, Frank Rowand wrote:

> On 08/31/17 13:56, Rob Herring wrote:
> > On Sat, Aug 26, 2017 at 10:50:46AM -0400, Robert P. J. Day wrote:
> >>
>
> < snip >
>
> >> p. 25: table 3.6, the acronym "PIR" comes out of nowhere, perhaps
> >> explain it the first time?
> >
> > I'm drawing a blank as to what that is.
>
> According to the Mindshare book: PowerPC System Architecture:
>
> "Processor ID Register (PIR)
>
> The PIR is a 32-bit register that can be used by the OS to assign
> an ID to the processor.  Aside from any OS-specific usage of the
> assigned ID, the processor uses the ID when communicating with
> I/O devices."

  whoops, then my patch was wrong. dang.

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
