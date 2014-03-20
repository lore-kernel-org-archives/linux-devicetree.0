From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Fri, 21 Mar 2014 00:26:12 +0100
Message-ID: <2220569.iDU3Tk3vCh@avalon>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <20140320153804.35d5b835@samsung.com> <20140320231250.8F0E0C412EA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320231250.8F0E0C412EA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Thursday 20 March 2014 23:12:50 Grant Likely wrote:
> On Thu, 20 Mar 2014 19:52:53 +0100, Laurent Pinchart wrote:
> > On Thursday 20 March 2014 18:48:16 Grant Likely wrote:
> > > On Thu, 20 Mar 2014 15:38:04 -0300, Mauro Carvalho Chehab wrote:
> > > > Em Thu, 20 Mar 2014 17:54:31 +0000 Grant Likely escreveu:
> > > > > On Wed, 12 Mar 2014 10:25:56 +0000, Russell King - ARM Linux wrote:

[snip]

> > > > > > I believe trying to do this according to the flow of data is just
> > > > > > wrong. You should always describe things from the primary device
> > > > > > for the CPU towards the peripheral devices and never the opposite
> > > > > > direction.
> > > > > 
> > > > > Agreed.
> > > > 
> > > > I don't agree, as what's the primary device is relative.
> > > > 
> > > > Actually, in the case of a media data flow, the CPU is generally not
> > > > the primary device.
> > > > 
> > > > Even on general purpose computers, if the full data flow is taken into
> > > > the account, the CPU is a mere device that will just be used to copy
> > > > data either to GPU and speakers or to disk, eventually doing format
> > > > conversions, when the hardware is cheap and don't provide format
> > > > converters.
> > > > 
> > > > On more complex devices, like the ones we want to solve with the
> > > > media controller, like an embedded hardware like a TV or a STB, the
> > > > CPU is just an ancillary component that could even hang without
> > > > stopping TV reception, as the data flow can be fully done inside the
> > > > chipset.
> > > 
> > > We're talking about wiring up device drivers here, not data flow. Yes, I
> > > completely understand that data flow is often not even remotely
> > > cpu-centric. However, device drivers are, and the kernel needs to know
> > > the dependency graph for choosing what devices depend on other devices.
> > 
> > Then we might not be talking about the same thing. I'm talking about DT
> > bindings to represent the topology of the device, not how drivers are
> > wired together.
> 
> Possibly. I'm certainly confused now. You brought up the component helpers
> in drivers/base/component.c, so I thought working out dependencies is part
> of the purpose of this binding. Everything I've heard so far has given me
> the impression that the graph binding is tied up with knowing when all of
> the devices exist.

The two are related, you're of course right about that.

We're not really moving forward here. Part of our disagreement comes in my 
opinion from having different requirements and different views of the problem, 
caused by experiences with different kind of devices. This is much easier to 
solve by sitting around the same table than discussing on mailing lists. I 
would propose a meeting at the ELC but that's still a bit far away and would 
delay progress by more than one month, which is probably not acceptable.

I can reply to the e-mail where I've drawn one use case I have to deal with to 
detail my needs if that can help.

Alternatively the UK isn't that far away and I could jump in a train if you 
can provide tea for the discussion :-)

> How device drivers get connected together may not strictly be a property
> of hardware, but it absolutely is informed by hardware topology.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
