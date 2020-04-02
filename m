Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8B4C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 06:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5828720784
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 06:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="MIET5lBo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgDBGFp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 02:05:45 -0400
Received: from mail-dm6nam12on2059.outbound.protection.outlook.com ([40.107.243.59]:41899
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbgDBGFp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Apr 2020 02:05:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsUbCK9MGYiOsKQuIFSSjLelmbH1y1hWK3dCxz3fsdVODL+tERuchWSj/ivbNe8inCf1CFbf2vW0oYLiU0fH8rNvtgWn8/ocB8sQ8ODcMbl75UhVSj1HmADTwdUXRlHm7YxsMkb4oexogTlFH/6j8YkP13EOP/xPsQWC47NTt9SfdzVjHNifPaYRq8+Forzwh9xS3f7cd9YQgNhFLYpcyUusIqvsaii1tyWhdmGDC0ah87gz8hifzhT5kHiBMxxZWGhfEYwszM2cqPD103yIl1/LcF++mVjiUv3pw1bP2mzGJToR7OG1e2z/w4STZAuJYkL7p3GlE+zm9yBLeX6OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOH83+zn7mqhIL307GBH6M8FYVd9c2cOlU3jYZb/4Mc=;
 b=dfxUM024TgLssJY0KDF0yCqGj8THe4Yb1ml5Afc+ZXdTHKkvJOzzRGWho2NGExhaEkZq0qGQcli1Fs7guxmrXxl7ZQ0S6EDLEXrz+8NtJYQrad51bHgT4MHo4UUUeilx4NGeAtg8KYMrqU2wrOXHvmPMjMeYf1Sj/Y3xLa7JIj8btGxj5oV350THlaiSlP17YzfIroIB5mJQY30GZCs83VvV5+rwgxrS8s6hKPLOFz2sMCX2kTPb5W0hXTvyF9Ustm0QXbro2JUvXXHH4S78LRblV3LZ25vz/P64+gU1DjfrCzDlYwE+FhjgoF3wcwAoBeuFKU0R3yL1D4qdFADNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xs4all.nl smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOH83+zn7mqhIL307GBH6M8FYVd9c2cOlU3jYZb/4Mc=;
 b=MIET5lBoc0WRnf+ki5vBNts9wpfwBMUBSTvISc8RXuc/yfpuKVcHeYhEQNVT/wWi4ZJNdoX2ZVKZZYJKUHBo3HA5w35y7DqTJbUlr8agWKEWuUDLsf4ZVgn3196wbt3JbFiBmXd3WBLklWHdeUiWy5/E++dqPgxEy5xhDJoLQqE=
Received: from BL0PR01CA0023.prod.exchangelabs.com (2603:10b6:208:71::36) by
 CH2PR02MB6037.namprd02.prod.outlook.com (2603:10b6:610:8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 06:05:42 +0000
Received: from BL2NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:71:cafe::9) by BL0PR01CA0023.outlook.office365.com
 (2603:10b6:208:71::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 06:05:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT059.mail.protection.outlook.com (10.152.76.247) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 06:05:41
 +0000
Received: from [149.199.38.66] (port=43114 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJsyu-0007ri-Nk; Wed, 01 Apr 2020 23:05:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJsyz-0001aZ-Ef; Wed, 01 Apr 2020 23:05:41 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03265cAZ008233;
        Wed, 1 Apr 2020 23:05:39 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jJsyw-0001Zq-OQ; Wed, 01 Apr 2020 23:05:38 -0700
Subject: Re: u-boot DT configuration node
To:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     robh@kernel.org, devicetree@vger.kernel.org, u-boot@lists.denx.de,
        trini@konsulko.com, loic.poulain@linaro.org
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <016159802e74c8a2@bloch.sibelius.xs4all.nl>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ff4d0123-ca41-630e-322f-5251ee1e308e@xilinx.com>
Date:   Thu, 2 Apr 2020 08:05:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <016159802e74c8a2@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(5660300002)(336012)(81156014)(426003)(9786002)(4326008)(70586007)(3480700007)(31686004)(70206006)(8936002)(2616005)(44832011)(2906002)(26005)(47076004)(8676002)(82740400003)(81166006)(478600001)(186003)(31696002)(966005)(36756003)(316002)(110136005)(356004)(42866002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6414f71a-e857-4ba6-be91-08d7d6cbdfcf
X-MS-TrafficTypeDiagnostic: CH2PR02MB6037:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6037ACEB9B1E6189A3E9A749C6C60@CH2PR02MB6037.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0361212EA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaiWnPeI+vHJ22mYWMfdWlqCLJnUXfXPVOr5k2YjxmIiodUgza2rKU41kGgrl0AHkXfTC2g9vsPKeSERWNMqUjCwwdMhzllBso4s87zU/U1iezX0jwgxw9qwVYQC0zNjsuSKPh48UFvgyDZQ5R06l7kpPkcQw2DfB25P1ntDZR5rKfEkShz253hRHh03sGe+iHV8MOqShLGxdFdpCpLMjby1jYbRYRTpyDz9Nzit6yagOZK6GzFekcydMxBw7BKQCPf8LSwe77iJJmzaG1ppqknIDJGngogbXQaVXgCPDxi3eIUMbCl3R/rmH3qY68tfW7y82luO1Mu4oWymWzYxn/F5baRN2Q7EJDIvmU+Dt2jsBQPXuNsyJN/xv3VOigI/axTfJT4iXwYGkeE0y+sEDoAUgvPLwpHz32AuQK92Q7n1vy0WgePASaaIjaRHMnls/r+9KyOiIhWtjAn/XHrr07IGKvd4xNgMmQIM8mLNQYKpsKi73piLtZJwMTPD10TXrnegnVtsf/SxDiIAMG6H0l2HoNKppEb2TmD8FcxhRlzOCZl5pJwVrw9FD73ZdhhdUZRzxTPaZqJRhssYoioHfSvXkjkpAPHnglQTX3u8ZzgobotSIQSQ627NRqTL5Uqn
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 06:05:41.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6414f71a-e857-4ba6-be91-08d7d6cbdfcf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6037
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 01. 04. 20 20:09, Mark Kettenis wrote:
>> From: Michal Simek <michal.simek@xilinx.com>
>> Date: Wed, 1 Apr 2020 11:23:13 +0200
>>
>> Hi Rob and others,
>>
>> for couple of years already u-boot is using config node in root DT for
>> u-boot configuration.
>>
>> Here is one example in u-boot source code.
>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
>>
>> And here is dt binding description
>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
>>
>> I was checking dt binding specification and there no such a thing
>> described there. It means I expect this is more adhoc u-boot solution.
>> We have reached the point where could be beneficial to put some u-boot
>> specific configurations to DT.
>>
>> Actually I have done similar thing some time ago too by using chosen
>> node and add xilinx specific property there to point to eeprom.
>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
>>
>> I think it is a time to discuss it and do it properly.
>>
>> First of all my question is where we could list SW prefixes to make sure
>> that they are listed and everybody is aware about it. We have
>> vendor-prefixes and we should have a way to record also prefixes for sw
>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
>> xen prefix. At least these two should be listed.
> 
> OpenBSD is using "openbsd," as a prefix.  I've always thought it would
> be good to have it listed in the list of vendor prefixes there.  In an
> open source world it shouldn't matter whether an entity sells
> something or not.  And in fact "inux," is already there.  And so is
> "qemu,".

Good we have more.


> 
>> Next my question is what is the recommended way to pass sw specific
>> parameters via DT? I think using chosen node is more appropriate then
>> adhoc config node. Or is there a better way how this should be done?
> 
> On OpenBSD we do indeed use the the chosen node to pass information
> between the bootloader and the kernel.

Can you please point me to any example or description what you are
adding there?

Thanks,
Michal

