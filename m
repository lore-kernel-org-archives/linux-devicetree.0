From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree
 is used.
Date: Sat, 2 Nov 2013 13:40:21 -0700
Message-ID: <20131102204021.GA13994@kroah.com>
References: <20131101145925.66e22f73@notabene.brown>
 <1383279744.28909.26.camel@pasglop>
 <1383280054.28909.30.camel@pasglop>
 <20131101160329.37f3707b@notabene.brown>
 <1383282516.28909.36.camel@pasglop>
 <20131101204749.GA19662@kroah.com>
 <1383347399.28909.46.camel@pasglop>
 <20131102155824.GG23938@kroah.com>
 <1383423730.4776.16.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383423730.4776.16.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 03, 2013 at 07:22:10AM +1100, Benjamin Herrenschmidt wrote:
> On Sat, 2013-11-02 at 08:58 -0700, Greg Kroah-Hartman wrote:
> > Just loop through all the platform devices before registering it to
> > determine if you need to do this, the platform code can do this just
> > fine.  If you try to register a duplicate name with the driver core,
> > odds are it will complain loudly, so don't do that.
> 
> But that loop + registration is racy ... oh well, we might do something
> better with Neil's idea of labels instead.

How is it racy?  Only one platform device should be allowed to be
registered at a time, there is a per-bus lock that should be used to
enforce this, right?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
