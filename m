Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DD3C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8305D206C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YumOYpGc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgEDG25 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 02:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgEDG24 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 02:28:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55511C061A0E
        for <devicetree@vger.kernel.org>; Sun,  3 May 2020 23:28:54 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 188so8683974lfa.10
        for <devicetree@vger.kernel.org>; Sun, 03 May 2020 23:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IG/tGFQPJCSJYnPu8/15Qbq3jfJlPJ6HJh4I87r1NIs=;
        b=YumOYpGcROINiP9wKRrt4Kr8G2zKkJEhHgZkkk6XeLTvKHSUHl+YsFerC4ty7e9Xf8
         MfzmyGkOYAns2VLQMBAKThlZJiF7kql80QFDqWkE1uPP8tBkoUbbrPytRItJDQZ22Hg9
         9qc21PC1/rxBmnQFNViOT3LuibVLnHFOjhDwIeqncOW7vkmeOF6qBPEYNx+Q/jyme1Ye
         8J2TfumsMAOhcUxzFEesLq0nu4lbVB4Ys6TAyiZZyOYHlA0v4QJRPHhwRrynhRJTXoJk
         aDX50M54/DSdHhoT9I4ABRDKZOdZXga3kLlqVTa0kvcMADTIwafVRk6KXQ68f6QFQGDP
         38Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IG/tGFQPJCSJYnPu8/15Qbq3jfJlPJ6HJh4I87r1NIs=;
        b=COZylOFIPgZriyn73n3cZO16JmxuleU6mRcSTDa4kNpYjBTo0eo2kTz8gbm0KCWB+8
         6NoJjSA0+3qrdT4Dsf7spYZZ7Slp0AQqDMYjMjv39ThekiwZxI0h7dIj+zAU4E0qTafl
         t1JAHcNQowfNQGSSzesv3dWwoH2aWi/LlCCJZU/YhqPEi1ozylb9JIgJSEmRDA5Ow7Xe
         gqXQkRTUjOfM+YmUoBR+TYkVPyI2tJ+3hhUzXMgSqna8YCLQuu6+7rrs6C738R1FDgWv
         rAA163xQWtWwjOhJNPfZ7MvxuGrlEyHGX8xMWsQxBtOXGsmry1e63Zj+fbJbUXJu42jk
         knCw==
X-Gm-Message-State: AGi0PuZCTT3VwdhKesZDT/N+sfppGuMPWA1xIlqMOVm/Gne+a+FUFgYu
        qYunQNjkKNEMfy7rLduf15VoSQJbSiWFenxt3AC6Tg==
X-Google-Smtp-Source: APiQypKO3fJEpw/Lg9UxJ1PfVeF0vg7F8K+oZ9DqX0zFzsZA/c0kCGb3cmKEKqUN6T9RPgBy+nmfJLzBOrTGKieDleA=
X-Received: by 2002:ac2:5dd4:: with SMTP id x20mr6381625lfq.7.1588573732796;
 Sun, 03 May 2020 23:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200501203311.143934-1-konradybcio@gmail.com> <20200501203311.143934-3-konradybcio@gmail.com>
In-Reply-To: <20200501203311.143934-3-konradybcio@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 4 May 2020 11:58:22 +0530
Message-ID: <CAP245DWJsUnR9XaW_2kzcg9Ji8DR6JgfV0Xa_7NmoMK=F4HzSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: tsens: qcom: Document MSM8939 compatible
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, May 2, 2020 at 2:03 AM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 2ddd39d967662..2ce489ccbf902 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -23,6 +23,7 @@ properties:
>          items:
>            - enum:
>                - qcom,msm8916-tsens
> +              - qcom,msm8939-tsens
>                - qcom,msm8974-tsens
>            - const: qcom,tsens-v0_1
>
> --
> 2.26.1
>
