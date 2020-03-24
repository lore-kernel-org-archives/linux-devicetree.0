Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C83C10DCE
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 07:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A621220735
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 07:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GzELforH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCXHLK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 03:11:10 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:6076
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725905AbgCXHLJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 24 Mar 2020 03:11:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVpDIPgMm51NlhnN2uzPyXfX9IY+MnhxREcCUoovfBXI1WkagtM/92LbpB3KZi8D512fXGKwuCHTslZL7kU+HZbaI+Uc8blp9JMQBHAxukT8pI980sJ2fdeoHE5BchDY0864t/8Ckl5rsUzSrAsNtMwFjE5G/CzpYNtkomTweeVRnx8+JLPxiZ8EW+EFxjuDJhARi0Pj7e86zXJ0hhkS2sjBqHS8dhZ6o4QHvT9n0MXidAUVjgFss3iOZjE098cL//pm2LSE494DwuIQWhiyg3D1x0gljUctCXxvVl+NLzXnR+UIzgqotLakRC4p/Y92teQghiZAYm5x/Tlwb+kU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpbM0dlB8HRqFoGkqYnAFL+e2YZFOMIwcFQSjDZ8Ej8=;
 b=ChQSFW+V79ZhbkJzh7UKwkSLnaClsAPR4CVebVhShVTbaUP8inlwCr7ajF/vH7UbvjxSnK6cXQvc7wqRcgMwbEjN0h7XwMu6xE2ZwYuzc7YypNtrUkMm8B2vvhmWX8Wpnbo3cNQdWNMHEOhWa09EXnZ63uTvMmx+rHkbNaMy+956d3eKB9bualjZ1TXhEcnXIvft+C472NzPxSKWmahBubWCbLVjF/3WvDn3kAKgb887mdmN9e0tnrmJHOVV+xfAtXAnG7HK3QeUMT7RhmAkn+KNlE6tETQBMI2uCWaVm+yTU+ImLlmo6AXxKOyqGWcd3FZVD3kWOXFFXJwIWlsyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpbM0dlB8HRqFoGkqYnAFL+e2YZFOMIwcFQSjDZ8Ej8=;
 b=GzELforH39JC+CGaFRf2x0J7DusBRKw970F84sICUlYf6+5zbUthfgAMAuXNwJ+onvZ2xDGtj4kBg9RYs/V3XRdkgUkRIAcaB2JWvKE6N1JziaSuYPDJaOdYgIXDIYutR/B5QyFRRGq/adbm9Q7MQp7lNp+tnyPT4zTawThXJZo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6840.eurprd04.prod.outlook.com (10.141.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 07:10:34 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 07:10:34 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org, kishon@ti.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Date:   Tue, 24 Mar 2020 15:10:30 +0800
Message-Id: <20200324071030.19801-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324071030.19801-1-peter.chen@nxp.com>
References: <20200324071030.19801-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0251.apcprd06.prod.outlook.com
 (2603:1096:4:ac::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0251.apcprd06.prod.outlook.com (2603:1096:4:ac::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend Transport; Tue, 24 Mar 2020 07:10:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1c4071a-f247-474f-96ba-08d7cfc27201
X-MS-TrafficTypeDiagnostic: AM7PR04MB6840:|AM7PR04MB6840:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68403D4532D857911F7E501B8BF10@AM7PR04MB6840.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8676002)(81166006)(6486002)(5660300002)(66946007)(52116002)(66556008)(478600001)(81156014)(66476007)(6506007)(36756003)(6512007)(86362001)(2906002)(316002)(16526019)(44832011)(956004)(2616005)(8936002)(4326008)(186003)(26005)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6840;H:AM7PR04MB7157.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcCrsG7We4Ps0oMW1tWqhikHqrGsNz7Z4VYmHcs/CJFAUt7FXugMVB3tVHXFeKLFOhX5wZ1U4XCXWibTfwXRJXXuSeGYYFa0bjMvcXDgIgfVxJea+U554pNmqA1bPmW87+zHiAX/o2nNBg1Bpx4VMwASKAa9sTJLViYPgNlWkvCYsgZJjLlZ1gzJbBDlYe4XXgONKs6inIEXv+22MzrBGEaawG+O8aO9pos21asVPCh397S+iKvKU3A2cPrGeFA8S5oaNPgaIAYLYIIBUwYbvhDzHcoT96y5eVDxlTv+e48UERRnTP5ltzeG3t6cOcKBOS58tYvUVbAiaSIl0rLwVOUkqon0oDV1+XO3L2YuUkLxrrntN0kCmb6bo2MetgEPYSII0M/WYFH8SsQ+GOs/gJbJVBCchJ5wfGBiBrw3YlWUo8h9rdBg2JJWvQN3CMNoS3WZottfd8pk6tX1VnTMbXT3xvSkLMAVRf12G1bP0yHu3i48DUAA2osS1HxMZUtmC5X3716Dcqwx2GMNDSaOPw==
X-MS-Exchange-AntiSpam-MessageData: vBdjBBtzlggZudxYTi6PJRpHW2SyGL1sGRTFTHbFLgHVEC6BZT4Z7oGpd3meIhVMqpVZr4IpilOWl7ksIgXDgwHTmgHuwykFEML/PuH0/oCAkI4Zs3RhE8PeyRBOuwQnyq1vOdKV/2eZ5PULWOueAw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c4071a-f247-474f-96ba-08d7cfc27201
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 07:10:34.1945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKoXDELyMxTkjbH2/OYsBYJW/X6lEU063n6sHNro/azaLsN02yTpXyYeZ6SQIoi2m6/nWuWCEegE8ijBFYg75Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
and is only used for USB3 and USB2.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Fix more schema errors

 .../bindings/phy/cdns,salvo-phy.yaml          | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
new file mode 100644
index 000000000000..a36e21e1808c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
@@ -0,0 +1,53 @@
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
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  "#phy-cells":
+    const: 0
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

