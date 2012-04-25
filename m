From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] pinctrl: enhance reporting of errors when loading from
 DT
Date: Tue, 24 Apr 2012 20:45:40 -0600
Message-ID: <4F976554.3090708@wwwdotorg.org>
References: <1335286387-18520-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335286387-18520-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/24/2012 10:53 AM, John Crispin wrote:
> There are a few places in the api where the code simply returns -EINVAL when
> it finds an error. An example is pinmux_map_to_setting() which now reports an
> error if we try to match a group with a function that it does not support.
> 
> The reporting of errors in pinconf_check_ops and pinmux_check_ops now has the
> same style and is located inside the according functions and not the calling
> code.
> 
> When the map is loaded from DT but the default state can not be found we get
> an error to know that the code at least tried.
> 
> The patch also removes a stray word from one comment and a "->" from another
> for the sake of consistency.

> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c

>  	/* If we're implementing pinmuxing, check the ops for sanity */
>  	if (pctldesc->pmxops) {
>  		ret = pinmux_check_ops(pctldev);
> -		if (ret) {
> -			pr_err("%s pinmux ops lacks necessary functions\n",
> -			       pctldesc->name);
> +		if (ret)
> +			//FIXME: moved to pinmux_check_ops so we se a difference
> +			//between missing function name and missing callback

The changes at this and the next FIXME look OK to me. In order to
actually apply the patch, I think you'd need to repost without the FIXME
comments though.

> @@ -1356,8 +1353,14 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
>  		struct pinctrl_state *s =
>  			pinctrl_lookup_state_locked(pctldev->p,
>  						    PINCTRL_STATE_DEFAULT);
> +
> +		/* if it is not 0 we should not get here, clear it anyhow */
> +		ret = 0;
>  		if (!IS_ERR(s))
> -			pinctrl_select_state_locked(pctldev->p, s);
> +			ret = pinctrl_select_state_locked(pctldev->p, s);
> +		if (IS_ERR(s) || ret)
> +			pr_err("%s: failed to lookup/select default state\n",
> +				pctldesc->name);

This seems a little muddled. Why not:

s = pinctrl_lookup_state_locked(...);
if (IS_ERR(s))
    dev_dbg(...);
} else {
    ret = pinctrl_select_state_locked(...);
    if (ret) {
        dev_err(...);
    }
}

Note that pinctrl_lookup_state_locked() failing isn't necessarily an
error; it's quite legitimate for a pin controller to not have any states
defined for itself, if all pinctrl states are represented in other drivers.

That said, perhaps we should require all pin controllers to have dummy
states defined?

pinctrl_select_state_locked() failing means that a state was defined,
but could not be selected - that's definitely an error.

Also, dev_err() should be used in preference to pr_err().

> diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c

> @@ -144,9 +144,11 @@ static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
>  		return -ENODEV;
>  	}
>  	ret = ops->dt_node_to_map(pctldev, np_config, &map, &num_maps);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err(p->dev, "failed to load mapping from DT for %s\n",
> +			dev_name(pctldev->dev));

Perhaps we should rely on the individual pin controller's dt_node_to_map
function reporting the specific error - it can provide more information.

> @@ -304,7 +305,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>  		selector++;
>  	}
>  
> -	pr_err("%s does not support function %s\n",
> +	pr_err("%s: function \"%s\" not supported\n",
>  	       pinctrl_dev_get_name(pctldev), function);

That change seems to be a no-op really.

> @@ -330,16 +331,21 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
>  
>  	ret = pinmux_func_name_to_selector(pctldev, map->data.mux.function);
>  	if (ret < 0)
> +		//FIXME: pinmux_func_name_to_selector is verbose
>  		return ret;
>  	setting->data.mux.func = ret;
>  
>  	ret = pmxops->get_function_groups(pctldev, setting->data.mux.func,
>  					  &groups, &num_groups);
>  	if (ret < 0)
> +		//FIXME: safe to assume that get_function_groups() is verbose ?
>  		return ret;
> -	if (!num_groups)
> +	if (!num_groups) {
> +		//FIXME: we still need to check if returned data is valid
> +		dev_err(pctldev->dev, "could not get mux groups \"%s\"",
> +		                                map->data.mux.function);

That's not accurate. The retrieval succeeded, but the number of groups
the function can be selected on was zero.

I think I added a bunch more error prints locally when I was debugging a
new board. I guess I should remove the cruft from the patch and rebase
it on top of the final version of this once you post it.
