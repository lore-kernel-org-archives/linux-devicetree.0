From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Thu, 28 Jan 2016 12:36:31 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1601281235390.2516@hadrien>
References: <20160127152017.GA16048@amitoj-Inspiron-3542> <20160127160531.GB17123@leverpostej> <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com> <20160127162153.GC17123@leverpostej> <FF19B941-89E4-4954-9818-E352FE9A0E97@konsulko.com>
 <alpine.DEB.2.02.1601272042030.2051@localhost6.localdomain6> <20160128112810.GK17123@leverpostej>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160128112810.GK17123@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thu, 28 Jan 2016, Mark Rutland wrote:

> On Wed, Jan 27, 2016 at 08:48:00PM +0100, Julia Lawall wrote:
> >
> >
> > On Wed, 27 Jan 2016, Pantelis Antoniou wrote:
> >
> > > Hi Mark,
> > >
> > > > On Jan 27, 2016, at 18:21 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > > >
> > > > On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
> > > >> Hi Mark,
> > > >>
> > > >>> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > > >>>
> > > >>> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
> > > >>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> > > >>>> index 640eb4c..e2a0143 100644
> > > >>>> --- a/drivers/of/resolver.c
> > > >>>> +++ b/drivers/of/resolver.c
> > > >>>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
> > > >>>>
> > > >>>> 	for_each_child_of_node(node, child) {
> > > >>>> 		found = __of_find_node_by_full_name(child, full_name);
> > > >>>> -		if (found != NULL)
> > > >>>> +		if (found != NULL) {
> > > >>>> +			of_node_put(child);
> > > >>>> 			return found;
> > > >>>> +		}
> > > >>>> 	}
> > > >>>>
> > > >>>> 	return NULL;
> > > >>>
> > > >>> I don't think this is quite right. When child == found, this change will
> > > >>> leave it decremented.
> > > >>>
> > > >>
> > > >>
> > > >> This patch is bogus.
> > > >>
> > > >> __of_find_node_by_full_name() is not taking a reference on the node if found.
> > > >> This method relies on keeping the reference taken by the loop.
> > > >
> > > > Sure. For the found node, that makes sense.
> > > >
> > > > However, it also increments the refcount of all the parents, which does
> > > > not seem correct to me, given they're not put on the return path, and a
> > > > put of the found node won't decrement its parents refcounts, unless I
> > > > have missed something.
> > > >
> > >
> > > Hmm, yes. The parent refcounts must be decremented.
> >
> > So there should be if (found != child) of_node_put(child); ?
>
> That would match the intended semantics, yes.

I don't think so.  I sent another mail with what seems like a better
solution (upping the reference count of the child that is selected).

julia
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
