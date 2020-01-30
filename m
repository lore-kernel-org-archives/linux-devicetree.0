Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EFEC33C9E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 08:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17EA620702
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 08:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="feNeqU4z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgA3IpT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 03:45:19 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:23092 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726882AbgA3IpT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 03:45:19 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00U8cLPq025647;
        Thu, 30 Jan 2020 09:44:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=kWfXJnmr0BI7puqIerfdcIFZFcyxNHSzlJmHkNmaVRw=;
 b=feNeqU4zO0MFE/ruSwBCprntxNVqEFLc3rPHyECyMsu3M5t+bM5SvxdcKrviCSJJ/kt9
 0KEC3fKWceLrLnh84VNQTVs/lIyexyczULeiLq+30OjmgbZMyIzwozeeTAM3KC2JRmtR
 gOmfOALXm4T6KcgE7FeU+g0D5sLeDyF0YhP25N1ALDKYo4TMhL1oSBTPr+ZrjvOIz5Dq
 VtfTyJvKuNLftub3DC2p9W19nb5tTj7MU6BD9h1TCN9NqZgiOHBUx5pseA4iQdh03FzN
 S7e5J4EhkWHpnmnwXQf14ApXmSBG8EO9R4PdEFOmhF+YLxuxKrHqptPdBwnDn67hjgAL fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrc13f5g7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Jan 2020 09:44:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDDA3100039;
        Thu, 30 Jan 2020 09:44:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B97A3222CB6;
        Thu, 30 Jan 2020 09:44:55 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Jan 2020 09:44:55
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
CC:     Sam Ravnborg <sam@ravnborg.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3] dt-bindings: one file of all simple DSI panels
Date:   Thu, 30 Jan 2020 09:44:30 +0100
Message-ID: <20200130084430.20966-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-30_02:2020-01-28,2020-01-30 signatures=0
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

To complement panel-simple.yaml, create panel-simple-dsi.yaml.
panel-simple-dsi-yaml are for all simple DSP panels with a single
power-supply and optional backlight / enable GPIO / reset GPIO.

Migrate panasonic,vvx10f034n00, orisetech,otm8009a and raydium,rm68200 over to the new file.

The objectives with one file for all the simple DSI panels are:
    - Make it simpler to add bindings for simple DSI panels
    - Keep the number of bindings file lower
    - Keep the binding documentation for simple DSI panels more consistent

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
version 3:
- add orisetech,otm8009a and raydium,rm68200 compatibles
- add reset-gpios optional property
- fix indentation on compatible enumeration
=> Rob had reviewed the second version but, given the changes in version 3
   I haven't added here.
 .../bindings/display/panel/orisetech,otm8009a.txt  | 23 -------
 .../display/panel/panasonic,vvx10f034n00.txt       | 20 ------
 .../bindings/display/panel/panel-simple-dsi.yaml   | 74 ++++++++++++++++++++++
 .../bindings/display/panel/raydium,rm68200.txt     | 25 --------
 4 files changed, 74 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt

diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
deleted file mode 100644
index 203b03eefb68..000000000000
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
-
-The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
-a MIPI-DSI video interface. Its backlight is managed through the DSI link.
-
-Required properties:
-  - compatible: "orisetech,otm8009a"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "orisetech,otm8009a";
-		reg = <0>;
-		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
deleted file mode 100644
index 37dedf6a6702..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Panasonic 10" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f034n00"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "panasonic,vvx10f034n00";
-			reg = <0>;
-			power-supply = <&vreg_vsp>;
-			backlight = <&lp8566_wled>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
new file mode 100644
index 000000000000..1168b8186490
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple DSI panels with a single power-supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  requires only a single power-supply.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      # compatible must be listed in alphabetical order, ordered by compatible.
+      # The description in the comment is mandatory for each compatible.
+
+        # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
+      - orisetech,otm8009a
+        # Panasonic 10" WUXGA TFT LCD panel
+      - panasonic,vvx10f034n00
+        # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
+      - raydium,rm68200
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems : 1
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reg
+
+examples:
+  - |
+    mdss_dsi@fd922800 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "panasonic,vvx10f034n00";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&ltdc_out>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
deleted file mode 100644
index cbb79ef3bfc9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
-
-The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
-panel connected using a MIPI-DSI video interface.
-
-Required properties:
-  - compatible: "raydium,rm68200"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-  - backlight: phandle of the backlight device attached to the panel.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "raydium,rm68200";
-		reg = <0>;
-		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-		backlight = <&pwm_backlight>;
-	};
-};
-- 
2.15.0

