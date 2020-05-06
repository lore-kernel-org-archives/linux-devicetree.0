Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC95C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1638E2075A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgEFKA5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:00:57 -0400
Received: from foss.arm.com ([217.140.110.172]:60898 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbgEFKA5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 06:00:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6B030E;
        Wed,  6 May 2020 03:00:56 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681FE3F71F;
        Wed,  6 May 2020 03:00:55 -0700 (PDT)
Subject: Re: [PATCH 07/16] arm64: dts: arm: Fix GIC compatible names
To:     Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-8-andre.przywara@arm.com>
 <86lfm6tf1f.wl-maz@kernel.org> <629da7f9-9cc9-ec9e-f175-ef6c90b5e3f1@arm.com>
 <d9ebbc077d70805bed252656dede750b@kernel.org>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <72e7ca7e-003f-7edf-267c-763014f33fdc@arm.com>
Date:   Wed, 6 May 2020 11:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9ebbc077d70805bed252656dede750b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06/05/2020 10:16, Marc Zyngier wrote:
> On 2020-05-06 09:45, André Przywara wrote:
>> On 05/05/2020 19:25, Marc Zyngier wrote:
>>> On Tue, 05 May 2020 17:52:03 +0100,
>>> Andre Przywara <andre.przywara@arm.com> wrote:
>>>>
>>>> The GIC DT binding only allows a certain combination of DT compatible
>>>> strings, mostly just consisting of one name.
>>>>
>>>> Drop the combination of multiple names and go with the
>>>> "arm,cortex-a15-gic" name for GICv2, as this seems to be the most
>>>> widely
>>>> accepted string. "arm,gic-400" would be more correct, but was
>>>> introduced
>>>> much later into the kernel's GIC driver.
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>>>>  arch/arm64/boot/dts/arm/juno-base.dtsi           | 2 +-
>>>>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>> b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>> index 15fe81738e94..61a1750fcdd6 100644
>>>> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>> @@ -6,7 +6,7 @@
>>>>
>>>>  / {
>>>>      gic: interrupt-controller@2c001000 {
>>>> -        compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>> +        compatible = "arm,cortex-a15-gic";
>>>>          #interrupt-cells = <3>;
>>>>          #address-cells = <2>;
>>>>          interrupt-controller;
>>>> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>> b/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>> index 3feefd61eb76..62392ab1f880 100644
>>>> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>> @@ -69,7 +69,7 @@
>>>>      };
>>>>
>>>>      gic: interrupt-controller@2c010000 {
>>>> -        compatible = "arm,gic-400", "arm,cortex-a15-gic";
>>>> +        compatible = "arm,cortex-a15-gic";
>>>
>>> Why? GIC-400 is definitely the most correct compatible string. I'd
>>> rather see this compatible being generalised to the models rather than
>>> only referencing the A15 GIC.
>>
>> I agree that gic-400 is the far better name, but it was only introduced
>> in v3.16. So omitting arm,cortex-a15-gic would break any kernels before
>> that, which I would like to avoid.
> 
> I am not talking about dropping the A15 GIC. I'm saying that both should
> stay. Is there anything in the DT binding that forbids multiple names in
> the compatible property?

Well, the current form of the YAML bindings require every combination of
compatible strings to be listed, either explicitly, or using an list of
allowed strings for each position. This combination here is not listed
at the moment.

>> It's actually a pity that we are so picky about the compatible listings,
>> because the existing combination is actually quite nice: we get
>> compatibility with older DT consumers, but still can say what it
>> actually is.
>> I wonder if I should introduce this combination to the GIC DT binding
>> instead, it seems like there are other users in the tree as well.
>>
>> What do you think?
> 
> I'd say that if the binding forbids multiple compatible strings, the
> binding is likely to be wrong. We should fix it, and not make the DTs
> worse as a result of a binding issue.

OK, thanks for the confirmation, and I agree. I will ditch this patch
and replace it with a respective bindings fix.

Thanks,
Andre.
