Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFA7C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 677CB20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W0Qyupfp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgHYR0C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:26:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49386 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgHYR0B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:26:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHPwDL077732;
        Tue, 25 Aug 2020 12:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376359;
        bh=wibygpru0/6xxBzGrmaY9/RxocqkAciiQVd3tvuYb2A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=W0QyupfpCXgm6ixG58NULlv8KIh8J7b3KluBidPijZ1zPWYigsU4UIx3NQZWvkJR9
         Ml8lMrq3sR3ZqoaZlNeodjX+21GRijLhRiIlxtIisP34rei7nN8HXXGowPeKvzQNI7
         leWedXsanyqULjp33pJNb1UjrP29r+1OMUX5Dgk8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PHPwv2089054
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 12:25:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:25:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:25:58 -0500
Received: from [10.250.70.134] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHPwoe080965;
        Tue, 25 Aug 2020 12:25:58 -0500
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 mailboxes to C66x DSPs
To:     Nishanth Menon <nm@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200820010331.2911-1-s-anna@ti.com>
 <20200820010331.2911-3-s-anna@ti.com> <20200820114238.7ovvxq5n3fogzowi@akan>
 <8491a1bf-3665-8f23-6b75-34890566fcae@ti.com>
 <20200820190333.4ga5uob5tgsgwego@akan>
 <b8f8f034-16fa-82c4-579f-a3432bf207e6@ti.com>
 <20200825104239.lvdlz4sci3fe3nis@akan>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b41d2aeb-7e54-a0de-3a93-5fe65ffee00d@ti.com>
Date:   Tue, 25 Aug 2020 12:25:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825104239.lvdlz4sci3fe3nis@akan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 8/25/20 5:42 AM, Nishanth Menon wrote:
> On 17:00-20200824, Suman Anna wrote:
>> Hi Nishanth,
>>
>> On 8/20/20 2:03 PM, Nishanth Menon wrote:
>>> On 08:25-20200820, Suman Anna wrote:
>>> [...]
>>>>> I am just wondering if the carveouts and mbox linkage should be in the
>>>>> common processor board? if that makes sense at all? I know we already
>>>>> have other definitions.. Trying to see if we are making it harder to
>>>>> understand the definition than that is necessary..
>>>>
>>>> In general, I consider these as stuff that needs to be added to the board dts
>>>> files. You will see that this is what I have followed on all the TI
>>>> AM57xx/DRA7xx boards. For J721E, we have a weird organization as the memory
>>>> node, typically a board property, is defined in the som dtsi file, so the
>>>> reserved memory nodes are also added in the som dtsi file. The convention I
>>>> followed in general is to have the reserved-memory and memory nodes together.
>>>>
>>>> If you think the mailbox nodes should be moved into the SoM dts file, I could do
>>>
>>> I think that might make more sense and less confusing. I'd rather
>>> leave the processor board dts for more signal and interface hookup
>>> related topics as it is done right now. if we do endup with too many
>>> SoM duplication, then we should consider it's own dtsi
>>>
>>>> it as a follow-on cleanup series, but would wait for the ABI 3.0 changes to be
>>>> merged first.
>>>
>>> Of course. We are expecting this to be part of rc2, please rebase and
>>> post once the tag is out. next-20200820 has it already, if you want a
>>> pre-look.
>>>
>>
>> So, the ABI 3.0 changes are not part of -rc2, so, I cannot move the unrelated
>> mailbox nodes/cleanup without conflicting with that series. Are you ok if I just
>> move these nodes into the SoM dtsi file?
> 
> Lets introduce things properly: First cleanup rather creating a
> kludgy intermediate state (half of r5 mbox nodes in proc, half of c6x
> node in SoM etc).

OK, posted a v2 [1] with the cleanup first. It does create a dependency on the
pending ABI 3.0 PR.

regards
Suman

[1] https://patchwork.kernel.org/cover/11736095/
