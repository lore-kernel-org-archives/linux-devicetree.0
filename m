From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Wed, 31 Jan 2018 13:43:27 -0800
Message-ID: <5dd35d8f-c430-237e-9863-2e73556f92ec@gmail.com>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517429142-25727-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/31/18 12:05, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
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
> 
> 
>  drivers/of/base.c       | 85 ++++++++++++++++++++++++++++++++++++++++++++++---
>  drivers/of/of_private.h |  5 +++
>  drivers/of/resolver.c   | 21 ------------
>  3 files changed, 86 insertions(+), 25 deletions(-)

Some observations....

The size of the cache for a normal device tree would be a couple of
words of overhead for the cache, plus one pointer per devicetree node
that contains a phandle property.  This will be less space than
would be used by adding a hash field to each device node.  It is
also less space than was used by the older algorithm (long gone)
that added a linked list through the nodes that contained a
phandle property.

This is assuming that the values of the phandle properties are
the default ones created by the dtc compiler.  In the case
where a very large phandle property value is hand-coded in
a devicetree source, the size of the cache is capped at one
entry per node.  In this case, a little bit of space will be
wasted -- but this is just a sanity fallback, it should not
be encountered, and can be fixed by fixing the devicetree
source.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
