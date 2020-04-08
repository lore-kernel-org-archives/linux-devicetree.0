Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DBFC2D0EA
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 06:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54AD4206A1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 06:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Rh8R+qxd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDHG50 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 02:57:26 -0400
Received: from mail-bn8nam11on2049.outbound.protection.outlook.com ([40.107.236.49]:33868
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725763AbgDHG50 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Apr 2020 02:57:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOw48kzcv9/BHx0Kc3ghu5AxxXGkVlWgEMXXrjMF96MedNqXBLUoPKFQ/vJYgrpwl4o+8mOU3C+CP8p8XYYRmjgDcW78xlCPGEwLdhYlGsMt5rR+dfBkKQgfkNfZ+Uyh+Rh8SAPEVKn99CLfTUAyoYt3Vi5AlplAi6htfQx3FTqxspd0v3/DlwiTlQMVi7Wm/Jj0Y7rcDKoWMdpQxxsBOTLuhaeuloOT7oEANIDDeKGy9bNhZuf2hazjaokGqY5O2iIZzgAvUc1W/3/Hvz9U2GBf5a9wea9mTwGO4v51EoXIzSJnqKtud8dI1NIYPpdNUcWZru5HNU7cyS8Gm8aiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolWF9YXsZXYstdO5veFwfAKLENWX9e0ZV96nUp2aAw=;
 b=a7Sopn0ACPVoDWiWb1MGrsK67uSA5qejiijLGRz7f/a31ojMQ5Mul1yj62lTGE1clnKQekfVcykiq4ZrrwBUDqo2i0Ujxim3q1yLNTNBNdFk+/RsnG41mMB9Fyq/xuq23thJqxyevUKwrt3Nk2azaw50Xg2tBL8tcQsd3hY6w+LxH0LsZrI/ZSWpZH8z9dsplijIZz86AasJdT5tr5LhHz2ZYkVbsV16lV+7IDKgq6pAYA0Ec+yy+iwWOeLTxQFJOTZbLrS1l9w53czv87QAQS0bBJ0Vk0KWzrB45mGBpPW3ngXDwvz9JM+/5CM4yCGh10t+Bjnviw0ciRlfSuYRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xs4all.nl smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolWF9YXsZXYstdO5veFwfAKLENWX9e0ZV96nUp2aAw=;
 b=Rh8R+qxdL950EonAavFQmCJjy0NwMXDK/fhfR2XmaCxekdlgoYhnWD5KUCO9O6af1OnbzBE5p/ajUmMHb3gKzHivHGEljJJeUwQjOh7136lvHP9RHDO0apEBwfAuPNjBaoG/Ysgfr5pZ0sOchwppRtYu6+BDu1Br0T9tb1Co02U=
Received: from MN2PR15CA0046.namprd15.prod.outlook.com (2603:10b6:208:237::15)
 by DM6PR02MB4361.namprd02.prod.outlook.com (2603:10b6:5:22::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 06:57:11 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:237:cafe::9e) by MN2PR15CA0046.outlook.office365.com
 (2603:10b6:208:237::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17 via Frontend
 Transport; Wed, 8 Apr 2020 06:57:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 06:57:10
 +0000
Received: from [149.199.38.66] (port=33387 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jM4dk-0001Ib-EI; Tue, 07 Apr 2020 23:56:48 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jM4e6-000092-GV; Tue, 07 Apr 2020 23:57:10 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0386v8eP009454;
        Tue, 7 Apr 2020 23:57:09 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jM4e4-00008R-ON; Tue, 07 Apr 2020 23:57:08 -0700
Subject: Re: u-boot DT configuration node
To:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>, robh@kernel.org
Cc:     devicetree@vger.kernel.org, u-boot@lists.denx.de,
        trini@konsulko.com, loic.poulain@linaro.org
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <016159802e74c8a2@bloch.sibelius.xs4all.nl>
 <ff4d0123-ca41-630e-322f-5251ee1e308e@xilinx.com>
 <01615b4c8ab806fd@bloch.sibelius.xs4all.nl>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c4c6da5b-dce4-fbe2-52a4-753fb283bcd8@xilinx.com>
Date:   Wed, 8 Apr 2020 08:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <01615b4c8ab806fd@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(186003)(2616005)(336012)(426003)(31696002)(356004)(8936002)(47076004)(4326008)(2906002)(316002)(81166007)(3480700007)(5660300002)(70586007)(70206006)(8676002)(26005)(44832011)(36756003)(81156014)(9786002)(478600001)(82740400003)(966005)(31686004)(110136005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adea9c1c-3f03-4bbf-a46c-08d7db8a0f8c
X-MS-TrafficTypeDiagnostic: DM6PR02MB4361:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4361CDBFE66762683A09048AC6C00@DM6PR02MB4361.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0367A50BB1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D79v3I9kLzd3eCqA6s0uXyTgWWZ5TkUcyO7hwgWy7XqddPi5BhkpbiAyJ7h2KmQjbseRz6qI6Z/WxJswrxo5uGXHTdVYxgFbHhaXzQaBlA+gRI/E5aGDv8/mgOBLQ7g7uUpK844GyP8yuEX4vkL5P/2mJGkj33fMZVitzojpi6H4QjMjmtFyBfD4mdIpHRg2glEOOLlGMeBPx63ePtE+a5L0HCY55kdPnz2YUU/hYwleLNsPhUX5CCSp+91rBMy3YOo8KqLxyta1B+vgYZxN4UYmbwnSop3cvZItpHUQZGgVKoLJyvjNP5vPZsNvGWkWdoa2eYUdu5TTuKxiOi5JYKc9JO8GBHd2NRqVN0yjp+Qr9WarAYbY/9maXxlW+dabJgHP2kWHdCOVVDN458vSXF0HBGBcBRM2/U9vG7NX6LuEtrQr6xwmFzN2pkkuzI8grNH7X28eSW6DRBeMTqnrGPDgK1RgizunTOrCXvyCKn1eSossBJf3FuA3dlUQNvE+egyHEjDomOWbrS86nxmmj95ZMHnyM5pNoVWBkQZpARMh9+EKYa6iIRJMeXWGATQ4k+uW5Cy/42XZz4bkqHEkJBMykH2sl8A3B1J0E+X8SA8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 06:57:10.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adea9c1c-3f03-4bbf-a46c-08d7db8a0f8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4361
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 02. 04. 20 13:34, Mark Kettenis wrote:
>> From: Michal Simek <michal.simek@xilinx.com>
>> Date: Thu, 2 Apr 2020 08:05:36 +0200
>>
>> On 01. 04. 20 20:09, Mark Kettenis wrote:
>>>> From: Michal Simek <michal.simek@xilinx.com>
>>>> Date: Wed, 1 Apr 2020 11:23:13 +0200
>>>>
>>>> Hi Rob and others,
>>>>
>>>> for couple of years already u-boot is using config node in root DT for
>>>> u-boot configuration.
>>>>
>>>> Here is one example in u-boot source code.
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
>>>>
>>>> And here is dt binding description
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
>>>>
>>>> I was checking dt binding specification and there no such a thing
>>>> described there. It means I expect this is more adhoc u-boot solution.
>>>> We have reached the point where could be beneficial to put some u-boot
>>>> specific configurations to DT.
>>>>
>>>> Actually I have done similar thing some time ago too by using chosen
>>>> node and add xilinx specific property there to point to eeprom.
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
>>>>
>>>> I think it is a time to discuss it and do it properly.
>>>>
>>>> First of all my question is where we could list SW prefixes to make sure
>>>> that they are listed and everybody is aware about it. We have
>>>> vendor-prefixes and we should have a way to record also prefixes for sw
>>>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
>>>> xen prefix. At least these two should be listed.
>>>
>>> OpenBSD is using "openbsd," as a prefix.  I've always thought it would
>>> be good to have it listed in the list of vendor prefixes there.  In an
>>> open source world it shouldn't matter whether an entity sells
>>> something or not.  And in fact "inux," is already there.  And so is
>>> "qemu,".
>>
>> Good we have more.
>>
>>
>>>
>>>> Next my question is what is the recommended way to pass sw specific
>>>> parameters via DT? I think using chosen node is more appropriate then
>>>> adhoc config node. Or is there a better way how this should be done?
>>>
>>> On OpenBSD we do indeed use the the chosen node to pass information
>>> between the bootloader and the kernel.
>>
>> Can you please point me to any example or description what you are
>> adding there?
> 
> Here is an example of what the chosen node looks like:
> 
>     Node 0x2220
>             name: 'chosen'
>             openbsd,uefi-mmap-desc-ver: 00000001
>             openbsd,uefi-mmap-desc-size: 00000030
>             openbsd,uefi-mmap-size: 00000540
>             openbsd,uefi-mmap-start: 00000081.fbe37df8
>             openbsd,uefi-system-table: 00000081.ff910018
>             openbsd,bootduid: 1b33bbab.1613122f
>             bootargs: 'sd0a:/bsd'
>             stdout-path: '/smb/serial@e1010000'
> 
> The openbsd,uefi-* proprties are effectively the same those already
> documented for linux and xen.  The openbsd,bootduid contains the
> unique idea of the boot disk such that the kernel can find it and use
> it as its root disk.  There is also an openbsd,bootmac property to
> support netbooting, and openbsd,sr-bootuuid and openbsd,sr-bootkey
> properties to support booting from software raid with full disk
> encryption.  The actual key is zeroed out as soon as possible by the
> kernel.
> 
> This all is pretty much a private interface between the boot loader
> and the kernel though.
> 
> For booting on arm64 systems that use ACPI instead of a device tree,
> the bootloader creates its own minimal device tree that contains a few
> specific nodes that use compatible properties wuth an "openbsd,"
> prefix.  But once again that is a private interface between bootloader
> and kernel.

Rob: any comment?

Thanks,
Michal


