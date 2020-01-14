Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C42CC33CB1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 237E024672
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="sdHI1k6e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgANMSW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 07:18:22 -0500
Received: from mail-eopbgr700053.outbound.protection.outlook.com ([40.107.70.53]:37217
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbgANMSW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jan 2020 07:18:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFx7aFvEV2oNPQuc7NA5iJ+gGkQLi/GStdvP8iPA3uIRsYOTNzCMokPJ1Y8mIHMPNrd8wHL08fpuwbnI9rU4KEoOnm2R678dYI4DzerT026XnZ3Z2ZPwUD4ayO4hGKR4gA3QGf7NUym9PWbgkKYqT5TRna14hPLDqUtgpgEL+P/RuYKsADzMg/iSUlLEMW43wQH0oJx7BWcxLSXJiA5sTYFZekYI1RyuIa/Y6ukzqudOfxKfRM8wab4gdv+kHhCWh6tiQONuzTh/o0vLueu4yUOveSQ0ql7PboXfeLFodmLdZYsOQi+hLC82OvDL4dMsP9GLDNlvJw7/5dK2cgUOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKWIGmY+3NKPno9NHxRmdw0Abp3+mkdgPRVhy2UEog=;
 b=eaiUsQJ1ihceDQ1ODLxGVrR3PpeSXIPFtbNX3YluFeF7khb3lzC70o624tttIMsAm007pyf3EdAEia9EylWtm3wLER1lEKGmd16PJc7Q/ri5h6Epl7t022lPCLuHAJSg4cPWQ8BcUA8bri2PviUfEaj8mdqGcNaE6Apas7WdKlpelqijPv/U5X/Xr00JTFHf4QTgXoUbPfflMn/HBR4qPlygo7NvVVRudSBHoxKTE9j7q6KUu7RKB4I1iP88sb8WVv829RF2tJ4x1DTnTBw3+T/pUh8/9ES2+vkAARp5N9if2LJSneNVrSgi8vwMtRpLsQ6UbBTReTnKpBmm/lHvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=hazent.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKWIGmY+3NKPno9NHxRmdw0Abp3+mkdgPRVhy2UEog=;
 b=sdHI1k6ediwatjgrUc6PGe5VWuC9rxuRVZMEOaIiHrCccK47qZt/hpVndVfRcUbElo7ceVtp0+9kEOvbDNZUTzYAUtKroKtGut3kM4z73VEIKkgGR9UNh3UTEGHBpXA3pjhKeOn4hwdEH2B6SiWTyVO+p8eg7dZymrIYnYMMZE0=
Received: from BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32)
 by MWHPR0201MB3513.namprd02.prod.outlook.com (2603:10b6:301:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13; Tue, 14 Jan
 2020 12:18:17 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by BYAPR02CA0055.outlook.office365.com
 (2603:10b6:a03:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15 via Frontend
 Transport; Tue, 14 Jan 2020 12:18:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; hazent.com; dkim=none (message not signed)
 header.d=none;hazent.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Tue, 14 Jan 2020 12:18:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1irL9E-0008E4-Dw; Tue, 14 Jan 2020 04:18:16 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1irL99-00062L-AF; Tue, 14 Jan 2020 04:18:11 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00ECI4eT005870;
        Tue, 14 Jan 2020 04:18:04 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1irL91-0005zf-VQ; Tue, 14 Jan 2020 04:18:04 -0800
Subject: Re: [PATCH] ARM: zynq: add flash memory interfaces, Xilinx efuse and
 missing clocks
To:     Alvaro Gamez Machado <alvaro.gamez@hazent.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200114120024.19779-1-alvaro.gamez@hazent.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <55db7dc3-ca06-4b01-417d-0b6869cb475a@xilinx.com>
Date:   Tue, 14 Jan 2020 13:18:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114120024.19779-1-alvaro.gamez@hazent.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(199004)(189003)(31686004)(36756003)(336012)(31696002)(70586007)(478600001)(26005)(8676002)(81166006)(81156014)(9786002)(316002)(110136005)(44832011)(2906002)(2616005)(5660300002)(6666004)(426003)(356004)(186003)(8936002)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR0201MB3513;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe27c1e6-da8a-4b4c-afe3-08d798ebd5e7
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3513:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB351353390448A7028764D9D7C6340@MWHPR0201MB3513.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 028256169F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWDJtKG+d45vWJpljnh6AZQiG8CyB/qm+9YGe5nkWWNE7icGDrZLz3+DYodR2p0AgVu+44YAU9I54lReVthY1EBf12xYnI7kkPWRAJ75UAa53Jxqlz0R0YPQ7gn4hFZUZncyF+9TQ06fiX3t5/40S82nmU+t2HQxJ2TbLCrQj4yaesHg335lXlXRF6KN0wVUeiA1d2Srv8JKIa6qsBTUEggg9n05vhPlOllojUnbXy/0kFXiTfS2rsUeNaEt/0elTNwGghicPx2gd7GECdpTaF6sTAK5hFeTD1jFK6tIfmPnKATwBJGVBT9uvBf2dYGQDY9NKr3GlOz7V+EH6GUPm2hfR3bbDw1bmrPz/0Mz0cGJ6mVipv0N6q/Hnf3Yabq5yYUbWRPMio5LwhpsjvaXqWzd2NCQ9IGhGNMIv9sXLen+DlBdB/Uhk5zD3iZ+U0Cj
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2020 12:18:16.8200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe27c1e6-da8a-4b4c-afe3-08d798ebd5e7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3513
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Alvaro,

here is missing description.

On 14. 01. 20 13:00, Alvaro Gamez Machado wrote:
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 50 ++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index ca6425ad794c..8358315d7803 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -197,6 +197,45 @@ spi1: spi@e0007000 {
>  			#size-cells = <0>;
>  		};
>  
> +		qspi: spi@e000d000 {
> +			clock-names = "ref_clk", "pclk";
> +			clocks = <&clkc 10>, <&clkc 43>;
> +			compatible = "xlnx,zynq-qspi-1.0";
> +			status = "disabled";
> +			interrupt-parent = <&intc>;
> +			interrupts = <0 19 4>;
> +			reg = <0xe000d000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		smcc: memory-controller@e000e000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +			clock-names = "memclk", "apb_pclk";
> +			clocks = <&clkc 11>, <&clkc 44>;
> +			compatible = "arm,pl353-smc-r2p1", "arm,primecell";
> +			interrupt-parent = <&intc>;
> +			interrupts = <0 18 4>;
> +			ranges ;
> +			reg = <0xe000e000 0x1000>;
> +			nand0: flash@e1000000 {
> +				status = "disabled";
> +				compatible = "arm,pl353-nand-r2p1";

note: Driver is not in mainline but dt binding has been reviewed already.

> +				reg = <0xe1000000 0x1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +			};
> +			nor0: flash@e2000000 {
> +				status = "disabled";
> +				compatible = "cfi-flash";
> +				reg = <0xe2000000 0x2000000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +			};
> +		};
> +
>  		gem0: ethernet@e000b000 {
>  			compatible = "cdns,zynq-gem", "cdns,gem";
>  			reg = <0xe000b000 0x1000>;
> @@ -297,14 +336,19 @@ dmac_s: dmac@f8003000 {
>  
>  		devcfg: devcfg@f8007000 {
>  			compatible = "xlnx,zynq-devcfg-1.0";
> -			reg = <0xf8007000 0x100>;
>  			interrupt-parent = <&intc>;
>  			interrupts = <0 8 4>;
> -			clocks = <&clkc 12>;
> -			clock-names = "ref_clk";
> +			reg = <0xf8007000 0x100>;
> +			clocks = <&clkc 12>, <&clkc 15>, <&clkc 16>, <&clkc 17>, <&clkc 18>;
> +			clock-names = "ref_clk", "fclk0", "fclk1", "fclk2", "fclk3";

This is not the part of dt binding.

>  			syscon = <&slcr>;
>  		};
>  
> +		efuse: efuse@f800d000 {
> +			compatible = "xlnx,zynq-efuse";
> +			reg = <0xf800d000 0x20>;
> +		};

ditto.

> +
>  		global_timer: timer@f8f00200 {
>  			compatible = "arm,cortex-a9-global-timer";
>  			reg = <0xf8f00200 0x20>;
> 


Thanks,
Michal
