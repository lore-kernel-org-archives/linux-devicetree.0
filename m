Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31236C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E00C2074F
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KW6lra3Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgGFJse (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:34 -0400
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:63758
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728734AbgGFJse (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJCwXibrgX1Qx6jJHyLiomouwrbtvtQqqsEugX4dYk0upA/Ihl3NVxT85VK/oUsitndV1iTqd18/B0mGLoqlHUiy9mPltz3wn2XcRb/31zjuehvtdpWrdjRjexF1uozqWJ4HskST6Nlpt2qd6u+jZV0tVMa7+3gZi1XAbGx0/SZ8ffpsrNgs5uviGonwucGL4R7LrFLcNiEwUM31YAU9UeH38hzO5nUTg24y8ikL1Fo67Gmd6KyD9wYNMhiP4JrKhhZZw+pDQLJDBUolccUim1rqwKjmRcmaz8mbr93yYcPrXx8BQ2ssv0CXnUj4TSwLp1QUxRTCAqS9/stFFlVrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb2iSjwpZHYsE3KCI9+2iTK60OIDs5FkpAvv2TiiRBk=;
 b=AKfiJZoEwP2HMA4HJVC2TD1lBcdKFJcmbEt5dvCWl+aUFmmFbJoW8Xo+lx/YAcPbejost68s9iG2I2rq055sDNIjBMca5uMWPJnS9n/wbBssGmYJd61JRQw57KbuMaSxHslwCLOjyNDf6+yqeTDW9mm/k4F/qys/IxLdhkRNm6px6W9qbisxKsrGlfg8L0xjBGFrQWUA5lxbNzjINIwROF7HFdL9aDAG/nPk5AN+LJh6yq+W1LeLlcNatUsgGEPtX6yKb7+vJayzzxbg5kCGix4HCmEGjGZPGYWcLYrNWoIFxaU8wkd1TkM7q6rDeRPMGQHuW/1va7Hkm6RYGHF+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb2iSjwpZHYsE3KCI9+2iTK60OIDs5FkpAvv2TiiRBk=;
 b=KW6lra3QMc59B/a6GviklcFi601VXhL/Mz044QIJjyMAd4l7ggMtp4SH2zNOBaMLnyFWCg16+fqJPnL0EDNwpixamTGufp38MIJJDjqgjpZ8QRH3r16Kz5pAGXYjtxn4HWaTPzLx+29XJPRGJLzKbKddSZXX5f9AvgXqhhNUeuc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:30 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:30 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 5/5] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
Date:   Mon,  6 Jul 2020 17:44:59 +0800
Message-Id: <1594028699-1055-6-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:25 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56ff15da-294a-4634-737a-08d82191bd17
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB352081D7B33478684410CF8889690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VG8ImI89S1WlgUNHvMQQarfkI9J+zqxv3nH4/210lMJxYUThknksleoF8m7bt8DWPD3oLDPW3KSHvq/OqLYOsITohKQPxEztLOtziFnVBPEGHczLRw8gpz86302Bz8eahri1K8jJnV1KbO0nm7GlIdItlsIy7wgUZRbGerrRegEgwS5UsK0X5MgtMC4i7Zrd3Cme9PAqH7Z2Y2IRHGttFSNQT9tA06zKSzxpFtaRnPLDybJPnH6/upG6gZpyzuLvFTeF+mbAvBaTVHNGZca5mBK5kzOMIH4o35S18ZQJn9mdfqyXrUuiCb7ZdVfDEtC/I6BiLjLCRflGbFwrAt9BknIkNUZ7JJ7irrRts5Ik+pEbagsfl6gpVjvy1I/zBzfrU91pKT+eOwEm48rYbVrq+IKXagjDq4wjiil2Yip52UWyuwvtSzc0ZSt+RgrEwvTOFkn4nIkcAh1+1mgbhxExAsSSBq+umJjeCGpfLAbrPKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(83380400001)(478600001)(5660300002)(36756003)(316002)(966005)(7416002)(6666004)(6486002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2OhKSDGbfFLztlZMVS52+Y7xwTjHsylAbykKlTngYWs5ZB+b2zSPyvnSJa8yWNC9QEpsl/nA2xMBzNiN7F9BEoZxeIaOysvPUkmIN2Q2OgybMcJfJeqaFjggQvio+X2+jliF9iZXcmwZ5ks8m+LzkHDRxw/jZuAA7HYF9LAa2XUV+PUrCZeuzyYYvHTvE0OKh7yR5yaAJitxBt2lMBotllP4yAVOQr65fIP1aIiiN+TmyEuV+pVA5EEMJZostM/vLyOL1abNEodB423Jzt66Vf/wpxDAyF2uNdnp9OExWqfTUrZqJ1Mknnm5n4klR6sWMno8adg+d3ZSGqcLUBlok4C9XuaVA13NObY9Ld9QNaLY0r0RcVm5zozBT4+ypLMnQHvu27k2rtGzn3RpvSwglHd2sUrk+jllbO9aQU+ZOkjO/0m2svRKCGI2deQiI+KcvL0hqPqltOefXBiOi2j/2WTuBP9/4tzM3keTwT0UnyE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ff15da-294a-4634-737a-08d82191bd17
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:30.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeI8wBKFqiiOk8QmQ6XOh4ywCzCND2M3CLvGIE6m87JACQVicGyIU2d79YnybVP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
to support low power mode, the glue layer is for this wakeup
functionality, which has a separated interrupt, can support
wakeup from U3 and connect events for host, and vbus wakeup for
device.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
new file mode 100644
index 0000000..823db058
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP iMX8MP Soc USB Controller
+
+maintainers:
+  - Li Jun <jun.li@nxp.com>
+
+properties:
+  compatible:
+    items:
+    - const: fsl,imx8mp-dwc3
+
+  reg:
+    maxItems: 1
+    description: Address and length of the register set for the wrapper of
+      dwc3 core on the SOC.
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  interrupts:
+    maxItems: 1
+    description: The interrupt that is asserted when a wakeup event is
+      received.
+
+  clocks:
+    description:
+      A list of phandle and clock-specifier pairs for the clocks
+      listed in clock-names.
+    items:
+      - description: system hsio root clock.
+      - description: system bus AXI clock.
+      - description: suspend clock, used for wakeup logic.
+
+  clock-names:
+    items:
+      - const: hsio
+      - const: bus
+      - const: suspend
+
+# Required child node:
+
+  dwc3:
+    description: This is the node representing the DWC3 controller instance
+      Documentation/devicetree/bindings/usb/dwc3.txt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb3_0: usb@32f10100 {
+      compatible = "fsl,imx8mp-dwc3";
+      reg = <0x32f10100 0x8>;
+      clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+               <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+               <&clk IMX8MP_CLK_USB_ROOT>;
+      clock-names = "hsio", "bus", "suspend";
+      assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+      assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+      assigned-clock-rates = <500000000>;
+      interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      dwc3@38100000 {
+        compatible = "snps,dwc3";
+        reg = <0x38100000 0x10000>;
+        interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb3_phy0>, <&usb3_phy0>;
+        phy-names = "usb2-phy", "usb3-phy";
+      };
+    };
-- 
2.7.4

