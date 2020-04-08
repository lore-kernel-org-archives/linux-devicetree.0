Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97D0C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CF7620936
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioDaWnCB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgDHTwW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41850 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgDHTwV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:21 -0400
Received: by mail-lf1-f67.google.com with SMTP id z23so6109011lfh.8
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJCCkRIdQYZizf3lrj9PmXMBXsnQM3CNWOz+i68b5qs=;
        b=ioDaWnCBdekR5Uypkvp87fPf4bKJMGHIPurqS6rJwzGNrZtdwBS7Zxch4a7PKgxkXN
         t1oeMHRrRDQmNJVweBUgYnMyupHxdidXPOR7CDTnvp0GAdNIg2Wm9mevleve2AT2kq7i
         8QWozhl+s4iO1DXIjUDYnwYKNa5RVgNmLba+rBweF4aQb7s07wDXbKqJJhPY37EMeoqX
         yF9f6tdGZ0yS6m3cIUZFk7uJIftWEtiqRHZ6LiYFWm7Fm9hvjRPEB/qH5Ch1wgtueALA
         deT9tGAZprpHlRFhXk9O/TiCh1m9PPE9h3jQ0puWydDuBDcpsgzjgrA489O/r/oAltMR
         DQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VJCCkRIdQYZizf3lrj9PmXMBXsnQM3CNWOz+i68b5qs=;
        b=KN4vhxt+/ReT1GboKWJO6Pxs0zVjdrGfWHGyYAsQMaSj0hUyIwIVKlSa9s5Xm5OxyM
         p+tZboSmLyIEMdLkyBd3vRJysjE1OftdTRhUJEivI02ieXk79PbYi13ei1vp0/IoLSeq
         q+tcZc5Y3mxfr63lLw4bBfzXBojvDCfpXPUli1n4VYL9fqnTsCPD8PCVUv21c28W2vyJ
         a7NUtnTpuB9/5VZ20Cr6+8CBoSJ695U5c0Ivj9ipzLD3IiaayrtG7XU40YU87SGPt1Kf
         8NghI6TDQ6omR9SZNxL3/A6oLdgxxBumIRrL8sIKrcTHdB4ndSFU1AqI2OY8d12VzU6I
         kTEw==
X-Gm-Message-State: AGi0PuYE42XWSjPRPWQgJiGzHCoPGCejKEvrEeH70EGctHVelhotIzvP
        XmfNp6HD2jDDgj6oUn6U1zMy1xKsPE0=
X-Google-Smtp-Source: APiQypL2DbbPq8gMuU8zl3cgNaQitOS0YkG5vNPE+/UUfphZWIW1fa7PoalWduD5LbMTKMGom2c0ZQ==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr5601399lfc.60.1586375538493;
        Wed, 08 Apr 2020 12:52:18 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:18 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 35/36] dt-bindings: display: convert olimex,lcd-olinuxino to DT Schema
Date:   Wed,  8 Apr 2020 21:51:08 +0200
Message-Id: <20200408195109.32692-36-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2:
  - use "ic2" node name in example (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/olimex,lcd-olinuxino.txt    | 42 -----------
 .../display/panel/olimex,lcd-olinuxino.yaml   | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 71 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
deleted file mode 100644
index a89f9c830a85..000000000000
--- a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Binding for Olimex Ltd. LCD-OLinuXino bridge panel.
-
-This device can be used as bridge between a host controller and LCD panels.
-Currently supported LCDs are:
-  - LCD-OLinuXino-4.3TS
-  - LCD-OLinuXino-5
-  - LCD-OLinuXino-7
-  - LCD-OLinuXino-10
-
-The panel itself contains:
-  - AT24C16C EEPROM holding panel identification and timing requirements
-  - AR1021 resistive touch screen controller (optional)
-  - FT5x6 capacitive touch screnn controller (optional)
-  - GT911/GT928 capacitive touch screen controller (optional)
-
-The above chips share same I2C bus. The EEPROM is factory preprogrammed with
-device information (id, serial, etc.) and timing requirements.
-
-Touchscreen bingings can be found in these files:
-  - input/touchscreen/goodix.txt
-  - input/touchscreen/edt-ft5x06.txt
-  - input/touchscreen/ar1021.txt
-
-Required properties:
-  - compatible: should be "olimex,lcd-olinuxino"
-  - reg: address of the configuration EEPROM, should be <0x50>
-  - power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-  - enable-gpios: GPIO pin to enable or disable the panel
-  - backlight: phandle of the backlight device attacked to the panel
-
-Example:
-&i2c2 {
-	panel@50 {
-		compatible = "olimex,lcd-olinuxino";
-		reg = <0x50>;
-		power-supply = <&reg_vcc5v0>;
-		enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>;
-		backlight = <&backlight>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
new file mode 100644
index 000000000000..2329d9610f83
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/olimex,lcd-olinuxino.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for Olimex Ltd. LCD-OLinuXino bridge panel.
+
+maintainers:
+  - Stefan Mavrodiev <stefan@olimex.com>
+
+description: |
+  This device can be used as bridge between a host controller and LCD panels.
+  Currently supported LCDs are:
+    - LCD-OLinuXino-4.3TS
+    - LCD-OLinuXino-5
+    - LCD-OLinuXino-7
+    - LCD-OLinuXino-10
+
+  The panel itself contains:
+    - AT24C16C EEPROM holding panel identification and timing requirements
+    - AR1021 resistive touch screen controller (optional)
+    - FT5x6 capacitive touch screnn controller (optional)
+    - GT911/GT928 capacitive touch screen controller (optional)
+
+  The above chips share same I2C bus. The EEPROM is factory preprogrammed with
+  device information (id, serial, etc.) and timing requirements.
+
+  Touchscreen bingings can be found in these files:
+    - input/touchscreen/goodix.yaml
+    - input/touchscreen/edt-ft5x06.txt
+    - input/touchscreen/ar1021.txt
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: olimex,lcd-olinuxino
+
+  backlight: true
+  enable-gpios: true
+  power-supply: true
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@50 {
+            compatible = "olimex,lcd-olinuxino";
+            reg = <0x50>;
+            power-supply = <&reg_vcc5v0>;
+            enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index eec316171b5e..22e63341006e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5356,7 +5356,7 @@ DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
 M:	Stefan Mavrodiev <stefan@olimex.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
-F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
+F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 
 DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
 M:	Noralf Trønnes <noralf@tronnes.org>
-- 
2.20.1

