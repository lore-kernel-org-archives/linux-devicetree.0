From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] usb: usb251xb: Add USB2517/i hub support
Date: Sat, 16 Sep 2017 02:55:50 +0300
Message-ID: <20170915235550.GB21291@mobilestation>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-2-fancer.lancer@gmail.com>
 <20170915234514.GA8407@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170915234514.GA8407-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 04:45:14PM -0700, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Sat, Sep 16, 2017 at 02:31:09AM +0300, Serge Semin wrote:
> > USB2517i hubs are very like USB251xb devices series. They have almost
> > the same configuration registers space except number of ports, led
> > configurations and lack of battery settings. All these peculiarities
> > are reflected in this patch.
> 
> Please add one type of feature at a time per patch.  That makes it
> easier to review and ensure you got it right.
> 
> thanks,
> 
> greg k-h

Ok. The patch isn't that big though.

Regards,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
