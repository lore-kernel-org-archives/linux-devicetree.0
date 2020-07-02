Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40843C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 05:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FD5A207CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 05:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4Y7fZEl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgGBFFU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 01:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgGBFFU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 01:05:20 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A85DC08C5DB
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 22:05:20 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id e64so22618830iof.12
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePm8K1YrKTYlTFOwBCRGn4xw8mI3+0R5ZwHfAbLgLak=;
        b=D4Y7fZElDuKkAbGQBTP7tnXJ9yxEYcJ1+lqoyHC2Q4j4RAG70CRzK84FdG5w43sSjw
         9IIsyPC8XLWKN4+EuqWpOq7nDJ9OrCSROZZ9x30dtGEgEwPw08WBGqZzPGLDzO+HM52/
         Ej5TSs+VoFSZkT1ZArqjX03JDC1rNspZXsfTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePm8K1YrKTYlTFOwBCRGn4xw8mI3+0R5ZwHfAbLgLak=;
        b=meTJoWiXOOsNjZg21G2EEEcPmLGY3WD7rY3/g3zElRwhoLaNg8xPH6GdDkscIIm2/J
         1Gr/XQAoARKxyk5c0G3154R5BPKvL0YA1aYZsVGg6f40lxIOFLMPb34p6MotqNL6pkFu
         EhYYJirgEpm5IXOPpraeoCXGLB0xuJxz+TyTTNiTej37vwqYucNU2ikZZZHvNsDkArQq
         dtWOwi4+P5WHFnHSEa3tBLMBAaoKzXE1SVSwTV2JQ/mVRgMPeVAVtoobDiPAO1N5/DRQ
         8+oYOrVdL0GUTREXeObovvm99rANNLRd8m7C+4NAenUvwgC0/t7FOJfDdTa5zkDD5Tp3
         FZLg==
X-Gm-Message-State: AOAM53316o4LNKmJdjQvbaRIGjNJ7M+CX/vK+YZIQeabFPco1Wh0+FzM
        g33Td7BgeIxgxnkiAy5NEfVOHbUO/OBHUtKGV9W+LQ==
X-Google-Smtp-Source: ABdhPJw2kPVQNy2tWis10zqAhHf5YpNiIQG11abVlOkUAhNPPsHAqxRbxQbJ1oKec7GIt0IdmyqCbGzt0U1S+2n9eq8=
X-Received: by 2002:a05:6602:2295:: with SMTP id d21mr5736965iod.0.1593666319420;
 Wed, 01 Jul 2020 22:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com> <20200625101757.101775-3-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-3-enric.balletbo@collabora.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 2 Jul 2020 13:04:53 +0800
Message-ID: <CAJMQK-hGg0QUjZsWN3rXzbZVD3DQEmOjkcoJixEn7YfKRMC==g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: mt6358: Add the compatible for the regulators
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
> The regulators are expected to be instantiated with matching the
> device-tree compatible, so add the proper compatible name under the
> regulators node.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> index 9361ada0c497e..fa159b20379e4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -16,6 +16,8 @@ mt6358codec: mt6358codec {
>                 };
>
>                 mt6358regulator: mt6358regulator {
> +                       compatible = "mediatek,mt6358-regulator";
> +
>                         mt6358_vdram1_reg: buck_vdram1 {
>                                 regulator-name = "vdram1";
>                                 regulator-min-microvolt = <500000>;
> --
> 2.27.0
>
