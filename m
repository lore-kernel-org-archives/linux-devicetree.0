From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [RFC] pinctrl: enhance reporting of errors when loading from
 DT
Date: Wed, 25 Apr 2012 13:27:49 +0200
Message-ID: <4F97DFB5.8070307@openwrt.org>
References: <1335286387-18520-1-git-send-email-blogic@openwrt.org>
 <4F976554.3090708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F976554.3090708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

> This seems a little muddled. Why not:
>
> s = pinctrl_lookup_state_locked(...);
> if (IS_ERR(s))
>     dev_dbg(...);
> } else {
>     ret = pinctrl_select_state_locked(...);
>     if (ret) {
>         dev_err(...);
>     }
> }
>
ok

> Note that pinctrl_lookup_state_locked() failing isn't necessarily an
> error; it's quite legitimate for a pin controller to not have any states
> defined for itself, if all pinctrl states are represented in other drivers.
>
> That said, perhaps we should require all pin controllers to have dummy
> states defined?
>
> pinctrl_select_state_locked() failing means that a state was defined,
> but could not be selected - that's definitely an error.
>
> Also, dev_err() should be used in preference to pr_err().

The rest of the function used pr_*() style api. However
pinctrl_register() is passed a device pointer. I will update the patch
to use dev_err() throughout the function.


>> diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
>> @@ -144,9 +144,11 @@ static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
>>  		return -ENODEV;
>>  	}
>>  	ret = ops->dt_node_to_map(pctldev, np_config, &map, &num_maps);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		dev_err(p->dev, "failed to load mapping from DT for %s\n",
>> +			dev_name(pctldev->dev));
> Perhaps we should rely on the individual pin controller's dt_node_to_map
> function reporting the specific error - it can provide more information.

Ok, i will drop this bit


>> @@ -304,7 +305,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>>  		selector++;
>>  	}
>>  
>> -	pr_err("%s does not support function %s\n",
>> +	pr_err("%s: function \"%s\" not supported\n",
>>  	       pinctrl_dev_get_name(pctldev), function);
> That change seems to be a no-op really.
>
I will drop this bit


>> @@ -330,16 +331,21 @@ int pinmux_map_to_setting(struct pinctrl_map const *map,
>>  
>>  	ret = pinmux_func_name_to_selector(pctldev, map->data.mux.function);
>>  	if (ret < 0)
>> +		//FIXME: pinmux_func_name_to_selector is verbose
>>  		return ret;
>>  	setting->data.mux.func = ret;
>>  
>>  	ret = pmxops->get_function_groups(pctldev, setting->data.mux.func,
>>  					  &groups, &num_groups);
>>  	if (ret < 0)
>> +		//FIXME: safe to assume that get_function_groups() is verbose ?
>>  		return ret;
>> -	if (!num_groups)
>> +	if (!num_groups) {
>> +		//FIXME: we still need to check if returned data is valid
>> +		dev_err(pctldev->dev, "could not get mux groups \"%s\"",
>> +		                                map->data.mux.function);
> That's not accurate. The retrieval succeeded, but the number of groups
> the function can be selected on was zero.

Let me change the text a bit

> I think I added a bunch more error prints locally when I was debugging a
> new board. I guess I should remove the cruft from the patch and rebase
> it on top of the final version of this once you post it

I will send the final version of my patch shortly. Feel free to use it
as a basis to merge with your debug prints.

Thanks for the review,
John
