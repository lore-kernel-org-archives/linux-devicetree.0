From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Thu, 18 Jun 2015 22:44:11 +0800
Message-ID: <20150618144410.GG15280@shlinux2>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>
 <20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>
 <20150618075527.GA15280@shlinux2>
 <20150618151824.64f6932cebd9e518f4b87e43@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150618151824.64f6932cebd9e518f4b87e43-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 03:18:24PM +0300, Roger Quadros wrote:
> On Thu, 18 Jun 2015 15:55:28 +0800
> Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > On Thu, Jun 18, 2015 at 10:36:50AM +0300, Roger Quadros wrote:
> > > Lin,
> > > 
> > > You can use --in-reply-to "message id of v5 of this path" so that it appears together
> > > with the other patches in peoples mailboxes.
> > > 
> > okay, I will try that next time, thanks.
> > 
> > Li Jun
> > > On Thu, 18 Jun 2015 09:18:22 +0800
> > > Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > 
> > > 
> > Then that's not so simple, every number should be checked,
> > if ((otg_caps->otg_rev % 10) > 9) ||
> > 	((otg_caps->otg_rev >> 4) % 10) > 9) ||
> > 	((otg_caps->otg_rev >> 8) % 10) > 9) ||
> > 	((otg_caps->otg_rev >> 12) % 10) > 9))
> > 	return error;
> > We really need this kind of format check? seems no this check
> > for bcdUSB.
> 
> How about checking for released spec versions instead?
> 
> 	switch (otg_rev) {
> 	case 0x0100:
> 	case 0x0110:
> 	case 0x0200:
> 	case 0x0300:
> 		break;
> 	default:
> 		dev_err(dev, "unsupported otg-rev: 0x%x\n", otg_rev);
> 		return error;
> 	}
> 
Currently only 1.x and 2.0 can make sense, but this could be done.

> cheers,
> -roger
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
