From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 09:30:00 +0100
Message-ID: <52FB3108.3000202@gmail.com>
References: <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net> <20140210110342.GA15806@visitor2.iram.es> <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net> <20140211072606.GA26514@visitor2.iram.es> <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com> <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org> <52FAA97F.4060600@gmail.com> <1392162080.6733.404.camel@snotra.buserror.net> <52FAB65C.4090201@gmail.com> <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com> <20140212052816.GA15434@pek-khao-d1.corp.ad.wrs.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212052816.GA15434-2Y/eJ/Q4tBKYoDLmhA0N63T7OC0tnCxdQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/12/2014 06:28 AM, Kevin Hao wrote:
> On Wed, Feb 12, 2014 at 10:21:58AM +1000, Stephen N Chivers wrote:
>> But, the Interrupt Controller (MPIC)
>> goes AWOL and it is down hill from there.
>>
>> The MPIC is specified in the DTS as:
>>
>>          mpic: pic@40000 {
>>                          interrupt-controller;
>>                          #address-cells = <0>;
>>                          #interrupt-cells = <2>;
>>                          reg = <0x40000 0x40000>;
>>                          compatible = "chrp,open-pic";
>>                          device_type = "open-pic";
>>                          big-endian;
>>                  };
>>
>> The board support file has the standard mechanism for allocating
>> the PIC:
>>
>>          struct mpic *mpic;
>>
>>          mpic = mpic_alloc(NULL, 0, 0, 0, 256, " OpenPIC  ");
>>          BUG_ON(mpic == NULL);
>>
>>          mpic_init(mpic);
>>
>> I checked for damage in applying the patch and it has applied
>> correctly.
>
> How about the following fix?
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ff85450d5683..ca91984d3c4b 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -730,32 +730,40 @@ out:
>   }
>   EXPORT_SYMBOL(of_find_node_with_property);
>
> +static int of_match_type_name(const struct device_node *node,
> +				const struct of_device_id *m)

I am fine with having a sub-function here, but it should rather be
named of_match_type_or_name.

> +{
> +	int match = 1;
> +
> +	if (m->name[0])
> +		match &= node->name && !strcmp(m->name, node->name);
> +
> +	if (m->type[0])
> +		match &= node->type && !strcmp(m->type, node->type);
> +
> +	return match;
> +}
[...]
> +	/* Check against matches without compatible string */
> +	m = matches;
> +	while (!m->compatible[0] && (m->name[0] || m->type[0])) {

We shouldn't check for anything else than the sentinel here.
Although I guess yours will not quit early as mine did but that
way we don't have to worry about it.

Sebastian

> +		match = of_match_type_name(node, m);
> +		if (match)
> +			return m;
> +		m++;
> +	}
> +
>   	return NULL;
>   }
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
