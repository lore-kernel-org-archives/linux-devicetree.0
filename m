From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Usage of for_each_child_of_node()
Date: Wed, 23 Oct 2013 09:16:44 -0700
Message-ID: <20131023161644.GB20675@roeck-us.net>
References: <5259B6F8.3070701@roeck-us.net>
 <CAL_Jsq+wBGV6KGo4Ngrxr4_aZ=0eWPTbt0n4bhhrpERB55bQyg@mail.gmail.com>
 <20131023071006.GA7708@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023071006.GA7708-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 09:10:07AM +0200, Thierry Reding wrote:
> On Sat, Oct 12, 2013 at 10:15:03PM -0500, Rob Herring wrote:
> > On Sat, Oct 12, 2013 at 3:54 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> > > Hi all,
> > >
> > > for_each_child_of_node() and similar functions increase the refcount
> > > on each returned node and expect the caller to release the node by
> > > calling of_node_put() when done.
> > >
> > > Looking through the kernel code, it appears this is hardly ever done,
> > > if at all. Some code even calls of_node_get() on returned nodes again.
> > >
> > > I guess this doesn't matter in cases where devicetree is a static entity.
> > > However, this is not (or no longer) the case with devicetree overlays,
> > > or more generically in cases where devicetree nodes are added and
> > > removed dynamically.
> > >
> > > Fundamental question: Would patches to fix this problem be accepted upstream
> > > ?
> > 
> > Certainly.
> > 
> > > Or, of course, stepping a bit back: Am I missing something essential ?
> > 
> > No. I think this is frequently wrong since it typically doesn't matter
> > for static entries as you mention.
> 
> Actually, I think it actually happens to be correct most of the time.
> The reason is that for_each_child_of_node() internally calls the
> of_get_next_child() to iterate over all children. And that function
> already calls of_node_put() on the "previous" node. So if all the code
> does is to iterate over all nodes to query them, then all should be
> fine.
> 
Good, that reduces the scope of the problem significantly.

> The only case where you actually need to drop the reference on a node is
> if you break out of the loop (so that of_get_next_child() will not be
> called). But that's usually the case when you need to perform some
> operation on the node, in which case it is the right thing to hold on to
> a reference until you're done with the node.
> 
Unfortunately, there are many cases with code such as

	if (error)
		return;	/* or break; */

or even
	if (found node)
		return of_node_get(node);

in the loop.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
