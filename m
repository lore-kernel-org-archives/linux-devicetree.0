Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0470FC433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 18:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D75B620717
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 18:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bOI/H+t8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732488AbgGVSvY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 14:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgGVSvX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 14:51:23 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99FDC0619E0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 11:51:21 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id lx13so3382394ejb.4
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckjMfObU3VR4aVlN8sx7NeyOwpBgmwCnRHjq06bGHdA=;
        b=bOI/H+t8PnciNYTHP/88aE2CzZkUKTkT2+gh5LYFnaRTm7sX+E3EBfyXcWby2Lk9o8
         THn8qBlr9fR/kLc/rJOhtfchzPz2h6GViYLw0YJBWkd1QhP61SYEQKyiRd52AdJ0t31T
         BkzlhwABTrcUx/oBR2Yygdp/myp1rsyOcP3fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckjMfObU3VR4aVlN8sx7NeyOwpBgmwCnRHjq06bGHdA=;
        b=dz5Ouo6HA1JtvL+hoMvPMh9Mby/x9bWty6jTVwy6/kPTrJ15XohkHHElS4aDy0Bppx
         rbTknAgpoMpprC0Jo4aBJToH1q6XlV/ji/VCVDL8Kl4fCtYabP51g8xhCpfEA5Ujs2Xx
         aHLyyoapGxlFBNcjoN3f7U/s0S+TZed3gCkRfbr8xpYBx43nEAr9gO0f5vLNlmpW0D+E
         oao4DrUB+9c6z6vVA+gM0Ua6hb75qljI0gl7yrW2xLgjmbwfvf+sT5QhTjbevi992cVw
         74c7jpU/LMhZBSzBIO9J5c+fVNNJ5Lmw9u8RTg2AtoHpCSLIZ8DeEwsK1Asa51Oh0TOQ
         +szg==
X-Gm-Message-State: AOAM531DDR7TfMnF/LgtsZ40b9Ww+YkUbtL4daEmo4X7zl3Izxy+nqUt
        Rf/kLzw27g6jkoeeR6E29/gSAlfCHTpE4YzEGrML6A==
X-Google-Smtp-Source: ABdhPJwkngaZ2CHVRhBzf8uI4XLL0dC4YbAv+ZrUhO8OEdsq3u5XQolU4RSgHCv2T3YROp8PBgWIIC1BBIjreo/5ifc=
X-Received: by 2002:a17:906:ecf4:: with SMTP id qt20mr929128ejb.485.1595443880417;
 Wed, 22 Jul 2020 11:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200720110230.367985-1-jagan@amarulasolutions.com> <20200720110230.367985-3-jagan@amarulasolutions.com>
In-Reply-To: <20200720110230.367985-3-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 23 Jul 2020 00:21:07 +0530
Message-ID: <CAMty3ZDkvRGn6a54ryVFNJOwm+X6YXW-TxSjO+kC9o2kshRxtg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add PCIe for RockPI N10
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

On Mon, Jul 20, 2020 at 4:33 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This patch adds support to enable PCIe for RockPI N10.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../dts/rockchip/rk3399pro-vmarc-som.dtsi     | 41 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> index ebccc4a153a2..b415b8a16c78 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> @@ -11,6 +11,19 @@
>
>  / {
>         compatible = "vamrs,rk3399pro-vmarc-som", "rockchip,rk3399pro";
> +
> +

Sorry for this extra space, let me know so that I can resend next version.

Jagan.
