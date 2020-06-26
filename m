Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAD8C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7528207E8
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVnSP+/m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgFZUWN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 16:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZUWM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 16:22:12 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE06C03E979
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 13:22:12 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id c7so1973902uap.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bYsvRQj/KxO7y6dcHjKoVfFZMfrtTcsCp4sG21kGBU=;
        b=cVnSP+/m+7yKuZx6yu96KuQZagQE2QwRL8rlUKUdf7JB8RzaML0YfYX0XCNHk3q2AL
         1sEoS7KqNSGVHu8R9gM8PQc7xETIM3LxOnV1tHenKcyY7IWU/uqES3yBkHhO6rUuWOlw
         3F5uTuzCOzTOE8hRDq9rJCCArcCMLmk11dPUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bYsvRQj/KxO7y6dcHjKoVfFZMfrtTcsCp4sG21kGBU=;
        b=ss1vOuKllKF95W43stq4tM+0xWHXgzKf8GwHymVljxsPNfbhTIr5TkD06KIJAJHs++
         TCTrcUURXIHpG7LIPvLs4FWUxeL8po+tn6AtlrVsRkh7BZ59W/EvW1rt4J7TNV4gqdeV
         hulHdX8Xe47r1kh0WRat1jqRnCGUVgQm5qZ8lRAU1zyEUJcjKuiXN/pg3vr4uFjUIqci
         2or36N2PPwKHaAVV1JmTlD3gS239HgR/82ZgfF+EiUqN2Ny3qBeg/3TFO3fc/ZdFRnOK
         edA+ff9iw2SJCSeCr/sY1dI4/WznfCcB1BUihIYAx8RTwZpvY87K8aUDSIwW5jTm3m8f
         Jxmw==
X-Gm-Message-State: AOAM532iAOlFCa2Lk0S/7POq3byavhgdVynaoO4BF5VcF7kx3mfB9TES
        zo3CB6IYIIyS6h7m5hkjIwGFpU2zr+M=
X-Google-Smtp-Source: ABdhPJzD5/DDUlCB/X8ynC0F60BH379YkDvBZZIRcui+fJe462x59IZsaT1B+Ywx8q5Kpqg8h64hyg==
X-Received: by 2002:ab0:13ab:: with SMTP id m40mr3799397uae.131.1593202931616;
        Fri, 26 Jun 2020 13:22:11 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id g22sm3804301vso.8.2020.06.26.13.22.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 13:22:10 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id i15so3426431uah.13
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 13:22:09 -0700 (PDT)
X-Received: by 2002:ab0:2eab:: with SMTP id y11mr3463084uay.22.1593202929409;
 Fri, 26 Jun 2020 13:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200626190808.8716-1-sibis@codeaurora.org>
In-Reply-To: <20200626190808.8716-1-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Jun 2020 13:21:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_0s-YOCj72F3rzu0oFkNBx82MeHsP2Yqrj0=LAOF_tg@mail.gmail.com>
Message-ID: <CAD=FV=X_0s-YOCj72F3rzu0oFkNBx82MeHsP2Yqrj0=LAOF_tg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add cpu OPP tables
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jun 26, 2020 at 12:09 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add OPP tables required to scale DDR/L3 per freq-domain on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> v2:
>  * drop interconnect-tag property
>
> v1: https://patchwork.kernel.org/patch/11527597/
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 160 +++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)

This is a huge perf boost and I'd love to see it land while waiting
for the interconnect-tag stuff to get resolved.  In theory I guess we
could land the sdm845 one too...

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm also not really an expert here, but the patch seems sane to me, so
I'd give it a weak:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
