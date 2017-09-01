From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: still unclear on a couple DT questions from my initial post
Date: Fri, 1 Sep 2017 09:51:44 +0100
Message-ID: <20170901085144.GA1933@leverpostej>
References: <alpine.LFD.2.21.1709010121140.20957@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1709010121140.20957-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 01, 2017 at 01:29:31AM -0400, Robert P. J. Day wrote:
>   again, more nitpicky pedantry, but from my initial post, i'm still
> unclear on a couple things.
> 
>   first, a number of powerpc .dts files contain the line:
> 
>     dcr-parent = <&{/cpus/cpu@0}>;
> 
> and it's not clear to me why there are curly braces there. that is the
> only example of that, but i see no mention of that in the spec. is it
> meaningful? or are they superfluous?

This syntax allows us to refer to a node by path, even if it doesn't
have an existing label. The &foo syntax only allows us to refer to an
existing label called foo.

>   also, the spec states that status could be set to "okay", but a pile
> of .dts files in the current kernel have the shorter form:
> 
>   status = "ok";
> 
> and the current kernel code in drivers/of explicitly accepts both
> forms. is that a formal spec property, or is the kernel code simply
> allowing people to be sloppy?

The kernel is catering for sloppiness. We should probably fix those up
in the kernel tree.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
