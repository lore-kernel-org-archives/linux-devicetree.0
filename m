From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/5] nvmem: core: Add consumer API to get nvmem cell
 from node
Date: Thu, 7 Jul 2016 10:18:49 +0100
Message-ID: <577E1E79.4090809@linaro.org>
References: <cover.1467872014.git.maitysanchayan@gmail.com>
 <0e6294d931bf181376a6f4e1a86df3f6c6a5d575.1467872014.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e6294d931bf181376a6f4e1a86df3f6c6a5d575.1467872014.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/07/16 07:39, Sanchayan Maity wrote:
> From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>
> The existing NVMEM consumer API's do not allow to get a
> NVMEM cell directly given a device tree node. This patch
> adds a function to provide this functionality.
>
> Assuming the nvmem cell id name is known, this can be used
> as follows
>
> struct device_node *cell_np;
> struct nvmem_cell *foo_cell;
>
> cell_np = of_find_node_by_name(parent, "foo");
> foo_cell = of_nvmem_cell_get_direct(cell_np);

I don't see a real gain in adding this new api,
This will encourage people to use non-standard nvmem bindings.

why not just use standard nvmem bindings.. and use

of_nvmem_cell_get(np, "foo");

which should work in your case.

thanks,
srini
>
> Parent node can also be the of_node of the main SoC device
> node.
>
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/nvmem/core.c           | 44 +++++++++++++++++++++++++++++-------------
>   include/linux/nvmem-consumer.h |  1 +
>   2 files changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 965911d..470abee 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -743,29 +743,21 @@ static struct nvmem_cell *nvmem_cell_get_from_list(const char *cell_id)
>
>   #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
>   /**
> - * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
> + * of_nvmem_cell_get_direct() - Get a nvmem cell from given device node
>    *
> - * @dev node: Device tree node that uses the nvmem cell
> - * @id: nvmem cell name from nvmem-cell-names property.
> + * @dev node: Device tree node that uses nvmem cell
>    *
>    * Return: Will be an ERR_PTR() on error or a valid pointer
>    * to a struct nvmem_cell.  The nvmem_cell will be freed by the
>    * nvmem_cell_put().
>    */
> -struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
> -					    const char *name)
> +struct nvmem_cell *of_nvmem_cell_get_direct(struct device_node *cell_np)
>   {
> -	struct device_node *cell_np, *nvmem_np;
> +	struct device_node *nvmem_np;
>   	struct nvmem_cell *cell;
>   	struct nvmem_device *nvmem;
>   	const __be32 *addr;
> -	int rval, len, index;
> -
> -	index = of_property_match_string(np, "nvmem-cell-names", name);
> -
> -	cell_np = of_parse_phandle(np, "nvmem-cells", index);
> -	if (!cell_np)
> -		return ERR_PTR(-EINVAL);
> +	int rval, len;
>
>   	nvmem_np = of_get_next_parent(cell_np);
>   	if (!nvmem_np)
> @@ -824,6 +816,32 @@ err_mem:
>
>   	return ERR_PTR(rval);
>   }
> +EXPORT_SYMBOL_GPL(of_nvmem_cell_get_direct);
> +
> +/**
> + * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
> + *
> + * @dev node: Device tree node that uses the nvmem cell
> + * @id: nvmem cell name from nvmem-cell-names property.
> + *
> + * Return: Will be an ERR_PTR() on error or a valid pointer
> + * to a struct nvmem_cell.  The nvmem_cell will be freed by the
> + * nvmem_cell_put().
> + */
> +struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
> +					    const char *name)
> +{
> +	struct device_node *cell_np;
> +	int index;
> +
> +	index = of_property_match_string(np, "nvmem-cell-names", name);
> +
> +	cell_np = of_parse_phandle(np, "nvmem-cells", index);
> +	if (!cell_np)
> +		return ERR_PTR(-EINVAL);
> +
> +	return of_nvmem_cell_get_direct(cell_np);
> +}
>   EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
>   #endif
>
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 9bb77d3..bf879fc 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -136,6 +136,7 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
>   #endif /* CONFIG_NVMEM */
>
>   #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
> +struct nvmem_cell *of_nvmem_cell_get_direct(struct device_node *cell_np);
>   struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>   				     const char *name);
>   struct nvmem_device *of_nvmem_device_get(struct device_node *np,
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
