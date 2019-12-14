Return-Path: <SRS0=22nm=2E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01422C43603
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 02:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D54F72073D
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 02:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kT5JfkWW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfLNCMk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 21:12:40 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38487 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfLNCMk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 21:12:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so2426274pfc.5
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 18:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:cc:to:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=VqAsPt9bELAFiBc9U8EPUlegvQWFH4OeQsw2yFpIirU=;
        b=kT5JfkWWnltIHB+KMi22oaqdi0u7b/XW08cmsNjm4rw3SijQ4hzc17kT7kk1xgsZda
         mqIMijiU6iWoQHCMyWHqU8fSBCVUg90YGHJ7ynH/UfGvk/2uvOxDff9KkUvHItY6Y7oo
         lw5NjlExuH04tyEE0FfxlhF0iAXiTscaHVst2fLNWkpEdtXzloRmwvP4Mmji6OWMneWW
         XBR2pDRcUNpAWWOmU/qgBUazLU8+aLtZnU7NxJ5l5TC3baS5oImDa1xkBINqMNiVUwhv
         WFEAlA2pGu8Qzy3P5SYElGhntwaQXriA60SGHTFhxGQ4atZ5Vr1Njc8T+6OsOIzbfSwI
         uDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=VqAsPt9bELAFiBc9U8EPUlegvQWFH4OeQsw2yFpIirU=;
        b=S4zSbSoMxyfgQoW3ECUQUq9z5wUQao5tn8pv0N1y18WcQuGXqknb1Xov4o9/03GqGH
         LwnrNIqU7fac6gKKVlUX/GUI79jgEqJVOdWvcaxWAjiZc8/QLy2Mhy74HBltlr1L+F0N
         5/optEfgDtlK0cWnAOaFCzuaS9HKHyYvO/4S1jVJChR77DZ+ZCGBmyIU59M1TkWsH84A
         5/nnCkYXlt9WukCw2cqoOc4ABuSzD24dhwidS8sd08pEXC2/F6byKKIxsfPfe8nnDONa
         AH7pA1euVxOLtuYS/JtgsY4eYYKuzgIvaRiZXUm4X+TnQyZnCcdpdHPEGleVfTDIEJi5
         C79g==
X-Gm-Message-State: APjAAAWTIA8pMjaPsnTN8J7+iAzKz3YYw7kpUDgFgCzma5a/DwAyHvj3
        geNhy94W9UXR8sgVFrm3EFYKVg==
X-Google-Smtp-Source: APXvYqz6Aiqa+GHK4u01RqHA/l0Ts2E4I0yDj82iO4jlfpVQb6dLB9g4/nePTWCgR435ZKhTeO9gWg==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr3072965pga.176.1576289559199;
        Fri, 13 Dec 2019 18:12:39 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
        by smtp.gmail.com with ESMTPSA id u123sm13088597pfb.109.2019.12.13.18.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 18:12:38 -0800 (PST)
Date:   Fri, 13 Dec 2019 18:12:38 -0800 (PST)
X-Google-Original-Date: Fri, 13 Dec 2019 18:12:36 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: [PATCH 2/2] riscv: cacheinfo: Add support to determine no. of L2 cache way enabled
CC:     robh+dt@kernel.org, mark.rutland@arm.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, bmeng.cn@gmail.com, allison@lohutok.net,
        alexios.zavras@intel.com, Atish Patra <Atish.Patra@wdc.com>,
        tglx@linutronix.de, Greg KH <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, yash.shah@sifive.com
To:     yash.shah@sifive.com
In-Reply-To: <1575890706-36162-3-git-send-email-yash.shah@sifive.com>
References: <1575890706-36162-3-git-send-email-yash.shah@sifive.com>
  <1575890706-36162-1-git-send-email-yash.shah@sifive.com>
Message-ID: <mhng-a1ba4b8a-4c6a-43e9-a87a-f8bbbe3555d8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 09 Dec 2019 03:25:06 PST (-0800), yash.shah@sifive.com wrote:
> In order to determine the number of L2 cache ways enabled at runtime,
> implement a private attribute using cache_get_priv_group() in cacheinfo
> framework. Reading this attribute ("number_of_ways_enabled") will return
> the number of enabled L2 cache ways at runtime.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/include/asm/sifive_l2_cache.h |  2 ++
>  arch/riscv/kernel/cacheinfo.c            | 31 +++++++++++++++++++++++++++++++
>  drivers/soc/sifive/sifive_l2_cache.c     |  5 +++++
>  3 files changed, 38 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sifive_l2_cache.h b/arch/riscv/include/asm/sifive_l2_cache.h
> index 04f6748..217a42f 100644
> --- a/arch/riscv/include/asm/sifive_l2_cache.h
> +++ b/arch/riscv/include/asm/sifive_l2_cache.h
> @@ -10,6 +10,8 @@
>  extern int register_sifive_l2_error_notifier(struct notifier_block *nb);
>  extern int unregister_sifive_l2_error_notifier(struct notifier_block *nb);
>
> +int sifive_l2_largest_wayenabled(void);

I thought the plan was to get this stuff out of arch/riscv?  It looks like it
only got half-way done.

> +
>  #define SIFIVE_L2_ERR_TYPE_CE 0
>  #define SIFIVE_L2_ERR_TYPE_UE 1
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 4c90c07..29bdb21 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -7,6 +7,7 @@
>  #include <linux/cpu.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <asm/sifive_l2_cache.h>
>
>  static void ci_leaf_init(struct cacheinfo *this_leaf,
>  			 struct device_node *node,
> @@ -16,6 +17,36 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
>  	this_leaf->type = type;
>  }
>
> +#ifdef CONFIG_SIFIVE_L2
> +static ssize_t number_of_ways_enabled_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	return sprintf(buf, "%u\n", sifive_l2_largest_wayenabled());
> +}
> +
> +static DEVICE_ATTR_RO(number_of_ways_enabled);
> +
> +static struct attribute *priv_attrs[] = {
> +	&dev_attr_number_of_ways_enabled.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group priv_attr_group = {
> +	.attrs = priv_attrs,
> +};
> +
> +const struct attribute_group *
> +cache_get_priv_group(struct cacheinfo *this_leaf)
> +{
> +	/* We want to use private group for L2 cache only */
> +	if (this_leaf->level == 2)
> +		return &priv_attr_group;
> +	else
> +		return NULL;
> +}
> +#endif /* CONFIG_SIFIVE_L2 */
> +
>  static int __init_cache_level(unsigned int cpu)
>  {
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
> index a9ffff3..f1a5f2c 100644
> --- a/drivers/soc/sifive/sifive_l2_cache.c
> +++ b/drivers/soc/sifive/sifive_l2_cache.c
> @@ -107,6 +107,11 @@ int unregister_sifive_l2_error_notifier(struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(unregister_sifive_l2_error_notifier);
>
> +int sifive_l2_largest_wayenabled(void)
> +{
> +	return readl(l2_base + SIFIVE_L2_WAYENABLE);
> +}
> +
>  static irqreturn_t l2_int_handler(int irq, void *device)
>  {
>  	unsigned int add_h, add_l;
