From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [GIT PULL] Move device tree graph parsing helpers to drivers/of
Date: Tue, 18 Mar 2014 00:30:13 +0100
Message-ID: <5247436.pV9jXGKXCJ@avalon>
References: <1394126000.3622.66.camel@paszta.hi.pengutronix.de> <5321CB04.6090700@samsung.com> <20140314070505.GV1629@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140314070505.GV1629-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Friday 14 March 2014 08:05:05 Robert Schwebel wrote:
> On Thu, Mar 13, 2014 at 04:13:08PM +0100, Sylwester Nawrocki wrote:
> > My experience and feelings are similar, I started to treat mainline
> > kernel much less seriously after similar DT related blocking issues.
> 
> So how do we proceed now? Philipp implemented any of the suggested variants
> now; nevertheless, there doesn't seem to be a consensus.
> 
> However, we really need a decision of the oftree maintainers. I think we are
> fine with almost any of the available variants, as long as there is a
> decision.
> 
> It would be great if we could soon continue to address the technical issues
> with the IPU, instead of turning around oftree bindings. There is really
> enough complexity left :-)

I agree with you. I know that DT bindings review takes too much time, slows 
development down and is just generally painful. I'm trying to reply to this e-
mail thread as fast as possible, but I'm also busy with other tasks :-/

The lack of formal consensus comes partly from the fact that people are busy 
and that the mail thread is growing big. There's still two open questions from 
my view of the whole discussion:

- Do we really want to drop bidirectional links ? Grant has been pretty vocal 
about that, but there has been several replies with arguments for 
bidirectional links, and no reply from him afterwards. Even though that 
wouldn't be the preferred solution for everybody, there doesn't seem to be a 
strong disagreement about dropping bidirectional links, as long as we can come 
up with a reasonable implementation.

- If we drop bidirectional links, what link direction do we use ? There has 
been several proposals (including "north", which I think isn't future-proof as 
it assumes an earth-centric model) and no real agreement, although there seems 
to be a consensus among several developers that the core OF graph bindings 
could leave that to be specified by subsystem bindings. We would still have to 
agree on a direction for the display subsystem of course.

If my above explanation isn't too far from the reality the next step could be 
to send a new version of the DT bindings proposal as a ping.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
