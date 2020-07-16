Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE843C433F8
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB88A20825
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPn/z1Lg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgGPOBg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 10:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbgGPOBf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 10:01:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7501CC08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 07:01:35 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so7169671wrl.8
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBgidtm3K2UC7bZZD55ufcqNRxLA7lDeHaLH7hy/Zr8=;
        b=BPn/z1Lg4Ha3YThdEhMABfg1GUZMLmrkbn22btW3YQXptrhrx2hxb6Q/uSuFdMTzhm
         pMfcXaPSnKoNCfaJg/0W2zZ5D46xvftkaMQ3RslriCnOiUWvf9G8u9VQaeZN2DCboxPU
         xAGk8J2dVTTdOI2ZEKlmdD79jH9qen6wcLfFGtJDVYCE55JHtrZnCfcfRjSeDlkP/i4O
         Pk7/81psmTfylLNQVbzi/R3250fofHM3xPxtq7Q3K3hxRB3JtaThKcgp7loQWMbSFEUR
         BMspmu4NGwWXSWAglvfwUs5AAnFJDLwYdwjfecHnoin3JHBoUCwFGbFgDj//M2iPjZ8E
         EfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cBgidtm3K2UC7bZZD55ufcqNRxLA7lDeHaLH7hy/Zr8=;
        b=uHLqYsuxZ8gvmjv1vYPy9uORTPhf79DaOVnytJ3BylrEp9QrnmikmOJ+cXsa8siaLk
         GhnVDpvaV+MTo+JFunbAHdKgiVHrUqbt+I/c7jCyQQq6MeqTOBF35THkh56iLt96uH27
         JAZK+7Ar7gLGWuh/7xYwjxluFT90KrhlylmV7g9dMgyzFRfsAK2lIftIPwn8eMEy4YIc
         CY2hQ7XsT2x9iNmp8pGj6CQf9PptS/xpoOqhuHQLxgdSNub0/btCc0nfZXZdVSx24Ru8
         Cisz7oPtQhB7WfPVM05jmHjmTIjAQDt7fYFLNO6Afbyt2944sF3eInIwuUSZOCobBu/E
         oMBg==
X-Gm-Message-State: AOAM531LuspZ95owfGsytBKXX/9RHMTkmtch/eEg9Hwxdwj8j12Q6VMg
        RzsgazVRarPsBGx3Bo21p0sOzw==
X-Google-Smtp-Source: ABdhPJxWuTEqJ0U0mmug3AZEYrGs0qIUBJq6BWHdQAoQMxFMyqmaghCWr1vGT05W3k5rLX9Hq4gauA==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr5240273wro.413.1594908093264;
        Thu, 16 Jul 2020 07:01:33 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393? ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
        by smtp.googlemail.com with ESMTPSA id b62sm8730073wmh.38.2020.07.16.07.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 07:01:32 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To:     Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>
Cc:     Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
References: <20200715071506.10994-1-anup.patel@wdc.com>
 <20200715071506.10994-5-anup.patel@wdc.com> <20200715175052.GA497000@bogus>
 <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
Date:   Thu, 16 Jul 2020 16:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Hi Anup,


On 16/07/2020 14:32, Anup Patel wrote:
> On Wed, Jul 15, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:

[ ... ]

> Thanks for these steps. I will fix and send v4.

Please take the opportunity to clarify how you want the series to be merged.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
