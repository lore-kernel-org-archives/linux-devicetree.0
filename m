From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt: add helper to read 64-bit integers
Date: Wed, 03 Aug 2011 11:17:14 -0500
Message-ID: <4E39748A.3030002@gmail.com>
References: <1312379073-13502-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312379073-13502-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/03/2011 08:44 AM, Jamie Iles wrote:
> Add a helper similar to of_property_read_u32() that handles 64-bit
> integers.
> 
> v2: constify device node and property name parameters.
> 
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> ---
>  drivers/of/base.c  |   28 ++++++++++++++++++++++++++++
>  include/linux/of.h |    8 ++++++++
>  2 files changed, 36 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 3ff22e3..3808e70 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -632,6 +632,34 @@ int of_property_read_u32_array(const struct device_node *np,
>  EXPORT_SYMBOL_GPL(of_property_read_u32_array);
>  
>  /**
> + * of_property_read_u64 - Find and read a 64 bit integer from a property
> + * @np:		device node from which the property value is to be read.
> + * @propname:	name of the property to be searched.
> + * @out_value:	pointer to return value, modified only if return value is 0.
> + *
> + * Search for a property in a device node and read a 64-bit value from
> + * it. Returns 0 on success, -EINVAL if the property does not exist,
> + * -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data isn't large enough.
> + *
> + * The out_value is modified only if a valid u64 value can be decoded.
> + */
> +int of_property_read_u64(struct device_node *np, char *propname, u64 *out_value)

Missed a const here...

> +{
> +	struct property *prop = of_find_property(np, propname, NULL);
> +
> +	if (!prop)
> +		return -EINVAL;
> +	if (!prop->value)
> +		return -ENODATA;
> +	if (sizeof(*out_value) > prop->length)
> +		return -EOVERFLOW;
> +	*out_value = of_read_number(prop->value, 2);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_property_read_u64);
> +
> +/**
>   * of_property_read_string - Find and read a string from a property
>   * @np:		device node from which the property value is to be read.
>   * @propname:	name of the property to be searched.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 0085bb0..d1b98c0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -199,6 +199,8 @@ extern int of_property_read_u32_array(const struct device_node *np,
>  				      const char *propname,
>  				      u32 *out_values,
>  				      size_t sz);
> +extern int of_property_read_u64(const struct device_node *np,
> +				const char *propname, u64 *out_value);
>  
>  extern int of_property_read_string(struct device_node *np,
>  				   const char *propname,
> @@ -256,6 +258,12 @@ static inline int of_property_read_string(struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> +static inline int of_property_read_u64(const struct device_node *np,
> +				       const char *propname, u64 *out_value)
> +{
> +	return -ENOSYS;
> +}
> +
>  #endif /* CONFIG_OF */
>  
>  static inline int of_property_read_u32(const struct device_node *np,
