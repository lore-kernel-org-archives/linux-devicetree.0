From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: match by compatible property first
Date: Wed, 13 Jun 2012 10:37:53 -0500
Message-ID: <4FD8B3D1.1090706@gmail.com>
References: <1334917312-21192-1-git-send-email-thierry.reding@avionic-design.de>
 <4F9160DF.70308@gmail.com>
 <20120420132839.GB25662@avionic-0098.adnet.avionic-design.de>
 <20120613070138.GA5670@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120613070138.GA5670-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/13/2012 02:01 AM, Thierry Reding wrote:
> On Fri, Apr 20, 2012 at 03:28:40PM +0200, Thierry Reding wrote:
>> * Rob Herring wrote:
>>> On 04/20/2012 05:21 AM, Thierry Reding wrote:
>> [...]
>>>> +const struct of_device_id *of_match_compat(const struct of_device_id *matches,
>>>> +					   const char *compat)
>>>> +{
>>>> +	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
>>>
>>> You are not using name or type here, so you can remove.
>>
>> They are still required so we don't stop early. A match table could well have
>> a first entry that has name and/or type set but not compatible, followed by a
>> second entry with only compatible set.
>>
>>>>  	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
>>>
>>> You don't need to check compatible ptr here.
>>
>> For similar reasons as above this check needs to stay in.

Yes, you're right.

>>
>>>
>>>>  		int match = 1;
>>>>  		if (matches->name[0])
>>>> @@ -532,10 +558,7 @@ const struct of_device_id *of_match_node(const struct of_device_id *matches,
>>>>  		if (matches->type[0])
>>>>  			match &= node->type
>>>>  				&& !strcmp(matches->type, node->type);
>>>> -		if (matches->compatible[0])
>>>> -			match &= of_device_is_compatible(node,
>>>> -						matches->compatible);
>>>> -		if (match)
>>>> +		if (match && !matches->compatible[0])
>>>>  			return matches;
>>>>  		matches++;
>>>>  	}
>>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>>> index bd52d83..23b5061 100644
>>>> --- a/include/linux/of.h
>>>> +++ b/include/linux/of.h
>>>> @@ -231,6 +231,8 @@ extern const void *of_get_property(const struct device_node *node,
>>>>  
>>>>  extern int of_n_addr_cells(struct device_node *np);
>>>>  extern int of_n_size_cells(struct device_node *np);
>>>> +extern const struct of_device_id *of_match_compat(
>>>> +	const struct of_device_id *matches, const char *compat);
>>>
>>> Why does this need to be a public function?
>>
>> It doesn't. I just thought it might be handy to have. I can make it static if
>> you don't think it's useful generally.
>>
>> Thierry
> 
> Rob,
> 
> Do you have further comments on this?

Only that I still think of_match_compat should be static. Please respin
and I'll apply it.

Rob
