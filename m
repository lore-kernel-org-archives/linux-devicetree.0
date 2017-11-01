From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: DT best practices for defining multiple closely-related boards
Date: Wed, 1 Nov 2017 16:24:44 -0500
Message-ID: <20171101212444.zfor6pfhqwe6ozmh@rob-hp-laptop>
References: <alpine.LFD.2.21.1710280514300.8772@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1710280514300.8772-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 28, 2017 at 05:19:23AM -0400, Robert P. J. Day wrote:
> 
>   much shorter followup to previous note -- if we extend all that to
> defining, say, two very closely-related boards, the acme "coyote1" and
> "coyote2", then all i should end up needing (at most) is two new .dts
> files:
> 
>   coyote1.dts
>   coyote2.dts

Another option is if your bootloader can distinguish between boards, you 
fixup the dtb at runtime. Depends if managing mulitple dtbs and firmware 
images is a pain or not.

> 
> both of which could include (among other things) common coyote content
> in:
> 
>   coyote.dtsi
> 
> and that's it. unless there's something really novel about these
> boards, all other content should come from kernel-supplied .dtsi
> files, yes? and, once again, i'm asking since the design i was handed
> again copies kernel-supplied .dtsi files and modifies them, apparently
> for no other reason than to remove properties, which should have been
> done with /delete-property/.

Seems so, but people just copy things for a variety of reasons (laziness 
primarily).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
