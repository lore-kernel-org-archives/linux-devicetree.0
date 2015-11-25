From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] dmaengine: usb-dmac: Document SoC specific bindings
Date: Wed, 25 Nov 2015 09:21:25 +0900
Message-ID: <20151125002125.GG20596@verge.net.au>
References: <1448331641-21758-1-git-send-email-horms+renesas@verge.net.au>
 <SG2PR06MB09198719427CB3F4FE532834D8060@SG2PR06MB0919.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB09198719427CB3F4FE532834D8060-ESzmfEwOt/zNQ8RBPPB5A20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 05:49:05AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman [mailto:horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> > Sent: Tuesday, November 24, 2015 11:21 AM
> > 
> > In general Renesas hardware is not documented to the extent where the
> > relationship between IP blocks on different SoCs can be assumed although
> > they may appear to operate the same way. Furthermore the documentation
> > typically does not specify a version for individual IP blocks. For these
> > reasons a convention of using the SoC name in place of a version and
> > providing SoC-specific compat strings has been adopted.
> > 
> > Although not universally liked this convention is used in the bindings for
> > most drivers for Renesas hardware. The purpose of this patch is to
> > update the Renesas USB DMA Controller driver to follow this convention.
> > 
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> 
> Thank you for the patch!
> 
> > ---
> > * r8a7792 (R-Car V2H) is omitted as my reading of the documentation
> >   is that Renesas USB-DMAC does not exist on that SoC
> 
> I agree with you.
> 
> > * r8a7795 (R-Car H2) is omitted as its unclear to me on the compatibility
> >   of USB-DMAC that SoC
> 
> I think this is R-Car H3, not H2.

Yes, H3. Sorry about that.

> Since R-Car H3's USB-DMAC is compatible with other SoCs,
> would you add the R-Car H3's compatible string, if possible?

Sure, will do.

> Anyway,
> Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
