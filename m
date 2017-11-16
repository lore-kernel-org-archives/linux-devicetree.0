From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/pci: Fix theoretical NULL dereference
Date: Wed, 15 Nov 2017 23:10:27 -0600
Message-ID: <20171116051027.sirf2g5nai2xpbgy@rob-hp-laptop>
References: <f367c825b5e9f8eb9fee3607bbcc16222f10bd72.1510749974.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f367c825b5e9f8eb9fee3607bbcc16222f10bd72.1510749974.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 12:50:06PM +0000, Robin Murphy wrote:
> In the (relatively mechanical) process of adapting the RID-mapping code
> to put the resulting ID in an output argument rather than the funtion
> return value, we ended up with the debug print using the argument
> pointer rather than the local value, which potentially defeats the
> earlier NULL check.
> 
> Fixes: 987068fcbdb7: "of/irq: Break out msi-map lookup (again)"
> Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/of/of_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
