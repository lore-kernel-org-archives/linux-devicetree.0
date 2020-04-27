Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186DFC54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 12:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E286520656
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 12:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="MMNLdQ+Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgD0MGp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 08:06:45 -0400
Received: from mail-mw2nam12on2063.outbound.protection.outlook.com ([40.107.244.63]:36960
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726539AbgD0MGo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Apr 2020 08:06:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoXnDfKdx7GSK36BRgUmr4wO4LGW64JJmvZH24wJQ5GKQj8zOdDkqHwWO5c6VgzxGG6Nh+wwFxhsX/nhLQXq88O/utqjxKlUk0OcA3g1LtpmzC1Jr/+PhXbzZIyA4E8IjTh8kZ0bZcazIhJ4khah7vvXsiKIX5s8g0tR9qKRz3pTKMf8FkZjlMLe+DNWLn3RKcv0dl2++NGWaJUcRMJQcWmikgP25qFqKARHpscrDkqepv2HvJ0kUYFjbfV5ew1rNtLwTVmt4VOmk3fprwTzB8+aFBTGVgL9mv1dBt76PYIXfeVPnopsszGUPvlCigEi0rfEiPlda8nwwKFcK375GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L37S5ZPCYiEM13GSpigez3oCAqxq2cYFNMo2ueuKCco=;
 b=WpPAsqkaFBp/HmIXYjnXlo1WQrdrg84BrTdWOGyBj9E/VVGrYdq2TCR4xK01b3jzFpnPI/N4z1lDu3Bi1efOij7BsLcIkhhjVdAS3imOPkkHjoo4d6N/zj91dvPCPj0BmAhlmE4AA3P2OXKGekCjVLApzv4SG0d9IH605UD4+ga1Q/ozTmjsDejnb4r2JBSyKJfpwOxLqr0oCGY/NFQrGxfwFotKR900mHut9YEQLA1+Jrj0caLdyFZ7/ID3NGahy9fG44jSFhxEIFdPFGKbdiW4PHOBaFI3N1gv0NM1zr8SkbXbOOWPP0yXxGrLBZA1v0ZmTubmGbmTYEbUVJMycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xs4all.nl smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L37S5ZPCYiEM13GSpigez3oCAqxq2cYFNMo2ueuKCco=;
 b=MMNLdQ+QyzWwEzG8N1LPB8s9CnTQbH7AnvYM/B4iaJtTOoAYS6T/7Hm3Hk1q0Xf79s0gCtwSQu/SDJzuEDVUIybY3338QK7HxJToQLaV1V7UfAVu75AbyWY1Wg+AD/cPajJK2tbo8xxKkFJVYkPMCCG+v7Y3oi2Rb1FnRjIa9/I=
Received: from SN4PR0201CA0008.namprd02.prod.outlook.com
 (2603:10b6:803:2b::18) by DM6PR02MB4684.namprd02.prod.outlook.com
 (2603:10b6:5:fe::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 12:06:39 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2b:cafe::f9) by SN4PR0201CA0008.outlook.office365.com
 (2603:10b6:803:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 12:06:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Mon, 27 Apr 2020 12:06:39
 +0000
Received: from [149.199.38.66] (port=37445 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jT2Wy-0004ar-HH; Mon, 27 Apr 2020 05:06:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jT2X0-0002hm-Nx; Mon, 27 Apr 2020 05:06:38 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03RC6VXs031089;
        Mon, 27 Apr 2020 05:06:31 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jT2Wt-0002fG-46; Mon, 27 Apr 2020 05:06:31 -0700
Subject: Re: u-boot DT configuration node
To:     Michal Simek <michal.simek@xilinx.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>, robh@kernel.org
Cc:     devicetree@vger.kernel.org, u-boot@lists.denx.de,
        trini@konsulko.com, loic.poulain@linaro.org
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <016159802e74c8a2@bloch.sibelius.xs4all.nl>
 <ff4d0123-ca41-630e-322f-5251ee1e308e@xilinx.com>
 <01615b4c8ab806fd@bloch.sibelius.xs4all.nl>
 <c4c6da5b-dce4-fbe2-52a4-753fb283bcd8@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <27a97282-96b4-1527-2719-620e7aa0655a@xilinx.com>
Date:   Mon, 27 Apr 2020 14:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c4c6da5b-dce4-fbe2-52a4-753fb283bcd8@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(44832011)(6666004)(70586007)(5660300002)(9786002)(31686004)(316002)(110136005)(70206006)(26005)(966005)(36756003)(2616005)(4326008)(83080400001)(186003)(82740400003)(81156014)(426003)(478600001)(81166007)(82310400002)(336012)(8676002)(3480700007)(8936002)(2906002)(47076004)(31696002)(356005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f21a91a-d5e1-44cf-cf5a-08d7eaa370db
X-MS-TrafficTypeDiagnostic: DM6PR02MB4684:
X-Microsoft-Antispam-PRVS: <DM6PR02MB46847189261A3DA78441487EC6AF0@DM6PR02MB4684.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0386B406AA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTXb37JJiA2Fy8IyJSBOfv+LKMsQRqyiYtLlHOHRMq7fX4cBbVGnCzNES0a3e7Gj6oWxqpjhoRcUbINk6bJz4ipUva9Xq/ya1eR+skMCMd4xHYFWLsouy7L6wKTxO9k07MZ6db8ijQRluYk8YLmBNv1czUrLy5Q80umt2AkelNq62vhMzTncqc3zBisot4WiqqBRqqm/cocJB/obd16u00pI+GVMWKe/Lg+9a4xwiaCtwGY4N6ANGAD8P6NBuXd59XrjAmedFu2DzFZgXS7ZnukJ7EVr8MQ38wN+lCck3KI3EU2SvvFuejQmemScf71/NwA5Fx1c79R020JKXXW2XXuXnzI/AMrGxiaoyXELB4hVvlfVdGJo1UZKYQ10QTSKPIYmlu9XEMTVdjnScXld1qGpSBFvwH09OuCwyZoVbrDySuoI84wLFElogD0AitK1YKFCb8zdUTgwyGC7BMxTULTT/xDWvO+6aBaoYV3GPgc6gCeLZr8yfWP/ULpz3oQjxvMoKVQAt3yW5pYqdmu9zjeviTI6HkcZRf0mO+j9IP7HOJyUlBT/4WFU72fOwlOd6dXOSYCnb2GCKOKpPTq/OXjKQPfoofM/pNj9T4Ltpng=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 12:06:39.0147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f21a91a-d5e1-44cf-cf5a-08d7eaa370db
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4684
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 08. 04. 20 8:57, Michal Simek wrote:
> On 02. 04. 20 13:34, Mark Kettenis wrote:
>>> From: Michal Simek <michal.simek@xilinx.com>
>>> Date: Thu, 2 Apr 2020 08:05:36 +0200
>>>
>>> On 01. 04. 20 20:09, Mark Kettenis wrote:
>>>>> From: Michal Simek <michal.simek@xilinx.com>
>>>>> Date: Wed, 1 Apr 2020 11:23:13 +0200
>>>>>
>>>>> Hi Rob and others,
>>>>>
>>>>> for couple of years already u-boot is using config node in root DT for
>>>>> u-boot configuration.
>>>>>
>>>>> Here is one example in u-boot source code.
>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
>>>>>
>>>>> And here is dt binding description
>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
>>>>>
>>>>> I was checking dt binding specification and there no such a thing
>>>>> described there. It means I expect this is more adhoc u-boot solution.
>>>>> We have reached the point where could be beneficial to put some u-boot
>>>>> specific configurations to DT.
>>>>>
>>>>> Actually I have done similar thing some time ago too by using chosen
>>>>> node and add xilinx specific property there to point to eeprom.
>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
>>>>>
>>>>> I think it is a time to discuss it and do it properly.
>>>>>
>>>>> First of all my question is where we could list SW prefixes to make sure
>>>>> that they are listed and everybody is aware about it. We have
>>>>> vendor-prefixes and we should have a way to record also prefixes for sw
>>>>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
>>>>> xen prefix. At least these two should be listed.
>>>>
>>>> OpenBSD is using "openbsd," as a prefix.  I've always thought it would
>>>> be good to have it listed in the list of vendor prefixes there.  In an
>>>> open source world it shouldn't matter whether an entity sells
>>>> something or not.  And in fact "inux," is already there.  And so is
>>>> "qemu,".
>>>
>>> Good we have more.
>>>
>>>
>>>>
>>>>> Next my question is what is the recommended way to pass sw specific
>>>>> parameters via DT? I think using chosen node is more appropriate then
>>>>> adhoc config node. Or is there a better way how this should be done?
>>>>
>>>> On OpenBSD we do indeed use the the chosen node to pass information
>>>> between the bootloader and the kernel.
>>>
>>> Can you please point me to any example or description what you are
>>> adding there?
>>
>> Here is an example of what the chosen node looks like:
>>
>>     Node 0x2220
>>             name: 'chosen'
>>             openbsd,uefi-mmap-desc-ver: 00000001
>>             openbsd,uefi-mmap-desc-size: 00000030
>>             openbsd,uefi-mmap-size: 00000540
>>             openbsd,uefi-mmap-start: 00000081.fbe37df8
>>             openbsd,uefi-system-table: 00000081.ff910018
>>             openbsd,bootduid: 1b33bbab.1613122f
>>             bootargs: 'sd0a:/bsd'
>>             stdout-path: '/smb/serial@e1010000'
>>
>> The openbsd,uefi-* proprties are effectively the same those already
>> documented for linux and xen.  The openbsd,bootduid contains the
>> unique idea of the boot disk such that the kernel can find it and use
>> it as its root disk.  There is also an openbsd,bootmac property to
>> support netbooting, and openbsd,sr-bootuuid and openbsd,sr-bootkey
>> properties to support booting from software raid with full disk
>> encryption.  The actual key is zeroed out as soon as possible by the
>> kernel.
>>
>> This all is pretty much a private interface between the boot loader
>> and the kernel though.
>>
>> For booting on arm64 systems that use ACPI instead of a device tree,
>> the bootloader creates its own minimal device tree that contains a few
>> specific nodes that use compatible properties wuth an "openbsd,"
>> prefix.  But once again that is a private interface between bootloader
>> and kernel.
> 
> Rob: any comment?

Rob: Another reminder?

Thanks,
Michal


