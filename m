Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC8CC4BA29
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 20:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5372C24653
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 20:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOGFjBTh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgBZUkk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 15:40:40 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44088 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgBZUkj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 15:40:39 -0500
Received: by mail-vs1-f66.google.com with SMTP id p6so300461vsj.11
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 12:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X38dp+xI/8/bQebYRzfnOr8kxspwiuDhfXc+NQs++Fs=;
        b=UOGFjBTh5wpqU9crrLKX2C788sZCcOcl87LvIZspmck+EOvU07D2ISbpfvUCNzdHWi
         1stD0H0A8F7rx8IqDWd+/8UAVCJ5yAGOWoyk2smT6wGRiGUo/2SAnB+XTvn3sEcSsMZd
         oPs2f1h5a3+7nQxbgt7ZjU0L/ziLobpX/4WvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X38dp+xI/8/bQebYRzfnOr8kxspwiuDhfXc+NQs++Fs=;
        b=C0W/Euez/nw0fzfSvRgSbKVSrPQvHwWQjbo6AKkA7DPE2TVfmtvsYhJyz0W5PG7ynG
         y+znzvH03qlgrQvxkWBoLN3kvhKtp4SXRE1RhTI8gVxi/YXkwG2zYP2hKXwoPfAZGfY4
         y/C7RxM2kWpT+sJbv2oWTlocWvTce4cE5Z2oWc5rGDuw0/UhagDwZzmewVCVnyty7VNu
         2+eTzuJ1VPX5hdSjbsjuHvqbLR3Iu0xC0ghUfNNFyYOPcWBOjhT+lYukYGiLBFSgwG/B
         7FPt08AuYs8s7eqKrjTQwsg7zvcDopOhmKCvNpQM/TB68umpwbKOfWuXSQIBSK0Oufcj
         d/pw==
X-Gm-Message-State: APjAAAWQ6r/nYgQ9gh5zollm0YchEqO/su8Ip0mNRIlMInbrnjG1WhbZ
        PSJ5cS7T2lO7ElbNUgjfaY8rugyHOz4=
X-Google-Smtp-Source: APXvYqzHy6Spp9yHdkInpBKBKcUzCTcpyVqiM37mMCQCdKP6X/epVTK21TuNKCzYKssw+R45CkSK0Q==
X-Received: by 2002:a67:eecb:: with SMTP id o11mr546944vsp.227.1582749636722;
        Wed, 26 Feb 2020 12:40:36 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id n10sm1246466vsm.0.2020.02.26.12.40.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:40:36 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id c129so81123vkh.7
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 12:40:36 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr667987vkl.92.1582749635551;
 Wed, 26 Feb 2020 12:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
In-Reply-To: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Feb 2020 12:40:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
Message-ID: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Move venus node to the correct position
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Feb 26, 2020 at 11:40 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Per convention device nodes for SC7180 should be ordered by address.
> This is currently not the case for the venus node, move it to the
> correct position.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 253274d5f04c..5f97945e16a4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
>                         interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               venus: video-codec@aa00000 {
> +                       compatible = "qcom,sc7180-venus";
> +                       reg = <0 0x0aa00000 0 0xff000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&videocc VENUS_GDSC>,
> +                                       <&videocc VCODEC0_GDSC>;
> +                       power-domain-names = "venus", "vcodec0";
> +                       clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +                                <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +                                <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +                       clock-names = "core", "iface", "bus",
> +                                     "vcodec0_core", "vcodec0_bus";
> +                       iommus = <&apps_smmu 0x0c00 0x60>;
> +                       memory-region = <&venus_mem>;
> +
> +                       video-decoder {
> +                               compatible = "venus-decoder";
> +                       };
> +
> +                       video-encoder {
> +                               compatible = "venus-encoder";
> +                       };
> +               };
> +
>                 usb_1: usb@a6f8800 {
>                         compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
>                         reg = <0 0x0a6f8800 0 0x400>;

Maybe try one more time?

>>> print [hex(x) for x in sorted([0x0aa00000, 0x0a6f8800])]
['0xa6f8800', '0xaa00000']

...makes me convinced that the codec should come _after_ the USB node, no?

-Doug
