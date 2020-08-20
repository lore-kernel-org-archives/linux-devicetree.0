Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD01C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 13:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8863820658
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 13:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Luk7a5dJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730845AbgHTNZ3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 09:25:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50318 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730830AbgHTNZR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 09:25:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KDPCbj060069;
        Thu, 20 Aug 2020 08:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597929912;
        bh=y/l56dAGpjnshDm3cxwCsETuPKtCmIdz45bEU/nlU3Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Luk7a5dJiMJPu/WNwCJd94xOsRD4SxChJpgQylGZK0LBl4t3sit0cjYX6qw2eChrL
         Xm6ZKi05oC0zUxkPdKbi3NqKsMroKjfc1F1PhAtx1AxTEab1itcZIkmaigPzjG+aLK
         7Wn9ZTkzDJiTs+n1B+Qe9C/OohCoRLpDijNz4cGQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KDPC4Z023311
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Aug 2020 08:25:12 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 08:25:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 08:25:12 -0500
Received: from [10.250.32.29] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KDPCtK095800;
        Thu, 20 Aug 2020 08:25:12 -0500
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 mailboxes to C66x DSPs
To:     Nishanth Menon <nm@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200820010331.2911-1-s-anna@ti.com>
 <20200820010331.2911-3-s-anna@ti.com> <20200820114238.7ovvxq5n3fogzowi@akan>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8491a1bf-3665-8f23-6b75-34890566fcae@ti.com>
Date:   Thu, 20 Aug 2020 08:25:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820114238.7ovvxq5n3fogzowi@akan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nishanth,

On 8/20/20 6:42 AM, Nishanth Menon wrote:
> On 20:03-20200819, Suman Anna wrote:
>> Add the required 'mboxes' property to both the C66x DSP processors on the
>> TI J721E common processor board. The mailboxes and some shared memory
> 
> I am not sure I understand the logic here. The carveout is added to
> p0 SOM - and the mbox is added to common_proc_board. I am not sure I
> get the difference. The C66x processors are on the SoC, stack is as
> follows: - SoC - SoM - Common Proc board
> 
> I am just wondering if the carveouts and mbox linkage should be in the
> common processor board? if that makes sense at all? I know we already
> have other definitions.. Trying to see if we are making it harder to
> understand the definition than that is necessary..

In general, I consider these as stuff that needs to be added to the board dts
files. You will see that this is what I have followed on all the TI
AM57xx/DRA7xx boards. For J721E, we have a weird organization as the memory
node, typically a board property, is defined in the som dtsi file, so the
reserved memory nodes are also added in the som dtsi file. The convention I
followed in general is to have the reserved-memory and memory nodes together.

If you think the mailbox nodes should be moved into the SoM dts file, I could do
it as a follow-on cleanup series, but would wait for the ABI 3.0 changes to be
merged first.

regards
Suman

> 
>> are required for running the Remote Processor Messaging (RPMsg) stack
>> between the host processor and each of the R5Fs. The chosen sub-mailboxes
>> match the values used in the current firmware images. This can be changed,
>> if needed, as per the system integration needs after making appropriate
>> changes on the firmware side as well.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> index e8fc01d97ada..ff541dc09eca 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> @@ -379,6 +379,14 @@ &mailbox0_cluster11 {
>>  	status = "disabled";
>>  };
>>  
>> +&c66_0 {
>> +	mboxes = <&mailbox0_cluster3 &mbox_c66_0>;
>> +};
>> +
>> +&c66_1 {
>> +	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
>> +};
>> +
>>  &main_sdhci0 {
>>  	/* eMMC */
>>  	non-removable;
>> -- 
>> 2.28.0
>>
> 

