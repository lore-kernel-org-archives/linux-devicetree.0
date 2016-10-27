From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 13/13] of: Remove unused variable overlay_symbols
Date: Thu, 27 Oct 2016 09:27:37 -0700
Message-ID: <58122AF9.3040709@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-14-git-send-email-frowand.list@gmail.com>
 <27823D48-C6B1-486C-8460-9B3C33DDC62F@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27823D48-C6B1-486C-8460-9B3C33DDC62F@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 10/27/16 07:41, Pantelis Antoniou wrote:
> Hi Frank,
> 
> 
>> On Oct 25, 2016, at 23:59 , frowand.list@gmail.com wrote:
>>
>> From: Frank Rowand <frank.rowand@am.sony.com>
>>
>> This unused variable is a reminder that symbols in overlays are
>> not available to subsequent overlays.  If such a feature is
>> desired then there are several ways it could be implemented.
>>
> 
> Please don’t apply that. There’s a patch that actually imports
> the symbol table from overlays that subsequent operations
> work.
> 
> Please see:
> 
> https://patchwork.kernel.org/patch/9104701/

Thanks for the pointer!  When the import symbols patch is applied
then the comment in my patch header becomes incorrect.  I will
change the patch comment to act is if the import symbols patch
is in place.

But the node pointer that my patch removes is still not used
for anything, even if the import symbols patch is applied.

Am I missing something?


> 
>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
>> ---
>> drivers/of/resolver.c | 5 +----
>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 3f7cf569c7ea..b48d16200ccd 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
>> @@ -272,7 +272,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
>> int of_resolve_phandles(struct device_node *overlay)
>> {
>> 	struct device_node *child, *local_fixups, *refnode;
>> -	struct device_node *tree_symbols, *overlay_symbols, *overlay_fixups;
>> +	struct device_node *tree_symbols, *overlay_fixups;
>> 	struct property *prop;
>> 	const char *refpath;
>> 	phandle phandle, phandle_delta;
>> @@ -302,12 +302,9 @@ int of_resolve_phandles(struct device_node *overlay)
>> 	if (err)
>> 		goto err_out;
>>
>> -	overlay_symbols = NULL;
>> 	overlay_fixups = NULL;
>>
>> 	for_each_child_of_node(overlay, child) {
>> -		if (!of_node_cmp(child->name, "__symbols__"))
>> -			overlay_symbols = child;
>> 		if (!of_node_cmp(child->name, "__fixups__"))
>> 			overlay_fixups = child;
>> 	}
>> -- 
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Regards
> 
> — Pantelis
> 
> 
