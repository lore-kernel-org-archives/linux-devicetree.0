Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4AEC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77A0A2073E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="acCjCaXO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgGFJs0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:26 -0400
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:40897
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727973AbgGFJsZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD6u3dofN886K4/biiPuTowCGCdint+dkMH9XZ3aJvDx83DtJm6R5WJZ33IVVOpFkfYdonPKUcZscwb+L/DbmEcm8VKfUKGYzvqTzUE90FqyZIrOvkTPaJzMOooGojdXxU5eL9NtKAR5iO6Si3DqLLSHdK95KFaqgAS+xCr1fkesv30d6Lbu6/4PAwIhqYXJjyfKZI2R6xLP7QsSbDyHxwfHtjztFWSkwvHqCWDUIyIn8Nh/O0YbrgpwghLscNcCA6VPehFWwaBMhN6B6jorp6HGRK+CizPV+xiFPhYSTTPGo76JsOSpU/EMAl/AjA/I1QvQQb5i1zr24wZ/8G9yZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kXDC+0Ag4Ui6l5XrVs8CEH/nL2OJ+Jw1VmgLloVCFE=;
 b=FP7mc4K43v/zl4F4Oc8SSdETJ/SpBnXOCtDADAqgXiWmJSGXN08YpnWuilPmkWX/DXy6US0qadUzhODTgYqmZ1MKerdELS4WyzpcKutKE2sqBEBDLNEs9Rz0gnk55XWHkoLG1KXPFJ8buOQewG8zqPiWsM6YkLl/uqVz2q/ROvyMsv6gRdC8FiHC79O+Bw2nDyyfircUSNXzcgJ+Z7gr35tC4uGY32yx6bXBzOY/bxXXc+vL9h+ipqDnTOK+fzwXRqvGpGVRqTuG2mejQT+LOdcmSxNTnPyobfFIQE5Yt4lCefp5JmFtzFopge4XheqSB2IguqRjR5jGXuQBwn+M6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kXDC+0Ag4Ui6l5XrVs8CEH/nL2OJ+Jw1VmgLloVCFE=;
 b=acCjCaXOSe/H2X9eKh9XIWlHqODDt0K+cTKJoO6qN9zy5ILW5Fo63gVDTjf8xPo97QMSA5REXE7cKeQddOsEwQSSH1lmfXbBkP+UXUGc2RlxE0XYP+8jYiO00BXh9OVtZf8x9/ROATHtpwHNd0hFXxnEax+aec9NLiUX2R2EdTg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:21 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:21 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 3/5] arm64: dtsi: imx8mp: add usb nodes
Date:   Mon,  6 Jul 2020 17:44:57 +0800
Message-Id: <1594028699-1055-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:16 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fdacbfe-47be-4d9e-c723-08d82191b7a5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3520A2F13A914B2CD6BC598E89690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEqB7FV3ezhtuVRfGMQ1DXh5wBnRUcvnh3pIFpNVANgzRJlg0pYLbio1UbCyGeguHs/we1dKej/QEZiUNwvLH4mK4YSIapSa5d/UTVSZ4wm0Ge4bNXwdX99Ygsrf0JfW2WWno7jkn22nnD0BtggDBug6GLT1PJT1jOurpm+wDiwXucl+55+byuAilV/2YX3zJKe0T1n5sylE9Uslg0nP7SFkRULZ+dPrRQvc23WWLLColPC51tO/NsEnO/iQF1g+EfDUVLOiPyT9LG/7i42Ea+rt+N5rVdHnswgCIVODENTFT8DEROe1IbtdFCUs2WWRh2ObCCl7RuPabq+5T9W8zEDtlh1Lip1xmI2kzx8Nam2dVY3+YNRRRr/2VO7k8+bd+FgpAmvesrlYYXW99E0ugbTLjtpeavRNYUh1xwx0o8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(83380400001)(478600001)(5660300002)(36756003)(316002)(7416002)(6666004)(6486002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Vy9oZInww7FZJrwX8bu4jJz8RQqEdjXfF0Ta/GVwHgyT4FA0Tt7txXIqWCOmcDvUw4vIvkYI2Bs4Lk5k9OinG0RL4WJkABxERNdXHhFqiqofnkdetB6hQWCXpBAaS3KFWcTCu52pYkA05B5Bu9wbYGL+H9bPEjZmcf1J++KO47YbjL09LGHoOc07ySQJEgmbdAkthwimZTIk5iqWaOwM0Lj0n3H5Z0l1eZI+NRkj7aAMgjYp11BUQrRspAL85KnqpBgRyUNpF7A0sbvdzG1wdgzNxzZfmQaPhI9nivqZbphix4isMpDB3CbxlpxjOWT2VRAj482Vbe8lIlxZ8wyRYFP9Z78ljEk43BRL+xQNkNsuhNZ+Z6WpLpgYHLhkXzFD/PCJpcYAprCuSiiAALct9e9fFGVRe93FujC/89sTfLMgEZRzKpCEQhWhU+IlGYTizTTgGq49XZHyVTYx2agXpZL8WPo9BV/O9zrHPdVLy4k=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdacbfe-47be-4d9e-c723-08d82191b7a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:20.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0AINcdysME8qWsOGXDfw/yBJljoacgDfwOmsv1Ay2GywbU05wuEgYqIwnFAk4yn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

imx8mp integrates 2 identical dwc3 based USB3 controllers and
Synopsys phys, each instance has additional wakeup logic to
support low powe mode, so the glue layer need a node with dwc3
core sub node.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b1616e..f3d671f5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -650,5 +650,82 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
 		};
+
+		usb3_phy0: usb-phy@381f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x381f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_0: usb@32f10100 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10100 0x8>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "bus", "suspend";
+			assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+			assigned-clock-rates = <500000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_0: dwc3@38100000 {
+				compatible = "snps,dwc3";
+				reg = <0x38100000 0x10000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u2-freeclk-exists-quirk;
+				status = "disabled";
+			};
+
+		};
+
+		usb3_phy1: usb-phy@382f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x382f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_1: usb@32f10108 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10108 0x8>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "bus", "suspend";
+			assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+			assigned-clock-rates = <500000000>;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_1: dwc3@38200000 {
+				compatible = "snps,dwc3";
+				reg = <0x38200000 0x10000>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u2-freeclk-exists-quirk;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
2.7.4

