Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918E0C2D0F3
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BF6520BED
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="K6/RjcFP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgDABiz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 21:38:55 -0400
Received: from mail-eopbgr10088.outbound.protection.outlook.com ([40.107.1.88]:23458
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731712AbgDABiz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 21:38:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4GiX7BXe5tqgRlQCi842lr7Yd9A78iNOXZVWfvQttBgjcp5qMhdq0ixswAQptUDFHbUlR0kMtpTwkDiC98AiK/3fXxlRtXnoxHLQTaAhp4TC/pyWHep3YfTWTovJr+cYeJ0dVaxAlY2692/DcByDyyspte2lUVphv1ZIZIniOfy9fFjaj/J5Z0Pa+trYmJ8JUVyqhemxFKHsO56JlJmVy/PLff6K3XrHGWHNibsk+D9/ggIBTqmVgh62ykBPv6byxWlAbuDugPuAWS7r3tsaKA0gb4ZLkjTcBQ1+jWNhNYTPxhXVTWysOKSqR+AIpLaaYdlfV6jxk6NtT7nz75Czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzH3/kT8SOhf12sNq+hErWGR/MqdnGmeljAa9kzUJCU=;
 b=e/YWOgf11o80D+/R5haOwS3vXt3NbvNO0DSWAA7JaPyMnSJhWb1iUl5VMvxwHrn3gHZZZWc8oH6yznN+sw+i7pRLLsnH7nAzx3DUgC9ClR/6OMdzyo/BCCw//4Lp2F8IAKpFNqSjHpqKTULzbOhlP1rokSjgJ0OEY53NO+xpTlSNWm6iaRsgR+onfy2X4oYBj6NZW7gZaS4VPeO7AYlUi/J5OvbUTKCE4MjaAWn5toRFSkHJIIS65ngvCWOprJAmnyvxqWPTghjK0M9FH0sxMDmBau5HG5rXY4Q8m0lhz1X4lyy7Kxd+TN5xrTRiJi1vKW4YckS1Rg8O1Qj6cHbmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzH3/kT8SOhf12sNq+hErWGR/MqdnGmeljAa9kzUJCU=;
 b=K6/RjcFP4cv7kSM4mX1VgEJE7/Uyv8rnhZMokOh17Lwbw5rFb2YK9uk8N2YS4xymrWkB+AV/6b7fN6WG5zUhrkydwxTLlNVYwRXZJI7PuKjbreGnvr/zDkIQehCwjOWYVGwJ8qwzYjPuX0uYibd74zBj0rxYwBrVv12ykHENk3c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6872.eurprd04.prod.outlook.com (10.141.172.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 01:38:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 01:38:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org, kishon@ti.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATH v4 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Date:   Wed,  1 Apr 2020 09:38:51 +0800
Message-Id: <20200401013851.16227-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401013851.16227-1-peter.chen@nxp.com>
References: <20200401013851.16227-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0244.apcprd06.prod.outlook.com
 (2603:1096:4:ac::28) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0244.apcprd06.prod.outlook.com (2603:1096:4:ac::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Wed, 1 Apr 2020 01:38:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd0bf173-35fa-4c98-8e35-08d7d5dd6cc0
X-MS-TrafficTypeDiagnostic: AM7PR04MB6872:|AM7PR04MB6872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68727DA6626C87C21C045DD68BC90@AM7PR04MB6872.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(1076003)(316002)(956004)(186003)(44832011)(5660300002)(2616005)(16526019)(26005)(36756003)(8676002)(52116002)(6512007)(8936002)(6486002)(2906002)(6666004)(66946007)(4326008)(81156014)(478600001)(66476007)(66556008)(81166006)(86362001)(6506007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PgBxn0/8Qb6Mk5qbT35uq9WNP92DiefFpDDzYmPSLtC/jtwIdnOl6dvj766IfFdokepvXIBihNn+wKkM3rGvIMYUopo5SDSxrZpAQ0OZU1tuA2ZKQBedJ14oF4zZ/UGzB6n9Zgagjw8Z72pYG+tLIObNz/dFkVltgn+ZkLIoLdVtgTsJvygauz7vf+bzpW3YbPA7kvHxlLKc6+maRA9jDwEDeWeQDjAlvBdZXAohWioGQQSNxp8V/QxvmAiR7w9urm4plz0OMo4u58Uxn4xejIrinF4styPxT6VGri/W1o52Y2Ni03Jvyzkb1jaNYyfA6NGUHbIVDHort8ComEJ8S9cyOwVFCTVnnIbubhwTR1VbMxr85b7X0aLDhRwX/NX8mXv4zTO4kSKK/mB2NvTkco8LyonHzl3Lg4D/E//ePiC9vJMTsKV6ueIwjK7logJmGZWIwYJttKMf99kqNAOGDrO123AH9xAFHmbl+4JvtauCEn+sqfUJ43xGMPAO5AgzA7PoAx73p+wkBvTNaNSpw==
X-MS-Exchange-AntiSpam-MessageData: LxKdUtGk1FE+4vs8ipVMUBXKDJPLk5m4/pLE+h2jflD1iKD2Ep4OiYG1s0y1aupKhbbYGV3GuS+nTvs3Gd1F75wD9+Dqb0sg8CrX8nybZ130RQKLxqQ+tFU9EJYsEo96uOzU9OCAukqFB5owUQJ5Lg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0bf173-35fa-4c98-8e35-08d7d5dd6cc0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 01:38:48.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ghm0g9AZ5FyAYV57osRdXjCgPXDh/oDDihTOkfuNmUyXwBLu1avk2jnvDBvVf+Gvyl7ZYQvPZtv1b5frcURlog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
and is only used for USB3 and USB2.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v4:
- Drop the useless description for power-domains
- change unit-address of node as lowercase hex

Changes for v3:
- Fix more schema errors

 .../bindings/phy/cdns,salvo-phy.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
new file mode 100644
index 000000000000..3a07285b5470
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
@@ -0,0 +1,52 @@
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
+    usb3phy: usb3-phy@5b160000 {
+        compatible = "nxp,salvo-phy";
+        reg = <0x5b160000 0x40000>;
+        clocks = <&usb3_lpcg 4>;
+        clock-names = "salvo_phy_clk";
+        power-domains = <&pd IMX_SC_R_USB_2_PHY>;
+        #phy-cells = <0>;
+    };
-- 
2.17.1

