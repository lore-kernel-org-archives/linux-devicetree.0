Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C4C47259
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F19A9206D5
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 08:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgEFIqZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 04:46:25 -0400
Received: from foss.arm.com ([217.140.110.172]:59540 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbgEFIqZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 04:46:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E6530E;
        Wed,  6 May 2020 01:46:24 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F8803F71F;
        Wed,  6 May 2020 01:46:23 -0700 (PDT)
Subject: Re: [PATCH 07/16] arm64: dts: arm: Fix GIC compatible names
To:     Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-8-andre.przywara@arm.com>
 <86lfm6tf1f.wl-maz@kernel.org>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <629da7f9-9cc9-ec9e-f175-ef6c90b5e3f1@arm.com>
Date:   Wed, 6 May 2020 09:45:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <86lfm6tf1f.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05/05/2020 19:25, Marc Zyngier wrote:
> On Tue, 05 May 2020 17:52:03 +0100,
> Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The GIC DT binding only allows a certain combination of DT compatible
>> strings, mostly just consisting of one name.
>>
>> Drop the combination of multiple names and go with the
>> "arm,cortex-a15-gic" name for GICv2, as this seems to be the most widely
>> accepted string. "arm,gic-400" would be more correct, but was introduced
>> much later into the kernel's GIC driver.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>>  arch/arm64/boot/dts/arm/juno-base.dtsi           | 2 +-
>>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> index 15fe81738e94..61a1750fcdd6 100644
>> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> @@ -6,7 +6,7 @@
>>  
>>  / {
>>  	gic: interrupt-controller@2c001000 {
>> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> +		compatible = "arm,cortex-a15-gic";
>>  		#interrupt-cells = <3>;
>>  		#address-cells = <2>;
>>  		interrupt-controller;
>> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> index 3feefd61eb76..62392ab1f880 100644
>> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
>> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> @@ -69,7 +69,7 @@
>>  	};
>>  
>>  	gic: interrupt-controller@2c010000 {
>> -		compatible = "arm,gic-400", "arm,cortex-a15-gic";
>> +		compatible = "arm,cortex-a15-gic";
> 
> Why? GIC-400 is definitely the most correct compatible string. I'd
> rather see this compatible being generalised to the models rather than
> only referencing the A15 GIC.

I agree that gic-400 is the far better name, but it was only introduced
in v3.16. So omitting arm,cortex-a15-gic would break any kernels before
that, which I would like to avoid.
It's actually a pity that we are so picky about the compatible listings,
because the existing combination is actually quite nice: we get
compatibility with older DT consumers, but still can say what it
actually is.
I wonder if I should introduce this combination to the GIC DT binding
instead, it seems like there are other users in the tree as well.

What do you think?

Cheers,
Andre

> 
>>  		reg = <0x0 0x2c010000 0 0x1000>,
>>  		      <0x0 0x2c02f000 0 0x2000>,
>>  		      <0x0 0x2c04f000 0 0x2000>,
>> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>> index c5d15cbd8cf6..f86f6451411f 100644
>> --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>> @@ -95,7 +95,7 @@
>>  	};
>>  
>>  	gic: interrupt-controller@2c001000 {
>> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> +		compatible = "arm,cortex-a15-gic";
>>  		#interrupt-cells = <3>;
>>  		#address-cells = <0>;
>>  		interrupt-controller;
>> -- 
>> 2.17.1
>>
>>
> 
> Thanks,
> 
> 	M.
> 

