Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99245C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A8E220784
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Hq8qEK20"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731544AbgDAJXU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 05:23:20 -0400
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com ([40.107.94.64]:6192
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727723AbgDAJXU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 05:23:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/HR8skh86G6AIZnxTMDuEk5sW/jlr20AAO88IdaZhQHee4Gwx+rEUzYjg/86/a8Q8lBV8xTa/rXyIOnEbyPPdmRYFkmw1yDjBTn7D5fM/Gg075FG/H64GSkPg+xp5N34CP3F/wIZVM2AvHtqiWNuIQwDUtglL/la6qyGKK8D1zEwVDjawNgPgM7OMrC7N1aPkjB9Rmc9H9TMt9TctjBE1RNNLVQ+2LszW78CShmLqTuwoZTPafLIIHRZXHW/TD5xyFxsoNBpKy4xj94I4iQQl2jKCnHHXTpdOlyk1PjiOjd7gXl9qFw8Au641tIe3Tx5MLlQgivgLB1A6MpUkOtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mgYcqN7ueM4i+6mJ2BLJyOzX1hVB/Qqjd28dbDe8SA=;
 b=dl2W56dXJcwQ4ozKPwq1mPeIhWejps/kBE7zWi1kSWKNaU2xmBXD2E/IDnc1JlFpoKsWfkUnaLnHXmD0wTu7LoPZ+/5AtNwWre2BMAEbKCClNVEowuRLImEX9/ltxEYAGK7nR8tWf1XZutEoJy0Ll1dAvF5mGgmPpWXyhmrutWepx9Dv2oCpEKY5T2yQSCHBNKjIa23NvYZnkzlFcbKYK50VAfuKAggkmQAyTdzN5eD05yQJBeyoaR5fbnjxCU76cWgQGGVTUGN9UUVb0HYVQ5FxqvjTrtjkPWk/pTh2N4TLklLYFp/qzISGTxqDsalz2AyBAqp2iaAyHJXXeKPYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mgYcqN7ueM4i+6mJ2BLJyOzX1hVB/Qqjd28dbDe8SA=;
 b=Hq8qEK201iZ20oqntbJY1ZZm7XQh6/t088YgA9xYKRA04jrspP7SAJrIB4OCFR5/PC2pw2rU0GQcHtYTTYWC884W1WqCO/E6yfndb46Z1BfyqOKlspTXww4/jRyKfSMCx9X0zyFMR1dqqW83qYqcW8WUR3X+Y9bQ9/dJFgKIieE=
Received: from CY4PR13CA0040.namprd13.prod.outlook.com (2603:10b6:903:99::26)
 by MWHPR02MB2606.namprd02.prod.outlook.com (2603:10b6:300:44::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 1 Apr
 2020 09:23:17 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:99:cafe::33) by CY4PR13CA0040.outlook.office365.com
 (2603:10b6:903:99::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend
 Transport; Wed, 1 Apr 2020 09:23:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 09:23:16
 +0000
Received: from [149.199.38.66] (port=40044 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJZac-0004hK-I8; Wed, 01 Apr 2020 02:23:14 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJZae-0004sU-Lv; Wed, 01 Apr 2020 02:23:16 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0319NF5W006149;
        Wed, 1 Apr 2020 02:23:15 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jJZad-0004re-3G; Wed, 01 Apr 2020 02:23:15 -0700
To:     Rob Herring <robh@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: u-boot DT configuration node
Message-ID: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
Date:   Wed, 1 Apr 2020 11:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(4326008)(316002)(3480700007)(9786002)(31696002)(336012)(70206006)(36756003)(5660300002)(186003)(70586007)(47076004)(426003)(2616005)(26005)(54906003)(44832011)(6916009)(8676002)(31686004)(81156014)(356004)(82740400003)(966005)(81166006)(8936002)(2906002)(478600001)(42866002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a0f771f-a411-48e8-e5c6-08d7d61e4fa8
X-MS-TrafficTypeDiagnostic: MWHPR02MB2606:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2606421E00BF93F0761EF07CC6C90@MWHPR02MB2606.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03607C04F0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFG7uP5R2GZlM21U1BS/oBfmPyds3QRU/Z2dO4InYNvpwo4/kQzpAJmB7+FzbxQaLTTs7vw1TJz6Fw/Np9Tjhv7nQeVmQqhz7KtLSfNCUOod00Q0974/mRyalCsn7Pn/iANnUH6/sIs5qXGN7dzL250nVgBc6/Sh7EhE8Dm5HTvqQmjQ0YMLNnrONJq9OAoutvn1w+IhjwZ1LlYpXDgNXEx1JucdxAF8DLZWeqGmOuJMK9CvsSbHST1KlUeX9FevyqNBzPSu7yXcZqGcF5U5/WozYIKgxOE/3Cc/zD2UO911lxUpGy2YdaGvOw6sKEqkB/0UbPifBjLjxBMlTd8x32Fi+fOnLBovuutEF+lCEjhzuwzP1bM9yC9PgZbvxOzcjVWxqw6n85Is9YUVHbYhjGvMVB9ikJ+7ZsViHgiV9X6cRKRdTLEkPdJkZwSZWKUeXuMuSJGPNVhykop5hhagzNPApdjCoMT8tbNjBRJErU5lBShPe7PXx3I7PUPZyp/K+HFpMCwUOReB0tPU+8eQ4jTVDdKT9KUs5+50NGXDluvQqhsKcIImJMnvpq+09LvRxzaBn/SoQD7V8w3EaSrKvCRwxr9/IJka0L4/84eeO2MazrRE71VixBVgYJt6Fbhl
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 09:23:16.9956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f771f-a411-48e8-e5c6-08d7d61e4fa8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2606
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob and others,

for couple of years already u-boot is using config node in root DT for
u-boot configuration.

Here is one example in u-boot source code.
https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47

And here is dt binding description
https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt

I was checking dt binding specification and there no such a thing
described there. It means I expect this is more adhoc u-boot solution.
We have reached the point where could be beneficial to put some u-boot
specific configurations to DT.

Actually I have done similar thing some time ago too by using chosen
node and add xilinx specific property there to point to eeprom.
https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39

I think it is a time to discuss it and do it properly.

First of all my question is where we could list SW prefixes to make sure
that they are listed and everybody is aware about it. We have
vendor-prefixes and we should have a way to record also prefixes for sw
projects. U-Boot is using u-boot. Xen has file in the kernel with using
xen prefix. At least these two should be listed.


Next my question is what is the recommended way to pass sw specific
parameters via DT? I think using chosen node is more appropriate then
adhoc config node. Or is there a better way how this should be done?

Thanks,
Michal


