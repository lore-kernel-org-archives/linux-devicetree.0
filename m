Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9499C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFF132080A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bg/yWxen"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfLCOKp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:10:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50963 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCOKp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:10:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so3116667wmg.0
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 06:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HGjAXZQx1EB9tsxVpd2mFdueY6RKdeeUL6gCePXpJho=;
        b=Bg/yWxen6hcV4hbGGWc+KvbdUWPOvYtP49GjEeGXjGj366KhFWi35fwKc4o86DGtYK
         0YNM9FovBpU5ycrjY5vLaKX8BK5jZ9GT19GAO0mRRoaM8GxpeYlz9ZjcLmYLmo3hGAjG
         hQFPJ/WNevgxLwNg9A6btjU53wDpB8hJGHjHwp7FV23deDC3tab25wj1YTwp6nhfYK9a
         96sth3aaAmnHJZp9mYsUi71rWkwm80eNquj+2GXAZP2mNG9943W4VaRuPkcfsxcTQsjf
         UMEEPsSafgUm9Jly9NZmGnnvADN4KUIlLn6tfwJ1nMKyTNzyJ7Pcz7uAhpY1r6VsYLoK
         B5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HGjAXZQx1EB9tsxVpd2mFdueY6RKdeeUL6gCePXpJho=;
        b=CWWGaFVMpzHlMCncjqRxacjdzdZn2rKIEvCNiiWJirUXXy07njFI18dK2SKtk1QZ1Q
         yd7gixFgSUG6Rq08sLSDxr1ve7DOaeJfM+6i/QipXAjBr5V/xvBM+B2x8KsKlAYr1PYg
         FBHXVOlq3EVofMBEqMsNMJJflzJfxeTrZCzo1AhmV7l1I8jLO76IZBNvPsXg6+0FOjHO
         5VyhffXLIr3nz4VVUheD2vbALgoi4/9js0T0E/Ysy8uoxLIZ3Wc7W8L/TNOLl6nL8Iqt
         lL3z7Cbrg0H1QjszVv2PwykgARfPdXM0fX6aVEuLRkfm6QcV/wGFiWyzF0XQ93BX9HmD
         5hXA==
X-Gm-Message-State: APjAAAWwBGUqPhwYTBIrFH8RbBbiZHGIptWs/ymAE2Q5M8rLPxExySu3
        Jvg0bkNQufUdGHxTtVXF2wJjleNnVPqQfEzIMl+vCw==
X-Google-Smtp-Source: APXvYqySeACu3hotMIO7uyBq++za0r49yaoX4YVHwqUHXls6xH1JcEsgoGwGMXun7WZyBGk2foSJbxSmRC57oyyWY5o=
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr35272976wmf.10.1575382242700;
 Tue, 03 Dec 2019 06:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20191126114319.2755-1-ardb@kernel.org> <20191126114319.2755-7-ardb@kernel.org>
In-Reply-To: <20191126114319.2755-7-ardb@kernel.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 3 Dec 2019 14:10:38 +0000
Message-ID: <CAKv+Gu8zr=Ou3+TwQtpSMkY1KDVBwJ+WLyG=pB1mL5kB+jMDJA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt: amd-seattle: add description of the SATA/CCP SMMUs
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Devicetree List <devicetree@vger.kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 Nov 2019 at 11:43, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Add descriptions of the SMMUs that cover the SATA controller(s)
> on the AMD Seattle SOC. The CCP crypto accelerator shares its
> SMMU with the second SATA controller, which is only enabled on
> B1 silicon.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

We saw some breakage with this configuration on B0 silicon when using
the first SATA port, so I will need to respin this again.

> ---
>  arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |  4 ++++
>  arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |  5 +++++
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     | 22 ++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> index 8e341be9a399..be8db5758c94 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> @@ -60,6 +60,10 @@
>         status = "ok";
>  };
>
> +&sata0 {
> +       iommus = <&sata0_smmu 0x0a>, <&sata0_smmu 0x0b>, <&sata0_smmu 0x1a>;
> +};
> +
>  &spi0 {
>         status = "ok";
>  };
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> index 92cef05c6b74..1661544eb0af 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> @@ -60,7 +60,12 @@
>         status = "ok";
>  };
>
> +&sata0 {
> +       iommus = <&sata0_smmu 0x0e>, <&sata0_smmu 0x0f>, <&sata0_smmu 0x1e>;
> +};
> +
>  &sata1 {
> +       iommus = <&sata1_smmu 0x0e>, <&sata1_smmu 0x0f>, <&sata1_smmu 0x1e>;
>         status = "ok";
>  };
>
> diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> index 7484ea695262..eac241c98ff0 100644
> --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> @@ -83,6 +83,24 @@
>                         dma-coherent;
>                 };
>
> +               sata0_smmu: smmu@e0200000 {
> +                       compatible = "arm,mmu-401";
> +                       reg = <0 0xe0200000 0 0x10000>;
> +                       #global-interrupts = <1>;
> +                       interrupts = <0 332 4>, <0 332 4>;
> +                       #iommu-cells = <1>;
> +                       dma-coherent;
> +               };
> +
> +               sata1_smmu: smmu@e0c00000 {
> +                       compatible = "arm,mmu-401";
> +                       reg = <0 0xe0c00000 0 0x10000>;
> +                       #global-interrupts = <1>;
> +                       interrupts = <0 331 4>, <0 331 4>;
> +                       #iommu-cells = <1>;
> +                       dma-coherent;
> +               };
> +
>                 i2c0: i2c@e1000000 {
>                         status = "disabled";
>                         compatible = "snps,designware-i2c";
> @@ -201,6 +219,10 @@
>                         reg = <0 0xe0100000 0 0x10000>;
>                         interrupts = <0 3 4>;
>                         dma-coherent;
> +                       iommus = <&sata1_smmu 0x00>,
> +                                <&sata1_smmu 0x02>,
> +                                <&sata1_smmu 0x40>,
> +                                <&sata1_smmu 0x42>;
>                 };
>
>                 pcie0: pcie@f0000000 {
> --
> 2.17.1
>
