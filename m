Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B706DC2D0CD
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 20:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A91B21582
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 20:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SWfYOp7v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfLQUiZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 15:38:25 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:45991 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfLQUiZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 15:38:25 -0500
Received: by mail-il1-f195.google.com with SMTP id p8so9533844iln.12
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 12:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=SWfYOp7v2Gbzvj0oex2xBcjnDjxUg4jBwLcNA8Lj7Y20hF7uJS8Z+wqqD+6oKZME9U
         3p6Hh+fBlmoE58Y8glJzGHG3nV2ShrZXJI8oFnXr40yYSDt+Y/Yu67GPHgbuOPgKcRLa
         F3Wu2wWaSCDep6oSq/EtkLx/PZFaVr9IF38mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=bcr2i6N38U8i/IfOrEm2XGQ75Pfya0OJEc/igBuRfcdSO7Nm097uI3mx+xYr9RXvu1
         haSHny2j3S/YOCTwe5F1lVz61uvgpCKeXnoLL+ToIBaDa9iLPaApsDGrR59qqyonnOTg
         L5GNnPUBZ56jf0euIXk7WzCXap/5VI5+kKOXZvHiXn0ipDyX/z77jd0JS3PYZ/2pwUeE
         0EdR2l5+jPwkw06LLV52IYfieFtIzNvpTNTeOJfLMHg5INbzd+zWeHbcEBdDLm9lf48M
         quiSgqHKdS+WszLKVjviLg7Q2GZ22Iz3xcjyfWSJBdnPS8331cXNaKPMBM1ipAdEysGF
         OSPA==
X-Gm-Message-State: APjAAAWHCsjHm0kkKfDKQe+CCa8kk8Hl/Y/RreyV1ku/J7IKmpZuROk2
        6v2Fc3cvAHHZbgKlRgsPcDRnEv+PUFM=
X-Google-Smtp-Source: APXvYqzEEkIciz8aISjAoGk9a2L2yQQMsvZggg8UyqrVThbzDdO00GteRAPfkestGWorwDd0rjguPA==
X-Received: by 2002:a92:b744:: with SMTP id c4mr17533976ilm.34.1576615103962;
        Tue, 17 Dec 2019 12:38:23 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id 141sm793560ile.44.2019.12.17.12.38.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 12:38:22 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id s15so6492675iln.1
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 12:38:22 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr4548825ilo.218.1576615101966;
 Tue, 17 Dec 2019 12:38:21 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 12:38:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add wakeup parent for TLMM
To:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Bjorn / Andy,

On Wed, Oct 30, 2019 at 12:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Specify wakeup parent irqchip for sc7180 TLMM.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

I see that Linus W. applied patch #1:

https://lore.kernel.org/r/CACRpkdY9ETQRHn7x2D2XVLZ810Uo1cPQxMBqTy5LnrORRNjTVw@mail.gmail.com

...so I think this patch is ready to go.

FWIW, feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
