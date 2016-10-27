From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/7] [media] ir-lirc-codec: don't wait any transmitting
 time for tx only devices
Date: Thu, 27 Oct 2016 16:44:01 +0900
Message-ID: <20161027074401.wxg5icc6hcpwnfsf@gangnam.samsung>
References: <20160901171629.15422-1-andi.shyti@samsung.com>
 <20160901171629.15422-6-andi.shyti@samsung.com>
 <CGME20160902084206epcas1p26e535506ec1c418ede9ba230d40f0656@epcas1p2.samsung.com>
 <20160902084158.GA25342@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <20160902084158.GA25342-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>, David =?iso-8859-15?Q?H=E4rdeman?= <david-0WFrdVpeebksCylrc8G9yg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

it's been a while :)

I was going through your review fixing what needs to be fixed,
but...

> > @@ -153,7 +153,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
> >  	}
> >  
> >  	ret = dev->tx_ir(dev, txbuf, count);
> > -	if (ret < 0)
> > +	if (ret < 0 || dev->driver_type == RC_DRIVER_IR_RAW_TX)
> 
> Just because a driver only does transmit doesn't mean its transmit ABI
> should change.
> 
> Now this bit of code is pretty horrible. It ensures that the call to write()
> takes at least as long as the length of the transmit IR by sleeping. That's
> not much of a guarantee that the IR has been sent.
> 
> Note that in the case of ir-spi, since your spi transfer is sync no sleep
> should be introduced here.
> 
> The gap calculation in lirc checks that if the call to write() took _longer_
> than expected wait before sending the next IR code (when either multiple
> IR codes or repeats are specified). Introducing the sleep in the kernel
> here does not help at all, lirc already ensures that it waits as long as
> the IR is long (see schedule_repeat_timer in lirc).
> 
> This change was introduced in 3.10, commit f8e00d5. 

... I'm not sure what can be done here. I get your point and I
understand that this indeed is a kind of fake sync point and by
doing this I 

How about creating two different functions:

- ir_lirc_transmit_ir where we actually do what the function
  already does
- ir_lirc_transmit_no_sync where the function we don't wait
  because the the sync is done on a different level (for example
  in the SPI case).

SPI does approximately the same thing.

Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
