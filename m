From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of of_find_node_by_phandle()
Date: Thu, 1 Feb 2018 08:34:35 -0600
Message-ID: <CAL_Jsq+z7Z7nbXUS-6MxAzAq353OK02Uc6i3AH7WS2KmOrLnmA@mail.gmail.com>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517429142-25727-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 2:05 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> Create a cache of the nodes that contain a phandle property.  Use this
> cache to find the node for a given phandle value instead of scanning
> the devicetree to find the node.  If the phandle value is not found
> in the cache, of_find_node_by_phandle() will fall back to the tree
> scan algorithm.
>
> The cache is initialized in of_core_init().
>
> The cache is freed via a late_initcall_sync().
>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
>
> Some of_find_by_phandle() calls may occur before the cache is
> initialized or after it is freed.  For example, for the qualcomm
> qcom-apq8074-dragonboard, 11 calls occur before the initialization
> and 80 occur after the cache is freed (out of 516 total calls.)

We should be able to do this earlier. We already walk the tree twice
in unflattening. We can get the max phandle (or number of phandles
IMO) on the first pass, allocate with the early allocator and then
populate the cache in the 2nd pass. AIUI, you can alloc with memblock
and then free with kfree as the memblock allocations get transferred
to the slab.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
