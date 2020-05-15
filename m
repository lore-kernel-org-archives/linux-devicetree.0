Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963D6C433E5
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 15:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7997A207C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 15:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgEOPLh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 11:11:37 -0400
Received: from foss.arm.com ([217.140.110.172]:57900 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgEOPLh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 11:11:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115532F;
        Fri, 15 May 2020 08:11:37 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2DAE3F71E;
        Fri, 15 May 2020 08:11:35 -0700 (PDT)
Subject: Re: [PATCH v3 08/20] arm64: dts: arm: model: Fix GIC compatible names
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-9-andre.przywara@arm.com>
 <20200513182144.GD27686@bogus>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <4aa83004-38c3-c625-f439-25255376ab2b@arm.com>
Date:   Fri, 15 May 2020 16:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513182144.GD27686@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13/05/2020 19:21, Sudeep Holla wrote:
> On Wed, May 13, 2020 at 11:30:04AM +0100, Andre Przywara wrote:
>> The GIC DT binding only allows certain combinations of DT compatible
>> strings. The somewhat awkward "arm,cortex-a15-gic", "arm,cortex-a9-gic"
>> is not among those.
>>
>> Drop that combination of different "cortex" based strings used for the
>> models, and replace it with the more useful combination including
>> "arm,gic-400".
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> index 15fe81738e94..f17e744163a5 100644
>> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>> @@ -6,7 +6,7 @@
>>  
>>  / {
>>  	gic: interrupt-controller@2c001000 {
>> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> +		compatible = "arm,gic-400", "arm,cortex-a15-gic";
> 
> Do we need to still retain "arm,cortex-a15-gic" ? 

I'd rather would like to keep that. "arm,gic-400" was introduced only
later into Linux as a compatible string, so dropping this would break
older kernels. I don't see any difference between a9-gic and a15-gic in
term of kernel support, so a9-gic can surely go.

Cheers,
Andre

