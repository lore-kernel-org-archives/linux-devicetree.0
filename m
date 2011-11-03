From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] dt/platform: minor cleanup
Date: Thu, 03 Nov 2011 08:23:09 -0500
Message-ID: <4EB295BD.3090501@calxeda.com>
References: <1320296849-27726-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320296849-27726-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/03/2011 12:07 AM, Olof Johansson wrote:
> * Correct description of of_platform_bus_create to match implementation
> * Remove a level of indentation in of_dev_lookup
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---

Applied.

Rob

>  drivers/of/platform.c |   28 ++++++++++++++++------------
>  1 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index ed5a6d3..cbd5d70 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -310,18 +310,21 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
>  				 struct device_node *np)
>  {
>  	struct resource res;
> -	if (lookup) {
> -		for(; lookup->name != NULL; lookup++) {
> -			if (!of_device_is_compatible(np, lookup->compatible))
> -				continue;
> -			if (of_address_to_resource(np, 0, &res))
> -				continue;
> -			if (res.start != lookup->phys_addr)
> -				continue;
> -			pr_debug("%s: devname=%s\n", np->full_name, lookup->name);
> -			return lookup;
> -		}
> +
> +	if (!lookup)
> +		return NULL;
> +
> +	for(; lookup->name != NULL; lookup++) {
> +		if (!of_device_is_compatible(np, lookup->compatible))
> +			continue;
> +		if (of_address_to_resource(np, 0, &res))
> +			continue;
> +		if (res.start != lookup->phys_addr)
> +			continue;
> +		pr_debug("%s: devname=%s\n", np->full_name, lookup->name);
> +		return lookup;
>  	}
> +
>  	return NULL;
>  }
>  
> @@ -329,8 +332,9 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
>   * of_platform_bus_create() - Create a device for a node and its children.
>   * @bus: device node of the bus to instantiate
>   * @matches: match table for bus nodes
> - * disallow recursive creation of child buses
> + * @lookup: auxdata table for matching id and platform_data with device nodes
>   * @parent: parent for new device, or NULL for top level.
> + * @strict: require compatible property
>   *
>   * Creates a platform_device for the provided device_node, and optionally
>   * recursively create devices for all the child nodes.
