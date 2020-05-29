Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E94C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 11:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C366C207F5
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 11:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X+WskA+K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgE2LNq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 07:13:46 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41496 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgE2LNq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 07:13:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04TBDUJA037663;
        Fri, 29 May 2020 06:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590750810;
        bh=laSh5WDSxtGsanL/QvTs+5ZA+9Q2Ea1wGgBncXX0Eko=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X+WskA+KaiRKwU/n8cyC2YGhQkVT/PsQHXi9nTZ6Wp8u7uQanjdU15XwvOotFra92
         K+6IeWPeZJ5UUN93ww51WwYM8Jrr6rCgA24BYUmFlMLUYHbqVcNThTlTctXFZJ2k7m
         sA+pNIfGeUp+wNyoLol73bh6K18u5Uuak5EvC3j0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04TBDUsm044198
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 29 May 2020 06:13:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 May 2020 06:13:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 May 2020 06:13:30 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04TBDPMA027241;
        Fri, 29 May 2020 06:13:27 -0500
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti,sci-intr: Update bindings
 to drop the usage of gic as parent
To:     Rob Herring <robh@kernel.org>
CC:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
 <20200520124454.10532-5-lokeshvutla@ti.com> <20200528221406.GA769073@bogus>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <df339bc8-f1ad-0056-b2be-9b4957cb63d8@ti.com>
Date:   Fri, 29 May 2020 16:43:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528221406.GA769073@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

[..snip..]
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>> index 1a8718f8855d..8b56b2de1c73 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>> @@ -44,15 +44,17 @@ Required Properties:
>>  			4: If intr supports level triggered interrupts.
>>  - interrupt-controller:	Identifies the node as an interrupt controller
>>  - #interrupt-cells:	Specifies the number of cells needed to encode an
>> -			interrupt source. The value should be 2.
>> -			First cell should contain the TISCI device ID of source
>> -			Second cell should contain the interrupt source offset
>> -			within the device.
>> +			interrupt source. The value should be 1.
>> +			First cell should contain interrupt router input number
>> +			as specified by hardware.
>>  - ti,sci:		Phandle to TI-SCI compatible System controller node.
>> -- ti,sci-dst-id:	TISCI device ID of the destination IRQ controller.
>> -- ti,sci-rm-range-girq:	Array of TISCI subtype ids representing the host irqs
>> -			assigned to this interrupt router. Each subtype id
>> -			corresponds to a range of host irqs.
>> +- ti,sci-dev-id:	TISCI device id of interrupt controller.
>> +- ti,interrupt-ranges:	Set of triplets containing ranges that convert
>> +			the INTR output interrupt numbers to parent's
>> +			interrupt number. Each triplet has following entries:
>> +			- First entry specifies the base for intr output irq
>> +			- Second entry specifies the base for parent irqs
>> +			- Third entry specifies the limit
> 
> Humm, sounds like what interrupt-map does.

IIUC, for every irq translation there should be an entry in interrupt-map
property. These Controllers has interrupts ranging from 32, 256 and more. It
might be odd to have 256  entries in the interrupt map no? Also there are
multiple interrupt controllers which need such translations.

Thanks and regards,
Lokesh

