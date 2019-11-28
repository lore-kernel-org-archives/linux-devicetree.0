Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47D2C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88AB8217AB
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vRsb4zfd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfK1Qpm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 11:45:42 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43350 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfK1Qpl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 11:45:41 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xASGjcuD072267;
        Thu, 28 Nov 2019 10:45:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574959538;
        bh=+cV/xaoWKni6uJVsXA8KD+nVtRVb9rRhaDXvqY781rI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vRsb4zfdBWhOUDZnwkRRjj3FXSE+/YY12NF7BMOB8p8IBqiEslsn+LxFcTUwxQk43
         4//ruhYv2aYfNc8yYUW/0r2CcZzbwaU4qx1hTSc0UCrtCnG9/j3E1yahaOW4Stimgd
         dMfv8at3F5BeqX2jjiGYkWMTXxDN/fQQfufxESjM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGjcdh126096;
        Thu, 28 Nov 2019 10:45:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 10:45:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 10:45:36 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGjZXQ122491;
        Thu, 28 Nov 2019 10:45:35 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: DT schema for rocktech,rk101ii01d-ct panel
Date:   Thu, 28 Nov 2019 18:45:34 +0200
Message-ID: <bc69f06adb9e5e590ae58bdb47717699a0b404ff.1574959312.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574959312.git.jsarha@ti.com>
References: <cover.1574959312.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT schema binding for Rocktech Displays Limited RK101II01D-CT
10.1" TFT 1280x800 Pixels with LVDS interface, LED Backlight and
capacitive touch panel.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../display/panel/rocktech,rk101ii01d-ct.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml
new file mode 100644
index 000000000000..09caeee8701d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/dlc,dlc0700yzg-1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rocktech Displays Ltd RK101II01D-CT 10.1" TFT 1280x800 Pixels
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+description: |
+  Rocktech Displays Limited RK101II01D-CT 10.1" TFT 1280x800 Pixels
+  with LVDS interface, LED Backlight and capacitive touch panel. For
+  touch screen details see "goodix,gt928" in:
+  Documentation/devicetree/bindings/input/touchscreen/goodix.txt
+
+properties:
+  compatible:
+    const: rocktech,rk101ii01d-ct
+
+  reset-gpios: true
+  enable-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - power-supply
+
+examples:
+  - |
+        display0 {
+                compatible = "rocktech,rk101ii01d-ct";
+                backlight = <&lcd_bl>;
+                enable-gpios = <&pca9555 8 GPIO_ACTIVE_HIGH>;
+                power-supply = <&dummy_supply>;
+
+                port {
+                        lcd_in0: endpoint {
+                                remote-endpoint = <&oldi_out0>;
+                        };
+                };
+        };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

