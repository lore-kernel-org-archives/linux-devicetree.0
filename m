From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
Date: Thu, 19 Jan 2017 09:08:47 -0600
Message-ID: <1484838527.24294.45.camel@kernel.crashing.org>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-2-cyrilbur@gmail.com>
         <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
         <1484784318.4097.2.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484784318.4097.2.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-19 at 11:05 +1100, Cyril Bur wrote:
> > > +============
> > > +This represents the mailbox on the Soc.
> > > +
> > > +As the mailbox registers sit on the LPC bus, it makes most sense for
> > > +the device to be within the LPC host node. See
> > > +Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
> > > +information. This does not have to be the case, provided the reg
> > > +property can give the full address of the mbox registers.
> > 
> > This does have to be the case. I'd expect all devices on the LPC bus to 
> > be under a LPC bus node.
> > 
> > Drop the last sentence, and:
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Will do, thanks for the review.

Well well ... on the BMC side it's not actually on the LPC bus ;-)

However it's within the LPC host controller register set, and so as such
can be represented as a child of it.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
