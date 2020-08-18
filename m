Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D79C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 14:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E54D5207DE
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 14:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hbGVRH3B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgHRO5z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 10:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbgHRO5x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 10:57:53 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7274BC061342
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 07:57:53 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id i20so4381584vkk.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TV7ie8YQzzCwxQWHVrIBTQKXy/oaWTjxbImglzQ6zZQ=;
        b=hbGVRH3BGMrwNufK6iwkScF4wgv806ZBXZDcJCRIPddAOmGq1Fm5FWiW+VdokAM2/+
         +w/sFtvsijDh0eHR69yXym0B1iwEHzEHK8Az8EdNtFj0/mTzzi9Iw0FtnpbQ2F7eIIX8
         voFTbtK4Bux+4SL0ScZh+F4IRH5ehPrmv6wyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TV7ie8YQzzCwxQWHVrIBTQKXy/oaWTjxbImglzQ6zZQ=;
        b=YLv2ZVzBEa+9ykRXrVZrXZX94kcglBADF0YacEixwLLpyyQGDCHqop4RW+X/j2Fet2
         12ZUAriY663Hz+L6x2gWN8qZm2xmmVA6x2GmTWKIxA8W+430zE79r7cfjuJxazBA+rkY
         JJSjv6FBEnWAl9+RAmoo8XBfcR4HoiOiZg7OOc0q0sUpGjZzsslFCNZU6jQEdii0QSWP
         nx7qJtveyWoIejHOqm9UwfAbjNY/QB3Q0jpXqcGF2nm6ESCe69j5Sln7MvH20i3zWCf3
         u0W2XXKTxUyO9UWwVvekW2fx+X2MFarE0Nw39L4whlxsqQj0vh6YKmBlz0GdgRvVHHX6
         GeBQ==
X-Gm-Message-State: AOAM533pU6T/qtpjAtvTpM/mg+5NDpo02zyMwTdsQmSqGG4+TTPjzM9G
        Bd9KKn4aSNsnb3A5+uCU0wpIeiakAxCGTw==
X-Google-Smtp-Source: ABdhPJwnrtoU500xKn9sNkNxoDAWsY7gejcEqvYgenlOIAdJCa87XaA1NtdJLGtHFlkFU9lSrfLLdw==
X-Received: by 2002:a1f:206:: with SMTP id 6mr12095518vkc.79.1597762670991;
        Tue, 18 Aug 2020 07:57:50 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id y17sm4120722vky.49.2020.08.18.07.57.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 07:57:50 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 186so4386772vkx.4
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 07:57:50 -0700 (PDT)
X-Received: by 2002:a1f:a302:: with SMTP id m2mr12131702vke.28.1597762669752;
 Tue, 18 Aug 2020 07:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200818145514.16262-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200818145514.16262-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Aug 2020 07:57:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzk=qkemLRU3gaZ1K4P-9=tMqB+HUoGCQL4Zxv6q8XFQ@mail.gmail.com>
Message-ID: <CAD=FV=Vzk=qkemLRU3gaZ1K4P-9=tMqB+HUoGCQL4Zxv6q8XFQ@mail.gmail.com>
Subject: Re: [PATCHv2] arm64: dts: qcom: sc7180: Fix the LLCC base register size
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,


On Tue, Aug 18, 2020 at 7:55 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> There is one LLCC logical bank(LLCC0) on SC7180 SoC and the
> size of the LLCC0 base is 0x50000(320KB) not 2MB, so correct
> the size and fix copy paste mistake carried over from SDM845.
>
> Fixes: 7cee5c742899 ("arm64: dts: qcom: sc7180: Fix node order")
> Fixes: c831fa299996 ("arm64: dts: qcom: sc7180: Add Last level cache controller node")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>
> Changes in v2:
>  * Edit commit msg to remove confusing references (Doug).
>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can't validate against any datasheets, but it does what it says and
seems sane.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
