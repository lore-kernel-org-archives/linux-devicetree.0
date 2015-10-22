From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 0/4] add missing of_node_put
Date: Thu, 22 Oct 2015 15:19:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1510221517300.2607@hadrien>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr> <CAL_JsqJGS+L=FZAwPs-wBSYiX8kQWqZyaLTGhadYVNT3=Qte_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJGS+L=FZAwPs-wBSYiX8kQWqZyaLTGhadYVNT3=Qte_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thu, 22 Oct 2015, Rob Herring wrote:

> +Russell who raised issues with these iterators recently.
>
> On Thu, Oct 22, 2015 at 4:02 AM, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org> wrote:
> > The various for_each device_node iterators performs an of_node_get on each
> > iteration, so a break out of the loop requires an of_node_put.
>
> Thanks for this.
>
> Are there any plans to use coccinelle as a checker that developers can
> run to be warned of these problems?

There are three issues I have found so far:

1.  of_node_put before a continue
2.  missing of_node_put before a break
3.  missing of_node get before some more permanent storage of the value

The semantic patches for the first two seem to be working pretty well, so
I could submit them for integration into the kernel.  The third one, I
have only looked at in an ad hoc way so far.

julia

>
> Rob
>
> > The complete semantic patch that fixes this problem is
> > (http://coccinelle.lip6.fr):
> >
> > // <smpl>
> > @r@
> > local idexpression n;
> > expression e1,e2;
> > iterator name for_each_node_by_name, for_each_node_by_type,
> > for_each_compatible_node, for_each_matching_node,
> > for_each_matching_node_and_match, for_each_child_of_node,
> > for_each_available_child_of_node, for_each_node_with_property;
> > iterator i;
> > statement S;
> > expression list [n1] es;
> > @@
> >
> > (
> > (
> > for_each_node_by_name(n,e1) S
> > |
> > for_each_node_by_type(n,e1) S
> > |
> > for_each_compatible_node(n,e1,e2) S
> > |
> > for_each_matching_node(n,e1) S
> > |
> > for_each_matching_node_and_match(n,e1,e2) S
> > |
> > for_each_child_of_node(e1,n) S
> > |
> > for_each_available_child_of_node(e1,n) S
> > |
> > for_each_node_with_property(n,e1) S
> > )
> > &
> > i(es,n,...) S
> > )
> >
> > @@
> > local idexpression r.n;
> > iterator r.i;
> > expression e;
> > expression list [r.n1] es;
> > @@
> >
> >  i(es,n,...) {
> >    ...
> > (
> >    of_node_put(n);
> > |
> >    e = n
> > |
> >    return n;
> > |
> > +  of_node_put(n);
> > ?  return ...;
> > )
> >    ...
> >  }
> >
> > @@
> > local idexpression r.n;
> > iterator r.i;
> > expression e;
> > expression list [r.n1] es;
> > @@
> >
> >  i(es,n,...) {
> >    ...
> > (
> >    of_node_put(n);
> > |
> >    e = n
> > |
> > +  of_node_put(n);
> > ?  break;
> > )
> >    ...
> >  }
> > ... when != n
> >
> > @@
> > local idexpression r.n;
> > iterator r.i;
> > expression e;
> > identifier l;
> > expression list [r.n1] es;
> > @@
> >
> >  i(es,n,...) {
> >    ...
> > (
> >    of_node_put(n);
> > |
> >    e = n
> > |
> > +  of_node_put(n);
> > ?  goto l;
> > )
> >    ...
> >  }
> > ...
> > l: ... when != n// </smpl>
> >
> > ---
> >
> >  drivers/of/irq.c      |    7 +++++--
> >  drivers/of/overlay.c  |    5 ++++-
> >  drivers/of/platform.c |    8 ++++++--
> >  drivers/of/unittest.c |    8 ++++++--
> >  4 files changed, 21 insertions(+), 7 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
