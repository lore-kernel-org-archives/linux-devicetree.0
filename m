Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A8C0044D
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 01:37:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63A5A2076A
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 01:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WFqtRXG3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgCOBhJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 21:37:09 -0400
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:26838
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726891AbgCOBhJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 14 Mar 2020 21:37:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPcTpJZ4G1xPmrXGjUUrOeEIDfnIbCQjWy7wx2DV11aLItRjsjS/+3qr9vr6IV19F1R0U2v/HNacr7It26bbQfbVQXdasNqvGS/XOF1dWqCfTejRLx17TSSTBkjuiT1VJruQlFTV92xruqq2mhFNGjCH8tlqRyK2X+uqMbw1GeNI90ejtLhQL5suscEFo3Cu9F5odP2fz+LHvYThzpKrYnlX+6/DbbanIjLygmQ9xdNzpqykuB7rscNlhJpBK16uEnIKeu4U8Mw5KFQne2lUzr0hxEAmKkHYj2paDxHtZOOe2r1jMl+4uS7HU7W4RYgVDlqmYSql1eBLi0/J99W9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHptm0f/c09T11Plu87u+BYKzE0FFIDVlmhP6sSVPKU=;
 b=AnYKee+S/Gb81hd80dy6FFcjFDbjlv5gUDJnaEizK6M/Cr5fyMDZ3N/bFFep6LhICAsN09TaTs5ndsaX6TagtNOBHfZmDwx3A3DKcidcgPjrfHfZD1bzmzK+ty1L67pAmAvE4m2N1k6emNCIYUV0FyqzMsnlF8HrZ4QGXML0pI6NG5JuelPV/i6VHP5KejcRefM0eJVOxnr9c0qFCTH8rd7caGjCZMPO+hKQjtQLcIFsYMkShz3TAm5eOAo/JYzoccdWBRYH2sdV2UUwiFmGYFkd9mGWLfkoE9/hW9cEeKtsNni49PpJe34H65/VOM1Y85P7Z1VqcQkdPTUJA5NoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHptm0f/c09T11Plu87u+BYKzE0FFIDVlmhP6sSVPKU=;
 b=WFqtRXG3mjadlFmA1raCdK/Gaf6idqO1c1R1ldAap3eYsNCn33mwMyFNCxstn+fnp6fo42ar9C2Dq0ic4s1lCl7InsbRawoz5L/Vw85rYvur+I7Y1l9Zsnl/LXz0hWZYZWlQWiVXGfzCmnCmdpKXRbaNxzip02q/cW6UX2C1f1w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6893.eurprd04.prod.outlook.com (52.133.245.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Sat, 14 Mar 2020 09:40:01 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.018; Sat, 14 Mar 2020
 09:40:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org, kishon@ti.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Date:   Sat, 14 Mar 2020 17:39:41 +0800
Message-Id: <20200314093941.2533-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200314093941.2533-1-peter.chen@nxp.com>
References: <20200314093941.2533-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13 via Frontend Transport; Sat, 14 Mar 2020 09:39:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c697406-0f2f-4341-fdf8-08d7c7fbaa99
X-MS-TrafficTypeDiagnostic: VI1PR04MB6893:|VI1PR04MB6893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB689345E70E0F804458D8B5498BFB0@VI1PR04MB6893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 034215E98F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(6486002)(2906002)(52116002)(316002)(66946007)(66556008)(16526019)(66476007)(186003)(2616005)(36756003)(6666004)(5660300002)(8676002)(81166006)(44832011)(81156014)(478600001)(8936002)(26005)(6506007)(86362001)(4326008)(6512007)(1076003)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6893;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgNYhlYxMu/fLn4qTd9AYnxpiyzoSQey7rvN8QSm6rz9wzWVJbx+DSJ4fxiGdlNEidyl0Vkq+cxHweVWkFVyx5pgDHx/xlrfsovyMJiU2llZ9ojZT8RzXd2aEIVOi7DMDGRg4HE2rrjltHZDm+hodDbQK7mw4m3SQzHPqIeTSE7zDFPRG4E6xhuaMytUYXReq1gvu4slSBWtrLJK+0I4H21dFUIS8dYpQt+xuNrxVKzpaNNWN5UAwr/QqbCHkRcX/I+Q9Njjry3hGVHw/l2s1XOBZXmRSxKL1N0Bu9hz8QDRYM50NIpbIHFhDURFte3LIRg4ufgrGBaXpuz8VC5ZGoiom3YlWQXjXuBjxthQNsSUB7oOyfcRRrAA+F4bymjy2ze6DOrtQnSj7fWw6+JViPQfAiVDjGXSh+1GTBCd0t8p2/gypbWGt4KAOw+/n8WjtIEIGvVAfq+EERQJY///Q24d9Z3lE7K5mD/H72cv1qrHENB/jf2SaKOFdc1+zER+tPb8G6rrzMq/Y5B6UZ9VKA==
X-MS-Exchange-AntiSpam-MessageData: sDEMILx19hoGmafotvTzAEoZGEP5CC+kV9qfDqqOl2izisDMl8LfuCsDhiYqMzzoqxYez6U8VcSe4uFCTJc+loVGKtuNI/Mlw+KOell/WaK8ka+7GdenXpKZJqfNh3SsxSJ3WithHJNCVrL0wv8aVA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c697406-0f2f-4341-fdf8-08d7c7fbaa99
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2020 09:40:01.0930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLCdk5Va4IkUmywTNM2smizOWtdVM6z3fmBNAE6hrRELSbD/OYdbhqidcJdUOqkso7EocbwKpY/MH2XKa+H7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6893
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
and is only used for USB3 and USB2.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Fix kinds of yaml style issue

 .../bindings/phy/cdns,salvo-phy.yaml          | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
new file mode 100644
index 000000000000..ccfcb990eb1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 NXP
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/cdns,salvo-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence SALVO PHY
+
+maintainers:
+  - Peter Chen <peter.chen@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,salvo-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: salvo_phy_clk
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    usb3phy: usb3-phy@5B160000 {
+        compatible = "nxp,salvo-phy";
+        reg = <0x5B160000 0x40000>;
+        clocks = <&usb3_lpcg 4>;
+        clock-names = "salvo_phy_clk";
+        power-domains = <&pd IMX_SC_R_USB_2_PHY>;
+        #phy-cells = <0>;
+    };
-- 
2.17.1

