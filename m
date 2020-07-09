Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF3FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BF4420708
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i9w797hR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGIJlX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 05:41:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36704 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGIJlW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 05:41:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0699f4fl052229;
        Thu, 9 Jul 2020 04:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594287664;
        bh=PPgtvAk6IVJpKX4EvuqzKPLs3MtOEYxnDVSphsHjNTE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i9w797hRF30scVev4KsfyoRuEmqIGniFk6iEsRxm82OhRcz0Ql1OceCYvi0tfjWpw
         JzlqE+bRRrkJSC9aw3wxfOksTA3avrib3Fk52C/u5SwPFtSykicoTwwGcM1YHxyv6t
         H0Zqt0P7PO1P7cnegOKclkRMRflWOJD8i86nDiy8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0699f4Ix091676
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 04:41:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 04:41:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 04:41:03 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0699exkk042395;
        Thu, 9 Jul 2020 04:41:00 -0500
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti, sci-intr: Update bindings
 to drop the usage of gic as parent
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
 <d586e88c-2907-1771-dee2-32429082aa07@ti.com>
 <9afd8a79d9c9ecfd35b6a4e66c93e298@kernel.org>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <967eb351-792b-a1b9-706a-38825ed6749f@ti.com>
Date:   Thu, 9 Jul 2020 15:10:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9afd8a79d9c9ecfd35b6a4e66c93e298@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marc,

On 15/06/20 2:04 pm, Marc Zyngier wrote:
> On 2020-06-15 09:03, Lokesh Vutla wrote:
>> Hi Marc,
>>
>> On 01/06/20 5:06 pm, Lokesh Vutla wrote:
>>> Hi Marc,
>>>
>>> On 29/05/20 3:48 pm, Marc Zyngier wrote:
>>>> On 2020-05-29 11:14, Lokesh Vutla wrote:
>>>>> Hi Rob,
>>>>>
>>>>> On 29/05/20 3:44 am, Rob Herring wrote:
>>>>>> On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
>>>>>>> Drop the firmware related dt-bindings and use the hardware specified
>>>>>>> interrupt numbers within Interrupt Router. This ensures interrupt router
>>>>>>> DT node need not assume any interrupt parent type.
>>>>>>
>>>>>> I didn't like this binding to begin with, but now you're breaking
>>>>>> compatibility.
>>>>>
>>>>> Yes, I do agree that this change is breaking backward compatibility. But IMHO,
>>>>> this does cleanup of firmware specific properties from DT. Since this is not
>>>>> deployed out yet in the wild market, I took the leverage of breaking backward
>>>>> compatibility. Before accepting these changes from firmware team, I did
>>>>> discuss[0] with Marc on this topic.
>>>>
>>>> And I assume that should anyone complain about the kernel being broken
>>>> because they have an old firmware, you'll be OK with the patches being
>>>> reverted, right?
>>>
>>> I am assuming there is no one to complain as there is no product available yet
>>> with upstream kernel. Internally everyone is aware of the changes. So, yes I
>>> would agree with you to revert the changes if someone really needs it. :)
>>
>> Any chance you can shower your blessings on this series :)
> 
> I have purposely ignored it just before and during the merge window. It is now
> firmly in my review queue.

rc4 is tagged now. Do you want me to rebase, split the series and repost it?

Thanks and reagrds,
Lokesh

> 
>         M.
