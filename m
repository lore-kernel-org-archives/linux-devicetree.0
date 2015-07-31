From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: Add a binding for Mediatek xHCI host
 controller
Date: Fri, 31 Jul 2015 14:37:07 +0100
Message-ID: <20150731133707.GB25118@leverpostej>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
 <1437573945-31586-3-git-send-email-chunfeng.yun@mediatek.com>
 <20150722142208.GC15809@leverpostej>
 <1437882325.3040.22.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437882325.3040.22.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roger Quadros <rogerq@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

> > > + - mediatek,usb-wakeup: to access usb wakeup control register
> > 
> > What exactly does this property imply?
> > 
> There are some control registers for usb wakeup which are put in another
> module, here to get the node of that module, and then use regmap and
> syscon to operate it.

Ok. You need to specify the type of this property (i.e. that it is a
phandle to a syscon node). The description makes it sound like a boolean.

> 
> > > + - mediatek,wakeup-src: 1: ip sleep wakeup mode; 2: line state wakeup
> > > +	mode; others means don't enable wakeup source of usb
> > 
> > This sounds like configuration rather than a hardware property. Why do
> > you think this needs to be in the DT?
> > 
> Yes, it's better to put it in the DT. 

That doesn't answer my question.

_why_ do you think this needs to be in the DT? What do you think is
better for it being there?

> 
> > > + - mediatek,u2port-num: the number should not greater than the number
> > > +	of phys
> > 
> > What exactly does this property imply?
> > 
> On some platform, it only makes use of partial usb ports, so disable
> others to save power.

What exactly do you mean by "partial USB ports"?

If a phy isn't wired up, it won't be listed in the phys property, if it
is then disabling it sounds like a run-time decision.

Thanks,
Mark.
