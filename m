Return-Path: <SRS0=DFaX=3O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C5DC35244
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 18:48:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C9872071E
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 18:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="1/pz4dmo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgAYSsC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jan 2020 13:48:02 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44329 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgAYSsC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jan 2020 13:48:02 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so2863796oia.11
        for <devicetree@vger.kernel.org>; Sat, 25 Jan 2020 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b12gXgpzEnBV3TEYdPU7aJgxJdZG+mmVOMizdv7D9OM=;
        b=1/pz4dmo+4bjSLgMNaNpA3Czc/sNhbfo/ORbNsADjHPQ9l5yWtw9Hw6YyOLDClKe3H
         WCdjBANplR3BKmUQkQ+RQfEs9ydqabe/DHY8NXtZExTl5e3oztQaJ+ONHJuiqQEYFwdy
         9BZS9erPhWmY6rMt5MFZpDstAi45Lt+TNbtHGNNGbrIp6TWCsWKDfqIrD6NxcT9zRJJ6
         aHW1QziVMPMOlcb1rpJng8x+PGOWngzzH69LkmFTS7haAnQ33zW2tBZrrfkFLaa1UGgx
         S+ufHfaERiw5y/noWJ8eOKa+kRzsJ3EhSElcxVxzXTpLzfa+t5dtfMouFMkhTZhXBemz
         uxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b12gXgpzEnBV3TEYdPU7aJgxJdZG+mmVOMizdv7D9OM=;
        b=CPKCkmfBhYozaqtEg5I/MRyF+Ad8bHWplxJ6PMCDJeivwkTYwEhLiLnMRnfVNo+Khw
         jM9bCf4YeXLqqT7ko312DHsKcpIExhaCVr31IR+HGlgTo35oEL4GXsnvKDSJzhReX2Qm
         +DQRWBvGQqR+gOg2fkxCN7Ga6Umrn7+tdjMu27LIflazDBzFi/7EbRAvXJ7IygXKBBpu
         M6BImG0qoVQBJq8btWUufPGAFEEeVwRsK97uIaR0JEa1WuXZsWRmI19uGh5NZL6Syt3t
         0+hkWksueW2lMb1vrAvbhisorUlGmsDXd0+yCa5A8gp8N4mzvbN1mXlY4ia0Em0t6tOq
         v9zQ==
X-Gm-Message-State: APjAAAVnoEatq8xKUfndrX8P31B6bi4AeKOidZ/rw3AX7gRv/VDhkOKU
        F5NB/1ieRI+YKkN9wdNTiTR8HOfr1zWJREvTw0XkarobzBe4qA==
X-Google-Smtp-Source: APXvYqzjoQm8D0lkiup3uzD9802Tr6NdcVAByCveRRYecEhMl3BTa39maSqadZosmdNmbAEzmsF4kV8aiig3D1sKhZU=
X-Received: by 2002:a05:6808:4c2:: with SMTP id a2mr2943772oie.118.1579978081358;
 Sat, 25 Jan 2020 10:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20200108125455.308969-1-robert.marko@sartura.hr>
In-Reply-To: <20200108125455.308969-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 25 Jan 2020 19:47:50 +0100
Message-ID: <CA+HBbNE2Hd4Cse4qeuQuBb-6sYXRyckUQs3Udj9qxvTbzLNQyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: qcom: add gpio-ranges property
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Any issues that are preventing merging of this patch?

Cheers

On Wed, Jan 8, 2020 at 1:55 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: Christian Lamparter <chunkeey@gmail.com>
>
> This patch adds the gpio-ranges property to almost all of
> the Qualcomm ARM platforms that utilize the pinctrl-msm
> framework.
>
> The gpio-ranges property is part of the gpiolib subsystem.
> As a result, the binding text is available in section
> "2.1 gpio- and pin-controller interaction" of
> Documentation/devicetree/bindings/gpio/gpio.txt
>
> For more information please see the patch titled:
> "pinctrl: msm: fix gpio-hog related boot issues" from
> this series.
>
> Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes since v1:
> - Split ARM and ARM64 DTS changes into separate patches
>
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 1 +
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 1 +
>  8 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 8b79b4112ee1..2687c4e890ba 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -350,6 +350,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm_pinmux 0 0 90>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..4cc2d33f3d3b 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -401,6 +401,7 @@
>                         compatible = "qcom,apq8084-pinctrl";
>                         reg = <0xfd510000 0x4000>;
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 147>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 72d4e290b543..b6e5203a210b 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -201,6 +201,7 @@
>                         compatible = "qcom,ipq4019-pinctrl";
>                         reg = <0x01000000 0x300000>;
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 100>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 16c0da97932c..4021f661cd11 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -119,6 +119,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&qcom_pinmux 0 0 69>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index 356e9535f7a6..347b4f7d7889 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -128,6 +128,7 @@
>                 msmgpio: pinctrl@800000 {
>                         compatible = "qcom,mdm9615-pinctrl";
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 88>;
>                         #gpio-cells = <2>;
>                         interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index ec5cbc468bd3..480fc08cbe8e 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -115,6 +115,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 173>;
>                         #gpio-cells = <2>;
>                         interrupts = <0 16 0x4>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index f2aeaccdc1ad..172ea3c70eac 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -107,6 +107,7 @@
>                 msmgpio: pinctrl@800000 {
>                         compatible = "qcom,msm8960-pinctrl";
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 152>;
>                         #gpio-cells = <2>;
>                         interrupts = <0 16 0x4>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 369e58f64145..1689cf925b03 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -707,6 +707,7 @@
>                         compatible = "qcom,msm8974-pinctrl";
>                         reg = <0xfd510000 0x4000>;
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 146>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> --
> 2.24.1
>
