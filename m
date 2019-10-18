Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BE4CA9EA1
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 12:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A071222C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 12:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XVdq3vnW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442703AbfJRMVs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 08:21:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45188 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387570AbfJRMVr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 08:21:47 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICLfuG086145;
        Fri, 18 Oct 2019 07:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401302;
        bh=iMCXi1bXhcu5PpTfDwyLXE84r6Q/7AsOhkancNxD5Gg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XVdq3vnWT4AGBIDr0qlgJ35EJv53Za9UPViN4sRNJXYTD3iIqTFNINS+DFkSwr1sV
         rxbyAXtp6OKlWt8c+koi1E027N1RjFflSLjc1eOFbaDXjQ/HwxXMiY0lM+Fm9J/GZq
         rlkv7FIv9JpuDxCH/oXQIFyDfAFUSZDjFDetq4LE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9ICLfuU055675
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 07:21:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:21:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:21:41 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICLdO8006490;
        Fri, 18 Oct 2019 07:21:40 -0500
Subject: Re: [PATCH v2 0/4] Add Mailbox nodes for TI K3 AM65x & J721E SoCs
To:     Suman Anna <s-anna@ti.com>, Nishanth Menon <nm@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190725001020.23781-1-s-anna@ti.com>
 <e27abe06-2df0-fdae-6fe5-080a40ee3bdd@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <8b692766-08a4-6bad-768e-56acba5eb9de@ti.com>
Date:   Fri, 18 Oct 2019 15:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e27abe06-2df0-fdae-6fe5-080a40ee3bdd@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 09/10/2019 23:19, Suman Anna wrote:
> Hi Tero,
> 
> On 7/24/19 7:10 PM, Suman Anna wrote:
>> Hi Tero, Nishanth,
>>
>> The following series is a revised version of the series [1] that adds
>> the Mailbox DT nodes and the sub-mailboxes used to communicate between
>> the main MPU processor running Linux and the various R5F and DSP remote
>> processors present on the TI K3 AM65x and J721E SoC families. Patches
>> are based on v5.3-rc1 + the HwSpinlock DT node series [2], and are
>> intended for the 5.4 merge window. Functionality is verified using a
>> out-of-tree unit-test module and some additional loopback test nodes
>> available here [3] for reference.
>>
>> Changes in v2:
>>   - All clusters are enabled by default in base dtsi files
>>   - The sub-mailboxes are moved to the actual board dts files
>>   - Unused clusters disabled in the board dts files
> 
> Looks like you missed picking this series up for 5.4. Can you please
> pick this up for 5.5? Let me know if you want me to repost the series,
> the last patch has a conflict when applying on top of 5.4-rc1 due to
> some additional nodes in the board dts file.

Yep, I missed this.

Queuing up towards 5.5 now, thanks.

-Tero

> 
> regards
> Suman
> 
>>
>> regards
>> Suman
>>
>> [1] https://patchwork.kernel.org/cover/11053401/
>> [2] https://patchwork.kernel.org/cover/11053311/
>> [3] https://github.com/sumananna/mailbox/commits/mbox/test/5.3-rc1-k3-v2
>>
>> Suman Anna (4):
>>    arm64: dts: ti: k3-am65-main: Add mailbox cluster nodes
>>    arm64: dts: ti: k3-am65-base-board: Add IPC sub-mailbox nodes for R5Fs
>>    arm64: dts: ti: k3-j721e-main: Add mailbox cluster nodes
>>    arm64: dts: ti: k3-j721e-common-proc-board: Add IPC sub-mailbox nodes
>>
>>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 108 ++++++++++++++++++
>>   .../arm64/boot/dts/ti/k3-am654-base-board.dts |  58 ++++++++++
>>   .../dts/ti/k3-j721e-common-proc-board.dts     |  93 +++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 108 ++++++++++++++++++
>>   4 files changed, 367 insertions(+)
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
