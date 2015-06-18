From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5 12/23] usb: gadget: ether: allocate and init otg
 descriptor by otg capabilities
Date: Thu, 18 Jun 2015 16:30:14 +0800
Message-ID: <20150618083013.GC15280@shlinux2>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
 <1434541230-15090-13-git-send-email-jun.li@freescale.com>
 <20150618104302.3da49bc854834b0257e3f703@ti.com>
 <20150618105148.cbf486831982d0244d499461@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150618105148.cbf486831982d0244d499461-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 10:51:48AM +0300, Roger Quadros wrote:
> On Thu, 18 Jun 2015 10:43:02 +0300
> Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org> wrote:
> 
> > On Wed, 17 Jun 2015 19:40:19 +0800
> > Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > @@ -228,11 +215,6 @@ static int rndis_do_config(struct usb_configuration *c)
> > >  
> > >  	/* FIXME alloc iConfiguration string, set it in c->strings */
> > >  
> > > -	if (gadget_is_otg(c->cdev->gadget)) {
> > > -		c->descriptors = otg_desc;
> > 
> > If you remove this who is setting c->descriptors to otg_desc?
> > 
> > > -		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
> > 
> > Why are you removing this? won't it change gadget behaviour?
> 
> OK. I see that you moved this bit to eth_bind. So it should be fine
> I guess. But this change was not necessary.
> 
right, I will revert this change.

Li Jun
> cheers,
> -roger
> 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
