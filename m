Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B3C54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 13:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3D5E2074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 13:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou9NqB+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgCWNVQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 09:21:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40841 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgCWNVQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 09:21:16 -0400
Received: by mail-lf1-f66.google.com with SMTP id j17so10194577lfe.7;
        Mon, 23 Mar 2020 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xxi6l1fclcJsr5+CKBYbupw6npgtZlkO+8fmQyf+EsY=;
        b=Ou9NqB+7RrddepQ984O33P/tq2gZ5gJo2BJ57OHVBgXamswQgPXBiUlSQ+vaQtgnxi
         ytWbCwFtIoFWOcwj6qFoDy1T1YaIkmFYQurWVeuN/6avRstYoBMgeExBA/uSvgkC5Hq8
         AlhshJ0U4TDklxFMuVpM2/25MCTX52hjVKQtTvl5AVSGdUIJ2bqc66YFJ2pLPsp/5wJF
         rpMJ3MeOJd0uKOUSpY1ickWtL2rE/FrkxqdjeQc/PTWBhu4Dx+HsSOt4I33BvYLN69P1
         v9JLk6EiAeIJ6SyZW80o54wj/k3C92jaovUQ8apeyjMvjPgyLaxo0IeDXP+YpL103Dfa
         6/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xxi6l1fclcJsr5+CKBYbupw6npgtZlkO+8fmQyf+EsY=;
        b=N7AKlcHaFwA+Jbx7Y2Rye/AFUvAfncETm5/TwSGwBf/gF9X7lgVKpb8r8nBFEJdql9
         2n29nDEFKIHqDMDCJvjsISM9+DoZtap9wY/ADcKh2GNO4J65JjoGBXkdBg174ZdtQaf4
         kFbgnWRxQTVciy6hDYnZblb/ZpCH9EarMgmJ648n8mK21bYB5kmy5XiWfzQlZaCd0q1h
         yD4qeeR09FbHGula/FI66URZqFwD8KKBqNwf3mGczVKYepyoUCMHq+VGykOKy5xVJs9v
         qhpL3m/TxQhUHXr2PJ658efvLgSDa+glyt7QGmjw6SoqadqQK8Bmiw1ORJpQCl/+pA40
         lrqw==
X-Gm-Message-State: ANhLgQ3RKmSBlrIpWChgMF97tSsKZb5FalspFtJzXLLoPonaCR+FGWRN
        OcX2qei1GYbMF02OIbzSDTg=
X-Google-Smtp-Source: ADFU+vv/DDlXXllROgGPOZCQ2p80fEzGQ1G7DOdeC4Itk4FFwdCQQA0zXRgV7tLnBj0v44Otl+k+Uw==
X-Received: by 2002:a19:3803:: with SMTP id f3mr13350164lfa.160.1584969673354;
        Mon, 23 Mar 2020 06:21:13 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id h14sm8214874lfc.24.2020.03.23.06.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 06:21:12 -0700 (PDT)
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
 <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
 <20200323110023.GB3883508@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <baf98213-39fd-468f-58ec-fadd33c8ba5e@gmail.com>
Date:   Mon, 23 Mar 2020 16:21:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323110023.GB3883508@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

23.03.2020 14:00, Thierry Reding пишет:
...
>>> +	if (!provider || !provider->configs || provider->num_configs == 0)
>>> +		return -EINVAL;
>>
>> Why all these checks are needed? I don't think it ever could fail,
>> couldn't it?
> 
> This could fail if no EMC provider is attached, which happens, for
> example, when the EMC driver is not loaded.

Requesting EMC clock should return EPROBE_DEFER until provider is
available. Please see tegra20_clk_src_onecell_get for the example.
Tegra124 should do the same, BTW.
