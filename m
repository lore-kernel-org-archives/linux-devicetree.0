From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] dt: add property iteration helpers
Date: Tue, 20 Mar 2012 20:56:36 -0500
Message-ID: <4F693554.1010002@gmail.com>
References: <1332284899-24702-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332284899-24702-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/20/2012 06:08 PM, Stephen Warren wrote:
> This patch adds macros of_property_for_each_u32() and
> of_property_for_each_string(), which iterate over an array of values
> within a device-tree property. Usage is for example:
> 
> struct property *prop;
> const __be32 *p;
> u32 u;
> of_property_for_each_u32(np, "propname", prop, p, u)
> 	printk("U32 value: %x\n", u);
> 
> struct property *prop;
> const char *s;
> of_property_for_each_string(np, "propname", prop, s)
> 	printk("String value: %s\n", s);
> 
> Based on work by Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>


> ---
> v3: Moved code in base.c, defines/prototypes into of.h.
> v2: Simplified the implementation per suggestion by Rob Herring.
> 
> I'm not reposting them to avoid spamming people, but I have pinctrl changes
> that depend on this, so if this could be merged through the pinctrl tree,
> or somehow pulled into that tree, that'd be great.
> 
>  drivers/of/base.c  |   41 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |   35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 5806449..d9bfd49 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1260,3 +1260,44 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>  	return id;
>  }
>  EXPORT_SYMBOL_GPL(of_alias_get_id);
> +
> +const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
> +			       u32 *pu)
> +{
> +	const void *curv = cur;
> +
> +	if (!prop)
> +		return NULL;
> +
> +	if (!cur) {
> +		curv = prop->value;
> +		goto out_val;
> +	}
> +
> +	curv += sizeof(*cur);
> +	if (curv >= prop->value + prop->length)
> +		return NULL;
> +
> +out_val:
> +	*pu = be32_to_cpup(curv);
> +	return curv;
> +}
> +EXPORT_SYMBOL_GPL(of_prop_next_u32);
> +
> +const char *of_prop_next_string(struct property *prop, const char *cur)
> +{
> +	const void *curv = cur;
> +
> +	if (!prop)
> +		return NULL;
> +
> +	if (!cur)
> +		return prop->value;
> +
> +	curv += strlen(cur) + 1;
> +	if (curv >= prop->value + prop->length)
> +		return NULL;
> +
> +	return curv;
> +}
> +EXPORT_SYMBOL_GPL(of_prop_next_string);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ba5d849..7c58550 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -269,6 +269,37 @@ extern void of_detach_node(struct device_node *);
>  #endif
>  
>  #define of_match_ptr(_ptr)	(_ptr)
> +
> +/*
> + * struct property *prop;
> + * const __be32 *p;
> + * u32 u;
> + *
> + * of_property_for_each_u32(np, "propname", prop, p, u)
> + *         printk("U32 value: %x\n", u);
> + */
> +const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
> +			       u32 *pu);
> +#define of_property_for_each_u32(np, propname, prop, p, u)	\
> +	for (prop = of_find_property(np, propname, NULL),	\
> +		p = of_prop_next_u32(prop, NULL, &u);		\
> +		p;						\
> +		p = of_prop_next_u32(prop, p, &u))
> +
> +/*
> + * struct property *prop;
> + * const char *s;
> + *
> + * of_property_for_each_string(np, "propname", prop, s)
> + *         printk("String value: %s\n", s);
> + */
> +const char *of_prop_next_string(struct property *prop, const char *cur);
> +#define of_property_for_each_string(np, propname, prop, s)	\
> +	for (prop = of_find_property(np, propname, NULL),	\
> +		s = of_prop_next_string(prop, NULL);		\
> +		s;						\
> +		s = of_prop_next_string(prop, s))
> +
>  #else /* CONFIG_OF */
>  
>  static inline bool of_have_populated_dt(void)
> @@ -359,6 +390,10 @@ static inline int of_machine_is_compatible(const char *compat)
>  
>  #define of_match_ptr(_ptr)	NULL
>  #define of_match_node(_matches, _node)	NULL
> +#define of_property_for_each_u32(np, propname, prop, p, u) \
> +	while (0)
> +#define of_property_for_each_string(np, propname, prop, s) \
> +	while (0)
>  #endif /* CONFIG_OF */
>  
>  /**
