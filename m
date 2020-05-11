Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514D2C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 12:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18FFF208CA
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 12:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="tdnZIujI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgEKMxL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 08:53:11 -0400
Received: from mail-eopbgr690068.outbound.protection.outlook.com ([40.107.69.68]:54493
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726891AbgEKMxL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 08:53:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjWZ0jJCfrA+NECWGshNHnMx7sflrch0VeFR1+IP8gr1rp8/bM0ASo0B9fH6Mtx5zCl2SJMc+A8S8Ud0ADrEtxg96peHsRM7qZu9EaP/ntNm7ixg7CxWmJNNomFy54EvT7HYLkneLvrYUXAqt7KKDggtewdGjhhqmauhDkW4RqvAPE/ufiNQzgN+rlTrMlmjDzsdC+zO3g/vE5dcv0J3dNtGYmJblyTfkKtL3WattcakMJzimO01tEILd0VnMtWYcLN4EZDhDvoLysxLCOSD5fR4THzktrRS3cdIqJ/+E74xiMgTtJf3l/eO4zZA7MJFsPHxaMCm/24y1I2th28TQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzKrZlEB3SW3jYqgBUXJjeyJzaabF1yCPC9N4YjsQ60=;
 b=deVJO9LtqZsHltgu+z4d4xAYoQ/GZu7n4S06U/QgqwA0aELFbRPPVGtsA7pqfsDBz33PZcgI7svsZmq5G2cIY7KBhrWfeyT5IFDe0PNbAma8cOHIFiwJroTrmw93ECf0+JYMspmHD9kV7BQbfoJlTVJ1egzXHNdg5HIb6gIAxABEVNvCNct4vNP06iRUhjwVyC0IAIT5BnY1v0EAeteaAgt75MEmoBadFwiZFkIvObnBQdh7kgisc6XhrRDeCLTsSpXkEEEE9zdZxqLrb4sr87tGW/Iy94QmP5p8tIAztUc3C1yoMUGlssVWOAuD19AYMg4UZOpUgK8U5g6mhX4xRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=collabora.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzKrZlEB3SW3jYqgBUXJjeyJzaabF1yCPC9N4YjsQ60=;
 b=tdnZIujIZXDk6woNNNLArqbyPl3oLJMx61i8zXdL2LG7qyWADswB2UCXY6M+DgOXWVcnxRRHeyPhxmaSnTYwiVXMLfO54xIjc5Lh9VnuWjeV9bI7mvvtGKVG1CU/JeCNIwlIWyNKm+LY28fYer48XFqMJz92WHxzMgIPLbjeWt8=
Received: from SN6PR05CA0022.namprd05.prod.outlook.com (2603:10b6:805:de::35)
 by DM5PR02MB3385.namprd02.prod.outlook.com (2603:10b6:4:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Mon, 11 May
 2020 12:53:04 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:de:cafe::cd) by SN6PR05CA0022.outlook.office365.com
 (2603:10b6:805:de::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Mon, 11 May 2020 12:53:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Mon, 11 May 2020 12:53:04
 +0000
Received: from [149.199.38.66] (port=53576 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jY7vN-0003sv-5A; Mon, 11 May 2020 05:52:49 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jY7vc-0007FL-2D; Mon, 11 May 2020 05:53:04 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04BCqrgR008129;
        Mon, 11 May 2020 05:52:53 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jY7vR-0007Bj-4N; Mon, 11 May 2020 05:52:53 -0700
Subject: Re: [PATCH v2 3/6] ARM: dts: zynq: add port definitions to hdmi-tx@39
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com,
        =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-4-ricardo.canuelo@collabora.com>
 <28fa96d51523448656c71656dc80177d08c481ed.camel@collabora.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <9d3a0eea-578d-3138-f386-a3f47fed4233@xilinx.com>
Date:   Mon, 11 May 2020 14:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <28fa96d51523448656c71656dc80177d08c481ed.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(396003)(39860400002)(346002)(376002)(46966005)(33430700001)(356005)(81166007)(110136005)(5660300002)(2616005)(31686004)(54906003)(31696002)(44832011)(70586007)(8676002)(82740400003)(9786002)(82310400002)(336012)(47076004)(426003)(478600001)(70206006)(4326008)(316002)(26005)(186003)(2906002)(36756003)(33440700001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2bf8b1-ac9c-4d6f-9f09-08d7f5aa3ee3
X-MS-TrafficTypeDiagnostic: DM5PR02MB3385:
X-Microsoft-Antispam-PRVS: <DM5PR02MB33853636F7E1B4D114C3622BC6A10@DM5PR02MB3385.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73GYutVjEqWfECQinwIFGhFUkamUkZ5u8skiNLLMKLuKzy4wkCI9uGe7kvqrgdbU3MSw0BmLy76WXjGBxsISFnTZ5FNqO5u9pat5H8N9UccgSXKotsg0CoGoV2duhCG6W51zBb9DpjwFYD8b0AfzUSDgooBvfIImsVGuxnfPzfg4vvpZVKCtBqhDwb80FNMapz3K29KCkF1/IUoTGMVHr75wRkgb6eehvxGeWMOK7A+buAnePaitIkdcQ1KYVx/Dpf3lRlsuJ8URAUHf+qg3We/Ht1kMWgiN8KiTehv0ElhYWc68lN0V/b+Tbugs/bfOeaZMn+7q2P8nFKNrf6MLMRKNdTfOx4ceFTzC98p1c4zqZKJRwflzbgUc/tbprilzsYzhFTu/4MgpSm3skxB8MDD5nJ5ZxRcs7Vuw2x7Y/v1xx7yhS/LdzSqxz8ZcZVzpZMs+LspWVn98x1DtlcJ+Wp6LVH9QoVEiF/IJBSVA0iOAAKUe1ui4qN6UD8o2mWpNrQaTUvMwC+jKexpYNvnkQDs5kQqOYy9CyRVmkjf1yqhtMwXgV7HS2Nq4bz2aRGTk4dRETSpbH2m186ngSHZb26+KgLXU7nqJ6cSdb7HtMd0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 12:53:04.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2bf8b1-ac9c-4d6f-9f09-08d7f5aa3ee3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3385
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11. 05. 20 14:24, Ezequiel Garcia wrote:
> (Adding Michal)
> 
> On Mon, 2020-05-11 at 13:06 +0200, Ricardo Cañuelo wrote:
>> Define a 'ports' node for 'adv7511: hdmi-tx@39' to make it compliant with
>> the adi,adv7511 DT binding.
>>
>> This fills the minimum requirements to meet the binding requirements,
>> remote endpoints are not defined.
>>
>> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
>> ---
>>  arch/arm/boot/dts/zynq-zc702.dts | 10 ++++++++++
>>  arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
>> index 27cd6cb52f1b..79fd236edded 100644
>> --- a/arch/arm/boot/dts/zynq-zc702.dts
>> +++ b/arch/arm/boot/dts/zynq-zc702.dts
>> @@ -135,6 +135,16 @@
>>  				adi,input-clock = "1x";
>>  				adi,input-style = <3>;
>>  				adi,input-justification = "right";
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					port@0 {
>> +						reg = <0>;
>> +					};
>> +					port@1 {
>> +						reg = <1>;
>> +					};
>> +				};
>>  			};
>>  		};
>>  
>> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
>> index 77943c16d33f..99fa51ba6e93 100644
>> --- a/arch/arm/boot/dts/zynq-zc706.dts
>> +++ b/arch/arm/boot/dts/zynq-zc706.dts
>> @@ -93,6 +93,16 @@
>>  				adi,input-clock = "1x";
>>  				adi,input-style = <3>;
>>  				adi,input-justification = "evenly";
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					port@0 {
>> +						reg = <0>;
>> +					};
>> +					port@1 {
>> +						reg = <1>;
>> +					};
>> +				};
>>  			};
>>  		};
>>  
>> -- 
>> 2.18.0
>>
>>
> 
> 

Just c&p Laurent's reply to Ricardo about it.

"Completing the board definition is best I believe. Sometimes the
endpoint is related to an add-on board that isn't described as part of
the base DTS. The ports are required as they describe hardware
interfaces, but having no endpoint in a port shouldn't be a problem, it
just means the port is not connected."

I am ok with it too that's why

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michalt
