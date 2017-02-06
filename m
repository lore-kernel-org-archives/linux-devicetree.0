From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Mon, 06 Feb 2017 15:03:54 +0100
Message-ID: <1486389834.3005.55.camel@pengutronix.de>
References: <20170204033635.10250-1-robh@kernel.org>
         <20170204033635.10250-2-robh@kernel.org>
         <1486377167.3005.30.camel@pengutronix.de>
         <CAL_JsqJ2HO6WkSGccqGaxHPExnJGyRwrrL2wDOORO+auA=Jbrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ2HO6WkSGccqGaxHPExnJGyRwrrL2wDOORO+auA=Jbrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-02-06 at 07:54 -0600, Rob Herring wrote:
> On Mon, Feb 6, 2017 at 4:32 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Hi Rob,
> >
> > thanks for this clean-up series! I was not aware how far the duplication
> > has spread over time.
> >
> > On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
> >> The OF graph API leaves too much of the graph walking to clients when
> >> in many cases the driver doesn't care about accessing the port or
> >> endpoint nodes. The drivers typically just want the device connected via
> >> a particular graph connection. of_graph_get_remote_node provides this
> >> functionality.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  drivers/of/base.c        | 28 ++++++++++++++++++++++++++++
> >>  include/linux/of_graph.h |  8 ++++++++
> >>  2 files changed, 36 insertions(+)
> >>
> >> diff --git a/drivers/of/base.c b/drivers/of/base.c
> >> index d4bea3c797d6..ea18ab16b92c 100644
> >> --- a/drivers/of/base.c
> >> +++ b/drivers/of/base.c
> >> @@ -2469,3 +2469,31 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
> >>       return of_get_next_parent(np);
> >>  }
> >>  EXPORT_SYMBOL(of_graph_get_remote_port);
> >> +
> >> +struct device_node *of_graph_get_remote_node(const struct device_node *node,
> >> +                                          int port, int endpoint)
> >
> > I think this should have a documentation comment, similar to the
> > of_graph_get_endpoint_by_regs one, as it is not really clear from the
> > function name that the returned device node is the parent (or
> > grandparent) device node containing the remote port to the specified
> > node & port & endpoint.
> > Also it might be interesting to the user that -1 is a wildcard value for
> > port / endpoint.
> 
> I really want to not allow using a wildcard here. Drivers should know
> what port they want (or iterate over all of them). It didn't look like
> any drivers were depending on the wildcard, but were just using -1 for
> "no reg property" when really that should 0. Of course, I may have
> missed something.
> 
> I guess I could enforce port/endpoint > 0 here as there's no existing users.

That sounds reasonable. If it works for all users, enforcing >= 0 should
be fine, but in that case I'd change the parameters to be unsigned.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
