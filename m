Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF46C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A9D2206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OOQZ4mPl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgEOIFg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:05:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35868 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgEOIFf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:05:35 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F85YQj111491;
        Fri, 15 May 2020 03:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589529934;
        bh=Q5SaNfEj3LAtH4FyUMHSVzzBAxQRelQh8WAHbHFkCAs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OOQZ4mPlZ7CyfolEsJ46S4z1sNH+wWYL3IO/5jRc9V3SlulNdKG5ImKL9yCachK4z
         SNWGv2kF6oqliUPWbkgw3emmpDSFJcJUidLqVPPib1mLFK4prYszLMqda622jaXD+C
         Tdq1uqQQuvbzHYsvupwrd5u8Pw8mj+gNqX7dCijw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F85YKp122380
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 03:05:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:05:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:05:33 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85RTf069544;
        Fri, 15 May 2020 03:05:32 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 2/4] dt-binding: phy: convert ti,omap-usb2 to YAML
Date:   Fri, 15 May 2020 11:05:16 +0300
Message-ID: <20200515080518.26870-3-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515080518.26870-1-rogerq@ti.com>
References: <20200515080518.26870-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move ti,omap-usb2 to its own YAML schema.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 .../devicetree/bindings/phy/ti,omap-usb2.yaml | 73 +++++++++++++++++++
 .../devicetree/bindings/phy/ti-phy.txt        | 37 ----------
 2 files changed, 73 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml

diff --git a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
new file mode 100644
index 000000000000..ecfb28f714ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP USB2 PHY
+
+maintainers:
+ - Kishon Vijay Abraham I <kishon@ti.com>
+ - Roger Quadros <rogerq@ti.com>
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+        - enum:
+          - "ti,dra7x-usb2"
+          - "ti,dra7x-usb2-phy2"
+          - "ti,am654-usb2"
+        - enum:
+          - "ti,omap-usb2"
+
+  reg:
+    maxItems: 1
+    description: address and length of the register set for the device.
+
+  '#phy-cells':
+    description:
+      Number of cells in a PHY specifier.  The meaning of all those
+      cells is defined by the binding for the phy node. The PHY
+      provider can use the values in cells to find the appropriate PHY.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clocks:
+    minItems: 1
+    items:
+      - description: wakeup clock
+      - description: reference clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: "wkupclk"
+      - const: "refclk"
+
+  syscon-phy-power:
+    description:
+      phandle/offset pair. Phandle to the system control module
+      register offset to power on/off the PHY.
+
+  ctrl-module:
+    description:
+      (deprecated) phandle of the control module used by PHY driver
+      to power on the PHY. Use syscon-phy-power instead.
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    usb0_phy: phy@4100000 {
+      compatible = "ti,am654-usb2", "ti,omap-usb2";
+      reg = <0x0 0x4100000 0x0 0x54>;
+      syscon-phy-power = <&scm_conf 0x4000>;
+      clocks = <&k3_clks 151 0>, <&k3_clks 151 1>;
+      clock-names = "wkupclk", "refclk";
+      #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/ti-phy.txt b/Documentation/devicetree/bindings/phy/ti-phy.txt
index 8f93c3b694a7..60c9d0ac75e6 100644
--- a/Documentation/devicetree/bindings/phy/ti-phy.txt
+++ b/Documentation/devicetree/bindings/phy/ti-phy.txt
@@ -27,43 +27,6 @@ omap_control_usb: omap-control-usb@4a002300 {
         reg-names = "otghs_control";
 };
 
-OMAP USB2 PHY
-
-Required properties:
- - compatible: Should be "ti,omap-usb2"
-	       Should be "ti,dra7x-usb2" for the 1st instance of USB2 PHY on
-	       DRA7x
-	       Should be "ti,dra7x-usb2-phy2" for the 2nd instance of USB2 PHY
-	       in DRA7x
-	       Should be "ti,am654-usb2" for the USB2 PHYs on AM654.
- - reg : Address and length of the register set for the device.
- - #phy-cells: determine the number of cells that should be given in the
-   phandle while referencing this phy.
- - clocks: a list of phandles and clock-specifier pairs, one for each entry in
-   clock-names.
- - clock-names: should include:
-   * "wkupclk" - wakeup clock.
-   * "refclk" - reference clock (optional).
-
-Deprecated properties:
- - ctrl-module : phandle of the control module used by PHY driver to power on
-   the PHY.
-
-Recommended properies:
-- syscon-phy-power : phandle/offset pair. Phandle to the system control
-  module and the register offset to power on/off the PHY.
-
-This is usually a subnode of ocp2scp to which it is connected.
-
-usb2phy@4a0ad080 {
-	compatible = "ti,omap-usb2";
-	reg = <0x4a0ad080 0x58>;
-	ctrl-module = <&omap_control_usb>;
-	#phy-cells = <0>;
-	clocks = <&usb_phy_cm_clk32k>, <&usb_otg_ss_refclk960m>;
-	clock-names = "wkupclk", "refclk";
-};
-
 TI PIPE3 PHY
 
 Required properties:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

