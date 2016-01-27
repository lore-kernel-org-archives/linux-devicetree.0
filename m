From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Wed, 27 Jan 2016 23:32:36 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1601272325300.2072@localhost6.localdomain6>
References: <20160127152017.GA16048@amitoj-Inspiron-3542> <20160127160531.GB17123@leverpostej> <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com> <20160127162153.GC17123@leverpostej> <FF19B941-89E4-4954-9818-E352FE9A0E97@konsulko.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <FF19B941-89E4-4954-9818-E352FE9A0E97-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jan 2016, Pantelis Antoniou wrote:

> Hi Mark,
> 
> > On Jan 27, 2016, at 18:21 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > 
> > On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
> >> Hi Mark,
> >> 
> >>> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> >>> 
> >>> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
> >>>> for_each_child_of_node performs an of_node_get on each iteration, so
> >>>> to break out of the loop an of_node_put is required.
> >>>> 
> >>>> Found using Coccinelle. The semantic patch used for this is as follows:
> >>>> 
> >>>> // <smpl>
> >>>> @@
> >>>> expression e;
> >>>> local idexpression n;
> >>>> @@
> >>>> 
> >>>> for_each_child_of_node(..., n) {
> >>>>  ... when != of_node_put(n)
> >>>>      when != e = n
> >>>> (
> >>>>  return n;
> >>>> |
> >>>> +  of_node_put(n);
> >>>> ?  return ...;
> >>>> )
> >>>>  ...
> >>>> }
> >>>> // </smpl
> >>>> 
> >>>> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>> ---
> >>>> drivers/of/resolver.c | 4 +++-
> >>>> 1 file changed, 3 insertions(+), 1 deletion(-)
> >>>> 
> >>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> >>>> index 640eb4c..e2a0143 100644
> >>>> --- a/drivers/of/resolver.c
> >>>> +++ b/drivers/of/resolver.c
> >>>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
> >>>> 
> >>>> 	for_each_child_of_node(node, child) {
> >>>> 		found = __of_find_node_by_full_name(child, full_name);
> >>>> -		if (found != NULL)
> >>>> +		if (found != NULL) {
> >>>> +			of_node_put(child);
> >>>> 			return found;
> >>>> +		}
> >>>> 	}
> >>>> 
> >>>> 	return NULL;
> >>> 
> >>> I don't think this is quite right. When child == found, this change will
> >>> leave it decremented.
> >>> 
> >> 
> >> 
> >> This patch is bogus. 
> >> 
> >> __of_find_node_by_full_name() is not taking a reference on the node if found. 
> >> This method relies on keeping the reference taken by the loop.
> > 
> > Sure. For the found node, that makes sense.
> > 
> > However, it also increments the refcount of all the parents, which does
> > not seem correct to me, given they're not put on the return path, and a
> > put of the found node won't decrement its parents refcounts, unless I
> > have missed something.
> > 
> 
> Hmm, yes. The parent refcounts must be decremented. 

The code is very strange.  The function is called at only one place:

                refnode = __of_find_node_by_full_name(node, nodestr);
                if (!refnode) {
                        pr_warn("%s: Could not find refnode '%s'\n",
                                __func__, (char *)rprop->value);
                        continue;
                }

                /* now find the property */
                for_each_property_of_node(refnode, sprop) {
                        if (of_prop_cmp(sprop->name, propstr) == 0)
                                break;
	        }

This is in the function __of_adjust_phandle_ref.  These are the only 
references to refnode.  That is, there is no of_node_put on refnode.  So 
if __of_find_node_by_full_name ups the reference count, there will be a 
memory leak.  Furthermore, the invariant on __of_find_node_by_full_name is 
quite strange, because if the of_node_cmp succeeds immediately, the ref 
count of the returned value will be what it was on the way into the 
function, while if it does not succeed the ref count of the returned value 
will be one greater than what it was on the way into the function.

Note also that there is similar refnode code in the function 
of_resolve_phandles:

                refnode = of_find_node_by_path(refpath);
                if (!refnode) {
	                pr_err("%s: Could not find node by path '%s'\n",
	                                __func__, refpath);
                        err = -ENOENT;
                        goto out;
		}

                phandle = refnode->phandle;
                of_node_put(refnode);


There there is a put of the obtained value.

So it seems that the patch as is is going in the right direction.  It is 
just necessary to also add an of_node_get in the following code:

        if (of_node_cmp(node->full_name, full_name) == 0)
                return node;

and to add an of_code_put after the above refnode code.

julia
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
