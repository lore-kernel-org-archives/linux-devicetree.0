From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] OF: base: match each node compatible against all given
 matches first
Date: Tue, 03 Dec 2013 23:55:07 +0100
Message-ID: <529E614B.3070307@gmail.com>
References: <1385663785-8643-1-git-send-email-sebastian.hesselbarth@gmail.com> <1386078720-8756-1-git-send-email-sebastian.hesselbarth@gmail.com> <alpine.SOC.1.00.1312032210480.25191@math.ut.ee>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.SOC.1.00.1312032210480.25191-ptEonEWSGqKptlylMvRsHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/03/2013 09:14 PM, Meelis Roos wrote:
>> Currently, of_match_node compares each given match against all node's
>> compatible strings with of_device_is_compatible.
>>
>> To achieve multiple compatible strings per node with ordering from
>> specific to generic, this requires given matches to be ordered from
>> specific to generic. For most of the drivers this is not true and also
>> an alphabetical ordering is more sane there.
>>
>> Therefore, this patch modifies of_match_node to match each of the node's
>> compatible strings against all given matches first, before checking the
>> next compatible string. This implies that node's compatibles are ordered
>> from specific to generic while given matches can be in any order.
>
> I think I am on the CC: list because of a CPU detection problem report
> on sparc64 (183912d352a242a276a7877852f107459a13aff9 (of: move
> of_get_cpu_node implementation to DT core library) caused trouble and

The reason you are on Cc is that Thierry added you on last patch
version. I cannot see how above commit should be related with this
one, but maybe Thierry can comment on it.

> was reverted). So while your V2 patch does not cause any visible harm on
> the same Sun E3500, my gut feeling is that an additional patch would be
> needed to actually test it (a patch like
> 183912d352a242a276a7877852f107459a13aff9).

This patch deals with matching a node with more than one compatible
string on a (unordered) list of matches. Although not related to your
issue, it is good to hear that it causes no harm on DT-mature archs :)

I tested it with ARM and l2x0 cache controllers, where the specific
of_device_id (marvell,tauros3-cache) is sorted after the generic
one (arm,pl310-cache). The corresponding node's property is
compatible = "marvell,tauros3-cache", "arm,pl310-cache".

Without this patch, of_match_node always hits the first match that
equals _any_ of the above compatible strings. With this patch, it
hits the matches _in order_ of the compatible strings.

> Is this correct or am I missing something?

Thierry?

>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Changelog:
>> v1->v2:
>> - Allow checks against nodes with no compatible (Reported by Rob Herring)
>> - Add some comments
>>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
>> Cc: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   drivers/of/base.c |   53 +++++++++++++++++++++++++++++++++++++----------------
>>   1 files changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index f807d0e..8d007d8 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -731,24 +731,42 @@ static
>>   const struct of_device_id *__of_match_node(const struct of_device_id *matches,
>>   					   const struct device_node *node)
>>   {
>> +	const char *cp;
>> +	int cplen, l;
>> +
>>   	if (!matches)
>>   		return NULL;
>>
>> -	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
>> -		int match = 1;
>> -		if (matches->name[0])
>> -			match &= node->name
>> -				&& !strcmp(matches->name, node->name);
>> -		if (matches->type[0])
>> -			match &= node->type
>> -				&& !strcmp(matches->type, node->type);
>> -		if (matches->compatible[0])
>> -			match &= __of_device_is_compatible(node,
>> -							   matches->compatible);
>> -		if (match)
>> -			return matches;
>> -		matches++;
>> -	}
>> +	cp = __of_get_property(node, "compatible", &cplen);
>> +	do {
>> +		const struct of_device_id *m = matches;
>> +
>> +		/* Check against matches with current compatible string */
>> +		while (m->name[0] || m->type[0] || m->compatible[0]) {
>> +			int match = 1;
>> +			if (m->name[0])
>> +				match &= node->name
>> +					&& !strcmp(m->name, node->name);
>> +			if (m->type[0])
>> +				match &= node->type
>> +					&& !strcmp(m->type, node->type);
>> +			if (m->compatible[0])
>> +				match &= cp
>> +					&& !of_compat_cmp(m->compatible, cp,
>> +							strlen(m->compatible));
>> +			if (match)
>> +				return m;
>> +			m++;
>> +		}
>> +
>> +		/* Get node's next compatible string */
>> +		if (cp) {
>> +			l = strlen(cp) + 1;
>> +			cp += l;
>> +			cplen -= l;
>> +		}
>> +	} while (cp && (cplen > 0));
>> +
>>   	return NULL;
>>   }
>>
>> @@ -757,7 +775,10 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
>>    *	@matches:	array of of device match structures to search in
>>    *	@node:		the of device structure to match against
>>    *
>> - *	Low level utility function used by device matching.
>> + *	Low level utility function used by device matching. Matching order
>> + *	is to compare each of the node's compatibles with all given matches
>> + *	first. This implies node's compatible is sorted from specific to
>> + *	generic while matches can be in any order.
>>    */
>>   const struct of_device_id *of_match_node(const struct of_device_id *matches,
>>   					 const struct device_node *node)
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
