From: Laurentiu Tudor <b10716-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] of: make sure of_alias is initialized before accessing
 it
Date: Mon, 8 Sep 2014 17:13:41 +0300
Message-ID: <540DB995.7040406@freescale.com>
References: <53FDE6A3.3080303@freescale.com> <20140908132956.646FEC40AE5@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140908132956.646FEC40AE5-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Laurentiu Tudor <Laurentiu.Tudor-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/08/2014 04:29 PM, Grant Likely wrote:
> On Wed, 27 Aug 2014 17:09:39 +0300, Laurentiu Tudor <b10716-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Simply swap of_alias and of_chosen initialization so
>> that of_alias ends up read first. This must be done
>> because it is accessed couple of lines below when
>> trying to initialize the of_stdout using the alias
>> based legacy method.
>>
>> [Fixes a752ee5 - tty: Update hypervisor tty drivers to                          
>> use core stdout parsing code]
>>
>> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/of/base.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d8574ad..52f8506 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1847,6 +1847,10 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>>  {
>>  	struct property *pp;
>>  
>> +	of_aliases = of_find_node_by_path("/aliases");
>> +	if (!of_aliases)
>> +		return;
>> +
>>  	of_chosen = of_find_node_by_path("/chosen");
>>  	if (of_chosen == NULL)
>>  		of_chosen = of_find_node_by_path("/chosen@0");
>> @@ -1862,10 +1866,6 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>>  			of_stdout = of_find_node_by_path(name);
>>  	}
>>  
>> -	of_aliases = of_find_node_by_path("/aliases");
>> -	if (!of_aliases)
>> -		return;
>> -
> 
> Close, but not quite. The 'if (!of_aliases)' test should not be moved.
> Only the search for of_find_node_by_path().

Eek, completely missed this. Sorry.

> I've fixed it up and applied.
 
Thanks!

---
Best Regards, Laurentiu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
