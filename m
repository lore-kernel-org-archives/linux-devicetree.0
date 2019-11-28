Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C3AC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FCC0217BC
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1QPr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 11:15:47 -0500
Received: from foss.arm.com ([217.140.110.172]:37954 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfK1QPr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 11:15:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD3EE1FB;
        Thu, 28 Nov 2019 08:15:46 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C723B3F6C4;
        Thu, 28 Nov 2019 08:15:45 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: juno: Fix DMA address translations by adding
 SOC bus node
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20191126165355.6696-1-sudeep.holla@arm.com>
 <d9b057ed-acfc-a9a1-a466-d3048f008568@arm.com> <20191128141521.GA3333@bogus>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <df7408c0-21a9-94a6-950c-98560d3e33e4@arm.com>
Date:   Thu, 28 Nov 2019 16:15:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128141521.GA3333@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28/11/2019 2:15 pm, Sudeep Holla wrote:
> On Thu, Nov 28, 2019 at 11:50:54AM +0000, Robin Murphy wrote:
>> Hi Sudeep,
>>
>> On 2019-11-26 4:53 pm, Sudeep Holla wrote:
>>> Commit 951d48855d86 ("of: Make of_dma_get_range() work on bus nodes")
>>> reworked the logic such that of_dma_get_range() works correctly
>>> starting from a bus node containing "dma-ranges".
>>>
>>> Since on Juno we don't have a SoC level bus node and "dma-ranges" is
>>> present only in the root node, we get the following error:
>>>
>>> OF: translation of DMA address(0) to CPU address failed node(/sram@2e000000)
>>> OF: translation of DMA address(0) to CPU address failed node(/uart@7ff80000)
>>> ...
>>> OF: translation of DMA address(0) to CPU address failed node(/mhu@2b1f0000)
>>> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
>>> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
>>> OF: translation of DMA address(0) to CPU address failed node(/iommu@2b600000)
>>>
>>> Let's fix it by adding a SoC bus node and moving all the devices along
>>> with the "dma-ranges" inside it.
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>> ---
>>>    arch/arm64/boot/dts/arm/juno-base.dtsi        | 162 +++++++++---------
>>>    arch/arm64/boot/dts/arm/juno-clocks.dtsi      |   2 +
>>>    arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi     |   2 +
>>>    arch/arm64/boot/dts/arm/juno-motherboard.dtsi |   2 +
>>>    4 files changed, 88 insertions(+), 80 deletions(-)
>>>
>>> Hi Rob, Robin,
>>>
>>> Let me know if this is correct fix for the issue I am seeing with linux-next
>>> on Juno. This patch is generated with -b for ease of review. With lots of
>>> indentation, actual delta is:
>>>
>>> 4 files changed, 1274 insertions(+), 1266 deletions(-)
>>
>> Other than a few nits - the GIC should probably be under the soc node as
>> it's an MMIO device, while the clocks shouldn't; the dtsi's could probably
>> avoid churn with a "&soc {...}" phandle - I think this is a reasonable thing
>> to do, as it's generally the preferred structure.
>>
> 
> I agree and am still in confusion as what to put inside soc or not.

FWIW my understanding is that the "soc" node is used to provide a 'bus' 
to represent on-chip MMIO - in principle we could nerd out and describe 
the ACE-lite/AXI/APB slave interconnects in full, but there's really no 
benefit to going into that much detail - so everything with a "reg" 
representing a physical address goes inside it, while CPUs, clocks, 
firmware, regulators etc. sit in the root node 'outside the PA space', 
regardless of whether they're physically on-chip or not.

Robin.

>> The cruder but far simpler alternative would be to just drop the dma-ranges
>> property - I'm not sure the effort to make all 64-bit platforms describe
>> their dma-ranges has really panned out, and it isn't actually necessary for
>> Juno (which is why it didn't seem like sufficient reason to do all this
>> restructuring at the time, and instead I took a very liberal interpretation
>> of the spec to sneak it into the root node).
>>
> 
> I think I prefer that for v5.5 as a fix as this is much bigger churn. We
> can do that for v5.6 if required. Let me know if you disagree. I can simply
> revert your original patch adding dma-ranges for now and we can add it
> later with all the soc structure.
> 
> --
> Regards,
> Sudeep
> 
