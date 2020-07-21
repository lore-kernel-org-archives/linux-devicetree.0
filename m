Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E422C433ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 06:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05570208E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 06:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4Wkp7kF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgGUGCH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 02:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgGUGCG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 02:02:06 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456FCC0619D6
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 23:02:06 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 140so611447lfi.5
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my59yREAno2VQTQHnPXurOEKaB8ry8pumgPVSYznLUI=;
        b=n4Wkp7kFOj4iLJpP6r5SwB/qPrN12j5OeQuZbk0acAZfjK2hSrnY5oVJscJUPJZjD3
         3Tvi5Ib/nIudBxUDjzrTXkkSIr59b33qw6AqttrRaU1314ITKvd/1FtQuM/5vKaW0A+a
         PydSNvajtDmUqYoIqdhaT7f4RF6xalnRHweH8EiAQO0pKeOZ07SNaZwFOtlBa9fP73VM
         I4SbOpTQZF2mL623gjrHR8g1xHJHhidB/LdHYH0AexCQbQwR/+So1zmjx6IzHTdt6o48
         YzKD7k26mYLcUxYGMVuyYavPyJpwUSkvTdvD/fxuRGJ0N+AhylZL7eBHTZv7ZGwXd8Pw
         sgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my59yREAno2VQTQHnPXurOEKaB8ry8pumgPVSYznLUI=;
        b=J0t3HWLOk4Y7px6jxSnckkxkp1O2o5reWJRbdpSoCLlv2jUVsrKMnvDZU6qEykrHq9
         +05pM09Ju/ulSD9Zaj1pGXk45P+Wlak1P4NAy/jAnus+xjVkvlbePfQ+Xy/cBS6L2D1N
         qsc/zztCAVn9dZ+tKS9XKTCyLvj4StbVWIoAy781wMdAphzmama6KnjAUsNGwU3PHEmL
         QsSJWiZdPYEQTBWtF9Eq/eJdIi6VP289+3whotHTiTQiLNmLJFPr7cAiUw3ugxnK3wQX
         WqipbvnjhhOH/9cYznVpzSEw1YkGkM/59IQejnJRAiN1pWmBZtSPOhibO3BAM7LPn46c
         p/0w==
X-Gm-Message-State: AOAM530qmnKFcMdSLWcaqSGhbBnANPhqzksIMCVEeH9O/VqMpGt1+Wlz
        cyvEBHeo9idufd/oxZI5gZg1MFtrv7D8YWhk2/OzgQ==
X-Google-Smtp-Source: ABdhPJwvgCTehztyDX3Ii5ZlkS2X5xVAaX40gTTrRR53FMNAybYJMQOf2Mixr3o03K0dYP0cmjuKZJsCxtWu/EWeh40=
X-Received: by 2002:ac2:5325:: with SMTP id f5mr12579460lfh.6.1595311324713;
 Mon, 20 Jul 2020 23:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200716022817.30439-1-ansuelsmth@gmail.com> <20200716022817.30439-2-ansuelsmth@gmail.com>
 <CAP245DUqvTYENmaxG3rjUn1XrzrmvdFmKG_vaef2BxKL6jY+Rg@mail.gmail.com>
 <159528817752.3847286.2725374997908705208@swboyd.mtv.corp.google.com> <CAP245DXqiEZLoVa-jfLx0tYRwrtK0sp+ZX6P_yTf4C9vetg3RA@mail.gmail.com>
In-Reply-To: <CAP245DXqiEZLoVa-jfLx0tYRwrtK0sp+ZX6P_yTf4C9vetg3RA@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 21 Jul 2020 11:31:53 +0530
Message-ID: <CAP245DUZTT4dFAzpN3Uv1-y2DKHriXZ9jH3t7V1qxf7sNH8yYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] ipq806x: gcc: add support for child probe
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 11:27 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
>
>
> On Tue, 21 Jul, 2020, 05:06 Stephen Boyd, <sboyd@kernel.org> wrote:
>>
>> Quoting Amit Kucheria (2020-07-20 02:41:44)
>> > On Thu, Jul 16, 2020 at 7:58 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:
>> > >
>> > > Add support for child probing needed for tsens driver that share the
>> > > seme regs of gcc for this platform.
>> >
>> > Typo: same
>> >
>>
>> Otherwise reviewed-by? Because I can throw this into the clk tree with
>> the typo fixed.
>
>
> Yes, the rest of the series need work imo, but this patch looks ok to populate the child nodes in OF.
>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

Replied earlier from a phone, which resulted in HTML email. Resending.

The rest of the series need work imo, but this patch looks ok to
populate the child nodes in OF.

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
