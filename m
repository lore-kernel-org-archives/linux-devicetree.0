Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D8C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 13:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B8352073B
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 13:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20150623.gappssmtp.com header.i=@nigauri-org.20150623.gappssmtp.com header.b="zKQiYJD4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732550AbgDANml (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 09:42:41 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37210 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732396AbgDANml (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 09:42:41 -0400
Received: by mail-pj1-f68.google.com with SMTP id o12so2740862pjs.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJRkuri+52/NYhR4P5oF7/5wtZs4I8toehnqIWt5fAw=;
        b=zKQiYJD43I58XZSGeOdLFmb066UAc9qa1JgNxJPsP9RoIqQVsFmHmId4uZqwtPh2jr
         jLUTOXuf2v/WGLTLgn/hx4i6rV7sDazrrx/x3rOJlXcdy/1cCRSQjHRdYad1NUKT4HEe
         ns2/XGeDQr+hXBUmixVdievZUsvm0oMdGVu/10OGeKnfOF7tAg/cFtqwAVgYjxXya+q1
         NvZZJ+w1vqQ8fU+QFckJ1rXxCHYqylPTEXBE5U66R3ERaK0zEVqCBex4o6xit70JScKF
         GuVUhND+iTDenLK6SzrfNdAFsUR2X2ZUsjOucAdjUbLk2MNnNDW17Rb85Kspne1ScnJz
         t1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJRkuri+52/NYhR4P5oF7/5wtZs4I8toehnqIWt5fAw=;
        b=ETQABSIHGylczDTeb8qVaflANSXlGUUEzbRjC3LMPetJ9GqSSllAJu5L3CjGtNGIeC
         LKSO7LWNnqd4GHqQ2U7Fx/DaOjrByhECf3L10FafH2KGpesWdHqd72o9I4TPtBrkrRS6
         J4NgibQL3/1JAXVXNE4LIVtOzArbWvZ5h5Wa+rJ959TTgWuuv3hWN79Vyc0EtKy4kqfB
         JbDP++QJ0q9pjhCl9a6GAFSyxAvGgXStXR/GTPdZaSoHeVz04beCP78sNJRDXcQ1HRIq
         g61VKWfpCNTgjdiEZkSL+3E5TBDtmiCrZEvKB1BIQjDZY/Vlbpzp0Qd7bGbH/ElETF6m
         lHeQ==
X-Gm-Message-State: AGi0PuaUp5DiXjJDfkL0RuUFAvQDJrZUTOzEWGhAj34IoTKRT6/ZDdUL
        NsVzfz0gUgmSOP1A5UQ2gpMx+lXmhA==
X-Google-Smtp-Source: APiQypKPUCKj53e9OPViAg30mCZMfIwyCH5EpAb0FsfM18/PiV3fHoyFFllX8iterjb+8o+gHbzp/g==
X-Received: by 2002:a17:90a:94c8:: with SMTP id j8mr5035339pjw.155.1585748559475;
        Wed, 01 Apr 2020 06:42:39 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:bf52:1f8e:88d2:6ec])
        by smtp.gmail.com with ESMTPSA id lj14sm1710606pjb.25.2020.04.01.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 06:42:38 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     devicetree@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: i2c: cadence: Migrate i2c-cadence documentation to YAML
Date:   Wed,  1 Apr 2020 22:42:22 +0900
Message-Id: <20200401134222.60317-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The document was migrated to YAML format and renamed cdns,i2c-r1p10.yaml

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../bindings/i2c/cdns,i2c-r1p10.yaml          | 58 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-cadence.txt   | 28 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cadence.txt

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
new file mode 100644
index 0000000000000..dc0952f3780fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence I2C controller Device Tree Bindings
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cdns,i2c-r1p10 # cadence i2c controller version 1.0
+      - cdns,i2c-r1p14 # cadence i2c controller version 1.4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    minimum: 1
+    maximum: 400000
+    description: |
+      Desired operating frequency, in Hz, of the bus.
+
+  clock-name:
+    const: pclk
+    description: |
+      Input clock name.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@e0004000 {
+        compatible = "cdns,i2c-r1p10";
+        clocks = <&clkc 38>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0xe0004000 0x1000>;
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-cadence.txt b/Documentation/devicetree/bindings/i2c/i2c-cadence.txt
deleted file mode 100644
index ebaa90c58c8e7..0000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-cadence.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Binding for the Cadence I2C controller
-
-Required properties:
-  - reg: Physical base address and size of the controller's register area.
-  - compatible: Should contain one of:
-		* "cdns,i2c-r1p10"
-		Note:	Use this when cadence i2c controller version 1.0 is used.
-		* "cdns,i2c-r1p14"
-		Note:	Use this when cadence i2c controller version 1.4 is used.
-  - clocks: Input clock specifier. Refer to common clock bindings.
-  - interrupts: Interrupt specifier. Refer to interrupt bindings.
-  - #address-cells: Should be 1.
-  - #size-cells: Should be 0.
-
-Optional properties:
-  - clock-frequency: Desired operating frequency, in Hz, of the bus.
-  - clock-names: Input clock name, should be 'pclk'.
-
-Example:
-	i2c@e0004000 {
-		compatible = "cdns,i2c-r1p10";
-		clocks = <&clkc 38>;
-		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-		reg = <0xe0004000 0x1000>;
-		clock-frequency = <400000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f2..1fb95a12eda48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2672,7 +2672,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/block/xsysace.c
 N:	zynq
 N:	xilinx
-F:	Documentation/devicetree/bindings/i2c/i2c-cadence.txt
+F:	Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-xiic.txt
 F:	drivers/clocksource/timer-cadence-ttc.c
 F:	drivers/i2c/busses/i2c-cadence.c
-- 
2.26.0

