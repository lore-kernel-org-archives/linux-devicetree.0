From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Mon, 10 Mar 2014 14:41:02 +0000
Message-ID: <20140310144102.58C13C405FA@trevor.secretlab.ca>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> < CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com> < 20140217181451.7EB7FC4044D@trevor.secretlab.ca> <20140218070624.GP17250@ pengutronix.de> <20140218162627.32BA4C40517@trevor.secretlab.ca> < 1393263389.3091.82.camel@pizza.hi.pengutronix.de> <20140226110114. CF2C7C40A89@trevor.secretlab.ca> <1393426129.3248.64.camel@paszta.hi. pengutronix.de> <20140307170550.1DFB2C40A0D@trevor.secretlab.ca> <531AF1E8. 50606@ti.com> <20140308114115.BB08EC40612@trevor.secretlab.ca> <531D916C. 2010903@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531D916C.2010903-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Mar 2014 12:18:20 +0200, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> On 08/03/14 13:41, Grant Likely wrote:
> 
> >> Ok. If we go for single directional link, the question is then: which
> >> way? And is the direction different for display and camera, which are
> >> kind of reflections of each other?
> > 
> > In general I would recommend choosing whichever device you would
> > sensibly think of as a master. In the camera case I would choose the
> > camera controller node instead of the camera itself, and in the display
> > case I would choose the display controller instead of the panel. The
> > binding author needs to choose what she things makes the most sense, but
> > drivers can still use if it it turns out to be 'backwards'
> 
> I would perhaps choose the same approach, but at the same time I think
> it's all but clear. The display controller doesn't control the panel any
> more than a DMA controller controls, say, the display controller.

In a sense it doesn't actually matter. You sensibly want to choose the
most likely direction that drivers would go looking for a device it
depends on, but it can be matched up at runtime regardless of the
direction chosen by the binding.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
