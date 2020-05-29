Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EDBC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 10:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9015B2074D
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 10:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PpfT8mi2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE2KPG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 06:15:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2KPF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 06:15:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04TAEhWW022992;
        Fri, 29 May 2020 05:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590747283;
        bh=eV3Ea3rbl4XaNDus1+DK9jQ6sPK5lI/ChCqGDCfcrVw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PpfT8mi2irg7RIfZrXPZ0Nf8E+K2sBsN2PP7OSrfK3sOcq3AdWqgVsurUCCVsNMVT
         YJNxZWYjCXGp2bnlewx99CseS7FVMBTBlJRvRmnDII9kfQ+V8taEP8XlDVPJv91m1u
         KzOpXPW7gHerbyQG/gqmiasAGmXUluk6YaTKYjE8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04TAEhpO118133;
        Fri, 29 May 2020 05:14:43 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 May 2020 05:14:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 May 2020 05:14:42 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04TAEcpP095213;
        Fri, 29 May 2020 05:14:39 -0500
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
Message-ID: <f803f646-2a55-4f15-9682-1dc616d7c714@ti.com>
Date:   Fri, 29 May 2020 15:44:37 +0530
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

On 29/05/20 3:44 am, Rob Herring wrote:
> On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
>> Drop the firmware related dt-bindings and use the hardware specified
>> interrupt numbers within Interrupt Router. This ensures interrupt router
>> DT node need not assume any interrupt parent type.
> 
> I didn't like this binding to begin with, but now you're breaking 
> compatibility.

Yes, I do agree that this change is breaking backward compatibility. But IMHO,
this does cleanup of firmware specific properties from DT. Since this is not
deployed out yet in the wild market, I took the leverage of breaking backward
compatibility. Before accepting these changes from firmware team, I did
discuss[0] with Marc on this topic.

> 
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  .../interrupt-controller/ti,sci-intr.txt      | 31 ++++++++++---------
>>  1 file changed, 16 insertions(+), 15 deletions(-)
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

 Okay, Ill look at it.

[0]
https://lore.kernel.org/linux-arm-kernel/2331f04eacee3b06cc152fc609225233@www.loen.fr/

Thanks and regards,
Lokesh

