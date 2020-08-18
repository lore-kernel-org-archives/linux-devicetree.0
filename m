Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F129C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 13:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C155206B5
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 13:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GFlw44Sp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgHRN4i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 09:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgHRN4g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 09:56:36 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD3FC061343
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 06:56:35 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id q200so4329591vke.6
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SQHECpOUmUIUn/BlEGYsCVfl8NoL6sE1Zq5USMNyPsA=;
        b=GFlw44Sp9NvIROQShqLUaqn4pvZMQJmHC9t78x2jciAp3VCTruRs3JKFPbGAdavqdA
         jjRu4+46WRShUl2tgpcae4KqfCCmG8mTS2YQJgacVlzlgzqWEW+Y+2RPD4A4lrMKKttT
         yOKhXnEcWWI+FwdcvX4J7AZCbJaepBlthLTbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQHECpOUmUIUn/BlEGYsCVfl8NoL6sE1Zq5USMNyPsA=;
        b=M8tSSiZWjuXT8iRyG604pZBf8BKhSnLhSpfs+gTwTaOuVSEpcCacOHFsfFjfu0nWso
         RChRufWI7moGH9/ao/lwMpR0eFaR7J6/YXpBdAQ8Ra+EvbY+nfAuvQOaWUEmZ4BCrxF3
         U5AKxrzHFxcRdNXaF17ARK4oEJf8XDSoJ2ZUm5PH1oSXgKr681052qJvavE7Kzo9+q/p
         m1WSScDVsDrI4CROs44U3y53wd7k0++BP+frrGNMknqx/McrcEewreqvKnYYRHyEyCEv
         f0NpkksKHqyI+eDLILRhnCn5quNVkox7OjhSH+egPN4xixj1srHl6hw1Honldckj9H1w
         HCVg==
X-Gm-Message-State: AOAM530cLoIjnFMiKH0O8K6abODBF6nyj58vv/ShoPevYPj68wF+J7Ao
        Sctc7V2t9jZ91d5g1qpVVlSy38NbEAgq5g==
X-Google-Smtp-Source: ABdhPJzAMrG1lfw40kHT0ntINjy1ANfWbDVKwmII1YnE8Ye2rf/zZsEOwBSsuEnFt2W3ty4wx7rByA==
X-Received: by 2002:a1f:eecb:: with SMTP id m194mr10835328vkh.40.1597758994620;
        Tue, 18 Aug 2020 06:56:34 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id l11sm4213853vka.24.2020.08.18.06.56.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 06:56:33 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id y8so10136025vsq.8
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 06:56:33 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr11637826vsg.6.1597758992748;
 Tue, 18 Aug 2020 06:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200817040417.11111-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com> <5c8b1664adceab8c600c80058e40cc97@codeaurora.org>
In-Reply-To: <5c8b1664adceab8c600c80058e40cc97@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Aug 2020 06:56:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJB=6PxaG6LZsjQdWxKbVonnm9WTHwqCeoXPMD=uWjfw@mail.gmail.com>
Message-ID: <CAD=FV=VJB=6PxaG6LZsjQdWxKbVonnm9WTHwqCeoXPMD=uWjfw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix the LLCC base register size
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Aug 18, 2020 at 12:38 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> There is one LLCC logical bank(LLCC0) on SC7180 SoC and the size of the
> LLCC0 base
> is 0x50000(320KB) not 2MB, so correct the size and fix copy paste
> mistake
> carried over from SDM845.

Sounds fine, thanks!

-Doug
