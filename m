Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B04EC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:12:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3042E20747
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588759921;
	bh=mz5ev2R8CrXWRuZ2RcI5luPf4A4d6Xwee/lu//2Wels=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=UjIGQC6D8z21JxNBz6/nfcVSr0QWEjxXvy+RBy8Vm9Hc8SSSYaWtUChjFah6ykspL
	 AgtlqMpfiDc48XDdZZ1YkWspiSsSW4rDxbzM5hf/tqapU3dKDtir+LtMvd2yQfLaxO
	 vHvi0OKriAPEg2wrdhoJCvDPgyBu/hFNljGlbfzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbgEFKMA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:12:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728730AbgEFKMA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 06:12:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 606342073A;
        Wed,  6 May 2020 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588759919;
        bh=mz5ev2R8CrXWRuZ2RcI5luPf4A4d6Xwee/lu//2Wels=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qYrfTQ6mLiPiVsER7AkHNPDAqurs2/tzfFf8okKYweCu/+/ajZnJ45lkMJtb5HAeC
         8w+DMwdTkypPcK7VgFFl6DUzZrjC5zXiB4OO6TzXWtLul+/KKT1K3XOCF9/G70KGHh
         o6XwTe8vgsbeC/r8oCJcbZHK7tsgop/ulfet/HRI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jWH1x-009ulN-Nt; Wed, 06 May 2020 11:11:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 06 May 2020 11:11:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 07/16] arm64: dts: arm: Fix GIC compatible names
In-Reply-To: <72e7ca7e-003f-7edf-267c-763014f33fdc@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-8-andre.przywara@arm.com>
 <86lfm6tf1f.wl-maz@kernel.org>
 <629da7f9-9cc9-ec9e-f175-ef6c90b5e3f1@arm.com>
 <d9ebbc077d70805bed252656dede750b@kernel.org>
 <72e7ca7e-003f-7edf-267c-763014f33fdc@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <cfb1e6ee9d8f41cd5332eae75eec2647@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andre.przywara@arm.com, robh@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-05-06 11:00, André Przywara wrote:
> On 06/05/2020 10:16, Marc Zyngier wrote:
>> On 2020-05-06 09:45, André Przywara wrote:
>>> On 05/05/2020 19:25, Marc Zyngier wrote:
>>>> On Tue, 05 May 2020 17:52:03 +0100,
>>>> Andre Przywara <andre.przywara@arm.com> wrote:
>>>>> 
>>>>> The GIC DT binding only allows a certain combination of DT 
>>>>> compatible
>>>>> strings, mostly just consisting of one name.
>>>>> 
>>>>> Drop the combination of multiple names and go with the
>>>>> "arm,cortex-a15-gic" name for GICv2, as this seems to be the most
>>>>> widely
>>>>> accepted string. "arm,gic-400" would be more correct, but was
>>>>> introduced
>>>>> much later into the kernel's GIC driver.
>>>>> 
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>>>>>  arch/arm64/boot/dts/arm/juno-base.dtsi           | 2 +-
>>>>>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>> 
>>>>> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>>> b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>>> index 15fe81738e94..61a1750fcdd6 100644
>>>>> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>>> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
>>>>> @@ -6,7 +6,7 @@
>>>>> 
>>>>>  / {
>>>>>      gic: interrupt-controller@2c001000 {
>>>>> -        compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>>> +        compatible = "arm,cortex-a15-gic";
>>>>>          #interrupt-cells = <3>;
>>>>>          #address-cells = <2>;
>>>>>          interrupt-controller;
>>>>> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>>> b/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>>> index 3feefd61eb76..62392ab1f880 100644
>>>>> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>>> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
>>>>> @@ -69,7 +69,7 @@
>>>>>      };
>>>>> 
>>>>>      gic: interrupt-controller@2c010000 {
>>>>> -        compatible = "arm,gic-400", "arm,cortex-a15-gic";
>>>>> +        compatible = "arm,cortex-a15-gic";
>>>> 
>>>> Why? GIC-400 is definitely the most correct compatible string. I'd
>>>> rather see this compatible being generalised to the models rather 
>>>> than
>>>> only referencing the A15 GIC.
>>> 
>>> I agree that gic-400 is the far better name, but it was only 
>>> introduced
>>> in v3.16. So omitting arm,cortex-a15-gic would break any kernels 
>>> before
>>> that, which I would like to avoid.
>> 
>> I am not talking about dropping the A15 GIC. I'm saying that both 
>> should
>> stay. Is there anything in the DT binding that forbids multiple names 
>> in
>> the compatible property?
> 
> Well, the current form of the YAML bindings require every combination 
> of
> compatible strings to be listed, either explicitly, or using an list of
> allowed strings for each position. This combination here is not listed
> at the moment.

I think this should be relaxed. What the tool should be warning against
is a set of incompatible "compatible" strings (like a15 + a9, which is
totally bonkers).

>>> It's actually a pity that we are so picky about the compatible 
>>> listings,
>>> because the existing combination is actually quite nice: we get
>>> compatibility with older DT consumers, but still can say what it
>>> actually is.
>>> I wonder if I should introduce this combination to the GIC DT binding
>>> instead, it seems like there are other users in the tree as well.
>>> 
>>> What do you think?
>> 
>> I'd say that if the binding forbids multiple compatible strings, the
>> binding is likely to be wrong. We should fix it, and not make the DTs
>> worse as a result of a binding issue.
> 
> OK, thanks for the confirmation, and I agree. I will ditch this patch
> and replace it with a respective bindings fix.

Please keep removal of the A9 GIC reference though, because it doesn't
make any sense as it is.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
