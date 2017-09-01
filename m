From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH ] ARM: dts: iwg22d-sodimm: Add Ethernet AVB support
Date: Fri, 1 Sep 2017 10:49:23 +0200
Message-ID: <20170901084923.GC14918@verge.net.au>
References: <1504106234-41450-1-git-send-email-biju.das@bp.renesas.com>
 <20170831084534.GF29946@verge.net.au>
 <KL1PR06MB170280A3D466C9B35AF73939B89D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <TY1PR06MB07029D315FC6EE500D1EEA55B79D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB07029D315FC6EE500D1EEA55B79D0-/PRLmSCtZ14u2TXDOttQZW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 09:32:25AM +0000, Chris Paterson wrote:
> Hello,
> 
> > From: Biju Das
> > Sent: 31 August 2017 10:24
> > 
> > > From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> > > Sent: 31 August 2017 09:46
> 
> <snip>
> 
> > > > +	phy3: ethernet-phy@3 {
> > > > +	/*
> > > > +	 * On some older versions of the platform (before R4.0) the phy
> > > address
> > > > +	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
> > > > +	 */
> > > > +		reg = <3>;
> > > > +		micrel,led-mode = <1>;
> > >
> > > Does the phy have an interrupt?
> > 
> > The current board doesn't support interrupt . But there is a plan to support this
> > in future board variants through (GPIO3_28).
> 
> Actually, the plan has recently changed and at the moment interrupt support will not be added in the production version of the board.
> 
> If in the end the plan changes again and the actual hardware does add interrupt support we'll submit a new patch accordingly.

Thanks for following-up on this. I'm still surprised there is no interrupt
- does link speed renegotiation initiated by the other end of the link work
in a timely manner? - but if its not there and my wishful thinking won't
make it so.

I have applied this patch for v4.15.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
