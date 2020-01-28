Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E423AC33CB3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 14:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1B9420716
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 14:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbgA1Ole (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 09:41:34 -0500
Received: from foss.arm.com ([217.140.110.172]:58616 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730154AbgA1Old (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jan 2020 09:41:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4D8E31B;
        Tue, 28 Jan 2020 06:41:32 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D6D33F68E;
        Tue, 28 Jan 2020 06:41:23 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h6: Add IOMMU
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
 <5320339.DvuYhMxLoT@jernej-laptop>
 <20200127142339.crxsuunzec5drfe2@gilmour.lan>
 <2140600.ElGaqSPkdT@jernej-laptop>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5543595c-4ef9-b67e-5dff-042fb1991194@arm.com>
Date:   Tue, 28 Jan 2020 14:41:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2140600.ElGaqSPkdT@jernej-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 27/01/2020 7:04 pm, Jernej Škrabec wrote:
> Hi!
> 
> Dne ponedeljek, 27. januar 2020 ob 15:23:39 CET je Maxime Ripard napisal(a):
>> Hi Jernej,
>>
>> On Fri, Jan 24, 2020 at 09:54:23PM +0100, Jernej Škrabec wrote:
>>> Dne sreda, 22. januar 2020 ob 13:44:09 CET je Maxime Ripard napisal(a):
>>>> Now that we have a driver for the IOMMU, let's start using it.
>>>>
>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>> ---
>>>>
>>>>   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>>>> b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
>>>> 29824081b43b..8608bcf1c52c 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>>>> @@ -53,6 +53,7 @@
>>>>
>>>>   	de: display-engine {
>>>>   	
>>>>   		compatible = "allwinner,sun50i-h6-display-engine";
>>>>   		allwinner,pipelines = <&mixer0>;
>>>>
>>>> +		iommus = <&iommu 0>;
>>>>
>>>>   		status = "disabled";
>>>>   	
>>>>   	};
>>>
>>> Isn't iommu property of the mixer node? After all, mixer is the one which
>>> reads one or more framebuffers. Once second mixer is defined, would you
>>> put
>>> another iommu phandle here?
>>
>> You're right. I added it during the early dev, and forgot to remove
>> it. Thanks!
> 
> Remove it or move it? I guess enabling iommu support in each driver needs a
> bit more work than just referencing iommu node, right? At least in such case
> buffers don't need to be allocated by CMA, which sun4i-drm driver currently
> use.

Note that the DRM "CMA" helpers are somewhat misnamed, since they're in 
fact based on the common DMA API, and thus transparent IOMMU-backed DMA 
ops will "just work" without the drivers having to care. Since all the 
display components behind the IOMMU will be in the same IOMMU group, 
they're guaranteed to always operate in the same address space as each 
other, so there should be no additional problems with buffer sharing 
(assuming the code doesn't have bugs that it's currently just getting 
away with).

> I just take another look at BSP kernel and it seems that only one channel is
> used for whole display stack. That would mean that both mixers would have same
> iommu phandle, right? Confusingly enough, DE2 iommu channel seems to be for
> deinterlace core.

That's also fine - as discussed on the driver thread there's no point 
trying to expose a distinction between devices at the API level, so the 
IDs are really only relevant to the driver internals touching the 
various enable registers (and even then only if you wanted to refine the 
current "just enable everything" approach).

Robin.
