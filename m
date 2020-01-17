Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B834C33CB1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 12:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D27022082F
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 12:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JGztN/0g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgAQM6b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 07:58:31 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32802 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAQM6b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 07:58:31 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HCwNE1128076;
        Fri, 17 Jan 2020 06:58:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579265903;
        bh=E1dOnxVQIjpeR6bOLipZZbcFgOSQLVZ7wpbIxUxOI0E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JGztN/0gAyyp+QPZtCFIfV6L73s556m11QLrYi8t3D07CZG02r1z2qh0w4V3S8n0U
         mc9E78qTvrT2P4ab4RxAro4Cxu/YQWGn1A3Uoaz1L1WQYt3U3C2k93P62RXoGPuwEB
         xUPOvm80Pz+pj/XPtOAnsPxgdid1wj7WltNKvscI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00HCwNdM094446
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Jan 2020 06:58:23 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Jan 2020 06:58:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Jan 2020 06:58:23 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HCwLe6046135;
        Fri, 17 Jan 2020 06:58:21 -0600
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-main: Add missing power-domains
 for smmu
To:     Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>
References: <20191122100356.20622-1-lokeshvutla@ti.com>
 <14a3898b-f91b-861e-0091-7e445c087ec0@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <a2c6841a-4e30-bcb2-1bfa-6a603af44d4e@ti.com>
Date:   Fri, 17 Jan 2020 14:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <14a3898b-f91b-861e-0091-7e445c087ec0@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06/01/2020 06:00, Lokesh Vutla wrote:
> H Tero,
> 
> On 22/11/19 3:33 PM, Lokesh Vutla wrote:
>> Add power-domains entry for smmu, so that the it is accessible as long
>> as the driver is active. Without this device shutdown is throwing the
>> below warning:
>> "[   44.736348] arm-smmu-v3 36600000.smmu: failed to clear cr0"
>>
>> Reported-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Any comments on this patch? If there are no objections, can this be picked?

Sorry for delay, I've been engulfed with various other pieces of work 
and handling upstream has been quite slow.

Anyways, for this patch, queued up for 5.6, thanks!

-Tero

> 
> Thanks and regards,
> Lokesh
> 
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index 698ef9a1d5b7..96445111e398 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -43,6 +43,7 @@
>>   	smmu0: smmu@36600000 {
>>   		compatible = "arm,smmu-v3";
>>   		reg = <0x0 0x36600000 0x0 0x100000>;
>> +		power-domains = <&k3_pds 229 TI_SCI_PD_EXCLUSIVE>;
>>   		interrupt-parent = <&gic500>;
>>   		interrupts = <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
>>   			     <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>;
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
