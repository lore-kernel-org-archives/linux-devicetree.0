Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B185DC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88CD921D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8W9ZO9+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCJQ3r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:29:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42507 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCJQ3q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:29:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so14851178ljp.9;
        Tue, 10 Mar 2020 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=30exkwIozzMIemffj/fYVWOVstIzogFHegkU2NrMGIE=;
        b=H8W9ZO9+fAGGf0mi/x/aCZiEBxURB0+pmELuWYmMuZPzOqbCYjsT1aaTKRyPLWOJpF
         +xkWeEUdt6E1tTcRphwtmdbIjgWgM770EETZWV7SIuAVQ15anlGCOW/PKSfu5yRS/QII
         +Dso1YQbw0Gtgzn4iOolrqQ236Q0FaDAw2LA/0Z4erR8G71YkWhxe84I4OeBN56kK3Iz
         xzSJhtL9p0Om74cjaYupwdL0eyo9zUxLUlBIf0ZZbujcjnXId24dr7CVy4K89wyM8KrA
         qQ6v8y31COx5LKaTPPPjlmj/UQKfVgh73immy/UdBv/VpuvmfMT1toAFBZ4JHfLwtyq7
         KTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=30exkwIozzMIemffj/fYVWOVstIzogFHegkU2NrMGIE=;
        b=LHK0lnAYFSMv2T8eOmxdVKWmygmUV1crpkTJ3jSTIKy+vMXdBNeZdBPYRtRWwm/EDj
         u3PD5zbKkQCR0Sb5Pc9Z5de0iMskhvnc00qFyUtB8uI98Zok883FSqvRsPwYN7nHZ+eK
         jnRgaoWjjTwoimU1dJXjNNkkeGJbN+XabqQMBMjnoDaJhp4Do5+mmYaVebwdPgAkf5Sg
         OsR8j2XqIsZGsO0mwz2aP6xprLZlEJZTFGyXm+70G6hRoK3f1FracONKh5JwhZ8dfIhv
         0GUpp2IZwFqnLIIkA823gJNy/lEAz/RNg5kysudGw7JKzOlABKh1fMNSf6OtyKxXeIu1
         54xA==
X-Gm-Message-State: ANhLgQ1pWFY8FewJq3yeyKxyJchDaSn2kHM80rGA4zrFdUalZMXYi8z6
        dVVGNM/b4aTYhh5oOXcqHKs=
X-Google-Smtp-Source: ADFU+vvdTpxrjULX838dUbvtkil6NodhyPbfHR+o/rMELhCGItwMF1ZTV2oG4p09hAYaoXQGNe34Bg==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr12994367lji.273.1583857784214;
        Tue, 10 Mar 2020 09:29:44 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id z21sm14776415lfd.67.2020.03.10.09.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:29:43 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3b583202-50d0-145c-d60f-91bd646008ad@gmail.com>
Date:   Tue, 10 Mar 2020 19:29:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup

...
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_attach);
> +
> +void tegra210_clk_emc_detach(struct clk *clk)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(__clk_get_hw(clk));
> +
> +	emc->provider = NULL;
> +}
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_detach);...
> +config TEGRA210_EMC
> +	bool "NVIDIA Tegra210 External Memory Controller driver"


I'd remove all the exports for now, given that the driver is built-in.
