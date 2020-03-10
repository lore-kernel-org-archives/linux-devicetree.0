Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B432C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A31121D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGwOkmy5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCJQzn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:55:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43436 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgCJQzn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:55:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id r7so14972443ljp.10;
        Tue, 10 Mar 2020 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PMTk4pZIN5zdCpfQ8eLETIXT6rNawUuc7NXZZd6E4uY=;
        b=LGwOkmy5KQYzjhZOSktaSQcogsO6l1xY5ZrzSIbuI9RYkcrtdDto+iuOfEIZ9IDU0v
         NIVsRejDd0lko/OYiyga3pTmWoAwScRRGoF05rjaUIkpu/hOe92LMeultn+QFsRxelia
         JE29slX8yqZ+7TxgjS/dLjbRzQVVzua4YLozG0wGs0b/vN4+iFCprJMuCVvhj0IDYgxT
         4lO+kJUVyRda6RF5ws1z43g0Ick3CEAqr1SHDiAFy76E6Kw6+mBQFYn5t0G7HdI6HQwG
         i4bw3BPOgTpXMjqSU4ZkesdM1h7SlHyz/xucoXujoCDfpDdEAG4oDC86GCwyZMAcNX2Y
         dKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PMTk4pZIN5zdCpfQ8eLETIXT6rNawUuc7NXZZd6E4uY=;
        b=cr29JgFZ/h7YClD9a0uG6jsAAm2WOzXODsEb5zRKgWT9Q2wFS7DiJysTNMxSpSiHsh
         ursh6d/1LcmWDCF0rz2kYCHGf+X9gzdMt84yaA23nsDfREyseS/h/C7QsV5DwwtUbwWm
         CTKekSpBS1CgGJ1KzutKfyGmIybbQVaHz6KO/nlSV+FRUAQMbrJu+0hUiinuiZM0KLBf
         HoA0RJpGgGLtSn0DtB3ZtJOoTkMOGfu9TSfna1zkM4SJ6eS8l2Xp7nMqoM6LvDVDPzLg
         CFgeEuEUcnomJ6a9SDTp07unp8qhorh+NeJuT71twL7SE0el732wz6SFMqoATWiCwHmk
         AlcQ==
X-Gm-Message-State: ANhLgQ3+L4XyGGMmFQSOLEsRikrWwyPCfLkNLGA6mdXuP5OL4zVD/V9e
        8fXJjRCHQYL/ZCaadZFFw3o=
X-Google-Smtp-Source: ADFU+vteXWn2Yy9fC6eX4vL8/TOJUKaDZWDWIMM+zN32jCfLiBjJqO9gqnlmPn9DJKJKK5xWu5F5Gg==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr1330966ljj.275.1583859340655;
        Tue, 10 Mar 2020 09:55:40 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id t6sm5200833ljc.88.2020.03.10.09.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:55:40 -0700 (PDT)
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
Message-ID: <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
Date:   Tue, 10 Mar 2020 19:55:39 +0300
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

> +static int tegra210_emc_resume(struct device *dev)
> +{
> +	struct tegra_emc *emc = dev_get_drvdata(dev);
> +
> +	emc->emc_suspend = false;

Looks like the 'emc->emc_suspend' isn't really needed, nothing in kernel
shall touch EMC rate at this point.

Perhaps should be better to make EMC clk exlusive in order to catch
abusers, please see tegra30-emc suspend/resume for an example.

> +	clk_set_rate(emc->emc_clk, emc->emc_resume_rate);
> +
> +	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops tegra210_emc_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
> +};
What about to use the default suspend/resume level?
