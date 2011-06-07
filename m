From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: address: use resource_size helper
Date: Tue, 7 Jun 2011 13:19:42 -0600
Message-ID: <20110607191942.GB2035@ponder.secretlab.ca>
References: <1307472924-10907-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1307472924-10907-1-git-send-email-balbi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2011 at 09:55:24PM +0300, Felipe Balbi wrote:
> that should be the approved way of calculating
> the size of resources. No functional changes.
> 
> Signed-off-by: Felipe Balbi <balbi@ti.com>

Applied, thanks.

g.

> ---
>  drivers/of/address.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index deefc0c..6e7b2cf 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -624,6 +624,6 @@ void __iomem *of_iomap(struct device_node *np, int index)
>  	if (of_address_to_resource(np, index, &res))
>  		return NULL;
>  
> -	return ioremap(res.start, 1 + res.end - res.start);
> +	return ioremap(res.start, resource_size(&res));
>  }
>  EXPORT_SYMBOL(of_iomap);
> -- 
> 1.7.6.rc0
> 
