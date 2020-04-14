Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18F4C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E8612076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpMEIu6e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633292AbgDNUjv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633288AbgDNUjp (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:39:45 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEE6C061A0C;
        Tue, 14 Apr 2020 13:39:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d8so1295239ljo.6;
        Tue, 14 Apr 2020 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=khTmp2TYHsRQBvVJOtQBRGE8HXfWWnh3qR1G0Y1hx2w=;
        b=WpMEIu6eM7FZWqOFDcKbvrCKcHbPw3WcuHFI4BxHyZ93xpuhcnnQYqgHNxBg4Ufyih
         AkXXlW+huvXJV0YfhZ2g4lbnpwTOyfDGTpkiqZErm9xItkhvHL14lNZYLAD6HjqekFtK
         QCiCWekjo3Yq7rD3OKGt7KeJ5uIdBnVsgT9kNJDkKSocvlyUdbwtrkkYJGgpA5LV4T/T
         +Ulz7lJ1oRXDP8DxCNCfwIqr1wmQ7e/Z2xj/ci87Oot5xlkd6NZ+0gDl4BxwrYyk0gHo
         +3WaTaMEFSGjT8XrKKlgzS44+xKAsErFDSA5gcTcrHRKMe8Uo///Ceg/LxYXN/0+Doqx
         Q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=khTmp2TYHsRQBvVJOtQBRGE8HXfWWnh3qR1G0Y1hx2w=;
        b=koN5MU7VfBMwnZK1VHUXtj17Y5bY/Cj98bxxL0UdMtRinRr/az3l3xGC5dtnt2CKjV
         Vft7pY8+MpNp7pqJvOjOaAt7PFyg5sJn0Bm8920fvdM7ecz5X3KQMZ00ATqAV0Cjsb2s
         WkvPE064xNmETeQug255YGk1xN57Tvc50KdILlAEEj8KKNLudLR60LAl8I4UobUzguHs
         XyIIUryTDC9HUGxNZwQmsM+wFfia10+XzgfdTE4Q5VEwUb8bcbEyganhz1f3j72MttM1
         aMINJ/x6IGc/n9w2eunGfQGFDwgTI5IJjS+OhQ+NyyaDwTzJJSl4ooZ+cZNTSgNqjDAh
         J9VA==
X-Gm-Message-State: AGi0PuZTioRbm9nU4GNE9gF7uBHD2YcZvbO1jmrh69evXNuZXq9S/jQw
        ivICKHpCuRZscdwKPE1CAg4=
X-Google-Smtp-Source: APiQypLgro+dFqpUmd53bi7sLuYwFg61MWaD7404CUete81MLXi0Rc70RxWiF50erBpcVjZ61VKWeg==
X-Received: by 2002:a2e:6c0a:: with SMTP id h10mr1090372ljc.195.1586896783990;
        Tue, 14 Apr 2020 13:39:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r206sm11029258lff.65.2020.04.14.13.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:39:43 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <385ad42b-ebed-1783-0dd2-dc3693aeaf6b@gmail.com>
Date:   Tue, 14 Apr 2020 23:39:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static int tegra210_emc_set_rate(struct device *dev,
> +				 const struct tegra210_clk_emc_config *config)
> +{
> +	struct tegra210_emc *emc = dev_get_drvdata(dev);
> +	struct tegra210_emc_timing *timing = NULL;
> +	unsigned long rate = config->rate;
> +	s64 last_change_delay;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	if (rate == emc->last->rate * 1000UL)
> +		return 0;

Isn't it possible that parent is changed, while the rate is not? I think
the clock change should proceed in this case.
