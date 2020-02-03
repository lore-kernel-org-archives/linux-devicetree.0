Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696ECC33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 07:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F28D20661
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 07:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="ONT5+AII"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgBCHMj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 02:12:39 -0500
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com ([40.107.92.43]:6109
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726369AbgBCHMj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 3 Feb 2020 02:12:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtFPUJoxqB7oI6EyGf8IjvuppqVhCuVMV5F50R3BTpJvupeYYqm1bD+Sb3UoDPZOPIlWtC1sLo7CwYTv4np7LggV/WuVDt6GXLcpS/70P6RrxT2phj0fK/QQE4I+To7U9B8i2RY+/NUF2gSj5E4zuOQj7AMmj7QYPiK5wd/cOQn53grKIq8qpjwQqElZBGDo7lHT9MXdmHoEkzfLZQ3U0L3k5SF0U2Ww7J+hwHOuhZin0ZSfxcDM5JO+pHLrtQOxj8ygIscYMyxSjRYPWf+DZpbpWhS7DgNkEx83VK7mktvoM5XkWQHAtMRffEYaqoiW5tWganzGPz0r52WALR2oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXwTYmDjA6rFh4sAxinwBSnvx4rWZdeoiVWDAEtXkK8=;
 b=kGqNmk3wq2Ngvqv5NHojtUuWjS3/aK3tNPJdyq397XLR7abt1Uu8mMgMq1NNGdeIXwyRQwTNw+ja/Y00WsKzKq1wzxWmt8DPLVWgWz5llA9Qw/98MxzNFHhx3JJKmESr6St+htB3oOJR22N5cq1jBYj22DV8VOFNrdtdTAq8nVXLbW4t/3zEqBo0Afo9PLQbk1Rdu795TH+LJ38AM9fqgsl5Su1EIfDkdbBGQSz385nUiLoX3OhTJWTWWYehyLtMCN2Ppomf6E1ACrHszl7GPULMpE7e2FlElR/ce6CFwpxVeG/vsJKIft8Fbkt7K4vIbSAPlAd+Bxn106f40j+sCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=n7space.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXwTYmDjA6rFh4sAxinwBSnvx4rWZdeoiVWDAEtXkK8=;
 b=ONT5+AII1C4mwDnigH+YmKB9Vu5QPD7v2JnKpuUPoVrAy7DeKqu0h4ZnHSRGjYou72ibxV1SuU5ZLd1e60/gmdTcxG+qT+felsfp9BjkvyRnyXIdIz19p5cbeuhGhHOWSOB1z55bTrw/l2Pf33Y2RlKwVkJb7n2I5nP9VnzM8hg=
Received: from DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36)
 by SN6PR02MB5039.namprd02.prod.outlook.com (2603:10b6:805:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.27; Mon, 3 Feb
 2020 07:12:32 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by DM6PR02CA0059.outlook.office365.com
 (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.29 via Frontend
 Transport; Mon, 3 Feb 2020 07:12:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; n7space.com; dkim=none (message not signed)
 header.d=none;n7space.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2686.25
 via Frontend Transport; Mon, 3 Feb 2020 07:12:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iyVuI-0000fu-EY; Sun, 02 Feb 2020 23:12:30 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iyVuD-0004is-BV; Sun, 02 Feb 2020 23:12:25 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iyVu6-0004hc-Ie; Sun, 02 Feb 2020 23:12:18 -0800
Subject: Re: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
To:     =?UTF-8?Q?Wojciech_=c5=bbmuda?= <wzmuda@n7space.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "antoine.tenart@bootlin.com" <antoine.tenart@bootlin.com>,
        "t-kristo@ti.com" <t-kristo@ti.com>,
        "rajan.vaja@xilinx.com" <rajan.vaja@xilinx.com>,
        Krzysztof Pilch <kpilch@n7space.com>,
        Michal Mosdorf <mmosdorf@n7space.com>,
        =?UTF-8?Q?Micha=c5=82_Kurowski?= <mkurowski@n7space.com>,
        Jolly Shah <jolly.shah@xilinx.com>
References: <20200130153613.20365-1-wzmuda@n7space.com>
 <20200130153613.20365-2-wzmuda@n7space.com> <20200131183637.GA26658@xps15>
 <CANLsYkxOLdMjFkjJSZ7Y1OLSCefb0fFiNVnaWyrgOUyDfWtweg@mail.gmail.com>
 <CDE42254-9963-4D2B-B762-032B8C947810@n7space.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <a108d3ee-0959-d5f2-ecc7-a301929412ec@xilinx.com>
Date:   Mon, 3 Feb 2020 08:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CDE42254-9963-4D2B-B762-032B8C947810@n7space.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(189003)(199004)(81166006)(66574012)(9786002)(107886003)(31696002)(2906002)(5660300002)(31686004)(70586007)(70206006)(54906003)(8936002)(110136005)(81156014)(316002)(4326008)(30864003)(8676002)(336012)(426003)(6666004)(356004)(7416002)(44832011)(186003)(36756003)(26005)(2616005)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB5039;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2936b1dd-eca2-491e-dc91-08d7a8786f69
X-MS-TrafficTypeDiagnostic: SN6PR02MB5039:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5039F279830F2C513CA8572BC6000@SN6PR02MB5039.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0302D4F392
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2N91DZiXn3Kt7XEklso1lmgMBT7b5MU4y7554wQL72usIz3fi3AjkJJyeSEb5ydqL0ZWzpA8zWM23AXaKCJYS/0Tf81JGAqXmTraq/JPXxuKcSnNcCRviEjOBgezbQvx4FJ1sesHqxMDBJBj/s8y/8nKX5jNXdejuDbyk2tUp6T4I2lv5xSVfkJCbBaz19iO5JcO9Lvby8wa4ZzSW8cSy7Ty6S1csjXQhfjz0pr1ZVMcMw3K/j167zLofpWxZ+qBJXHW7cRcq1IDur9rffPfG1H1cx5M3ywZ4R4Y2ugb+7A6jaIFx0k5jwnDr2/bcmibPdZHd8+5r1a9YRnown04wnYo24XIzSAC3l654bLiPcTeg5jPFZBOqyXfJpqONb8bjcmfyeyrva1ubepyOgsyakmqnT8cBuX3XlF10s9aS7hbpbnDj95E1QAgUH5XgMlI
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2020 07:12:31.1422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2936b1dd-eca2-491e-dc91-08d7a8786f69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5039
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 31. 01. 20 20:37, Wojciech Żmuda wrote:
> Hello Mathieu, thank you for quick review!
> Please see my responses inline
> 
> ﻿On 31/01/2020, 19:47, "Mathieu Poirier" <mathieu.poirier@linaro.org> wrote:
>> On Fri, 31 Jan 2020 at 11:36, Mathieu Poirier
>> <mathieu.poirier@linaro.org> wrote:
>>
>>> Hi Wojciech,
>>>
>>> On Thu, Jan 30, 2020 at 03:36:27PM +0000, Wojciech Żmuda wrote:
>>>> From: Wojciech Zmuda <wzmuda@n7space.com>
>>>>
>>>> Add nodes for the following CoreSight components:
>>>>  - ETMs for A53 cores
>>>>  - debug components for A53 cores
>>>>  - funnel gathering outputs from A53 ETMs and SoC-wide funnels
>>>>  - the only replicator
>>>>  - all TMCs: 4k ETF, 8k ETF and ETR
>>>>  - TPIU
>>>>
>>>> Signed-off-by: Wojciech Zmuda <wzmuda@n7space.com>
>>>> ---
>>>>  arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 +++++++++++++++++++++++
>>>>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
>>>>  2 files changed, 274 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
>>>> new file mode 100644
>>>> index 000000000000..8b7579ad89cc
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
>>>> @@ -0,0 +1,272 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +
>>>
>>> Looking at other Xilinx DT files there is no space between the SPDX identifier
>>> and the header of the file.
> 
> Ok, I'll remove the extra space.
> 
>>>
>>>> +/*
>>>> + * dtsi for Xilinx Ultrascale+ MPSoC CoreSight components
>>>> + *
>>>> + * Copyright (C) 2019-2020 N7 Space Sp. z o.o.
>>>> + *
>>>> + * Author: Wojciech Zmuda <wzmuda@n7space.com>
>>>> + *
>>>> + */
>>>> +/ {
>>>> +     etm0@fec40000 {
>>>> +             compatible = "arm,coresight-etm4x", "arm,primecell";
>>>> +             reg = <0 0xfec40000 0 0x1000>;
>>>> +             cpu = <&cpu0>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etm0_out_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel1_in_port0>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etm1@fed40000 {
>>>> +             compatible = "arm,coresight-etm4x", "arm,primecell";
>>>> +             reg = <0 0xfed40000 0 0x1000>;
>>>> +             cpu = <&cpu1>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etm1_out_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel1_in_port1>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etm2@fee40000 {
>>>> +             compatible = "arm,coresight-etm4x", "arm,primecell";
>>>> +             reg = <0 0xfee40000 0 0x1000>;
>>>> +             cpu = <&cpu2>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etm2_out_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel1_in_port2>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etm3@fef40000 {
>>>> +             compatible = "arm,coresight-etm4x", "arm,primecell";
>>>> +             reg = <0 0xfef40000 0 0x1000>;
>>>> +             cpu = <&cpu3>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etm3_out_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel1_in_port3>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     debug0@fec10000 {
>>>> +             compatible = "arm,coresight-cpu-debug", "arm,primecell";
>>>> +             reg = <0 0xfec10000 0 0x1000>;
>>>> +             cpu = <&cpu0>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +     };
>>>> +
>>>> +     debug1@fed10000 {
>>>> +             compatible = "arm,coresight-cpu-debug", "arm,primecell";
>>>> +             reg = <0 0xfed10000 0 0x1000>;
>>>> +             cpu = <&cpu1>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +     };
>>>> +
>>>> +     debug2@fee10000 {
>>>> +             compatible = "arm,coresight-cpu-debug", "arm,primecell";
>>>> +             reg = <0 0xfee10000 0 0x1000>;
>>>> +             cpu = <&cpu2>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +     };
>>>> +
>>>> +     debug3@fee10000 {
>>>> +             compatible = "arm,coresight-cpu-debug", "arm,primecell";
>>>> +             reg = <0 0xfef10000 0 0x1000>;
>>>> +             cpu = <&cpu3>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +     };
>>>> +
>>>> +     funnel1@fe920000 {
>>>> +             compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>>> +             reg = <0 0xfe920000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     #address-cells = <0x1>;
>>>> +                     #size-cells = <0x0>;
>>>> +                     port@0 {
>>>> +                             reg = <0x0>;
>>>> +                             funnel1_in_port0: endpoint {
>>>> +                                     remote-endpoint = <&etm0_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +                     port@1 {
>>>> +                             reg = <0x1>;
>>>> +                             funnel1_in_port1: endpoint {
>>>> +                                     remote-endpoint = <&etm1_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +                     port@2 {
>>>> +                             reg = <0x2>;
>>>> +                             funnel1_in_port2: endpoint {
>>>> +                                     remote-endpoint = <&etm2_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +                     port@3 {
>>>> +                             reg = <0x3>;
>>>> +                             funnel1_in_port3: endpoint {
>>>> +                                     remote-endpoint = <&etm3_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             funnel1_out_port0: endpoint {
>>>> +                                     remote-endpoint = <&etf1_in_port>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     funnel2@fe930000 {
>>>> +             compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>>>> +             reg = <0 0xfe930000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     #address-cells = <0x1>;
>>>> +                     #size-cells = <0x0>;
>>>> +                     port@2 {
>>>> +                             reg = <0x2>;
>>>> +                             funnel2_in_port2: endpoint {
>>>> +                                     remote-endpoint = <&etf1_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +                     // Funnel2 has another input port connected to
>>>> +                     // funnel0's output. Funnel0 gathers Cortex-R5 ETMs.
>>>
>>> C++ style comments.
>>>
> 
> Ok, I'll go with:
> /*
>  * Funnel2 has another input port connected to
>  * funnel0's output. Funnel0 gathers Cortex-R5 ETMs.
>  */
> 
>>>> +             };
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             funnel2_out_port0: endpoint {
>>>> +                                     remote-endpoint = <&etf2_in_port>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etf1@fe940000 {
>>>> +             compatible = "arm,coresight-tmc", "arm,primecell";
>>>> +             reg = <0 0xfe940000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     port {
>>>> +                             etf1_in_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel1_out_port0>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etf1_out_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel2_in_port2>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etf2@fe950000 {
>>>> +             compatible = "arm,coresight-tmc", "arm,primecell";
>>>> +             reg = <0 0xfe950000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     port {
>>>> +                             etf2_in_port: endpoint {
>>>> +                                     remote-endpoint = <&funnel2_out_port0>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +             out-ports {
>>>> +                     port {
>>>> +                             etf2_out_port: endpoint {
>>>> +                                     remote-endpoint =
>>>> +                                             <&replicator_in_port0>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     replicator {
>>>> +             compatible = "arm,coresight-static-replicator";
>>>> +             in-ports {
>>>> +                     port {
>>>> +                             replicator_in_port0: endpoint {
>>>> +                                     remote-endpoint = <&etf2_out_port>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +             out-ports {
>>>> +                     #address-cells = <0x1>;
>>>> +                     #size-cells = <0x0>;
>>>> +                     port@0 {
>>>> +                             reg = <0x0>;
>>>> +                             replicator_out_port0: endpoint {
>>>> +                                     remote-endpoint = <&etr_in_port>;
>>>> +                             };
>>>> +                     };
>>>> +                     port@1 {
>>>> +                             reg = <0x1>;
>>>> +                             replicator_out_port1: endpoint {
>>>> +                                     remote-endpoint = <&tpiu_in_port>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     etr@fe970000 {
>>>> +             compatible = "arm,coresight-tmc", "arm,primecell";
>>>> +             reg = <0 0xfe970000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     port {
>>>> +                             etr_in_port: endpoint {
>>>> +                                     remote-endpoint =
>>>> +                                             <&replicator_out_port0>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     tpiu@fe980000  {
>>>> +             compatible = "arm,coresight-tpiu", "arm,primecell";
>>>> +             reg = <0 0xfe980000 0 0x1000>;
>>>> +             clocks = <&clk100>;
>>>> +             clock-names = "apb_pclk";
>>>> +             in-ports {
>>>> +                     port {
>>>> +                             tpiu_in_port: endpoint {
>>>> +                                     remote-endpoint =
>>>> +                                             <&replicator_out_port1>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +};
>>>> +
>>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>>> index 3c731e73903a..ca0a6b9f4445 100644
>>>> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>>> @@ -12,6 +12,8 @@
>>>>   * the License, or (at your option) any later version.
>>>>   */
>>>  >
>>>> +#include "zynqmp-coresight.dtsi"
>>>> +
>>>
>>> Those bindings are correctly used.  If Michal doesn't mind the nit-picks I have
>>> highlighted above then
>>>
>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>
>>> Otherwise feel free to add my tag to your next revision, which I advise you to
>>> send out once v5.6-rc1 comes out.
> 
> Great, thanks. I'll keep an eye for v5.6-rc1.
> 
>>
>> I forgot...  How does power management work on this board?  Is the
>> power domain where the CS blocks are powered up by the FW?  And what
>> about state retention when processors go idle?  Should this be taken
>> care of in the drivers or is the PMIC properly handling low retention
>> states?  Failure to properly address both cases will likely hang the
>> board (at boot time of when processors are idled).
> 
> To be honest, I don't know. I use kernel with CPU idle permanently disabled, as was
> advised somewhere in CoreSight-related documents I found at the beginning of my
> experiments. It might've been a presentation from Linaro Connect, either yours or Leo's.
> I didn't do any extra steps to power CS blocks on, so I guess they're either powered on
> by default, or it's taken care of by either FSBL, U-boot or ATF. I use those three provided
> by Xilinx. I didn't experiment with vanilla U-boot or ATF.
> 
> Can you please suggest some experiments I in this matter? Would turning off CPU idle
> in kernel's config and tracing a migrating process be sufficient for such test?

Jolly: Can you please take a look how this block is powered and how
power stuff should be handled?

Thanks,
Michal

