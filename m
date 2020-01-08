Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B67C33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 08:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 221692070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 08:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dt29E8cP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgAHI4h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 03:56:37 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38036 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgAHI4g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 03:56:36 -0500
Received: by mail-qt1-f194.google.com with SMTP id n15so2184291qtp.5
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 00:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
        b=dt29E8cPCpwAonKSxaiv3VaP8BgaW6t7bbMQkQnM0D3acz6OORwBCcouS6gD45iHNu
         GoPZetsVGj8l0OnJGPxqVSmqzq56aVUI+0uLD7j+Gg9OKKkLy6E736TS9AFewSX5PE6+
         AOSxXDvApaNRuUXWC+iSUIvKTYYK+4hSDeiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
        b=oV9/Rm1E2OpIS3rSJyLsoWsyu/5dMaM6BTp8hsU5kIskmesDtJ3L+91dqRZucauZ3S
         UZ5t7hMrXsaCjZ3PwGHvo82kCL4DLSpHRMJaDVNwiPzf1DfJqrqjR2p4wWM6MRVy50GV
         vN7p2CesGZEkwWR0BvTHq1+52Li2ByGSHLDGCHCLNNe2QGeYH4MPOBRvRWgwWdLaQcbO
         h9jQn0Y31vuBUZ3Ojwn8knS6BjrH2wx3h3aqq6gaqIvdl1Cx0gEEGv9ylUtq+JwvPEro
         rbUcco7dcWFhc7P2UPTLs6q+KjYtoYzpmnzWbx/ZWFP9n2+VSqWTQdt8EqRscPcE1lIz
         7oQA==
X-Gm-Message-State: APjAAAXXhKY1TSDzlPNvW5V/Y8Nd8JVIwjxaaYCRRaJ12zCPKzn1KGFc
        BA0ZQ2hQHalj4m91gifU1rVrtRgvk+rl3FIZZjgQdA==
X-Google-Smtp-Source: APXvYqwLdC1bnpk+yFSSUDDZwVNj0SEXt8iwYqeuRY98reHyPr1olVJxIKDeEhuHBiSIek43xvF7qoUS3R03lEt//CI=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2632345qtb.278.1578473795857;
 Wed, 08 Jan 2020 00:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com> <20191227141405.3396-2-yong.liang@mediatek.com>
In-Reply-To: <20191227141405.3396-2-yong.liang@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 Jan 2020 16:56:25 +0800
Message-ID: <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To:     Yong Liang <yong.liang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

minor nit, s/amr64/arm64/ in the commit title.

On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
>
> From: "yong.liang" <yong.liang@mediatek.com>
>
> 1. Include mt8183-reset.h and add reset-cells in infracfg
> in dtsi file
> 2. Add watchdog device node
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>

Tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> [snip]
