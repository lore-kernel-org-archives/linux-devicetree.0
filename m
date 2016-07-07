From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH] dt: Add of_device_compatible_match()
Date: Thu, 7 Jul 2016 09:42:54 -0700
Message-ID: <577E868E.30702@gmail.com>
References: <1466981246.20278.27.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466981246.20278.27.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/26/16 15:47, Benjamin Herrenschmidt wrote:
> This provides an equivalent of of_fdt_match() for non-flat trees.
> 
> This is more practical than matching an array of of_device_id structs
> when converting a bunch of existing users of of_fdt_match().
> 
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> ---
> 
> This is a pre-requisite for some work I'm doing to move the platform
> identification in arch/powerpc until after we have unflattened the
> device-tree. Rewriting all those lists as of_device_id's would be
> significantly cumbersome.
> 
> Note: untested other than it compiles. I want an agreement on the
> interface ASAP since the conversion of all the platforms is a burden
> I'd like to avoid doing twice.
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ebf84e3..429c594 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -493,6 +493,28 @@ int of_device_is_compatible(const struct device_node *device,
>  }
>  EXPORT_SYMBOL(of_device_is_compatible);
>  
> +/** Checks if the device is compatible with any of the entries in
> + *  a NULL terminated array of strings. Returns the best match
> + *  score or 0.
> + */
> +int of_device_compatible_match(struct device_node *device,
> +			       const char *const *compat)
> +{
> +	unsigned int tmp, score = 0;
> +
> +	if (!compat)
> +		return 0;
> +
> +	while (*compat) {
> +		tmp = of_device_is_compatible(device, *compat);
> +		if (tmp && (score == 0 || (tmp < score)))
> +			score = tmp;
> +		compat++;
> +	}
> +
> +	return score;
> +}
> +

of_device_is_compatible() returns a higher value for a better match.

of_fdt_match() returns a lower value for a better match.

So checking for (tmp < score) will give you the opposite of what you want.

And if you are replacing of_fdt_match() with of_device_compatible_match(),
the caller will have the expectation that a smaller score is a better
match.


>  /**
>   * of_machine_is_compatible - Test root of device tree for a given compatible value
>   * @compat: compatible string to look for in root node's compatible property.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 74eb28c..33c184d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -324,6 +324,8 @@ extern int of_property_read_string_helper(const struct device_node *np,
>  					      const char **out_strs, size_t sz, int index);
>  extern int of_device_is_compatible(const struct device_node *device,
>  				   const char *);
> +extern int of_device_compatible_match(struct device_node *device,
> +				      const char *const *compat);
>  extern bool of_device_is_available(const struct device_node *device);
>  extern bool of_device_is_big_endian(const struct device_node *device);
>  extern const void *of_get_property(const struct device_node *node,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
