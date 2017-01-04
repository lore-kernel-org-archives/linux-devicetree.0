From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mailbox: sti: Fix mbox-names copy and paste error
Date: Wed, 4 Jan 2017 16:01:07 +0000
Message-ID: <20170104160107.GD24225@dell>
References: <20170104120527.24806-1-lee.jones@linaro.org>
 <20170104145732.7yiqbi7rf7m6lem4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170104145732.7yiqbi7rf7m6lem4@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: patrice.chotard-qxv4g6HH51o@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 04 Jan 2017, Rob Herring wrote:

> On Wed, Jan 04, 2017 at 12:05:27PM +0000, Lee Jones wrote:
> > Due to an over-sight, mbox-names has become mbox-name in some instances.
> > 
> > Let's put it right.
> > 
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mailbox/sti-mailbox.txt | 4 ++--
> >  arch/arm/boot/dts/stih407-family.dtsi                     | 8 ++++----
> >  drivers/mailbox/mailbox-sti.c                             | 2 +-
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > index 351f612..648d176 100644
> > --- a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > +++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > @@ -9,7 +9,7 @@ Controller
> >  Required properties:
> >  - compatible		: Should be "st,stih407-mailbox"
> >  - reg			: Offset and length of the device's register set
> > -- mbox-name		: Name of the mailbox
> > +- mbox-names		: Name of the mailbox
> 
> It's worse than this. mbox-names is for the mailbox client side.

Ah yes, of course.  False alarm.

Let's just leave it as it is. ;)

I'll reply to the reporter directly.

> This should just be dropped. Plus, *-names is pointless when there
> is only 1 element.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
