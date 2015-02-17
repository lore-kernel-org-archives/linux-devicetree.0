From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of: add helper for getting endpoint node with specific
 identifiers
Date: Tue, 17 Feb 2015 13:19:26 +0900
Message-ID: <20150217131926.13904df5@hwh-ubuntu>
References: <1424083050-7804-1-git-send-email-human.hwang@samsung.com>
 <CAL_JsqKYYVzPgcpCQvGKcCMD2jY8heMcUp-72TWys5o3aaa0bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL_JsqKYYVzPgcpCQvGKcCMD2jY8heMcUp-72TWys5o3aaa0bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Rob Herring,

On Mon, 16 Feb 2015 11:47:24 -0600
Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, Feb 16, 2015 at 4:37 AM, Hyungwon Hwang
> <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > When there are multiple ports or multiple endpoints in a port, they
> > have to be distinguished by the value of reg property. It is
> > common. The drivers can get the specific endpoint in the specific
> > port via this function. Now the drivers have to implement this code
> > in themselves or have to force the order of dt nodes to get the
> > right node.
> >
> > Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/of/base.c        | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/of_graph.h |  2 ++
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 36536b6..95ffe1c 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2155,6 +2155,40 @@ struct device_node
> > *of_graph_get_next_endpoint(const struct device_node *parent,
> > EXPORT_SYMBOL(of_graph_get_next_endpoint);
> >
> >  /**
> > + * of_graph_get_endpoint_by_regs() - get endpoint node of specific
> > identifiers
> > + * @parent: pointer to the parent device node
> > + * @port_reg: identifier (value of reg property) of the parent
> > port node
> > + * @reg: identifier (value of reg property) of the endpoint node
> > + *
> > + * Return: An 'endpoint' node pointer which is identified by reg
> > and at the same
> > + * is the child of a port node identified by port_reg. reg and
> > port_reg are
> > + * ignored when they are -1.
> > + */
> > +struct device_node *of_graph_get_endpoint_by_regs(
> > +       const struct device_node *parent, int port_reg, int reg)
> > +{
> > +       struct of_endpoint endpoint;
> > +       struct device_node *node, *prev_node = NULL;
> > +
> > +       while (1) {
> > +               node = of_graph_get_next_endpoint(parent,
> > prev_node);
> > +               of_node_put(prev_node);
> > +               if (!node)
> > +                       break;
> > +
> > +               of_graph_parse_endpoint(node, &endpoint);
> 
> Seems like this all could be in a "for_each_of_graph_child_endpoint"
> iterator. I've not looked, but I'd guess there are other similar
> loops?
> 

There is no other iterator which can be used here. So other codes which
call of_graph_get_next_endpoint() are also using loop. I thought
about adding that kinds of iterator newly. IMHO, I feel it is a little
excessive. So I prefer to using the loop.

> > +               if (((port_reg == -1) ||
> 
> What if of_graph_parse_endpoint failed?
> 

It never fails and never return except 0. So there is no need to check
the return value of it.

> > +                       (endpoint.port == (unsigned int) port_reg))
> > &&
> > +                       ((reg == -1) || (endpoint.id == (unsigned
> > int) reg)))
> 
> Why the casts?

I just clarify that endpoint.{port/id} is unsigned int. But now it
seems unnecessary, and make harder to read the code. I will remove it.

> 
> > +                       return node;
> > +
> > +               prev_node = node;
> > +       }
> > +
> > +       return NULL;
> > +}
> > +
> > +/**
> >   * of_graph_get_remote_port_parent() - get remote port's parent
> > node
> >   * @node: pointer to a local endpoint device_node
> >   *
> > diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> > index befef42..c119728 100644
> > --- a/include/linux/of_graph.h
> > +++ b/include/linux/of_graph.h
> > @@ -31,6 +31,8 @@ int of_graph_parse_endpoint(const struct
> > device_node *node, struct of_endpoint *endpoint);
> >  struct device_node *of_graph_get_next_endpoint(const struct
> > device_node *parent, struct device_node *previous);
> > +struct device_node *of_graph_get_endpoint_by_regs(
> > +               const struct device_node *parent, int port_reg, int
> > reg);
> 
> Empty version is needed.

Sorry. I forgot.

> 
> >  struct device_node *of_graph_get_remote_port_parent(
> >                                         const struct device_node
> > *node); struct device_node *of_graph_get_remote_port(const struct
> > device_node *node); --
> > 1.9.1
> >

Best regards,
Hyungwon Hwang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
