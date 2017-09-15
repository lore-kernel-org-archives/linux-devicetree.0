From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 5/5] usb: usb251xb: Add copyrights
Date: Fri, 15 Sep 2017 16:42:40 -0700
Message-ID: <20170915234240.GA7809@kroah.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-6-fancer.lancer@gmail.com>
 <20170915234028.GA7681@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170915234028.GA7681-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 04:40:28PM -0700, Greg KH wrote:
> On Sat, Sep 16, 2017 at 02:31:13AM +0300, Serge Semin wrote:
> > Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/usb/misc/usb251xb.c | 1 +
> >  1 file changed, 1 insertions(+), 0 deletion(-)
> 
> I can't take patches without any changelog text, sorry.
> 
> > 
> > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > index 1d47acd09..43afa04ad 100644
> > --- a/drivers/usb/misc/usb251xb.c
> > +++ b/drivers/usb/misc/usb251xb.c
> > @@ -3,6 +3,7 @@
> >   * Configuration via SMBus.
> >   *
> >   * Copyright (c) 2017 SKIDATA AG
> > + * Copyright (c) 2017 T-platforms
> 
> I don't see the connection between a random company, and a random
> gmail.com email address.  Please explain :)

Also, based on the changes in this series, I fail to see how you could
even claim copyright on the entire file.  Please explain that as well
when you resend this patch.

Note, I'm not a lawyer, and this isn't legal advice, please contact your
company's lawyers, they know this type of thing, and now the normal
rules for claiming copyright of a whole file.  They also know that
copyright notices in files don't mean anything, but lawyers love to
cargo-cult things more than any other profession :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
