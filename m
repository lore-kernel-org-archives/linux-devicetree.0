Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AA5C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22724207DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrPh53BI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgHYRO2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgHYROV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:14:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602C0C061574;
        Tue, 25 Aug 2020 10:14:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kx11so1129760pjb.5;
        Tue, 25 Aug 2020 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nC0CGa0DhQLywOaSN+bsM9yIH3pm94jbNUPQgdZ88Zc=;
        b=UrPh53BImtLFBcv+cCSnb2qNXo6lIQxjvbEe5IvkiLrUqCkvCd0vLMoTGJ33ldyijB
         5jG3uzkNRQI4r42LVWK5lVeOtDkTlJhqLRmfH/yZ899mxP4JFtPFQjcqGSH2H7mz4Cu7
         uetACryJmuPdWieQ29zfPJMjyfXscYG+Ok97mXqWRwEkWKcRN6sbbKj9S1SETrVb4Iwg
         a63GIEAuK9eZpTX+Fr/qiLnz72/kyKwlA6kShPSGfw++voig8J1arLJD3U3fzcFHrire
         l///LWgSxJmGXZ+nRaDpYhAyoYsJCVlMpuE3OG4h9+G5S2Dhb1Tskuvfriid8xcEByoZ
         Vrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nC0CGa0DhQLywOaSN+bsM9yIH3pm94jbNUPQgdZ88Zc=;
        b=aGaQ6hYJ4ZwnvaEPqtvMIOm2w/wMAFTrT+RR34rQse3F4i2xffTFboMsqJ6hFipMBz
         382PMdlmaCO9fQbhlABzez1gbM2MW8gNKe/hw9BGNhYX4s5g3M3eFVD0m7x5z6aRW4kR
         7a8Pz8U/E8pqQF3GGzR3LBg0PWx/xpjlqg6oVB4m+dXeDnRfdBQFgNRSkykJSeGnFbMJ
         cKSCtZ9ure9aI+hmNwCDxBp/HnOWLAd4OXPwBW9d35c2Qoyr3lgVqSEWvFfNSafp791B
         6y0RDkAz5D3esuBioj3G3JvrFnMAU0HsG8BrShMpUq1JMOJB2GglncYcdny88qQ3+Q4l
         8IMA==
X-Gm-Message-State: AOAM533JPKiJDRKgHBHO/ieHRLXyXox/JQ82Fyx0dNEScDScMW+XuFdR
        dyjwkRoGIieEwi/2x1DqPBZfqntEWD0=
X-Google-Smtp-Source: ABdhPJz0hdCt6dO/xZHDgu7EfQeIWkH/2zYpyMfqRxlMXWDKzR+FSmzEGgyr71G/fTK5jRzr117JKA==
X-Received: by 2002:a17:90a:bc09:: with SMTP id w9mr2380318pjr.43.1598375660814;
        Tue, 25 Aug 2020 10:14:20 -0700 (PDT)
Received: from [10.69.79.32] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c15sm15746867pfo.115.2020.08.25.10.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 10:14:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] Hirschmann Hellcreek DSA driver
To:     Kurt Kanzenbach <kurt@linutronix.de>,
        David Miller <davem@davemloft.net>, olteanv@gmail.com
Cc:     kuba@kernel.org, andrew@lunn.ch, vivien.didelot@gmail.com,
        netdev@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, bigeasy@linutronix.de,
        richardcochran@gmail.com, kamil.alkhouri@hs-offenburg.de,
        ilias.apalodimas@linaro.org, ivan.khoronzhuk@linaro.org,
        vinicius.gomes@intel.com, xiaoliang.yang_1@nxp.com, Po.Liu@nxp.com
References: <20200820081118.10105-1-kurt@linutronix.de>
 <20200824143110.43f4619f@kicinski-fedora-PC1C0HJN>
 <20200824220203.atjmjrydq4qyt33x@skbuf>
 <20200824.153518.700546598086140133.davem@davemloft.net>
 <87sgcbynr9.fsf@kurt>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <efd98ac6-baaa-ae44-9630-ba1241ac315a@gmail.com>
Date:   Tue, 25 Aug 2020 10:14:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <87sgcbynr9.fsf@kurt>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 8/25/2020 4:21 AM, Kurt Kanzenbach wrote:
> On Mon Aug 24 2020, David Miller wrote:
>> Agreed, Kurt can you repost this series without the TAPRIO support for
>> now since it's controversial and needs more discussion and changes?
> 
> OK. It seems like the TAPRIO implementation has to be discussed more and
> it might be good to do that separately.
> 
> I'll replace the spinlocks (which were only introduced for the hrtimers)
> with mutexes and post a sane version of the driver without the TAPRIO
> support.

Sounds great, thanks!
-- 
Florian
