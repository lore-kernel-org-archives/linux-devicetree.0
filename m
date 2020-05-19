Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEE7C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAFF6207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iMBY+L1k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgESUHr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgESUHr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:07:47 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E67C08C5C2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:07:47 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id i89so419096uad.5
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXbwGQX7NBj93macBQks6TpgCaCAqI85y6U/Eho5NaA=;
        b=iMBY+L1k7S2P7A4yIvSJy4MuZVOr4X+yr4pt1EqaJLCp6UcTm+kmuYjI5XDEe9FOP2
         SumGBT1xC3NYhOGo+zSCsVuJcjHpynQ2q6oJ45AVzmudv6qxVEOkF4nnIgDJqe8LeQwJ
         yB5S7v/Ar4tfTj9fY0v9m2ouNF1hwJw9OzKyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXbwGQX7NBj93macBQks6TpgCaCAqI85y6U/Eho5NaA=;
        b=NsSRHSfMYHEb7ofC3w42w/92QA+51XX6/pAfVDHPlcUOXI5bIniROfXVDXaAth/6ZJ
         RKkGgVVwc+lQUSXY+vcLqgOVg/ECNZdc/sS5k9vLpkVzqGqFRkb7HZIFAwEgMtshth8y
         LXtGqHBH7GyoOd/zKsufXQF62HWs2uZlEc9GYRtAgW1jN0kmxR8YoRGCuGJsMHFCPabI
         rusfXAoZ8QKTS+u36Z+dNJCFqywYzk/mMgKD0SbRWKdrzosQLTj0k3Sy3pN55O5Q1v+Z
         xpN9GgJv+SKM5xuzwz+KV5C5JhRZkM1E9ZF71vUhcbGwOFR+ZKOLvSe4V6qyiEQEQq3S
         TJ6A==
X-Gm-Message-State: AOAM530lKbtRSwW/3U7K6eT3K5FqTAvyEla6PlwcBYSoZHO7PkmNPSZO
        Qw8lAph/96O8p+1pOkKdynBOJm9F/kM=
X-Google-Smtp-Source: ABdhPJw27XntE823KyS5nOOl2c8qnEfBY6Ny0ozR8bppup6hHYKFig0zkPTGreVJcEtNvbJIh00elA==
X-Received: by 2002:ab0:6688:: with SMTP id a8mr935795uan.93.1589918865821;
        Tue, 19 May 2020 13:07:45 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id n17sm178836vkn.29.2020.05.19.13.07.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 13:07:45 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id k3so406320ual.8
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:07:44 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr945772uak.91.1589918864128;
 Tue, 19 May 2020 13:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 May 2020 13:07:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXRhh-1cWH5rMPq4W_Dh4yE=++sga_aJ8cwFkKkrAXbg@mail.gmail.com>
Message-ID: <CAD=FV=XXRhh-1cWH5rMPq4W_Dh4yE=++sga_aJ8cwFkKkrAXbg@mail.gmail.com>
Subject: Re: [PATCH v10] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 11:53 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v9:
> - Place the wlan_fw_mem under reserved-memory node
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  7 +++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27 +++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 4e9149d..38b102e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -389,6 +389,13 @@
>         };
>  };
>
> +&wifi {
> +       status = "okay";
> +       wifi-firmware {
> +               iommus = <&apps_smmu 0xc2 0x1>;
> +       };
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
>  &qspi_clk {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f1280e0..19bd7d0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -106,6 +106,11 @@
>                         no-map;
>                 };
>
> +               wlan_fw_mem: memory@94100000 {
> +                       reg = <0 0x94100000 0 0x200000>;
> +                       no-map;
> +               };
> +
>                 rmtfs_mem: memory@84400000 {
>                         compatible = "qcom,rmtfs-mem";
>                         reg = <0x0 0x84400000 0x0 0x200000>;

This is less wrong than v9, but still a little wrong.  You should be
keeping these ordered by unit address.  94100000 comes after 84400000.

-Doug
