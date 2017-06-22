From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] Update binding documentation for cp110 and ap806
Date: Thu, 22 Jun 2017 16:14:56 -0500
Message-ID: <20170622211456.rip2gveiprlfw3kj@rob-hp-laptop>
References: <20170620083754.28053-1-gregory.clement@free-electrons.com>
 <87k2463c66.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87k2463c66.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 20, 2017 at 05:34:57PM +0200, Gregory CLEMENT wrote:
> Hi Rob, 
>  
>  On mar., juin 20 2017, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > Hi Rob,
> >
> > As you know there were dependencies issue about the binding between my
> > different series and you proposed yourself to apply them though the
> > device tree subsystem: [1]

I did, but ...

> >
> > All the driver parts have been merged so it's time merging the
> > documentation.
> 
> I forgot to mentioned that this series is based on the clk-ap806-dt
> stable branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-ap806-dt

... that was to avoid cross tree dependencies. Now you're creating one. 
Either Mike should take everything or drop this branch and I'll take it 
too.

And you missed my ack on patch 6.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
