Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73EFC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 08:03:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B57F42068E
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 08:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Aq1ntnpB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgFOIDk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 04:03:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57430 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgFOIDk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 04:03:40 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05F83Pf9008385;
        Mon, 15 Jun 2020 03:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592208205;
        bh=Uk+sr31sgCXRnh6PktSit7kYbZ3ovLU3+zbv2SOX1s0=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Aq1ntnpBIbSFrlciefSobaz+dLVpHV2kpLTHqx+3vhzEgci69C74ga154PpfaAtAh
         oYmkcndvSeIZ7XePbT8IWI4EUTY3PBSqyA7tjr5sWJWcYy+7BFw0G0KT3Nbyrlmwnb
         7IanqCL+dYZWkUp3eAbiS1+JJBnd71A6R/t7EHNM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05F83PQO003489
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 03:03:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 03:03:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 03:03:25 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05F83LeO018322;
        Mon, 15 Jun 2020 03:03:22 -0500
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti, sci-intr: Update bindings
 to drop the usage of gic as parent
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <maz@kernel.org>
CC:     Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
 <20200520124454.10532-5-lokeshvutla@ti.com> <20200528221406.GA769073@bogus>
 <f803f646-2a55-4f15-9682-1dc616d7c714@ti.com>
 <4ea8c6110a16900220a65f1d44145146@kernel.org>
 <3f253e25-2ee7-96f2-3158-7f6be0710a33@ti.com>
Message-ID: <d586e88c-2907-1771-dee2-32429082aa07@ti.com>
Date:   Mon, 15 Jun 2020 13:33:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3f253e25-2ee7-96f2-3158-7f6be0710a33@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marc,

On 01/06/20 5:06 pm, Lokesh Vutla wrote:
> Hi Marc,
> 
> On 29/05/20 3:48 pm, Marc Zyngier wrote:
>> On 2020-05-29 11:14, Lokesh Vutla wrote:
>>> Hi Rob,
>>>
>>> On 29/05/20 3:44 am, Rob Herring wrote:
>>>> On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
>>>>> Drop the firmware related dt-bindings and use the hardware specified
>>>>> interrupt numbers within Interrupt Router. This ensures interrupt router
>>>>> DT node need not assume any interrupt parent type.
>>>>
>>>> I didn't like this binding to begin with, but now you're breaking
>>>> compatibility.
>>>
>>> Yes, I do agree that this change is breaking backward compatibility. But IMHO,
>>> this does cleanup of firmware specific properties from DT. Since this is not
>>> deployed out yet in the wild market, I took the leverage of breaking backward
>>> compatibility. Before accepting these changes from firmware team, I did
>>> discuss[0] with Marc on this topic.
>>
>> And I assume that should anyone complain about the kernel being broken
>> because they have an old firmware, you'll be OK with the patches being
>> reverted, right?
> 
> I am assuming there is no one to complain as there is no product available yet
> with upstream kernel. Internally everyone is aware of the changes. So, yes I
> would agree with you to revert the changes if someone really needs it. :)

Any chance you can shower your blessings on this series :)

Thanks and regards,
Lokesh

> 
> Thanks and regards,
> Lokesh
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
