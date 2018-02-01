From: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Thu, 1 Feb 2018 12:15:39 +0530
Message-ID: <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517429142-25727-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2/1/2018 1:35 AM, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

> +
> +static void of_populate_phandle_cache(void)
> +{
> +	unsigned long flags;
> +	phandle max_phandle;
> +	u32 nodes = 0;
> +	struct device_node *np;
> +
> +	if (phandle_cache)
> +		return;
> +
> +	max_phandle = live_tree_max_phandle();
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +
> +	for_each_of_allnodes(np)
> +		nodes++;
> +
> +	/* sanity cap for malformed tree */
> +	if (max_phandle > nodes)
> +		max_phandle = nodes;
Shouldn't we speak up about this in kernel log ? May be WARN_ON() ?

> +
> +	phandle_cache = kzalloc((max_phandle + 1) * sizeof(*phandle_cache),
> +				GFP_KERNEL);
kzalloc (might_sleep) in critical context will break.

Anyways, will fix this locally and share test results.

Thanks,
Chintan

-- 
Qualcom India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation
Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
