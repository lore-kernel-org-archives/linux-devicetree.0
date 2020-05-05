Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBF5C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49711206CC
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgEERN7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 13:13:59 -0400
Received: from foss.arm.com ([217.140.110.172]:46042 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729209AbgEERN7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 13:13:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F208031B;
        Tue,  5 May 2020 10:13:58 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881A83F305;
        Tue,  5 May 2020 10:13:52 -0700 (PDT)
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
To:     Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-3-andre.przywara@arm.com>
 <468a97b2-ed4d-382b-262b-6c0cd3025696@arm.com>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <071f00e4-0658-d007-f70c-d2b9e4e3e5c6@arm.com>
Date:   Tue, 5 May 2020 18:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <468a97b2-ed4d-382b-262b-6c0cd3025696@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05/05/2020 18:06, Robin Murphy wrote:
> On 2020-05-05 5:51 pm, Andre Przywara wrote:
>> Date: Mon, 4 May 2020 12:42:49 +0100
>> Subject: [PATCH 02/16] dt-bindings: arm-smmu: Allow mmu-400,smmu-v1
>> compatible
> 
> ^^ not sure how you managed that...

Impressive, huh? ;-)
Actually just an accidental empty line when adding Cc: lines to the
header (copy & paste with EOL). Using the previous subject line is
probably an artefact of how git send-email works.

Sorry for that!
I figured that replying would create more churn, as the actual subject
line is still in the email.

> 
>> The Arm SMMUv1 DT binding only allows combining arm,mmu-401 with
>> arm,smmu-v1, even though the MMU-400 is compatible as well.
>>
>> Allow this combination as well to let the Arm Juno board pass the test.
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>

Thanks!

Cheers,
Andre

> 
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 6515dbe47508..e3ef1c69d132 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -41,7 +41,9 @@ properties:
>>             - const: arm,mmu-500
>>             - const: arm,smmu-v2
>>         - items:
>> -          - const: arm,mmu-401
>> +          - enum:
>> +              - arm,mmu-400
>> +              - arm,mmu-401
>>             - const: arm,smmu-v1
>>         - enum:
>>             - arm,smmu-v1
>>

