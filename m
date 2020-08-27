Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C65C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C366322BED
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LuhkfuSa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgH0GwA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 02:52:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55456 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgH0GwA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 02:52:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R6ptmU112930;
        Thu, 27 Aug 2020 01:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598511115;
        bh=R+p0a5cY7zHxTqfZYiAOyQdOxt2UPJvvWAcH9195/rs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LuhkfuSa2QBZCy/hUJCh0t+yGaob6Fi2Vu720ovy4pkQ6ALnSfQ9Pml5vIK8atvF+
         KGTiCK35DZe9nLPirW9fsJnF0cN6AzeEV4MKCLfnjZhnGDUUwLHxRUDYaQZXOFz5aV
         Jb2sv7uocWliW5FpHdc4O3cA36TBtzWbrPYsNw6I=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R6pt77011154
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 01:51:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 01:51:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 01:51:54 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R6pjog112178;
        Thu, 27 Aug 2020 01:51:51 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 1/4] dt-bindings: arm: ti: Convert K3 board/soc bindings to DT schema
Date:   Thu, 27 Aug 2020 12:21:41 +0530
Message-ID: <20200827065144.17683-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827065144.17683-1-lokeshvutla@ti.com>
References: <20200827065144.17683-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert TI K3 Board/SoC bindings to DT schema format.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../devicetree/bindings/arm/ti/k3.txt         | 26 ----------------
 .../devicetree/bindings/arm/ti/k3.yaml        | 31 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 32 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
 create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.yaml

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.txt b/Documentation/devicetree/bindings/arm/ti/k3.txt
deleted file mode 100644
index 333e7256126a..000000000000
--- a/Documentation/devicetree/bindings/arm/ti/k3.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Texas Instruments K3 Multicore SoC architecture device tree bindings
---------------------------------------------------------------------
-
-Platforms based on Texas Instruments K3 Multicore SoC architecture
-shall follow the following scheme:
-
-SoCs
-----
-
-Each device tree root node must specify which exact SoC in K3 Multicore SoC
-architecture it uses, using one of the following compatible values:
-
-- AM654
-  compatible = "ti,am654";
-
-- J721E
-  compatible = "ti,j721e";
-
-Boards
-------
-
-In addition, each device tree root node must specify which one or more
-of the following board-specific compatible values:
-
-- AM654 EVM
-  compatible = "ti,am654-evm", "ti,am654";
diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
new file mode 100644
index 000000000000..c5e3e4aeda8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ti/k3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 Multicore SoC architecture device tree bindings
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+description: |
+  Platforms based on Texas Instruments K3 Multicore SoC architecture
+  shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: K3 AM654 SoC
+        items:
+          - enum:
+              - ti,am654-evm
+          - const: ti,am654
+
+      - description: K3 J721E SoC
+        items:
+          - const: ti,j721e
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3b186ade3597..40d31bb7ecf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2636,7 +2636,7 @@ M:	Tero Kristo <t-kristo@ti.com>
 M:	Nishanth Menon <nm@ti.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/arm/ti/k3.txt
+F:	Documentation/devicetree/bindings/arm/ti/k3.yaml
 F:	arch/arm64/boot/dts/ti/Makefile
 F:	arch/arm64/boot/dts/ti/k3-*
 F:	include/dt-bindings/pinctrl/k3.h
-- 
2.28.0

