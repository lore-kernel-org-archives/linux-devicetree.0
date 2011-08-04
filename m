From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH v2] of/address: Add of_iomap_nocache
Date: Thu, 4 Aug 2011 07:44:07 -0500
Message-ID: <B148344E-9580-4C9B-A8FD-942A9713291C@kernel.crashing.org>
References: <1312454196-31028-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1312454196-31028-1-git-send-email-davidb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Brown <davidb@codeaurora.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org


On Aug 4, 2011, at 5:36 AM, David Brown wrote:

> Add uncached mappings from devicetree nodes similar to regular io
> mappings.
> 
> SPARC is coherent, so there this call is the same as regular of_iomap.
> 
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: David Brown <davidb@codeaurora.org>
> ---
> v2 - Add implementation for SPARC
> 
> drivers/of/address.c       |   19 +++++++++++++++++++
> include/linux/of_address.h |   10 ++++++++++
> 2 files changed, 29 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 72c33fb..9bee7f8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -613,3 +613,22 @@ void __iomem *of_iomap(struct device_node *np, int index)
> 	return ioremap(res.start, resource_size(&res));
> }
> EXPORT_SYMBOL(of_iomap);
> +
> +/**
> + * of_iomap_nocache - Maps the memory mapped IO for a given
> + *                    device_node, using ioremap_nocache.
> + * @device:	the device whose io range will be mapped
> + * @index:	index of the io range
> + *
> + * Returns a pointer to the mapped memory
> + */
> +void __iomem *of_iomap_nocache(struct device_node *np, int index)
> +{
> +	struct resource res;
> +
> +	if (of_address_to_resource(np, index, &res))
> +		return NULL;
> +
> +	return ioremap_nocache(res.start, 1 + res.end - res.start);
> +}
> +EXPORT_SYMBOL(of_iomap_nocache);
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 3118623..0e4734b 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -13,6 +13,16 @@ extern struct device_node *of_find_matching_node_by_address(
> 					u64 base_address);
> extern void __iomem *of_iomap(struct device_node *device, int index);
> 
> +#ifndef SPARC
> +extern void __iomem *of_iomap_nocache(struct device_node *device, int index);
> +#else
> +static inline void __iomem *of_iomap_nocache(struct device_node *device,
> +		int index)
> +{
> +	return of_iomap(device, index);
> +}
> +#endif
> +

What about adding an of_iomap_prot() to match ioremap_prot().

- k