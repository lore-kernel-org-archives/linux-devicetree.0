Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B4DC433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B683520716
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HGpqSDw3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392412AbgHQTgH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 15:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392396AbgHQTgC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 15:36:02 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5551C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 12:36:01 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p24so19168627ejf.13
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VwFw5hgUmgRtXhrUbQX2TB/ljF4qHz9d6xiixFTiMJw=;
        b=HGpqSDw3fP6ZBWEE+ohC8/MRyRcWLSXgCc70YwJNS0CpNnz2GpL3DFcmbnaYoEvOyj
         W42olQhdk1YTsaeuOP74p9ElmBvSOEhCL/fYqkqiAtEkJOEk9cIJThg7cKitD0nMDXeA
         fYI92dRFyrOoLciA5IBfIeYblE9VwJg8/+s2eaOFRa7Qi+oumXELb/33P/Pidw7jmD8+
         /Ba9iTlQyEQasdL09wMhZsNNrOQkgG2zKR21DlTb+s7NDoaAIyRhiBllGjtTymZhvsLi
         IZPyvHuM8N5OpEUnZsmg5M+ZSCVzdFwBYI2d+nKpUf5Er16KfVCgMev6gPb4CaLcsga4
         znpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwFw5hgUmgRtXhrUbQX2TB/ljF4qHz9d6xiixFTiMJw=;
        b=a9O39MABF4+Zldn8bRbxU/vAh3m5dJbJdK3r/vD0vB2DhpM5SmIe/VB/8pP+tdaIfk
         +hyiNP7mAXsWi8e8g2uhoQevlO3LVSLh+mOKXJ1G6cnF31LcVjszUCLmrq15sai3eWZg
         SnjRT01NoX2UyrsWffM+hxaboH+iErutPdlPZnZ+RWq1nbRZ2ATe4af27V4GbxH+bQD/
         NAkCwq5hr9P5GWT5D3dZOtyIBZYXWwlkoJSQypSHUorbPFkZZ3eHLTwCSxNMeExnVpVO
         U7tTa0NAtULMkkSMluo13qjzWIFN4/YocOkKEVOTn68jf8F4wgbHJYqsI4lEVSpzwu6J
         HMzA==
X-Gm-Message-State: AOAM532F3n2AoK9v8ENnQCDRcj8gLlOCOsqC6XeX6vxWZyjILT7r6D+v
        Z4ojhr4mbVQl4Fe2GBCrLJEQMEWx+BZmaWqSyho=
X-Google-Smtp-Source: ABdhPJzBLq7BTUZu0gPhyPZr1iMVSNYxpytQ0oWV4Nv6K4s8WcQqs0XwbGPW54bVfRpJFoiUF59hC2YERdceZBH+2xs=
X-Received: by 2002:a17:906:cc47:: with SMTP id mm7mr15799313ejb.362.1597692960285;
 Mon, 17 Aug 2020 12:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-2-linux.amoon@gmail.com>
In-Reply-To: <20200817102122.434-2-linux.amoon@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 17 Aug 2020 21:35:49 +0200
Message-ID: <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Anand,

thank you for updating this patch!

On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> changes v2
> --Fix the missing INT (GPIOA.BIT7) pinctrl.
should I also expect an interrupt property somewhere below?

> --Fix the missing rtcwakeup.
> --Drop the clock not required clock property by the PCF8563 driver.
> ---
>  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 34fffa6d859d..f08ae1b337ad 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
>         };
>  };
>
> +&i2c3 {
> +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> +       pinctrl-names = "default";
why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
also I'm surprised to see a TDM (audio) related pin function as part
of an I2C controller. if this is correct then I'd appreciate a bit
information (for example as part of the patch description) why that is


Martin
