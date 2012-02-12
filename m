From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V3 1/1] dt: add of_get_child_count helper function
Date: Sun, 12 Feb 2012 14:22:04 -0600
Message-ID: <4F381F6C.1030908@gmail.com>
References: <1328980929-5423-1-git-send-email-dong.aisheng@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1328980929-5423-1-git-send-email-dong.aisheng@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dong.aisheng@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/11/2012 11:22 AM, Dong Aisheng wrote:
> Currently most code to get child count in kernel are almost same,
> add a helper to implement this function for dt to use.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> 
> ---
> Hi Rob,
> 
> Since my imx pinctrl driver series still depends on the pinctrl core dt
> binding patch which is still not in mainline, i'd like this pure dt patch
> go separately first in case others want to use.
> 

Applied for 3.4.

Rob

> changes v2->v3:
>  Addressed some people's comments:
>  * do not use assignment as expression
>  * return 0 for non-dt case
> 
> Changes v1->v2:
>  * change the name from of_get_child_number to of_get_child_count
> ---
>  include/linux/of.h |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a75a831..ae242ef 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -195,6 +195,17 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
>  	     child = of_get_next_child(parent, child))
>  
> +static inline int of_get_child_count(const struct device_node *np)
> +{
> +	struct device_node *child = NULL;
> +	int num = 0;
> +
> +	while ((child = of_get_next_child(np, child)) != NULL)
> +		num++;
> +
> +	return num;
> +}
> +
>  extern struct device_node *of_find_node_with_property(
>  	struct device_node *from, const char *prop_name);
>  #define for_each_node_with_property(dn, prop_name) \
> @@ -268,6 +279,11 @@ static inline bool of_have_populated_dt(void)
>  #define for_each_child_of_node(parent, child) \
>  	while (0)
>  
> +static inline int of_get_child_count(const struct device_node *np)
> +{
> +	return 0;
> +}
> +
>  static inline int of_device_is_compatible(const struct device_node *device,
>  					  const char *name)
>  {
