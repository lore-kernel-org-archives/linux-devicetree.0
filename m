From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: Add a binding for Mediatek xHCI
 host controller
Date: Sat, 1 Aug 2015 11:42:02 +0800
Message-ID: <1438400522.31933.25.camel@mhfsdcap03>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1437573945-31586-3-git-send-email-chunfeng.yun@mediatek.com>
	 <20150722142208.GC15809@leverpostej> <1437882325.3040.22.camel@mhfsdcap03>
	 <20150731133707.GB25118@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150731133707.GB25118@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi,
On Fri, 2015-07-31 at 14:37 +0100, Mark Rutland wrote:
> Hi,
> 
> > > > + - mediatek,usb-wakeup: to access usb wakeup control register
> > > 
> > > What exactly does this property imply?
> > > 
> > There are some control registers for usb wakeup which are put in another
> > module, here to get the node of that module, and then use regmap and
> > syscon to operate it.
> 
> Ok. You need to specify the type of this property (i.e. that it is a
> phandle to a syscon node). The description makes it sound like a boolean.
> 
Is it ok to add a prefix of syscon, and name it syscon-usb-wakeup?

> > 
> > > > + - mediatek,wakeup-src: 1: ip sleep wakeup mode; 2: line state wakeup
> > > > +	mode; others means don't enable wakeup source of usb
> > > 
> > > This sounds like configuration rather than a hardware property. Why do
> > > you think this needs to be in the DT?
> > > 
> > Yes, it's better to put it in the DT. 
> 
> That doesn't answer my question.
> 
> _why_ do you think this needs to be in the DT? What do you think is
> better for it being there?
> 
It is unthoughtful to put it here;
There is different configuration on platforms, such as on tablet which
only needs line-state wakeup (because system can't enter suspend when
plug in usb cable, so don't need ip-sleep-wakeup to remote wakeup
system), and on box just needs ip-sleep wakeup mode. so it is better to
put in each board's dts.
 
> > 
> > > > + - mediatek,u2port-num: the number should not greater than the number
> > > > +	of phys
> > > 
> > > What exactly does this property imply?
> > > 
> > On some platform, it only makes use of partial usb ports, so disable
> > others to save power.
> 
> What exactly do you mean by "partial USB ports"?
> 
> If a phy isn't wired up, it won't be listed in the phys property, if it
> is then disabling it sounds like a run-time decision.
> 
Yes, you are right.
This confuse me a little before. It was a property of old phy driver at
first, and then ported it here, so did not remove it temp.
After I re-write the phy driver, I will remove it.

Thanks a lot.

> Thanks,
> Mark.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
