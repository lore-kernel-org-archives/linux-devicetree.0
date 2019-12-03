Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05D9C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2A6620659
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575383653;
	bh=OFnrcsoM6jb2LYxF1LQQVYOCGLEg/Zcy/bnMdtx5wts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Rm3p76BMfGwSL5B/2wzw56TC2M5fapPeY6ifEwxx+QHxdfKEZOAXF+SEA6TQFhe2h
	 PimAIKVVJ8o2gPqoyUflKD5wzaHgCk/XpAEtlOlLq8PuazwdlMioTpUVEr1TuUmsLw
	 plvqFxgE4ONDwbJSQXv5Lc7Ke7SOOQWc5eNgfmFQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLCOeN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:34:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:51800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfLCOeN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 09:34:13 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D42132070A
        for <devicetree@vger.kernel.org>; Tue,  3 Dec 2019 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575383652;
        bh=OFnrcsoM6jb2LYxF1LQQVYOCGLEg/Zcy/bnMdtx5wts=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C2EPNV7xvtzIfY0ZEyPja749MwjkU5yRWhPdy00YrCIkzebZmUseJSyvILzxmn+HO
         14tiUhz0NmptoYLh5P+Tw0z+63F7XK56hdtIkFCh4teNO39CoU4+zmhEpRKAq/Uy7B
         XnlrrjZ2ne/gx5wSc/4kETRAZAyQNCdVfMuM4M5A=
Received: by mail-qt1-f181.google.com with SMTP id 38so3882693qtb.13
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 06:34:11 -0800 (PST)
X-Gm-Message-State: APjAAAU40Xy539yw/hHGA+3NHTW2kopVHM3os4GLp8Uq8NU8+bScPKax
        8rUWhjOLssbhrTpbfn147pncdj1907yLgrYwaQ==
X-Google-Smtp-Source: APXvYqzqpQedMbavclQCDpAKdZV2g9SzpRmf+5I1HXmhmWOyCfe5GUdl8a/3qynrHsWa5JoqUOGqZFN/dv32V+OmMuI=
X-Received: by 2002:ac8:341d:: with SMTP id u29mr5403725qtb.300.1575383651020;
 Tue, 03 Dec 2019 06:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20191126114319.2755-1-ardb@kernel.org> <20191126114319.2755-7-ardb@kernel.org>
In-Reply-To: <20191126114319.2755-7-ardb@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 3 Dec 2019 08:33:58 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jQcaqSEOhDnvJpyJSqx-em49Gr2cqM9dm2apj57rtUA@mail.gmail.com>
Message-ID: <CAL_Jsq+jQcaqSEOhDnvJpyJSqx-em49Gr2cqM9dm2apj57rtUA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt: amd-seattle: add description of the SATA/CCP SMMUs
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 26, 2019 at 5:43 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Add descriptions of the SMMUs that cover the SATA controller(s)
> on the AMD Seattle SOC. The CCP crypto accelerator shares its
> SMMU with the second SATA controller, which is only enabled on
> B1 silicon.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
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

Nit: iommu@...

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
