Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3333BC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ED31206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CvQPScuQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQIlB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 04:41:01 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17206 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGQIlB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 04:41:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1163e1000a>; Fri, 17 Jul 2020 01:40:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 01:41:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 01:41:01 -0700
Received: from [10.26.72.76] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 08:40:59 +0000
Subject: Re: [PATCH v3 2/2] arm64: tegra: Add the GPU on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200717083609.557205-1-thierry.reding@gmail.com>
 <20200717083609.557205-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <65d7fa27-9b88-6af5-089f-60e97ecf3f12@nvidia.com>
Date:   Fri, 17 Jul 2020 09:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717083609.557205-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594975201; bh=OVZl6FSAHz95h6c3WzpADkBXrgveQBNM3vdlEASw5Cc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CvQPScuQWT8lvjX52yidxnTLe/oRlH+K5lyvbgs1TUJUbOiyq+1lIH+N0jz9resLK
         qnbZ5hK/Wxu2XVx15D/eTOwaSKwfaUqnQcws34frkyKx1syXRy0lLpidz7C4DESa96
         401bnwRo/mzhpHZNCgV683kE4CPKr3UPTpDHNFWB6eLuGipZCmLLvSdedtgppI05Gh
         ksWVxS+j4+DRhIvAWVTfCXb0R1rhpJis3vdzyGHOouKGctEbeu5CmOa34b27W8jI1I
         idcDPGWT6IBIUfXwLQPB560wGci497leJEw9YOxAOPcL9FlXku4lwL4hys5L2DBu3W
         LYy80fi9DVaDw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 17/07/2020 09:36, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
> GV11B.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - mark the GPU as DMA coherent because that's enforced by the MSS
> - add FUSE clock which is needed during GPU initialization
> - enable GPU by default
> 
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 98c366ab4aab..48160f48003a 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1395,6 +1395,40 @@ sor3: sor@15bc0000 {
>  				nvidia,interface = <3>;
>  			};
>  		};
> +
> +		gpu@17000000 {
> +			compatible = "nvidia,gv11b";
> +			reg = <0x17000000 0x10000000>,
> +			      <0x18000000 0x10000000>;
> +			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "stall", "nonstall";
> +			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
> +				 <&bpmp TEGRA194_CLK_GPU_PWR>,
> +				 <&bpmp TEGRA194_CLK_FUSE>;
> +			clock-names = "gpu", "pwr", "fuse";
> +			resets = <&bpmp TEGRA194_RESET_GPU>;
> +			reset-names = "gpu";
> +			dma-coherent;
> +
> +			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
> +			interconnect-names = "dma-mem", "read-0-hp", "write-0",
> +					     "read-1", "read-1-hp", "write-1",
> +					     "read-2", "read-2-hp", "write-2",
> +					     "read-3", "read-3-hp", "write-3";
> +		};
>  	};
>  
>  	pcie@14100000 {
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
