From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] of: base: Fix english spelling in
 of_alias_get_alias_list()
Date: Thu, 27 Sep 2018 08:52:49 +0200
Message-ID: <5d8b8daa-3953-a22d-3cab-5bd1764e4602@xilinx.com>
References: <b64be28f7705a91fcb84b9c59ca830e057c71d96.1537959997.git.michal.simek@xilinx.com>
 <dfd94b86-0a71-a2c4-449d-7f06ff3ae30e@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dfd94b86-0a71-a2c4-449d-7f06ff3ae30e@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, monstr@monstr.eu, gregkh@linuxfoundation.org, geert@linux-m68k.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 26.9.2018 17:34, Randy Dunlap wrote:
> On 9/26/18 4:06 AM, Michal Simek wrote:
>> Fix english spelling in of_alias_get_alias_list().
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>> Greg: Please apply it on the top of tty-next because patch is going via
>> your tree.
> 
> Maybe a few more fixes first...
> 
>> ---
>>  drivers/of/base.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 33011b88ed3f..ffcbb2963ba2 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1948,7 +1948,7 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>>   * @matches:	Array of OF device match structures to search in
>>   * @stem:	Alias stem of the given device_node
>>   * @bitmap:	Bitmap field pointer
>> - * @nbits:	Maximum number of alias ID which can be recorded it bitmap
>> + * @nbits:	Maximum number of alias IDs which can be recorded it bitmap
> 
> s/it/in/
> 
>>   *
>>   * The function travels the lookup table to record alias ids for the given
>>   * device match structures and alias stem.
>> @@ -1971,7 +1971,7 @@ int of_alias_get_alias_list(const struct of_device_id *matches,
>>  			 __func__, app->stem, app->id);
>>  
>>  		if (strcmp(app->stem, stem) != 0) {
>> -			pr_debug("%s: stem comparison doesn't passed %s\n",
>> +			pr_debug("%s: stem comparison didn't pass %s\n",
>>  				 __func__, app->stem);
>>  			continue;
>>  		}
>> @@ -1986,7 +1986,7 @@ int of_alias_get_alias_list(const struct of_device_id *matches,
>>  			pr_debug("%s: Allocated ID %d\n", __func__, app->id);
>>  			set_bit(app->id, bitmap);
>>  		}
>> -		/* Alias exist but it not compatible with matches */
>> +		/* Alias exists but it not compatible with matches */
> 
> s/it/is/
> 
>>  	}
>>  	mutex_unlock(&of_mutex);
>>  
>>
> 
> thanks,

I will include these fixes to v2 and will wait for Geert in connection
to discussion we had in origin thread.

Thanks,
Michal
