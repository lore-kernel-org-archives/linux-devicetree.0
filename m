From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/5] dt: introduce of_get_child_by_name to get
 child node by name.
Date: Mon, 17 Sep 2012 07:58:59 -0500
Message-ID: <50571E93.7010106@gmail.com>
References: <1347883101-16679-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1347883101-16679-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, bergner-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/17/2012 06:58 AM, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

Please drop the period on the subject.

> 
> This patch introduces of_get_child_by_name function to get a child node
> by its name in a given parent node.
> 
> Without this patch each driver code has to iterate the parent and do
> a string compare, However having of_get_child_by_name libary function would
> avoid code duplication, errors and is more convenient.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/of/base.c  |   25 +++++++++++++++++++++++++
>  include/linux/of.h |    2 ++
>  2 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4a1c9a..7391f8a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -391,6 +391,31 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
>  EXPORT_SYMBOL(of_get_next_available_child);
>  
>  /**
> + *	of_get_child_by_name - Find the child node by name for a given parent
> + *	@node:	parent node
> + *	@name:	child name to look for.
> + *
> + *      This function looks for child node for given matching name
> + *
> + *	Returns a node pointer if found, with refcount incremented, use
> + *	of_node_put() on it when done.
> + *	Returns NULL if node is not found.
> + */
> +

Remove blank line.

> +struct device_node *of_get_child_by_name(const struct device_node *node,
> +				const char *name)
> +{
> +	struct device_node *child;
> +
> +	for_each_child_of_node(node, child)
> +		if (child->name && (of_node_cmp(child->name, name) == 0)
> +			&& of_node_get(child))

of_get_next_child has already called of_node_get, so you don't need to
call it here.

> +			break;
> +	return child;
> +}
> +EXPORT_SYMBOL(of_get_child_by_name);
> +
> +/**
>   *	of_find_node_by_path - Find a node matching a full OF path
>   *	@path:	The full path to match
>   *
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 1b11632..7b8e3cd 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -192,6 +192,8 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
>  					     struct device_node *prev);
>  extern struct device_node *of_get_next_available_child(
>  	const struct device_node *node, struct device_node *prev);
> +extern struct device_node *of_get_child_by_name(const struct device_node *node,
> +					const char *name);
>  
>  #define for_each_child_of_node(parent, child) \
>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
> 
