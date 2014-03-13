From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [GIT PULL] Move device tree graph parsing helpers to drivers/of
Date: Thu, 13 Mar 2014 16:13:08 +0100
Message-ID: <5321CB04.6090700@samsung.com>
References: <1394126000.3622.66.camel@paszta.hi.pengutronix.de>
 <20140307182330.75168C40AE3@trevor.secretlab.ca>
 <20140310102630.3cb1bcd7@samsung.com>
 <20140310143758.3734FC405FA@trevor.secretlab.ca>
 <1394708896.3577.21.camel@paszta.hi.pengutronix.de>
 <20140313113527.GM21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140313113527.GM21483-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/03/14 12:35, Russell King - ARM Linux wrote:
[...]
> Grant and myself have exchanged emails in private on this discussing what
> should happen - essentially Grant's position is that he's happy to leave
> this stuff queued provided a resolution to his concerns are forthcoming.
> 
> However, what I find incredibly unfair is that we're taking the rap for
> these bad bindings.  From what I can see, these bad bindings were merged
> into the V4L2 code with _zero_ review by DT maintainers.  It's quite
> clear that DT maintainers would have objected to them had they seen them,

Russell, it's just unfair what you're trying to impute here.  These 
bindings were floating on the mailing list for _several_ months before 
getting merged.
They were finally acked by Rob and Grant [1], [2], however it cannot be 
seen from the commits as the Ack come late, after I sent a pull request.

> but they didn't.  And the lack of documentation of the bindings which
> has been something that's been insisted on is also disgusting.
>
> And now we're now taking the pain for that oversight.
> 
> So... frankly, I've walked away from this dysfunctional situation.  I
> don't see imx-drm moving out of drivers/staging due to this debacle for
> many months - possibly never now given that no one can agree on this
> stuff.  This just goes to show what a fscking joke mainline kernels are,
> and why people just give up and go to vendor kernels which offer /much/
> better support all round.
> 
> As far as I can see, it's proved impossible to define a set of bindings
> for display devices which satisfy everyone.  So, rather than doing
> /something/ so we can move forward, we end up doing /nothing/.
> 
> It's times like this where I start believing that /board files/ were the
> best solution for ARM, because DT just carries soo many thorny issues
> (such as these) and is a continual blocker.

My experience and feelings are similar, I started to treat mainline
kernel much less seriously after similar DT related blocking issues.
An example is a simple patch series for couple drivers that was first 
posted in July 2013 and is still not merged, because the subsystem 
maintainer requires a DT binding maintainer Ack for everything and you
can wait to death to get one, specially if there are multiple iterations,
each needing attention of a DT binding maintainer. I remember opinions, 
when the process was being defined during one of the last kernel summits, 
that things may get longer to merge upstream, due to DT binding reviews. 
And that we must live with that. But these latencies are getting so 
ridiculously large that there is nothing left but to move to an 
alternative process.

Regarding moving forward doing /something/, rather than ending up
doing nothing - IMO it's the worst thing to rush DT binding being
merged upstream. I don't think an agreement can't be achieved soon, 
if not for this release then hopefully for next one.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
