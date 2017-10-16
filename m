From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated
 property
Date: Sun, 15 Oct 2017 23:07:42 -0700
Message-ID: <59E44CAE.8050600@gmail.com>
References: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <1507864056-52089-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <59E13876.5020801@gmail.com>
 <VI1PR07MB342187128B48F66C464401A2A24F0@VI1PR07MB3421.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR07MB342187128B48F66C464401A2A24F0-ErKcd1u/gBOORytiVngBPTzdlHkvsOLVvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wang, Alan 1. (NSB - CN/Hangzhou)" <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

It is Rob's choice of which order to take the patches in.

Either order, it will be a trivial fixup to the second patchset
to go in.

-Frank


On 10/15/17 19:35, Wang, Alan 1. (NSB - CN/Hangzhou) wrote:
> Hi Frank,
> 
> Could I continue to send my patch since conflict with your patches? Or I have to wait for your patches merged? Thanks.
> 
> -----Original Message-----
> From: Frank Rowand [mailto:frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org] 
> Sent: Saturday, October 14, 2017 6:05 AM
> To: Wang, Alan 1. (NSB - CN/Hangzhou) <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>; Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated property
> 
> Hi Rob,
> 
> On 10/12/17 20:07, Lixin Wang wrote:
>> From: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
>>
>> Hello,
>>
>> Sorry It was my fault in last email that wrote the wrong subject and sign off name.
>> Correct them this time.
>> Thanks
>>
>> Function of_changeset_add_property or of_changeset_update_property may 
>> fails. In this case the property just allocated is never deallocated.
>>
>> Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
>> ---
>>  drivers/of/overlay.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c index 
>> 8ecfee3..af3b9a1 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -162,6 +162,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>>  		bool is_symbols_node)
>>  {
>>  	struct property *propn = NULL, *tprop;
>> +	int ret = 0;
>>  
>>  	/* NOTE: Multiple changes of single properties not supported */
>>  	tprop = of_find_property(target, prop->name, NULL); @@ -186,10 
>> +187,16 @@ static int of_overlay_apply_single_property(struct 
>> of_overlay *ov,
>>  
>>  	/* not found? add */
>>  	if (tprop == NULL)
>> -		return of_changeset_add_property(&ov->cset, target, propn);
>> -
>> -	/* found? update */
>> -	return of_changeset_update_property(&ov->cset, target, propn);
>> +		ret = of_changeset_add_property(&ov->cset, target, propn);
>> +	else /* found? update */
>> +		ret = of_changeset_update_property(&ov->cset, target, propn);
>> +
>> +	if (ret) {
>> +		kfree(propn->name);
>> +		kfree(propn->value);
>> +		kfree(propn);
>> +	}
>> +	return ret;
>>  }
>>  
>>  static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>>
> 
> Just a heads up.
> 
> This will conflict with my patch series "[PATCH 00/12] of: overlay: clean up device tree overlay code" [1].  The issue that Lixin has identified will still remain after applying my patch series, and can be fixed in the same manner as his patch, just different context, including variable names.
> 
> [1] https://lkml.org/lkml/2017/10/2/679
> 
> -Frank
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
