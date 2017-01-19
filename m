From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
Date: Thu, 19 Jan 2017 11:05:18 +1100
Message-ID: <1484784318.4097.2.camel@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-2-cyrilbur@gmail.com>
         <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-18 at 14:38 -0600, Rob Herring wrote:
> On Thu, Jan 12, 2017 at 11:29:07AM +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > new file mode 100644
> > index 000000000000..633cd534d91c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > @@ -0,0 +1,44 @@
> > +ASpeed Mailbox Driver
> > +=====================
> > +
> > +The ASpeed mailbox allows for communication between different
> > +processors. The mailbox on the ASpeed ast2400 and ast2500 is a set of
> > +16 single byte data registers along with interrupt and configuration
> > +registers directly on the SoC. These are memory mapped on the aspeed
> > +and can be accessed via the SuperIO registers on the other processor.
> > +
> > +Device Node:
> > +============
> > +This represents the mailbox on the Soc.
> > +
> > +As the mailbox registers sit on the LPC bus, it makes most sense for
> > +the device to be within the LPC host node. See
> > +Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
> > +information. This does not have to be the case, provided the reg
> > +property can give the full address of the mbox registers.
> 
> This does have to be the case. I'd expect all devices on the LPC bus to 
> be under a LPC bus node.
> 
> Drop the last sentence, and:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Will do, thanks for the review.

Cyril
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
