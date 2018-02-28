From: Chintan Pandya <cpandya@codeaurora.org>
Subject: Re: [PATCH v3] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Wed, 28 Feb 2018 18:57:08 +0530
Message-ID: <ab87b605-6ec4-0b65-89ff-6232c89cb75f@codeaurora.org>
References: <1518655979-10910-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518655979-10910-1-git-send-email-frowand.list@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 2/15/2018 6:22 AM, frowand.list@gmail.com wrote:

> +static void of_populate_phandle_cache(void)
> +{
> +	unsigned long flags;
> +	u32 cache_entries;
> +	struct device_node *np;
> +	u32 phandles = 0;
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +
> +	kfree(phandle_cache);
> +	phandle_cache = NULL;
> +
> +	for_each_of_allnodes(np)
> +		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> +			phandles++;
> +
> +	cache_entries = roundup_pow_of_two(phandles);
> +	phandle_cache_mask = cache_entries - 1;
> +
> +	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
> +				GFP_ATOMIC);
> +

NULL check of phandle_cache would be good to have.

> +	for_each_of_allnodes(np)
> +		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> +			phandle_cache[np->phandle & phandle_cache_mask] = np;
> +
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +}


Chintan
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation
Collaborative Project
