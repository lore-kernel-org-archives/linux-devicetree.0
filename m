Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE9EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 05:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3351207CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 05:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YiIFU9Ez"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgGBFGb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 01:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGBFGa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 01:06:30 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9477CC08C5C1
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 22:06:30 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id f6so11941141ioj.5
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 22:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZ47ETVXzGHp5M4VIrOqjcpx5J2EPuzka+sNTw7UoLE=;
        b=YiIFU9EzsHxMnSPRgJV+5hXTLBAIc4uJVIDYOxP1TgNAasD7ugmfudln9uslpxSqCo
         bI8Be59+9bB0NM83obWqjiLQ/dztYsTfJyOFRHR/WaoV9SaJJQLAXLMvfyFi1iSbGqjf
         tdiBbpWUqegEUpnwwR4dfHXAoBWk/tnXgKw6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZ47ETVXzGHp5M4VIrOqjcpx5J2EPuzka+sNTw7UoLE=;
        b=sL/qBkBRF+fgQi6OqmlyrLJyDjx+IwA60inTqAAMgcq2VlFYMfRLLpXAHWFcEunnJ4
         TeR49bjuViCJbhkT/QIGi3tF9o3RNKfLfjMER1kAHbSEOrbx0CVceY6sXMArqZJXfDj9
         iAK7qqM4ocSc0PlGEanVADjywIUA4fzqf1HtsZisZ3B88f/nA7dwcKb8JUUs+gTt632W
         FQivtdUH/SXuMqWjmSUEENSNe1NAUlil7GzHtS1eJSUhz+iG4AM2rfMgjeqK1XpZ3YRo
         w1HIcIy40M06pGOLVb6Du1bKIUuACGXGeaCzQcrPuiVpxt2TN0LooeeCVkGkF5SP3qyJ
         jUuw==
X-Gm-Message-State: AOAM533pxEBfIC/b+OBmqs4Ph9Ldq5w05Xf5vD7oVtoKJD94ww9dn8Wp
        R3yv3HK5H/Ctprcu4YTW6wCx9+z7nKCgqVG3+XtRog==
X-Google-Smtp-Source: ABdhPJzXw2DJHMGPSNP3awNApXu2clvWat6Vu+oQBLrbrBdFY9gePO9d3eY2YBFghqwYnLGIJTWjaNOpeeVxcJb0HU4=
X-Received: by 2002:a05:6602:148d:: with SMTP id a13mr5868932iow.44.1593666389992;
 Wed, 01 Jul 2020 22:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com> <20200625101757.101775-4-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-4-enric.balletbo@collabora.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 2 Jul 2020 13:06:04 +0800
Message-ID: <CAJMQK-iJsoZ-beetO58-d2tit0Oq22SGnBKuPY0jSfbtJVFLeQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: mt8183: Add MediaTek's peripheral
 configuration controller
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        erwanaliasr1@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 25, 2020 at 6:18 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The MediaTek's peripheral configuration controller is present on the
> MT8183 SoC. Add the node for that controller.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c849dc5d6..00137ec61164d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -285,6 +285,12 @@ infracfg: syscon@10001000 {
>                         #reset-cells = <1>;
>                 };
>
> +               pericfg: syscon@10003000 {
> +                       compatible = "mediatek,mt8183-pericfg", "syscon";
> +                       reg = <0 0x10003000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
>                 pio: pinctrl@10005000 {
>                         compatible = "mediatek,mt8183-pinctrl";
>                         reg = <0 0x10005000 0 0x1000>,
> --
> 2.27.0
>
