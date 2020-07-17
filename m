Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5712CC433EA
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 316B22074B
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="pRK2H8IZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGQIkg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 04:40:36 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5091 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgGQIkg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 04:40:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1163900000>; Fri, 17 Jul 2020 01:38:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 01:40:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 01:40:36 -0700
Received: from [10.26.72.76] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 08:40:34 +0000
Subject: Re: [PATCH v3 1/2] dt-bindings: Add documentation for GV11B GPU
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200717083609.557205-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5b8d0aaa-41c5-e577-df4c-737660be46f4@nvidia.com>
Date:   Fri, 17 Jul 2020 09:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717083609.557205-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594975120; bh=nQhXKm/WZ+yd5Gs92pLzDYxsTtp2wVWpOK5wR5m00nM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pRK2H8IZPh0xtbYtj3Q0whinXutiq8XN6RXBNC8tzS7/bY4w7Xc6GsFMWDhR3m2IT
         tcE53eTqTgoGTfI6ePuo+b1NiY9iXFaQeGpa5gx3VdZoG+QD9R4Nob2dGhphtqNMFH
         bAPsOrqaq1hRzmHxZxpktG3qpyw97DHC6E+dAuP8Ffw9qaFQcJ6WuZoa4710SGI647
         Gnf37ecDDROLQndUKT3gMX0R1x62o2Zt/iZnBlHKlhx8ct87ADB8g4ldw5Eltps6Bs
         XyskjFbd+dhDtXZHDC+NrcVVSj54pkpIV87Vm3qjCMvoWPhOcf9bclTD8Z4mkDkNoE
         z3WgobHbsEZLw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 17/07/2020 09:36, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The GV11B's device tree bindings are the same as for GP10B, though the
> GPU is not completely compatible, so all that is needed is a different
> compatible string.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - document the "fuse" clock which needs to be enabled during the GPU
>   initialization
> 
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> index f32bbba4d3bc..662a3c8a7d29 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> @@ -6,6 +6,7 @@ Required properties:
>    - nvidia,gk20a
>    - nvidia,gm20b
>    - nvidia,gp10b
> +  - nvidia,gv11b
>  - reg: Physical base address and length of the controller's registers.
>    Must contain two entries:
>    - first entry for bar0
> @@ -25,6 +26,9 @@ Required properties:
>  If the compatible string is "nvidia,gm20b", then the following clock
>  is also required:
>    - ref
> +If the compatible string is "nvidia,gv11b", then the following clock is also
> +required:
> +  - fuse
>  - resets: Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
> @@ -88,3 +92,24 @@ Example for GP10B:
>  		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
>  		iommus = <&smmu TEGRA186_SID_GPU>;
>  	};
> +
> +Example for GV11B:
> +
> +	gpu@17000000 {
> +		compatible = "nvidia,gv11b";
> +		reg = <0x17000000 0x10000000>,
> +		      <0x18000000 0x10000000>;
> +		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "stall", "nonstall";
> +		clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
> +			 <&bpmp TEGRA194_CLK_GPU_PWR>,
> +			 <&bpmp TEGRA194_CLK_FUSE>;
> +		clock-names = "gpu", "pwr", "fuse";
> +		resets = <&bpmp TEGRA194_RESET_GPU>;
> +		reset-names = "gpu";
> +		dma-coherent;
> +
> +		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> +		iommus = <&smmu TEGRA194_SID_GPU>;
> +	};
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
