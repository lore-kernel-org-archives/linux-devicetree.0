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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2CAC18E5C
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3349020848
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgzsxr6o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgCJQ0d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:26:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43610 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgCJQ0c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:26:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id q9so4757287lfc.10;
        Tue, 10 Mar 2020 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3kZ96VsUJ4A3yK6VGR9AXLTuIfooSdtJ0HnhKEGe9Fw=;
        b=Lgzsxr6oMFzOsPxY9dqSyyz+TWPWYZAYaIZybxHwPbTDTnpTfhcf8T7cmTQLxxeocf
         JFBzSHHXm9Id0YNDU2fxUGwLkp9N/UdZqQjoe9REJMwJvhVqE1a1wz3Yu2Kc45aDoebD
         p3MZ6O+MRPBq21lDU2CDWhIHursel7f6T21qSG9f+QLlQuVzLaZ200WMZjHJNXFknaHF
         V5IpTSiTfmThvMfZqAwsF97GR/Kgxoc03rpn5/BdIijvGI2RosWcR+V391wkXb3d51lW
         kNtc1sFbVEyZlKhAuMIG68F4XkLMlHf1sOzz+Al9dmAeCr7HI+efqXyIdHlcWa4Hx5tQ
         2/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3kZ96VsUJ4A3yK6VGR9AXLTuIfooSdtJ0HnhKEGe9Fw=;
        b=rze8gPoAEpSDV8xhq/2NLKRLEImbUkPtpiTbKKlcnglGA2Sz3jMyxYsNf/QeHiKViH
         U7RYQtRTu42E6FeQ/FVkNaXzkyCmb+bHZ4lpLuWLUFxJpXh9TwITPbkWUAxifIbeGqCi
         4x36lBogWyErRlnKpPYqr1ifdzyPM4XcD+Q8DRaAeRLUtU2j5stnElBIAk/xzIsSZIUh
         jmnSd3heO1qEqXoWzTxGT1Mf3mO43Hi48o0A5vj0vdRo7lLQubWeiBGh1ncm6v8IzESA
         vQi0RNIhPXZuUzPYVkotzWNRfj/i5ONK4RykY2J4hzRDhY0IQAABeLRG/pkZOMFfkHe8
         hpEQ==
X-Gm-Message-State: ANhLgQ2vPd0gtCLLwSe31QMfHFkJwqtKCPVGUznsxF58UWnZD6X8x3tF
        eBVhV/vGAsUKtgk8eCp82Ow=
X-Google-Smtp-Source: ADFU+vv2oMyShABl/4K04lOItrbsFoT02OEztRR3TdqYw5HWhLqIU0OqmWKQc+hKqbxT2Y49HNphaA==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr12918101lfk.112.1583857589703;
        Tue, 10 Mar 2020 09:26:29 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id w24sm22958192ljh.26.2020.03.10.09.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:26:29 -0700 (PDT)
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
Message-ID: <88d18719-b6dd-98d0-e147-f89eed2f3f0c@gmail.com>
Date:   Tue, 10 Mar 2020 19:26:28 +0300
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

> +u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
> +{
> +	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
> +}

static u32 emc_readl()

> +u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
> +			    unsigned long offset)

static u32 emc_readl_per_ch()
