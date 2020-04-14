Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BFAC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A60206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI34FaFA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407439AbgDNPdD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407370AbgDNPdA (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:33:00 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097C8C061A0C;
        Tue, 14 Apr 2020 08:33:00 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id l11so87161lfc.5;
        Tue, 14 Apr 2020 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4eIrItheLX7YX2ovx/taypeY8owEKNTnWW8Vad5FCew=;
        b=MI34FaFABelIhbrwZvWxpE3BeRjE+jLVkAPgR5417k1cCJsV73RHRHbvaa84RzMxgW
         xetz+hgEeMaQ9aO0rfNL/aOte1KsQtdBPkNlzr5dikvh/3Lig+gpmfNtfeB7GA9UJASU
         nbmkKqX2fP7DiasP27nvBvPpo6P2xGWSqXLGirBeR6WrvSn8jCF7ZJOUQZIBGwbgrnH5
         Rbq+AalrTIDbO3yyhvli1Qw7FejKlGpXk9qwvwwGpEQxfl4FlhhfSlTZ3bxUBPrCRmjP
         OLqjoR1LLJqjShTkwHmyuGdWL+JU7XSJUeVHv+3YpsEdC8ONzx4MexTEHcObjT1kph/Z
         pSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4eIrItheLX7YX2ovx/taypeY8owEKNTnWW8Vad5FCew=;
        b=XfjYxBW8n42eNO2LdkNInqa8fLA2Ikb78MPyepFk+rdPgTGvmq7v+e5l14tcmryetx
         GL6xtD8Mdy4ERWWr7I73d9WgsoHCrWSP2gUESPZlFHAeEMpwO5/JpQk0vx3N+B8rmtrv
         pb/lQvEez3zbHx7Uhu5uXJDy8S8Iv59v+V58iLkEHB3arYpEfVN8W1J70Grfhy4r363z
         SVw0yDUUSkqMPdVeDTbWDVODjHOO1QCYchE38B3by8UANbMChYF4rmyxXAVFeSadulVP
         qJVefWA78OEi7E3NkEu3VZcqQj2chNnKx46EKOUlTHxaiJosJmIkE+PBCQYAzr4Io5cR
         bT+w==
X-Gm-Message-State: AGi0PuaL7/Dkk5/++APA/zHkVDnHcdBLbI9vqmeFKu/+IyTNRu3up/pr
        KhpEUlyooJfKge4TzPRoXMo=
X-Google-Smtp-Source: APiQypKpGY5BqwvpNTlCvMY9U59k/lj+SeiqM+aeyFKz8Q5woDyVq/h4Ljj2eIGognuBJLL5rYF67g==
X-Received: by 2002:a19:c216:: with SMTP id l22mr229478lfc.172.1586878378571;
        Tue, 14 Apr 2020 08:32:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l12sm7528500lfp.35.2020.04.14.08.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 08:32:57 -0700 (PDT)
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
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
 <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
 <20200414150516.GL3593749@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45b65baa-fd9b-3248-bc24-e226cfc8c8dc@gmail.com>
Date:   Tue, 14 Apr 2020 18:32:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414150516.GL3593749@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 18:05, Thierry Reding пишет:
...
>> What about replacing those barely readable concatenated macros with a
>> raw values?
>>
>> Like:
>>
>> TRIM_REG(brlshft_idx, ob_ddll_long_dq_rank_mask, ...)
> 
> That's just going to move the complexity from the macros to the
> callsites, isn't it?
> 
> I suppose I could spend a few cycles trying to make this a little more
> readable, but to be frank, the complexity in this driver is already so
> high that this doesn't really make much of a difference, in my opinion.

I can't guarantee that the final result will be excellent, but I'd try
to turn that macro into the function and then use the raw HW values
instead of the defines. It looks to me that the result at least should
be better.
