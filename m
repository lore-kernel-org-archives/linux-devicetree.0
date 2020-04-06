Return-Path: <SRS0=4d9G=5W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96D6C2BA80
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 23:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C9D120768
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 23:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a9DPGYBx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgDFXsX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Apr 2020 19:48:23 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36131 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgDFXsX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Apr 2020 19:48:23 -0400
Received: by mail-ua1-f66.google.com with SMTP id m15so643809uao.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2020 16:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wp76Kyvm8RQcxJEi+GNTFvD7u58xFm/eeI8yCkx9UaY=;
        b=a9DPGYBxfRaFFN12gfMUgDgWSgr5qMmjAZptWkaGgrp03DY0V2eTWC6fVwCFLzgzXJ
         cMUG6A8aWKicmrgPJSJuMNmpqDa6soOUMRpyYwMYWuolFXrl2KdF+hS7XzofYtx72G6V
         nQq10sBt14qxL361HYyCzi4akknL4vLOtOIoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wp76Kyvm8RQcxJEi+GNTFvD7u58xFm/eeI8yCkx9UaY=;
        b=SaZgFMTcdJc8TK3nRSzUsRjNOvJhBK//7obOGUQlgwj/3tPvVGGpmo/4Ot4LUUeonZ
         L5RTCnfVPrCH0tkCD3hTiXiBeBfNU9YT2EayLTfiqfUvqbPJ/DOiAcnzz3oAHTG2I6M7
         118UfMNfbJBrbkrIgL87LoEkTNAz1DR9Apa7Zgnr68UHIsoTRtwLTAiM6wZrYDAmJbit
         s5LXjXYSsSeCyilimekVvkCAotjeZmhBMn+RAIYF/yUhWCeUXW4w2wRHrUZQQUYdN9lJ
         +pIwfE3Nra/946PL5HPOjLAp3NMDVuN4ADg9dOAOvUAnMNFrcODdkqKl1tB1BYCZfAPU
         vROg==
X-Gm-Message-State: AGi0PuZ0VQx+okoq4+W475DGlAMrXKXGGpWPGSJxp3CZzcdV3uI3KYlN
        H2zpKRcalOycpsKHoOkvNaany56mtmY=
X-Google-Smtp-Source: APiQypKNN2+AbHn6Ilx7nKGBCHTrqCaMGwsQ55tENb539sREgVivmqrKdvnRlGD4TyBM3lhxph5stg==
X-Received: by 2002:ab0:2e9c:: with SMTP id f28mr1657791uaa.66.1586216900825;
        Mon, 06 Apr 2020 16:48:20 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id k68sm5109083vke.40.2020.04.06.16.48.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 16:48:19 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id x82so1026228vsc.12
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2020 16:48:19 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr1969972vsr.169.1586216898579;
 Mon, 06 Apr 2020 16:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org> <1583747589-17267-9-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1583747589-17267-9-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Apr 2020 16:48:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNBkSOgFfZCg_jG91rBBmE+MZwsHhymOg-MD+9roqWkA@mail.gmail.com>
Message-ID: <CAD=FV=VNBkSOgFfZCg_jG91rBBmE+MZwsHhymOg-MD+9roqWkA@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:54 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Use generic QUSB2 V2 Phy configuration for sdm845.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Wouldn't hurt to add:

Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")

...in case this lands before the patch John Stultz sent out and thus
makes it to stable faster.

-Doug
