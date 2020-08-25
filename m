Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025C3C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 10:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C546A20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 10:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eVJO/TGk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgHYKmu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 06:42:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45816 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYKmt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 06:42:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PAgdL0037346;
        Tue, 25 Aug 2020 05:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598352159;
        bh=jGQ+M6EgOhma5mjSY4RFXiuXhel5REEsiZhV+q0YvuI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=eVJO/TGkm7dNw24U3jleDXg5lyjJP9eKTmLLC3AIxDQ3JVJf8dLRr+T697hguCQQ7
         /E0rbSqX9YDext+oZgFIX63BYH1LYn1fBUXckHeHx037Z5yhvEcJORwjbmXppY/ctn
         D0vQU8pFWbHmCSlx+xp81iuqyAPZa+Ygy+NrlkuI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PAgdvn039705
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 05:42:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 05:42:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 05:42:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PAgdju019207;
        Tue, 25 Aug 2020 05:42:39 -0500
Date:   Tue, 25 Aug 2020 05:42:39 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 mailboxes to C66x DSPs
Message-ID: <20200825104239.lvdlz4sci3fe3nis@akan>
References: <20200820010331.2911-1-s-anna@ti.com>
 <20200820010331.2911-3-s-anna@ti.com>
 <20200820114238.7ovvxq5n3fogzowi@akan>
 <8491a1bf-3665-8f23-6b75-34890566fcae@ti.com>
 <20200820190333.4ga5uob5tgsgwego@akan>
 <b8f8f034-16fa-82c4-579f-a3432bf207e6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b8f8f034-16fa-82c4-579f-a3432bf207e6@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 17:00-20200824, Suman Anna wrote:
> Hi Nishanth,
> 
> On 8/20/20 2:03 PM, Nishanth Menon wrote:
> > On 08:25-20200820, Suman Anna wrote:
> > [...]
> >>> I am just wondering if the carveouts and mbox linkage should be in the
> >>> common processor board? if that makes sense at all? I know we already
> >>> have other definitions.. Trying to see if we are making it harder to
> >>> understand the definition than that is necessary..
> >>
> >> In general, I consider these as stuff that needs to be added to the board dts
> >> files. You will see that this is what I have followed on all the TI
> >> AM57xx/DRA7xx boards. For J721E, we have a weird organization as the memory
> >> node, typically a board property, is defined in the som dtsi file, so the
> >> reserved memory nodes are also added in the som dtsi file. The convention I
> >> followed in general is to have the reserved-memory and memory nodes together.
> >>
> >> If you think the mailbox nodes should be moved into the SoM dts file, I could do
> > 
> > I think that might make more sense and less confusing. I'd rather
> > leave the processor board dts for more signal and interface hookup
> > related topics as it is done right now. if we do endup with too many
> > SoM duplication, then we should consider it's own dtsi
> > 
> >> it as a follow-on cleanup series, but would wait for the ABI 3.0 changes to be
> >> merged first.
> > 
> > Of course. We are expecting this to be part of rc2, please rebase and
> > post once the tag is out. next-20200820 has it already, if you want a
> > pre-look.
> > 
> 
> So, the ABI 3.0 changes are not part of -rc2, so, I cannot move the unrelated
> mailbox nodes/cleanup without conflicting with that series. Are you ok if I just
> move these nodes into the SoM dtsi file?

Lets introduce things properly: First cleanup rather creating a
kludgy intermediate state (half of r5 mbox nodes in proc, half of c6x
node in SoM etc).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
