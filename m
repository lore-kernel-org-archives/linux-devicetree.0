From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] dt: fix some code indent issue in of.h
Date: Tue, 20 Dec 2011 12:42:05 -0600
Message-ID: <4EF0D6FD.8070406@gmail.com>
References: <1324404609-3999-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324404609-3999-1-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/20/2011 12:10 PM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Checkpatch script will report some warnings for the old coding style:
> WARNING: suspect code indent for conditional statements (8, 0)
>         for (child = of_get_next_child(parent, NULL); child != NULL; \
> [...]
> +static inline int of_get_child_count(const struct device_node *np)
> 
> Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  include/linux/of.h |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index f1a490c..95dee0a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -163,22 +163,22 @@ extern struct device_node *of_find_node_by_name(struct device_node *from,
>  	const char *name);
>  #define for_each_node_by_name(dn, name) \
>  	for (dn = of_find_node_by_name(NULL, name); dn; \
> -	     dn = of_find_node_by_name(dn, name))
> +		dn = of_find_node_by_name(dn, name))
>  extern struct device_node *of_find_node_by_type(struct device_node *from,
>  	const char *type);
>  #define for_each_node_by_type(dn, type) \
>  	for (dn = of_find_node_by_type(NULL, type); dn; \
> -	     dn = of_find_node_by_type(dn, type))
> +		dn = of_find_node_by_type(dn, type))
>  extern struct device_node *of_find_compatible_node(struct device_node *from,
>  	const char *type, const char *compat);
>  #define for_each_compatible_node(dn, type, compatible) \
>  	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
> -	     dn = of_find_compatible_node(dn, type, compatible))
> +		dn = of_find_compatible_node(dn, type, compatible))
>  extern struct device_node *of_find_matching_node(struct device_node *from,
>  	const struct of_device_id *matches);
>  #define for_each_matching_node(dn, matches) \
>  	for (dn = of_find_matching_node(NULL, matches); dn; \
> -	     dn = of_find_matching_node(dn, matches))
> +		dn = of_find_matching_node(dn, matches))
>  extern struct device_node *of_find_node_by_path(const char *path);
>  extern struct device_node *of_find_node_by_phandle(phandle handle);
>  extern struct device_node *of_get_parent(const struct device_node *node);
> @@ -187,13 +187,13 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
>  					     struct device_node *prev);
>  #define for_each_child_of_node(parent, child) \
>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
> -	     child = of_get_next_child(parent, child))
> +		child = of_get_next_child(parent, child))
>  
>  extern struct device_node *of_find_node_with_property(
>  	struct device_node *from, const char *prop_name);
>  #define for_each_node_with_property(dn, prop_name) \
>  	for (dn = of_find_node_with_property(NULL, prop_name); dn; \
> -	     dn = of_find_node_with_property(dn, prop_name))
> +		dn = of_find_node_with_property(dn, prop_name))
>  
>  extern struct property *of_find_property(const struct device_node *np,
>  					 const char *name,

The old way looks fine to me and indenting like this is commonly used in
the kernel.

Rob
