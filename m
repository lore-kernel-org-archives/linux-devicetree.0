Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C488C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 04:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190A62078A
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 04:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eYKih+B0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgH0E6m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 00:58:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgH0E6m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 00:58:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R4wdjW005348;
        Wed, 26 Aug 2020 23:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598504319;
        bh=2alI/XzzQeGgZh4pS7eqwKRSfJnwDMvvtZgpsxYLy/Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eYKih+B0f5OXySU+PIaw20A+9MNbs6b6Pe6s+m2V62UdRa3kXCgLWApakEJ5FXEA/
         zxMb0E5b0KtJfqUFQ7+1ZFPE9Vu53Ekpr44YePU6qzBBvh/N49bIWN4fxLsygxOx78
         n1evNzYKezfEFYnrYZKUnDXbsYZP+NsaJmrkMuFk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R4wd5H128448
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Aug 2020 23:58:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 23:58:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 23:58:39 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R4waNM013060;
        Wed, 26 Aug 2020 23:58:37 -0500
Subject: Re: [PATCH v2 0/8] Add C66x & C71x DSP nodes on J721E SoCs
To:     Suman Anna <s-anna@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200825172145.13186-1-s-anna@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <1fc9eb3f-d56c-5d3e-ecf7-f30711051995@ti.com>
Date:   Thu, 27 Aug 2020 10:28:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200825172145.13186-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 25/08/20 10:51 pm, Suman Anna wrote:
> Hi Nishanth,
> 
> The following is a revised version of the series [1] that adds the base
> dt nodes for the 2 C66x and 1 C71x DSP remote processors present in MAIN
> domain on J721E SoCs, and the required nodes to boot these successfully
> on J721E EVM board. It addresses the cleanup comments from you.
> 
> The patches are based on top of the pending ABI 3.0 pull-request [2] and
> I have used your temporary staging branch [3] as the baseline.
> 
> Main changes in v2:
> - Patch 1 is new, and moves all the mailbox dts nodes from the common
>   board dts file to the k3-j721e-som-p0.dtsi file
> - Patches 3 & 6 are reworked to add the mboxes properties directly
>   in the k3-j721e-som-p0.dtsi file
> - Patches 4 & 8 are rebased versions to sit on top of the modified
>   mailbox addition patches
> - Patches 2, 5 and 8 are unchanged


FWIW, Series
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

