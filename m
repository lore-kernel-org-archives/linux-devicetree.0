Return-Path: <SRS0=aLuy=BT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F28C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Aug 2020 10:59:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B892C206B5
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Aug 2020 10:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgHIK7x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 9 Aug 2020 06:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHIK7u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 9 Aug 2020 06:59:50 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB995C061756
        for <devicetree@vger.kernel.org>; Sun,  9 Aug 2020 03:59:49 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BPbhh3PdKz1rrLM;
        Sun,  9 Aug 2020 12:59:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BPbhh2Xydz1qy5j;
        Sun,  9 Aug 2020 12:59:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id X16mMroUGXLm; Sun,  9 Aug 2020 12:59:46 +0200 (CEST)
X-Auth-Info: CuMrZL+8dnk5JEzGmIhGo5UcjVRKP/8B1AnlyoVQapU=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun,  9 Aug 2020 12:59:46 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Eric Anholt <eric@anholt.net>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: Add DT bindings for RaspberryPi 7" display ATTINY88-based regulator/backlight controller
Date:   Sun,  9 Aug 2020 12:59:37 +0200
Message-Id: <20200809105938.6388-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT bindings for RaspberryPi 7" display ATTINY88-based
regulator/backlight controller, this one is used in the
Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 ...ypi,7inch-touchscreen-panel-regulator.yaml | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
new file mode 100644
index 000000000000..0ae25d119b6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi 7" display ATTINY88-based regulator/backlight controller
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
+  controller on the PCB, which is used to turn the display unit on/off
+  and control the backlight.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: raspberrypi,7inch-touchscreen-panel-regulator
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      regulator@45 {
+        compatible = "raspberrypi,7inch-touchscreen-panel-regulator";
+        reg = <0x45>;
+      };
+    };
+
+...
-- 
2.28.0

