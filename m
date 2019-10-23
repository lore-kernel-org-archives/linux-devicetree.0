Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6FCCA9EB9
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04106214B2
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="n+Ks37WW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfJWMbE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:31:04 -0400
Received: from mail-eopbgr820043.outbound.protection.outlook.com ([40.107.82.43]:10467
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388581AbfJWMbE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 23 Oct 2019 08:31:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiXVSzu5p628q3d4LoB5lt+7UMJ/r8krpDwbQq+L6qJn9q771j7h9WUC8j93DD5TqZTXStU6IiEc3Vf+bwMTj0CTzinXZCn67+S3whMoD8g8N9H8BcCGHZmhVDsfVr8JKw5TTaHUz5DF9AYQmgMSNB8p0iYYvWUT2iV6U0+AC6o+DmQx25XduXTWmCNv5tjG+YvbWFB9Jkwul8QUKEvn/KPr2RakUjT9UVLmqpMLGN/bMPoQFHJxQK3S/DtHLpGZ/HtfgpDzrUVJ3V8EWGnN9UVWfy+LrA34MJ8v5C9HKgitKiojqQlSSKnkrtFw1XHeI3tzp6eC+mnCH6dKDEvrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG7mGGC1LWeIC+rwAuixXF0+0jcGsYtDGmbMWPtjiD8=;
 b=PghvMu/q8MY/uZIxMqzbsjGhqApunuwScc4Y7VvbDPCUFr7b16sKZJAfa2KpG47fm8Chc4zUaBEJEWGe9x6u4Mk25s3+SYCZnchiKkw4iQciyk1ECTrKio431ZtGKqUfyoNMApLCr8aoAK979wShPI58okwM5LaN1Y+4ALrbPB5xkALH27bA20eK5UIzeTtYKuSsK0R1RfY0VTu2j3ZT02CPbU/xYdmZHKEGFKr4Cb9c8YEYWyDU9O6FtHARV1DCuctEoB0ri3ZFhZCBrgKXE6JiPcPkhz3RPh2i0DIL6NTznGROnYra9lCL4oz127jAzgiO/BQxjSoM6ytTRcwdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG7mGGC1LWeIC+rwAuixXF0+0jcGsYtDGmbMWPtjiD8=;
 b=n+Ks37WWWLDmlVJQQ7lqEnSDG49suQsytka/hMm+tdhXoL7sWmDR+N5dSspSvEqmRVfbO9cQ/IJieWKNW4E8rjp4ZSvbqW4guOizJw3zM/xaLhwkZBxJhx5dS9Ke6iYiaZ/Dvse3ZVVhVXaND5LYX1WgbznjzmQZBNDeViUmAMM=
Received: from MWHPR02CA0001.namprd02.prod.outlook.com (2603:10b6:300:4b::11)
 by SN6PR02MB4944.namprd02.prod.outlook.com (2603:10b6:805:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Wed, 23 Oct
 2019 12:31:01 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by MWHPR02CA0001.outlook.office365.com
 (2603:10b6:300:4b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22 via Frontend
 Transport; Wed, 23 Oct 2019 12:31:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Wed, 23 Oct 2019 12:31:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iNFn1-00066h-Va; Wed, 23 Oct 2019 05:30:59 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iNFmw-0004g7-SE; Wed, 23 Oct 2019 05:30:54 -0700
Received: from [172.30.17.123]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iNFmn-0004cf-KH; Wed, 23 Oct 2019 05:30:45 -0700
Subject: Re: [PATCH 0/5] arm64: zynqmp: add firmware device tree node
To:     Michael Tretter <m.tretter@pengutronix.de>, robh+dt@kernel.org,
        mark.rutland@arm.com, michal.simek@xilinx.com,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
References: <20191018160735.15658-1-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <b67d4720-db85-8168-4831-d47a9f3234f4@xilinx.com>
Date:   Wed, 23 Oct 2019 14:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018160735.15658-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(186003)(230700001)(5660300002)(23676004)(65956001)(65806001)(26005)(966005)(31686004)(305945005)(9786002)(2486003)(478600001)(36386004)(6246003)(31696002)(476003)(229853002)(356004)(76176011)(316002)(8936002)(70586007)(11346002)(336012)(8676002)(106002)(126002)(486006)(81166006)(426003)(47776003)(50466002)(58126008)(2906002)(2616005)(70206006)(446003)(81156014)(36756003)(14444005)(6306002)(44832011)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4944;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2f6162e-5c1e-4804-48d5-08d757b4dccb
X-MS-TrafficTypeDiagnostic: SN6PR02MB4944:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <SN6PR02MB4944A1B541B9380FFAF1A7DBC66B0@SN6PR02MB4944.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 019919A9E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZc54PjHUiAU2f9q/Zoq8ltqWCuRCE0zeu6umW+XlDcWMRRk+NCpHYd5K28pBUbIac+39fhaeoipVtcLqAwe52yo6QlfPSHrmJVS8cPG5zpsOIRliXyEkITzlxfNZHFrK/bSVITDRFcPwv9SQfQXRJGvYLStIJKPRrsdZPO342958733hORcuX+cZB8iw+Hzf5wuwkOa/yUPeD99fDBhtDEMhSZf/DENpr1Knbz2sCBwg1KRmGpNwdEp9y1acPYB1Ygy0O3lfLW5mDHaliJf0ipK0IvXSTvzeGZXHKfSLHJtO0pdsNBxB1gEF8IVVwywuIgC+IsmNJDpdW/Pw5aMJJJ7xWNh0GeaWd2BIvqwVSS++ofGej98lNIwBLiQ1iTBsfzTe2DwulozCO/edRs4jXHJy3AhzGmfgRyhvhx5gA+zYoZoyX8usQvsi2V/ltfTGj8/ECkOuyhLrSaZhMCdakA8TlfRpGhi3ogee9WEWQc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 12:31:00.4833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f6162e-5c1e-4804-48d5-08d757b4dccb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4944
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 18. 10. 19 18:07, Michael Tretter wrote:
> Hi,
> 
> this patch series adds the device tree node for the ZynqMP PMU firmware and
> the subnodes for the pcap fpga loader and the efuses to the ZynqMP device
> tree. While the bindings have been mainlined, the actual device tree nodes
> were never added to mainline, but were left in the Xilinx downstream
> repository [0].
> 
> I cherry-picked the patches from the downstream repo and slightly adjusted
> them to the mainlined device tree bindings to be able to actually use the
> devices with the mainline kernel and device tree.
> 
> Michael
> 
> [0] https://github.com/Xilinx/linux-xlnx
> 
> Durga Challa (1):
>   arm64: zynqmp: Add data cells to access efuse
> 
> Nava kishore Manne (3):
>   arm64: zynqmp: Add support for zynqmp fpga manager
>   arm64: zynqmp: Label whole PL part as fpga_full region
>   arm64: zynqmp: Add support for zynqmp nvmem firmware driver
> 
> Rajan Vaja (1):
>   arm64: zynqmp: Add firmware DT node
> 
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 77 ++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

Applied 1-4.

Thanks,
Michal
