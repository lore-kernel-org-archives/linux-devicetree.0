From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3.6.0] of: Add missing dummy functions
Date: Wed, 17 Oct 2012 16:32:39 -0500
Message-ID: <507F23F7.5070509@gmail.com>
References: <1350469563-19345-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1350469563-19345-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/17/2012 05:26 AM, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> Some functions in of.h have dummy functions and real implementations,
> however few of them have only real implementation.
> I think to be more consistent this patch adds below dummy functions if
> for non CONFIG_OF's.
> 

Fixing these up one by one has annoyed me, but I know Grant has
generally resisted blindly creating empty functions. So I would like
Grant's comments. I'm fine with these except the ones noted below.

> 	of_find_node_by_type

This should not be used except a few places as using device_type is
generally only for true OF.

> 	of_device_is_available
> 	of_find_node_with_property

Only used in 2 places.

> 	of_find_matching_node
> 	of_find_node_by_path
> 	of_find_node_by_phandle
> 	of_get_parent
> 	of_get_next_parent
> 	of_get_next_child
> 	of_get_next_available_child
> 	of_get_child_by_name

Already have this one.

> 
> Hopefully this can eliminate the need to ifdef code in the drivers.

Sometimes we want that for drivers that can be built both for OF and !OF
and you can't optimize away all the code and data.

Rob

> 
> Reported-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  include/linux/of.h |   61 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 72843b7..51ca94a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -323,6 +323,12 @@ static inline struct device_node *of_find_node_by_name(struct device_node *from,
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_find_node_by_type(struct device_node *from,
> +	const char *type)
> +{
> +	return NULL;
> +}
> +
>  static inline bool of_have_populated_dt(void)
>  {
>  	return false;
> @@ -342,6 +348,17 @@ static inline int of_device_is_compatible(const struct device_node *device,
>  	return 0;
>  }
>  
> +static inline int of_device_is_available(const struct device_node *device)
> +{
> +	return 0;
> +}
> +
> +static inline struct device_node *of_find_node_with_property(
> +	struct device_node *from, const char *prop_name)
> +{
> +	return NULL;
> +}
> +
>  static inline struct property *of_find_property(const struct device_node *np,
>  						const char *name,
>  						int *lenp)
> @@ -357,6 +374,50 @@ static inline struct device_node *of_find_compatible_node(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_find_matching_node(
> +	struct device_node *from, const struct of_device_id *matches)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_find_node_by_path(const char *path)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_find_node_by_phandle(phandle handle)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_get_parent(const struct device_node *node)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_get_next_parent(struct device_node *node)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_get_next_child(
> +	const struct device_node *node, struct device_node *prev)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_get_next_available_child(
> +	const struct device_node *node, struct device_node *prev)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_get_child_by_name(
> +		const struct device_node *node,	const char *name)
> +{
> +	return NULL;
> +}
> +
>  static inline int of_property_read_u32_array(const struct device_node *np,
>  					     const char *propname,
>  					     u32 *out_values, size_t sz)
> 
