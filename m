From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/5] ARM: add SMP support for Broadcom mobile SoCs
Date: Fri, 04 Apr 2014 10:55:40 -0700
Message-ID: <533EF21C.6000909@codeaurora.org>
References: <1396577891-2713-1-git-send-email-elder@linaro.org> <1396577891-2713-3-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396577891-2713-3-git-send-email-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Elder <elder@linaro.org>, mporter@linaro.org, bcm@fixthebug.org, devicetree@vger.kernel.org, arnd@arndb.de
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/03/14 19:18, Alex Elder wrote:
> +
> +/*
> + * Secondary startup method setup routine to extract the location of
> + * the secondary boot register from a "cpu" or "cpus" device tree
> + * node.  Only the first seen secondary boot register value is used;
> + * any others are ignored.  The secondary boot register value must be
> + * non-zero.
> + *
> + * Returns 0 if successful or an error code otherwise.
> + */
> +static int __init of_enable_method_setup(struct device_node *node)
> +{
> +	int ret;
> +
> +	/* Ignore all but the first one specified */
> +	if (secondary_boot)
> +		return 0;
> +
> +	ret = of_property_read_u32(node, OF_SECONDARY_BOOT, &secondary_boot);
> +	if (ret)
> +		pr_err("%s: missing/invalid " OF_SECONDARY_BOOT " property\n",
> +			node->name);
> +
> +	return ret;
> +}

I don't understand why we need this. Why can't we get the secondary boot
address from the /cpus node in the smp_prepare_cpus op. It isn't that
hard to get access to the cpus node there via of_find_node_by_path().
Then we don't need patch 1 at all. If it turns out to be common stuff,
we can always have the common function live in arm common code or maybe
even be a devicetree API.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
