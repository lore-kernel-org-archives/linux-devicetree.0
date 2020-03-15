Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95712C18E5B
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 19:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AC1220724
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 19:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XwpMgfGT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgCOTit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 15:38:49 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38446 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgCOTit (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Mar 2020 15:38:49 -0400
Received: by mail-vk1-f193.google.com with SMTP id w4so4251361vkd.5
        for <devicetree@vger.kernel.org>; Sun, 15 Mar 2020 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3r4/BvkXpJFWjW4Dm8u+4gw7YjX6yojUcnevi1e7c+I=;
        b=XwpMgfGTAdDtlhQO/YyoLhfNXwLMPvXTGSKSJ3/yqwas/b7Ta+cQ2wnTzDLHjT5AuA
         is0tUAKR6jiW1Cp5bh7DfL57FcgLB+1uO7sUhAvKy4ebM7qf38EiZHoE25LYF+13WKXO
         UTog8wXTqLa6AS9Bcxq9qNZwzuGSYiMRLGQ47LcjF6wwY498/AUO6+Q7BFxvs1m1/AMG
         bRUdL4CTsbH92OFprdSeYcOMRQljBtzwNgAHkoWt5fplEmNq9lKf1gBvYX5n+9g7QUlN
         WIcYJPwR4J1PG631fhwjnINaNXQOAXCFMpJiRrfgYBnaMeUqN3+L5RpB21LPVEEkQQ47
         TPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3r4/BvkXpJFWjW4Dm8u+4gw7YjX6yojUcnevi1e7c+I=;
        b=X/rmDEZ33zuLJIDhVL37wuGPxRcIga8D90GSc6YXfkJrvbVE6hVLELLXIXmlk+vkc3
         z3yWmNyybpFPosarg2TAfcDPnbYzbNXkxvfxmnDdz7vwMNJ8AYSsAAVaWJ534TBhYcEe
         yTy5f8pCejrZyEjqdFi2h8M7kwzIttGC77D1JYsuNsi4cZ+tDA26zwqfnnk5hSckMz1J
         ShPVJVInYmnLRpMF7GB2OolP3NPMr/TuylERWbRokxg/z0Ifz45zmfHC45WxGFm9vv8z
         KBTjwKsYrDVVxZVAmehS5EHEx9WCaqbjXbK21D3p1CQ7/A2NBLpyAIWhRrbfn8n+eP2J
         GKgw==
X-Gm-Message-State: ANhLgQ0wXWYa6m1RMW93oxv7E9eSDtdDFJ/d8tv400mHVwapKPY8Xelm
        gKsk1AnIi9Qqj7QFdn2aBxE/cDZwr6fpRectmITSVQ==
X-Google-Smtp-Source: ADFU+vukkt95spIbn7oU3hsXT2PRPErWHGLPhTFw57L5X+fXp8Nt6v07e839vlcZH6eMP2Skvw+cvfE3msIzvNj+PKk=
X-Received: by 2002:a1f:e004:: with SMTP id x4mr15188225vkg.79.1584301126800;
 Sun, 15 Mar 2020 12:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200313214552.845-1-robh@kernel.org> <20200313214552.845-2-robh@kernel.org>
In-Reply-To: <20200313214552.845-2-robh@kernel.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 16 Mar 2020 01:08:35 +0530
Message-ID: <CAHLCerMDNXEr_1JHrdM_3rMFaJJK009E1v4JPJhLSu1dgVKJLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: qcom-tsens: Remove redundant 'maxItems'
To:     Rob Herring <robh@kernel.org>
Cc:     Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Mar 14, 2020 at 3:15 AM Rob Herring <robh@kernel.org> wrote:
>
> There's no need to specify 'maxItems' with the same value as the number
> of entries in 'items'. A meta-schema update will catch future cases.

Thanks Rob.

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index c0ed030d0960..62b97a6d9b65 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -43,7 +43,6 @@ properties:
>            - const: qcom,tsens-v2
>
>    reg:
> -    maxItems: 2
>      items:
>        - description: TM registers
>        - description: SROT registers
> --
> 2.20.1
>
