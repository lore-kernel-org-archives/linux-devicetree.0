Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798EFC33CAE
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 07:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49AFD2075B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 07:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kcDnCbCu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgAMHI0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 02:08:26 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37357 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgAMHI0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 02:08:26 -0500
Received: by mail-qk1-f194.google.com with SMTP id 21so7619991qky.4
        for <devicetree@vger.kernel.org>; Sun, 12 Jan 2020 23:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Li93yx3mVpdyk7CJK6HDbuJvR+euWoOVK8hS+mAbZms=;
        b=kcDnCbCuetwq8A/q63qeQ4jlC3PQiMbt+cpgN4GqEKafeNFliKhFMJ77TQBfNM+uMZ
         GxLi2SFn3qZC0mWbqPvE/PEQhABJA3O7117XpPYMuoOfLQavmLT39YopEgBs/IEFEsCL
         YLeEodBlNKuV+NJxnyI4smhWZr8oxmFTdGnLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Li93yx3mVpdyk7CJK6HDbuJvR+euWoOVK8hS+mAbZms=;
        b=YPN4C4pepFfrUA4qjV04iUs0hX8lo1+e2LXELbWcbEgCYxN9NbsWdbXj3MHPmprX39
         dVqVho0mAn8ITg+gLw1tCHZtXHRsqoNQtKN7j1WV2GgsQJSz2isvXC0ZKn2SfVP+2Cwv
         /T/BbuFuH1fTT9kdeU4ULAwo4vaw0mAUhE5qOZMwTl53pnPQuU8OY55guhl+5/Fr5YcQ
         owyolZLXrbp5q1NMv7qFgpWXXPQGmDU6zHOxhHGBQp0FcMClYME6CBa13kxVsLQvdEUY
         4lAhjcgWeKnHLs5J2cW3kj5ywF3ZMP9z/E1MKjLb46VyZhFDmja6aY1R2FkNj0cizUMs
         h9Pw==
X-Gm-Message-State: APjAAAWzYjCmf+Uzzt6Jg1KRKXchRalPkBv28qK3acl6+qjIL88KQ/il
        AiI5n/hohRVLN/F+vBEnq48wMhcpm3eRPEGYKCs4eQ==
X-Google-Smtp-Source: APXvYqy6PyadEbexQKem912USX21lARZeie9Bf+dUuy9LQm4s9hBnBrf7pNLiJG+vj+X6NMNYB/L+81jzgTCFcCmYQw=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr10243195qkg.457.1578899305001;
 Sun, 12 Jan 2020 23:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
In-Reply-To: <20200110145952.9720-1-matthias.bgg@kernel.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 13 Jan 2020 15:08:14 +0800
Message-ID: <CANMq1KCnLb04O3HWv_9HbkiDufN9_Kcapkg1wpT9ra28nJ6WFw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
To:     matthias.bgg@kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 11:00 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> The MT6397 mfd includes a pin controller. Add binding
> a description for it.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

>
> ---
>
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index a9b105ac00a8..ce22fca9d48b 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -54,6 +54,11 @@ Optional subnodes:
>                 - compatible: "mediatek,mt6323-pwrc"
>         For details, see ../power/reset/mt6323-poweroff.txt
>
> +- pin-controller
> +       Required properties:
> +               - compatible: "mediatek,mt6397-pinctrl"
> +       For details, see ../pinctrl/pinctrl-mt65xx.txt
> +
>  Example:
>         pwrap: pwrap@1000f000 {
>                 compatible = "mediatek,mt8135-pwrap";
> --
> 2.24.0
>
