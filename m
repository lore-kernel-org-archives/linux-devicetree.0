From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] OF: make of_property_for_each_{u32|string}() use
 parameters if OF is not enabled
Date: Sat, 20 Jul 2013 06:28:09 +0100
Message-ID: <20130720052809.3F0573E16E7@localhost>
References: <1371137331-4652-1-git-send-email-bigeasy@linutronix.de>
 <20130615140018.572793E0A2E@localhost> <20130617144813.GA10582@linutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4204231246154384897=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130617144813.GA10582-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4204231246154384897==
Content-Type: text/plain

On Mon, 17 Jun 2013 16:48:13 +0200, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> I am getting a few
> |warning: unused variable ‘p’ [-Wunused-variable]
> |warning: unused variable ‘prop’ [-Wunused-variable]
> 
> in the case where CONFIG_OF is not defined and the parameters are only
> used in the loop macro.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

Applied, thanks

g.


> ---
> 
> I also made that change for of_property_for_each_string().
> 
>  include/linux/of.h | 39 ++++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 1fd08ca..90a8811 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -323,12 +323,6 @@ extern int of_detach_node(struct device_node *);
>   */
>  const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
>  			       u32 *pu);
> -#define of_property_for_each_u32(np, propname, prop, p, u)	\
> -	for (prop = of_find_property(np, propname, NULL),	\
> -		p = of_prop_next_u32(prop, NULL, &u);		\
> -		p;						\
> -		p = of_prop_next_u32(prop, p, &u))
> -
>  /*
>   * struct property *prop;
>   * const char *s;
> @@ -337,11 +331,6 @@ const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
>   *         printk("String value: %s\n", s);
>   */
>  const char *of_prop_next_string(struct property *prop, const char *cur);
> -#define of_property_for_each_string(np, propname, prop, s)	\
> -	for (prop = of_find_property(np, propname, NULL),	\
> -		s = of_prop_next_string(prop, NULL);		\
> -		s;						\
> -		s = of_prop_next_string(prop, s))
>  
>  #else /* CONFIG_OF */
>  
> @@ -505,12 +494,20 @@ static inline int of_machine_is_compatible(const char *compat)
>  	return 0;
>  }
>  
> +static inline const __be32 *of_prop_next_u32(struct property *prop,
> +		const __be32 *cur, u32 *pu)
> +{
> +	return NULL;
> +}
> +
> +static inline const char *of_prop_next_string(struct property *prop,
> +		const char *cur)
> +{
> +	return NULL;
> +}
> +
>  #define of_match_ptr(_ptr)	NULL
>  #define of_match_node(_matches, _node)	NULL
> -#define of_property_for_each_u32(np, propname, prop, p, u) \
> -	while (0)
> -#define of_property_for_each_string(np, propname, prop, s) \
> -	while (0)
>  #endif /* CONFIG_OF */
>  
>  #ifndef of_node_to_nid
> @@ -559,6 +556,18 @@ static inline int of_property_read_u32(const struct device_node *np,
>  	return of_property_read_u32_array(np, propname, out_value, 1);
>  }
>  
> +#define of_property_for_each_u32(np, propname, prop, p, u)	\
> +	for (prop = of_find_property(np, propname, NULL),	\
> +		p = of_prop_next_u32(prop, NULL, &u);		\
> +		p;						\
> +		p = of_prop_next_u32(prop, p, &u))
> +
> +#define of_property_for_each_string(np, propname, prop, s)	\
> +	for (prop = of_find_property(np, propname, NULL),	\
> +		s = of_prop_next_string(prop, NULL);		\
> +		s;						\
> +		s = of_prop_next_string(prop, s))
> +
>  #if defined(CONFIG_PROC_FS) && defined(CONFIG_PROC_DEVICETREE)
>  extern void proc_device_tree_add_node(struct device_node *, struct proc_dir_entry *);
>  extern void proc_device_tree_add_prop(struct proc_dir_entry *pde, struct property *prop);
> -- 
> 1.8.3.1
> 


--===============4204231246154384897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4204231246154384897==--
