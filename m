From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: is there any value in unreferenced <linux,phandle> assignments?
Date: Tue, 24 May 2016 11:57:53 +0100
Message-ID: <20160524105731.GA25374@leverpostej>
References: <alpine.LFD.2.20.1605240643210.31752@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1605240643210.31752-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 24, 2016 at 06:49:40AM -0400, Robert P. J. Day wrote:
> 
>   apologies for what i'm sure is a trivial question, but is there any
> point in a .dts file having "linux,phandle" assignments that are
> unreferenced from anywhere in the final source file?
> 
>   i ask only because i've been handed a .dts file that admittedly
> works just fine, but it contains a number of lines of the form:
> 
>   linux,phandle = <some-number>;
> 
> where none of those numeric phandles are referenced from anywhere else
> in the source file (even after processing any .dtsi files).
> 
>   one possibility is that those are leftovers before someone started
> adding labels to nodes, and referring to them like that, but in my
> case, the nodes defining those phandles don't even have labels, so
> that seems fairly pointless.
> 
>   is there any other explanation for them? thanks.

It sounds like the dts file has been decompiled from a DTB, which would
explain the lack of labels. Otherwise, the phandle and linux,phandle
properties are generally not expected to be set directly in a dts
(though this is possible).

I suspect that there were unreferenced labels in the origninal
dts/dtsi, as I believe dtc adds a phandle for any label, regardless of
whether it is referenced (though I could be wrong).

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
