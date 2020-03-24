Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E81C41621
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 17:40:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A6FA20714
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 17:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="drSQstK+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgCXRkY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 13:40:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40670 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgCXRkY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 13:40:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id 19so19503324ljj.7
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHdHSXeaggEKXTuBPUsj+Dax4+iq/FMGBOOC34Ttl8I=;
        b=drSQstK+tdROKRR/LjOj0ucrd3VEKgjwndat96gIt+pKISyoD4RCEXpolqW2DSz887
         NXDT3WHFlNiBYqtYaJhxvGLK/i0ts8BKmntpzqOqXMEG3/nwDTJqCvmppkci0sgKx8aJ
         BZQn9m3oSQgMvJILG91fD7vdJijttO+lLvgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHdHSXeaggEKXTuBPUsj+Dax4+iq/FMGBOOC34Ttl8I=;
        b=qDF+v6cJF5jgNmF+tdeA0aTzufEZiTDKLxGOKmbyNfTk5Cbt57TiLbMXSJ+w8bkw/1
         L7gCYmQW4LeTweMIb12qHNd6k/a34hgNxCYHVtZZ6lO5k2xqcPdcRf7b4LGTKDbPZxxl
         kyUOh3Z/J8jytP2hK8AMv6OeayWq+J5Zzu4dPIM8XwhQQZ0J5hn5/W5Rl6wO1ZMTd2fQ
         Pe/srVuqA1OIG70aKqi1HGQXzAHq1Y//5qWxzvyGwLYpftYnFKe+EHIHHUZbn9t4wUND
         Oqts+MXQsPCnRtbU/UbCfv70a7+HOC5pEf7imE/UAvnDpBRgw4QCc0dAB2YXN89cBUnE
         MGAw==
X-Gm-Message-State: ANhLgQ29L+uO/ZKubx5ThIzWc+TU/ipZFq87om4JLnQrJyiz1N54cmhP
        wYGwgzw3IUcBUB/5DBXsgbV3f0AXQjU=
X-Google-Smtp-Source: ADFU+vtOFsdCvSWtLj5W6aoH2/aZfH8a+P415jew0Cbr3fPn1lunrigLYbbDOnhFLtoPgF+3SmRoxg==
X-Received: by 2002:a2e:83cf:: with SMTP id s15mr1991916ljh.36.1585071621800;
        Tue, 24 Mar 2020 10:40:21 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id y64sm8614277lfa.88.2020.03.24.10.40.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 10:40:20 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id n17so9196823lji.8
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 10:40:20 -0700 (PDT)
X-Received: by 2002:a2e:a495:: with SMTP id h21mr6019658lji.123.1585071619722;
 Tue, 24 Mar 2020 10:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 24 Mar 2020 10:39:43 -0700
X-Gmail-Original-Message-ID: <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
Message-ID: <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rakesh,

On Tue, Feb 4, 2020 at 5:21 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

What is the status of this? Looks like you have some feedback from
Sibi. Can you reply and spin this? Also a comment below:

> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27 +++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..167f68ac 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,11 @@
>         vdda-pll-supply = <&vreg_l4a_0p8>;
>  };
>
> +&wifi {
> +       status = "okay";
> +       qcom,msa-fixed-perm;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
>  &qspi_clk {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..e3e8610 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -75,6 +75,11 @@
>                         reg = <0x0 0x80900000 0x0 0x200000>;
>                         no-map;
>                 };
> +
> +               wlan_fw_mem: memory@93900000 {
> +                       reg = <0 0x93900000 0 0x200000>;
> +                       no-map;
> +               };
>         };
>
>         cpus {
> @@ -1490,6 +1495,28 @@
>
>                         #freq-domain-cells = <1>;
>                 };
> +
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       reg = <0 0x18800000 0 0x800000>;
> +                       reg-names = "membase";
> +                       iommus = <&apps_smmu 0xc0 0x1>;
> +                       interrupts =
> +                               <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +                               <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +                               <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +                               <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +                               <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +                               <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +                               <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +                               <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +                               <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +                               <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +                               <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +                               <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +                       memory-region = <&wlan_fw_mem>;

The clocks are missing:

clocks = <&rpmhcc RPMH_RF_CLK2>;
clock-names = "cxo_ref_clk_pin";

> +                       status = "disabled";
> +               };
>         };
>
>         thermal-zones {
> --
> 2.7.4
>
