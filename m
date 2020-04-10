Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6E5C2BB85
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 20:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71AB2206E9
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 20:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYxrDAPP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDJUtW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 16:49:22 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37315 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJUtW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 16:49:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so3152467ljd.4;
        Fri, 10 Apr 2020 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RtQay0p36yFoHHnkkvAKDptGQmyg6Qy1Y9oDL+R6OJs=;
        b=JYxrDAPPO7YcJQGQmfkDNy78riHDRnxnk+1BuPlS7InbdQdxLTvIz8OEPZiFpOU0X9
         ADT7Ft9odOWbzW9finqAX/+rKSLfnVSeR5Xa9J4oDuoZc8WSgiBXwkPvTWNMK5QpoSzN
         1xg345q38jbniCJJ64eiSGzaeGA44fhbyi5H4thk4LUHgSXt58daDdfyPUcXv+0GjcGe
         F4H5APl8W/ee6OkZLAkUhs4j7OpWcn9y25FlGh93o4+Mu+UEgQH6tmw2E6EOi8MUeF2i
         2aPAZ/DjIos0ISMXOdtcg0a828pLKVjCvFrg05ZPhPQe7PmFCw5csXUaxkljrQ3P9JVy
         8uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RtQay0p36yFoHHnkkvAKDptGQmyg6Qy1Y9oDL+R6OJs=;
        b=gymH4iAYrdD89KTYxC7WsOj2+8OzRw1wqKWTsYOEDtTAQ/lO0Gc5uA718WquVOybf/
         ZDqBc+OOqj+AZJtMesbHUWTt3KooayzWAuuuEJoxG+tvSy3evPfZ4pgTyBRIgz1uUb04
         XTXhh8hELz9jNWpVy74l34oonHj4gBFS7ReqP6ILsLebGCL4IdVitzqDxoNBpbDe7O/z
         smE8L+CUgBrm4SUQlocx3j3YLRzPbCeJqQdleWLHr8tQoiJTFHG9r85IZvUgT3TxKeaf
         uOaFCVuFYjVPywu3+1V1EGkg+7iQpnxvQQkYBXTwCcMYcYW57uae/ntlmXcxphLB7PrR
         hDbQ==
X-Gm-Message-State: AGi0PuZYmY40FIslkrKFrT/6VwBzsdF15vQjfYdZmrZYEgvM9PwZeP8U
        DpZGYvK+elY7aLmd9ku2n3U=
X-Google-Smtp-Source: APiQypKfmrULbbonnzAShBhrnEqTia/HO1FQk3qKGk14wKYdR6iNAa6QFkvw+u0KqefzQ/PvT2QTPg==
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr3909160ljm.117.1586551760333;
        Fri, 10 Apr 2020 13:49:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v9sm1775739ljj.31.2020.04.10.13.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 13:49:19 -0700 (PDT)
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c@gmail.com>
Date:   Fri, 10 Apr 2020 23:49:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +int tegra210_clk_emc_attach(struct clk *clk,
> +			    struct tegra210_clk_emc_provider *provider)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct device *dev = provider->dev;
> +	unsigned int i;
> +	int err;
> +
> +	if (!try_module_get(provider->owner))
> +		return -ENODEV;

Is the EMC driver module bumping its own refcount by itself?

In the other patch I already suggested that the EMC module should be
disallowed to be unloaded once it has been loaded, seems you're already
doing it. Correct?
