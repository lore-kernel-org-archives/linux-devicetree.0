From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add early boot allocation of
 of_find_node_by_phandle() cache
Date: Wed, 14 Feb 2018 16:55:20 -0800
Message-ID: <96984f12-dff6-73e9-8f45-9573cb9ca4e5@gmail.com>
References: <1518655465-10759-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518655465-10759-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/14/18 16:44, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> The initial implementation of the of_find_node_by_phandle() cache
> allocates the cache using kcalloc().  Add an early boot allocation
> of the cache so it will be usable during early boot.  Switch over
> to the kcalloc() based cache once normal memory allocation
> becomes available.
> 
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
> 
> This patch is optional, to be added at Rob's discretion.  The
> extra complexity is not as much as I had feared, but the boot
> speed up is also likely small.

This patch applies on top of:

[PATCH v3] of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
