Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0E6C4BA3C
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 06:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7931C2468E
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 06:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="azMSNv/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgB0G2X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 01:28:23 -0500
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:50496
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbgB0G2X (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Feb 2020 01:28:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJCWcrXg7OxMMU7iRUr3TCBltreCITTQn1hPlOg1MbWvrqW8zl28cEFz8zUITqZd34NizT9gmsZrnsm3+Y5YP9dt/NKxE6KgbHQzM1apRRMdCVbdjEDBRWA79cfEipdg9PUhANV/ctn++0q5wGaSHHEO3CByceX3qcsx2XHkczFN8aUL/6ru5olmnlQ4y9dIAKJXbz5NbLGeQPNtvjWYqx6M5ioxCKchcYSiVoSljGnjRJHQChSLv79DsS4hM3Pot5vNLko0tLAC3kA1fE3pK3crFCeSKUztoJj15vbwaK9waeYcZLBET1PaXXQ0i93hVLEHaNC8xqQXvqMd1ypAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+XMI5bbbQuI/bprR+FINW45abi4NdkN7LnQYD0VQOI=;
 b=fsPGUdYUwx/dSj8mwe+h5M0bitGvP+wDtykEw8WQEcdSI2qU0qXBb5dOIOBMYCEVsmwlx2/q/O+t7JRZ1+iw63sLGCZ4LcjSmZ5JcSCnoaX4suwZdXh7rlrw51go0mdOkbZbFo6jJZjSfttW1RFd5dLLcCK9+h/RQ605zyOxs/MHkh1N0nXkVaNSX4trPjZl4FVcIJRUMyD6Wly+vBkKy3Jn+DmitMT50GmMRqkKbMGArj7yAhnw45njjfJgJGOHLSDmNHrdxzdEOizVxPzZiaz6wKeb1bYQz/gha0gwJRvx6r0LTUbYA8Tog5WinFF/9yhOep4fATPh3Dasii1n2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+XMI5bbbQuI/bprR+FINW45abi4NdkN7LnQYD0VQOI=;
 b=azMSNv/F9yaCHP98QG0AlwI6vI9hlcPKRK2zuCOCzpKs3YZaOqISh7o+GN2YQgbBSQdvmquO1oS1t72l4CB4i6zaMVHqLSSEM2iYDKU519VTYBbyVYvGkTW5ZT3cjegJzUvly1dEepziptH2NScAyQxg0gsKPXJpsI3hW/lzzkI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4653.eurprd04.prod.outlook.com (20.177.56.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Thu, 27 Feb 2020 06:28:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 06:28:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, aniljoy@cadence.com,
        jun.li@nxp.com, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Date:   Thu, 27 Feb 2020 14:27:54 +0800
Message-Id: <20200227062754.19131-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227062754.19131-1-peter.chen@nxp.com>
References: <20200227062754.19131-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 06:28:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65e30daa-400f-476f-5b9f-08d7bb4e3b48
X-MS-TrafficTypeDiagnostic: VI1PR04MB4653:|VI1PR04MB4653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4653961C193720D4332B6DA88BEB0@VI1PR04MB4653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(86362001)(5660300002)(16526019)(186003)(26005)(6506007)(44832011)(36756003)(6512007)(6486002)(52116002)(1076003)(66946007)(66476007)(2616005)(956004)(81156014)(81166006)(8676002)(478600001)(6666004)(8936002)(4326008)(316002)(2906002)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4653;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVLeovKXbHzfVZnSnSTkMJlP2UujvOb7wacbolrxSIdWWTZnnbMuCzNGiuyZEOm900LH0Hi92D9lHABhq451lda27Upgnw/tDpnwjQRK1+sF684NfWq5BkZMkC1c6LMDvKfk2ygepkQpzzVP84Bs4WqOe/YgH/ERFhfjAg7kQrSTaZ9aLBSbOHTQtmKGqxF1sGnVicqGQok6zTyxzwATb7lNWM7VzprLo2GdgswSLkk7T1dsGPahFkA/wx2nOYJ0qPP8aMfnUr5Eez9Pnm+soUDBIrjBOQDiwIqbI1yS/OUYJXqPM9Pr/re0+2VLaxIiNGsUvDXf5/tiI3p6jvbzlY8zMbFl4aOG1AwHHl581VwdikWzrkVzLC37httFJRHL4VvvU6C5ClgM7KX9A/Br7/xj7OWRTvSt4GDxhsjhg7C/+DaYyDSQNf0hbmedAQI93nC4hyojRm4wCJdVK0LX58jfSKv4LXyxSjcnpZBVhnlC9vqa3WwDqnM37gfXZxes5v/any4aNyZXnypd+/c0lg==
X-MS-Exchange-AntiSpam-MessageData: jE5QilRY6IczOlAbX2BYIv1Yzg5McdOp47VUrTRvz/PMruRUlgf5DubFHKmpGPW8Qy4Oq8ILXw37Yv9h6vutoTCPU4Gp1i4NA0mNLg24wWoj6YOR7nGwwEFt8/08Ww7ce615ApdXCCB3JviVt40rZw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e30daa-400f-476f-5b9f-08d7bb4e3b48
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 06:28:17.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGU4nVPLH7rZilJHmhLF2hyORctwHQoA6ioy2Yc7n+5WgAMhFtmqLlkjUROadHnM0ckJw9Sh4P+ADZXYZw+pZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4653
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add Cadence SALVO PHY binding doc, this PHY is a lagacy module,
and is only used for USB3 and USB2.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
new file mode 100644
index 000000000000..f829f44c5e33
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
@@ -0,0 +1,47 @@
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
+    usb3phy: usb3-phy {
+	  compatible = "nxp,salvo-phy";
+	  reg = <0x5B160000 0x40000>;
+	  clocks = <&usb3_lpcg 4>;
+	  clock-names = "salvo_phy_clk";
+	  power-domains = <&pd IMX_SC_R_USB_2_PHY>;
+	  #phy-cells = <0>;
+};
-- 
2.17.1

