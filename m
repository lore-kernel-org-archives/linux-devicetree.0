From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers: of: check input parameter name for
 __of_find_property
Date: Tue, 15 Sep 2015 21:27:59 -0500
Message-ID: <55F8D3AF.9070503@kernel.org>
References: <1441979043-19694-1-git-send-email-van.freenix@gmail.com>
 <55F83FAC.5080002@kernel.org> <20150916001650.GA28082@linux-4gyl.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150916001650.GA28082-12w76u+6CWdQVMFFLWfSwA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/15/2015 07:16 PM, Peng Fan wrote:
> Hi Rob,
> 
> On Tue, Sep 15, 2015 at 10:56:28AM -0500, Rob Herring wrote:
>> On 09/11/2015 08:44 AM, Peng Fan wrote:
>>> Check input parameter 'name' for __of_find_property. If name is NULL,
>>> of_prop_cmp->strcasecmp may trigger panic.
>>
>> Arguably that could be a feature. Do you have a usecase where name being
>> NULL is valid and panicking is a problem?
> 
> In drivers/pinctrl/devicetree.c
> 
> 195                 propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> 196                 prop = of_find_property(np, propname, &size);
> 197                 kfree(propname);
> 198                 if (!prop)
> 199                         break;
> 
> If propname is NULL, of_find_property may trigger panic. Anyway propname should be checked
> before passing to of_find_property.

propname will only be NULL if the memory allocation failed which gives
you a big warning message. I don't think you would want to continue on
in this case.

So I'm inclined to leave this as is with passing NULL to
of_find_property to always be an error and fatal.

Rob

> I did not met panic message. I wrote this patch when I was reading the piece code.
> I think the name parameter should be checked before doing string compare.
> 
> Regards,
> Peng.
> 
>>
>> Rob
>>
>>>
>>> Signed-off-by: Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  drivers/of/base.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index 8b5a187..e41436d 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -215,7 +215,7 @@ static struct property *__of_find_property(const struct device_node *np,
>>>  {
>>>  	struct property *pp;
>>>  
>>> -	if (!np)
>>> +	if (!np || !name)
>>>  		return NULL;
>>>  
>>>  	for (pp = np->properties; pp; pp = pp->next) {
>>>
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
