From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/3] irqchip: al-fic: Introduce Amazon's Annapurna Labs
 Fabric Interrupt Controller Driver
Date: Thu, 6 Jun 2019 08:37:41 +0200
Message-ID: <20190606063741.GA23305@kroah.com>
References: <1559717653-11258-1-git-send-email-talel@amazon.com>
 <1559717653-11258-3-git-send-email-talel@amazon.com>
 <20190605075927.GA9693@kroah.com>
 <a81a46ef13273aa8c6ea87c8d3550e33650e27b6.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a81a46ef13273aa8c6ea87c8d3550e33650e27b6.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Talel Shenhar <talel@amazon.com>, nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 07:55:43AM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2019-06-05 at 09:59 +0200, Greg KH wrote:
> > 
> > > +struct irq_domain *al_fic_wire_get_domain(struct al_fic *fic);
> > > +
> > > +struct al_fic *al_fic_wire_init(struct device_node *node,
> > > +				void __iomem *base,
> > > +				const char *name,
> > > +				unsigned int parent_irq);
> > > +int al_fic_cleanup(struct al_fic *fic);
> > 
> > Who is using these new functions?  We don't add new apis that no one
> > uses :(
> 
> They will be used by subsequent driver submissions but those aren't
> quite ready yet, so we can hold onto patch 3 for now until they are.

Patch 2 also should have these removed :)

You know we don't add new apis until we have a real, in-kernel user for
them...

thanks,

greg k-h
