Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC87C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 19:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D5E72075E
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 19:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bUM+gW6y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgHTTDj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 15:03:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38276 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgHTTDi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 15:03:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KJ3YSU022628;
        Thu, 20 Aug 2020 14:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597950214;
        bh=sUy5GSsvgo5ZuLWE9Sq72lbGuzsWGyLYZNGbmx7ptDw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bUM+gW6yvuMDFsChFtLzdYpLzzQVN1Y1SUGNcR7tWf+OQrIg1KaH09J0oxLXZ/Bc0
         oOld33Sp0k3Av1rUbiqC6qi20PFO8Jb1/Q3Wmr+RXobGChb5HFzn+1JvMAuMOpP1uQ
         4OQ3+oJSY5uLM2cJGFr2fI+1Fv3M472Ck5CnZ5Cg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KJ3YDF065499;
        Thu, 20 Aug 2020 14:03:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 14:03:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 14:03:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KJ3XgB073160;
        Thu, 20 Aug 2020 14:03:33 -0500
Date:   Thu, 20 Aug 2020 14:03:33 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 mailboxes to C66x DSPs
Message-ID: <20200820190333.4ga5uob5tgsgwego@akan>
References: <20200820010331.2911-1-s-anna@ti.com>
 <20200820010331.2911-3-s-anna@ti.com>
 <20200820114238.7ovvxq5n3fogzowi@akan>
 <8491a1bf-3665-8f23-6b75-34890566fcae@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8491a1bf-3665-8f23-6b75-34890566fcae@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 08:25-20200820, Suman Anna wrote:
[...]
> > I am just wondering if the carveouts and mbox linkage should be in the
> > common processor board? if that makes sense at all? I know we already
> > have other definitions.. Trying to see if we are making it harder to
> > understand the definition than that is necessary..
>
> In general, I consider these as stuff that needs to be added to the board dts
> files. You will see that this is what I have followed on all the TI
> AM57xx/DRA7xx boards. For J721E, we have a weird organization as the memory
> node, typically a board property, is defined in the som dtsi file, so the
> reserved memory nodes are also added in the som dtsi file. The convention I
> followed in general is to have the reserved-memory and memory nodes together.
>
> If you think the mailbox nodes should be moved into the SoM dts file, I could do

I think that might make more sense and less confusing. I'd rather
leave the processor board dts for more signal and interface hookup
related topics as it is done right now. if we do endup with too many
SoM duplication, then we should consider it's own dtsi

> it as a follow-on cleanup series, but would wait for the ABI 3.0 changes to be
> merged first.

Of course. We are expecting this to be part of rc2, please rebase and
post once the tag is out. next-20200820 has it already, if you want a
pre-look.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
