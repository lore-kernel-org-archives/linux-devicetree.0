Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF76C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DF7A20863
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfK0S0y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 13:26:54 -0500
Received: from foss.arm.com ([217.140.110.172]:51540 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0S0y (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Nov 2019 13:26:54 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38F4831B;
        Wed, 27 Nov 2019 10:26:54 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DEC83F6C4;
        Wed, 27 Nov 2019 10:26:53 -0800 (PST)
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-4-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <df1f3912-4096-bc96-e65a-5db1593ad8f4@arm.com>
Date:   Wed, 27 Nov 2019 18:26:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119231912.12768-4-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/2019 23:19, Mike Leach wrote:
> Adds in sysfs programming support for the CTI function register sets.
> Allows direct manipulation of channel / trigger association registers.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../hwtracing/coresight/coresight-cti-sysfs.c | 362 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-cti.c   |  19 +
>   drivers/hwtracing/coresight/coresight-cti.h   |   5 +
>   3 files changed, 386 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 507f8eb487fe..02d3ee0c1278 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -109,6 +109,362 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
>   	NULL,
>   };
>   
> +/* CTI low level programming registers */
> +
> +/*
> + * Show a simple 32 bit value if enabled and powered.
> + * If inaccessible & pcached_val not NULL then show cached value.
> + */

Also I am not sure if it makes sense to mention that the value is cached.

> +static ssize_t cti_reg32_show(struct device *dev, char *buf,
> +			      u32 *pcached_val, int reg_offset)
> +{
> +	u32 val = 0;
   +	char *state = "";

> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct cti_config *config = &drvdata->config;
> +
> +	spin_lock(&drvdata->spinlock);
> +	if ((reg_offset >= 0) && CTI_PWR_ENA(config)) {

minor nit: Personally I don't like the naming here. This could simply 
be: cti_accessible(config) , may be defined as a static inline function
instead of a macro:

static inline bool cti_accessible(struct cti_drvdata *drvdata)
{
	struct cti_config *cfg = &drvdata->config;

	return cfg->hw_powered && cfg->hw_enabled;
}


> +		CS_UNLOCK(drvdata->base);
> +		val = readl_relaxed(drvdata->base + reg_offset);
> +		if (pcached_val)
> +			*pcached_val = val;
> +		CS_LOCK(drvdata->base);
> +	} else if (pcached_val) {
> +		val = *pcached_val;

   +		state = " (cached)";
> +	}
> +	spin_unlock(&drvdata->spinlock);
> +	return scnprintf(buf, PAGE_SIZE, "%#x\n", val);
   +	return scnprintf(buf, PAGE_SIZE, "%#x%s\n", val, state);

> +}
> +
> +/*
> + * Store a simple 32 bit value.
> + * If pcached_val not NULL, then copy to here too,
> + * if reg_offset >= 0 then write through if enabled.
> + */
> +static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> +			       size_t size, u32 *pcached_val, int reg_offset)


> +static ssize_t appclear_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	unsigned long val;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct cti_config *config = &drvdata->config;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +
> +	/* a 1'b1 in appclr clears down the same bit in appset*/

nit: a 0b1 ?

> +	config->ctiappset &= ~val;
> +
> +	/* write through if enabled */
> +	if (CTI_PWR_ENA(config))
> +		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_WO(appclear);
> +

Otherwise looks good to me.

Suzuki
