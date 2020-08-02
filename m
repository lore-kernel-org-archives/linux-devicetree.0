Return-Path: <SRS0=9TIE=BM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF45C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 10:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C4FC2075B
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 10:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AuGN0Sp6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgHBKej (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Aug 2020 06:34:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55926 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgHBKej (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 2 Aug 2020 06:34:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 072AY7EN091138;
        Sun, 2 Aug 2020 05:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596364447;
        bh=8Nq+YYAjgsIv967g7fISrevHQdVdaecT5CEIxqq/py4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AuGN0Sp6e6Na7FaceNvcvDHju7T7J5ewqOtg4ZYjUR9kEpW24ki5bGcTniXN8l7YF
         lvPQW5DeUZdO6phpzn7q76FtGPJRKbxjetKzLrimEzOg45OCFhwPZ4AZuWBxZmTAwc
         P3Ndbf+r68qgXA2hc+Jc7Q+fNHg+bZZrn/HtYPFc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 072AY7Ww014473
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 2 Aug 2020 05:34:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 2 Aug
 2020 05:34:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 2 Aug 2020 05:34:06 -0500
Received: from [10.24.69.198] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 072AY2hM065078;
        Sun, 2 Aug 2020 05:34:03 -0500
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
To:     Rob Herring <robh@kernel.org>, Suman Anna <s-anna@ti.com>
CC:     Marc Zyngier <maz@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
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
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <051cd3d8-a52a-bdad-c4e8-7a05251fab33@ti.com>
Date:   Sun, 2 Aug 2020 16:04:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200731205953.GA774358@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 8/1/20 2:29 AM, Rob Herring wrote:
> On Fri, Jul 31, 2020 at 01:24:17PM -0500, Suman Anna wrote:
>> On 7/31/20 1:16 PM, Rob Herring wrote:
>>> On Fri, Jul 31, 2020 at 06:01:50PM +0100, Marc Zyngier wrote:
>>>> On 2020-07-28 06:17, Lokesh Vutla wrote:
>>>>> Hi Marc,
>>>>> 	This is continuation of the RFC patches[0] regarding the driver
>>>>> updates to support for following interrupt parent connection:
>>>>> - INTR -> INTR
>>>>> - INTA -> GICv3
>>>>> The current existing driver assumes that INTR is always connected to
>>>>> GICv3 and INTA is always connected to INTR.
>>>>
>>>> I'm OK to take this if I can get an Ack from RobH on the three
>>>> DT patches that still need it.
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>
>>> However, there's a dependency on
>>> bindings/arm/keystone/ti,k3-sci-common.yaml.
>>>
>>> That's a dependency on this being merged. I don't care if it breaks in
>>> your tree, but I care for -next and Linus' tree. There could also be
>>> other 'make dt_bindings_check' failures/warnings with this as the above
>>> dependency prevents further testing.
>>>
>>
>> Bjorn did pick up the above common binding file through the remoteproc tree,
>> and it is available in -next. That said, I donno the merge order between
>> remoteproc and irq subsystem trees into -next, and if that is a concern.
> 
> I'm less concerned about merge order at this point. -rc1 not being 
> broken is the low bar I have...

Looking at Bjorn's remoteproc tree[0], the common bindings patch is 
applied on top of other (unrelated) remoteproc patches, so merging it 
into Marc's tree is out of question unless Bjorn is willing to re-write 
his tree (probably not).

The other option would be for Marc/Thomas to add these patches into a 
'late' branch, to be sent to Linus after Bjorn's tree has been merged.
Bjorn could help by sending his pull request early and someone from TI 
can keep an eye out for when its safe to merge.

Thanks,
Sekhar

[0] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=rproc-next
