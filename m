Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CE2C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 15:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A73B021771
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 15:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfK1P6e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 10:58:34 -0500
Received: from foss.arm.com ([217.140.110.172]:37796 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfK1P6e (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 10:58:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895C41FB;
        Thu, 28 Nov 2019 07:58:33 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B347D3F6C4;
        Thu, 28 Nov 2019 07:58:32 -0800 (PST)
Subject: Re: [PATCH] Revert "arm64: dts: juno: add dma-ranges property"
To:     Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20191126165355.6696-1-sudeep.holla@arm.com>
 <20191128154242.1035-1-sudeep.holla@arm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1e0ad966-031a-1343-a83e-8536a678341c@arm.com>
Date:   Thu, 28 Nov 2019 15:58:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128154242.1035-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/11/2019 3:42 pm, Sudeep Holla wrote:
> This reverts commit 193d00a2b35ee3353813b4006a18131122087205.
> 
> Commit 951d48855d86 ("of: Make of_dma_get_range() work on bus nodes")
> reworked the logic such that of_dma_get_range() works correctly
> starting from a bus node containing "dma-ranges".
> 
> Since on Juno we don't have a SoC level bus node and "dma-ranges" is
> present only in the root node, we get the following error:
> 
> OF: translation of DMA address(0) to CPU address failed node(/sram@2e000000)
> OF: translation of DMA address(0) to CPU address failed node(/uart@7ff80000)
> ...
> OF: translation of DMA address(0) to CPU address failed node(/mhu@2b1f0000)
> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
> 
> So let's fix it by dropping the "dma-ranges" property for now. We can
> add it later with a proper SoC bus node and moving all the devices that
> belong there along with the "dma-ranges" if required.

Acked-by: Robin Murphy <robin.murphy@arm.com>

As mentioned before, this is fine since it doesn't represent any kind of 
device-visible restriction; it was only there for completeness, and 
we've since given in to the assumption that missing "dma-ranges" implies 
a 1:1 mapping anyway.

Thanks,
Robin.

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   arch/arm64/boot/dts/arm/juno-base.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 9e3e8ce6adfe..1f3c80aafbd7 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -6,7 +6,6 @@
>   	/*
>   	 *  Devices shared by all Juno boards
>   	 */
> -	dma-ranges = <0 0 0 0 0x100 0>;
>   
>   	memtimer: timer@2a810000 {
>   		compatible = "arm,armv7-timer-mem";
> 
