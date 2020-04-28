Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188F4C83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 13:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6776206B9
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 13:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="J84ZyIIe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgD1NvH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 09:51:07 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com ([40.107.75.53]:58368
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727934AbgD1NvF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 09:51:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6V7h/WbEsKO1Zfv/KIRkgwBM7YW1cFtameRz5pSNewg89T+q+VJFnxgGqhCQpeG4TUITCcgDj2GVPt/40jZ8PeqvR7ExASJKYlKnDP96W4HWbAD7Jfc7/bLB/6PA+PuWF1ac7XFwwsMLTgJqDcUxNpBqngPXD2yi2caRoW9PugquMqfnJ3KsI38qaqBzN16RBqSV3yafmsk0qOsMqhb96GSdtkzmwDbVONS9qtv3Y4JPYlp0YOvX1AtWG9ZnfZcfJ2ViGis3UJjZONOqoh+kLW+/BLSjsdwD64l2uwvvminVOG1kqot9Jf5fCzrAaBX4aMLiSPWBLdRkmTYM+Q7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36asAMZpADDCOA9HRgh2qfMaGbNilcdlRVSFr1eMQdU=;
 b=YD5nv9EO8jpQrBdzWEE/Z7NQhmFPZcxXydHDp/EK4D1MOZzlLvjUYj3BnGT7LDtk4JHSgLnIYdTJIe6HB2rI6/kB6PK3qsV+ecuybax+N4+7Y1cAzRYrWq37ODGf1QoPpcXKo3+mKodfQpyVRXXrkNkNhyNjK9hoq5lrCuECgb7EUwRCIi/Vjq6mvIq98yjc1eS26Jy8l90DowY1XW75lg5lcLXHVhZonThj1CPqrJ/qYqXfRsRHkvfbCuOpUvi6G7snZcv90z7+cir8031X4o+KBsm0z4LqWRkBgiQc1+iHQAbuXx2fWP57plxL8iGbGamln6OpDhoO3/TASjmv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36asAMZpADDCOA9HRgh2qfMaGbNilcdlRVSFr1eMQdU=;
 b=J84ZyIIezjawdHMJ76SOlfoTKlO+OBd56Mp1HfOAzFocutSadqkdK+Zyj5YOXJfbcVetkMvixaw1XOs3Wz33ePMgX0Lp/zYrEOOyS+N2SuVSX7qYObD+Amp8z+Te9ec6Twk1wXjC9aKidTCAXc5shJJc1QbjbCIy3BZJBqVO/Lc=
Received: from SN1PR12CA0111.namprd12.prod.outlook.com (2603:10b6:802:21::46)
 by SN6PR02MB5056.namprd02.prod.outlook.com (2603:10b6:805:73::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Tue, 28 Apr
 2020 13:51:02 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::d6) by SN1PR12CA0111.outlook.office365.com
 (2603:10b6:802:21::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Tue, 28 Apr 2020 13:51:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Tue, 28 Apr 2020 13:51:02
 +0000
Received: from [149.199.38.66] (port=40430 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jTQdW-0004fV-9H; Tue, 28 Apr 2020 06:50:58 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jTQdZ-0000pF-Tz; Tue, 28 Apr 2020 06:51:01 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03SDouFT002003;
        Tue, 28 Apr 2020 06:50:56 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jTQdU-0000o4-DE; Tue, 28 Apr 2020 06:50:56 -0700
Subject: Re: u-boot DT configuration node
To:     Rob Herring <robh@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
Date:   Tue, 28 Apr 2020 15:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(966005)(26005)(478600001)(53546011)(5660300002)(3480700007)(8676002)(31696002)(31686004)(54906003)(110136005)(81156014)(9786002)(316002)(4326008)(70206006)(2906002)(2616005)(336012)(44832011)(186003)(426003)(70586007)(82310400002)(356005)(81166007)(82740400003)(36756003)(8936002)(47076004)(83080400001);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec90bd7-db4c-459e-dcb6-08d7eb7b306e
X-MS-TrafficTypeDiagnostic: SN6PR02MB5056:
X-Microsoft-Antispam-PRVS: <SN6PR02MB505670855E4B581C4A9B8FE8C6AC0@SN6PR02MB5056.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0387D64A71
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1GvAN4nSXKuipU9Kc144U/jieSTHpPye7kP2jUq8tgobIvsv0f/zT/UFVVgh91altgZjuBPVysoKMnFeeU87wT41uNZorYun7oj2ldqkjO2TsAQcZdu05qUYxEhj/LNOPDYI6Ot8FKUv78e/mKL/HLa0wU/y2D6uhZEuf+LJtU3F8nrUQkQ/5oeCyAxfQoYiIJ6FO6AYhGTCC8aujBBYrGAamGHQXz358ZPx33nUeZw24T99dfkBEGQTlGWeomf6HM1RGDNzWfQdqDUn59Xefoo6uZ70IJ9SU3kFa+8AGqDVahsaid43bCBOSo6zBa7QY9ywf2PU6NYn0HWgoZjdnJxOPCjFklhdwMdYQkRG/yF11XBguXrC9B/XTQDBZA5y186IsfHwOG+NK53fIWjK1pPNaS/SW9ciM2nP8J4prSJ8zqo6i8dT9tHFMqIKDYka/ikr0VacdvngmIKSqe8C6bXCOrHhA7j2r5C/bmTgBxvneRr2F6HBIjvBk4IXM+LC0HoIRVhLlAvkBmbuFi9lRCOQg/obY3SgGgK1A8gcEWEhAx44+zy3CiEcP39n7iMJ7RQlLdZRTM3TLOKa+tg7qstzIRcap/j771XjiBfRSg=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 13:51:02.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec90bd7-db4c-459e-dcb6-08d7eb7b306e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5056
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28. 04. 20 15:23, Rob Herring wrote:
> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
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
> 
> In this case, I think an alias should be used as it's more of just a
> shortcut to finding a specific node.

What alias name do you suggest to use?
We have systems where one i2c eeprom described based board and another
i2c eeprom describe bootable module. And I need to have shotcuts to both
of them.

dt specification doesn't list any keywords for aliases but there is
generic name recommendation.

Based on keywords it should look like this.
eeprom0 = ...;
eeprom1 = ...;


> 
>> I think it is a time to discuss it and do it properly.
>>
>> First of all my question is where we could list SW prefixes to make sure
>> that they are listed and everybody is aware about it. We have
>> vendor-prefixes and we should have a way to record also prefixes for sw
>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
>> xen prefix. At least these two should be listed.
> 
> Documentation/devicetree/bindings/vendor-prefixes.yaml.

thx

> 
>> Next my question is what is the recommended way to pass sw specific
>> parameters via DT? I think using chosen node is more appropriate then
>> adhoc config node. Or is there a better way how this should be done?
> 
> /chosen
> 
> For vendor specific things though I would be cautious. If they are
> settings for a specific device, then they probably belong in the
> device's node. Second, are they really vendor specific? What we don't
> want is each vendor doing the same thing in slightly different ways.

For u-boot specific setting like - offsets it should be generic for
everybody. I was already talking to Loic that for saving u-boot
variables to QSPI we should be using MTD partition map and put there
maybe a flag to say that this is the location for storing them.

Thanks,
Michal


