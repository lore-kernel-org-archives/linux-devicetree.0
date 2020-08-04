Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74D0C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 17:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD5F207FC
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 17:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x0RkUV/r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgHDRQ5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 13:16:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42624 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbgHDRQz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 13:16:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 074HGcUE017655;
        Tue, 4 Aug 2020 12:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596561398;
        bh=s4QwW87FIT9eU/zMHPowJVYmJ/Pi9b3VcwxtqOW2ZJ0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=x0RkUV/rlHaQcXUVRxzf8TGkA6AeAqROo+N2j9a6PBV9CxuexS7xcuTgqCCfBlctL
         za2+9aVfu/7IzcjHmdQeGC2hwVsDqWEQ46lAK6byA0ymueVtYPM0v89YVLhoLBiIXm
         2D+RQdaxwYT8NOKVtQbRr2rXO2mjkVd16P5FCP8o=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 074HGcWg095725
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Aug 2020 12:16:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 12:16:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 12:16:38 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074HGWNQ120907;
        Tue, 4 Aug 2020 12:16:34 -0500
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh@kernel.org>,
        Suman Anna <s-anna@ti.com>
CC:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
 <d017863c0da4950016f6d4e7fb34d7c7@kernel.org> <20200731181658.GA500828@bogus>
 <733bbcdc-8d29-51cc-f16e-7f95abb56ff2@ti.com> <20200731205953.GA774358@bogus>
 <051cd3d8-a52a-bdad-c4e8-7a05251fab33@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <d7fed961-63ad-eacf-76ba-e8641315994a@ti.com>
Date:   Tue, 4 Aug 2020 22:46:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <051cd3d8-a52a-bdad-c4e8-7a05251fab33@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi All,

On 02/08/20 4:04 pm, Sekhar Nori wrote:
> On 8/1/20 2:29 AM, Rob Herring wrote:
>> On Fri, Jul 31, 2020 at 01:24:17PM -0500, Suman Anna wrote:
>>> On 7/31/20 1:16 PM, Rob Herring wrote:
>>>> On Fri, Jul 31, 2020 at 06:01:50PM +0100, Marc Zyngier wrote:
>>>>> On 2020-07-28 06:17, Lokesh Vutla wrote:
>>>>>> Hi Marc,
>>>>>> 	This is continuation of the RFC patches[0] regarding the driver
>>>>>> updates to support for following interrupt parent connection:
>>>>>> - INTR -> INTR
>>>>>> - INTA -> GICv3
>>>>>> The current existing driver assumes that INTR is always connected to
>>>>>> GICv3 and INTA is always connected to INTR.
>>>>>
>>>>> I'm OK to take this if I can get an Ack from RobH on the three
>>>>> DT patches that still need it.
>>>>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>> However, there's a dependency on
>>>> bindings/arm/keystone/ti,k3-sci-common.yaml.
>>>>
>>>> That's a dependency on this being merged. I don't care if it breaks in
>>>> your tree, but I care for -next and Linus' tree. There could also be
>>>> other 'make dt_bindings_check' failures/warnings with this as the above
>>>> dependency prevents further testing.
>>>>
>>>
>>> Bjorn did pick up the above common binding file through the remoteproc tree,
>>> and it is available in -next. That said, I donno the merge order between
>>> remoteproc and irq subsystem trees into -next, and if that is a concern.
>>
>> I'm less concerned about merge order at this point. -rc1 not being 
>> broken is the low bar I have...
> 
> Looking at Bjorn's remoteproc tree[0], the common bindings patch is 
> applied on top of other (unrelated) remoteproc patches, so merging it 
> into Marc's tree is out of question unless Bjorn is willing to re-write 
> his tree (probably not).
> 
> The other option would be for Marc/Thomas to add these patches into a 
> 'late' branch, to be sent to Linus after Bjorn's tree has been merged.
> Bjorn could help by sending his pull request early and someone from TI 
> can keep an eye out for when its safe to merge.

What can we do to take this forward? Once this series is merged, DT changes
should also be merged. Else DMA will be broken as DT backward compatibility is
broken.

Thanks and regards,
Lokesh





