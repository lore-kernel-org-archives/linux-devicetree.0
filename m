From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 9/9 v2] usb: usb251xb: Use GPIO descriptor consumer
 interface
Date: Fri, 22 Sep 2017 18:26:54 +0300
Message-ID: <20170922152654.GA10152@mobilestation>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-10-fancer.lancer@gmail.com>
 <20170921082338.GA30669@kroah.com>
 <20170921145129.GA25888@mobilestation>
 <20170921150714.GA7791@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170921150714.GA7791-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 05:07:14PM +0200, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Thu, Sep 21, 2017 at 05:51:29PM +0300, Serge Semin wrote:
> > On Thu, Sep 21, 2017 at 10:23:38AM +0200, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > > On Sat, Sep 16, 2017 at 01:42:20PM +0300, Serge Semin wrote:
> > > > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > > > index 71994b883..c2dd9742f 100644
> > > > --- a/drivers/usb/misc/usb251xb.c
> > > > +++ b/drivers/usb/misc/usb251xb.c
> > > > @@ -3,6 +3,7 @@
> > > >   * Configuration via SMBus.
> > > >   *
> > > >   * Copyright (c) 2017 SKIDATA AG
> > > > + * Copyright (c) 2017 T-platforms
> > > 
> > > Again, no, please consult with your corporate lawyers why this isn't ok.
> > > 
> > > greg k-h
> > 
> > I still can't see why this isn't right. We submitted the patchset. It is not
> > that big and still it isn't just two lines. As I've seen all over the kernel, It is
> > a common practice to have multiple copyrights in kernel files. We are not claiming
> > the copyright to the whole file, but to the contribution only. I got a consent to
> > contribute when I was employed by the company. What's wrong with that? Shall I
> > send the patchset from my corporate e-mail then?
> 
> Well, yes, I need some way to properly identify that this corporation
> did do the changes.  I said that before, I don't know why you ignored
> that.
> 
> And yes, multiple copyrights are just fine, but again, please talk to
> your corporate lawyer about why these changes don't seem to warrant that
> "mark".  If they do think that they do warrant that, great, I will be
> glad to discuss that with them, off-list if needed.
> 
> For even more fun, try discussing with your lawyers about why copyright
> marks like this don't even mean anything anymore, and haven't for 20+
> years now (can't remember the actual date...)  But that's a different
> topic, and one not really relevant here.
> 
> thanks,
> 
> greg k-h

Alright then. We'll remove the Copyright mark and I'll resend the patchset
from my corporate e-mail. Hope it will solve this issue.
Could you review the rest of the patchset?

Regards,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
