Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E933C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2C5420768
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2ochy84"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgDHTvv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:51 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44468 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbgDHTvv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:51 -0400
Received: by mail-lf1-f65.google.com with SMTP id 131so6076752lfh.11
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qc1djU1Q06MzocO0vj8yJYnsVz6qQEHWX4cQfpHpC4I=;
        b=X2ochy84yzXA/0+fvtag6VW/IgKSnj9XG+n+oL3ULehMMcy/9cmybQe9YCvqhTVXvu
         3RcXMR7NYE0O0KJr0HUxLRpRh0LTLjbn/k8rjM4GBIFXECnMA/calvcRHRBiamxkiEOG
         kZbipGNnGnXG6LKD12oNghy5DvnBnZPJ7E+hf8kuk9eo6N8eP6pTnBwHGlSJrlcwbQi/
         FC2XWQmiw3JH9qOhoyG6BwcqloO48RXfRNAvNaQ4z9keu9LQ2foCLcmr4XoE/VSdM636
         twb0l+7nFD/VOKxN2k6GDZNXnY5Cd0QHYX0V4upCJIPtc4Kl3JvSLLitI7Jkir6tT6cY
         cGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Qc1djU1Q06MzocO0vj8yJYnsVz6qQEHWX4cQfpHpC4I=;
        b=IWVO5pfpy5nRjsFXjlNRKrjZA//2PBGtYgrhA1165CtGOlEr5N/QKEEcbpARNQbX+g
         pN19Ib5Xa/VJeGX3SlKWW9KFA9YmwO+OOKsIze+jnGo5kw82T/X4iU9VWybozRMmcEtE
         C6dfeEcF6mksGaMlfi0XqYMXfoK6au2InPjUvSXF9DrYqLZYTsu1JHJJ8HY7jjj/fAXs
         EIikSWZofTEvCEPe8GlNs+mSAwam8IMLW3KgyMrpTY5X9LDVuQrPLpGpUhN9AoOLIh0d
         0m5z4RHDDnEFHvBcF+Qu7wRyQovEm7jj3sUOmIXILJto3mdAJEfukmVX+HSIyUfKkBmm
         /3rg==
X-Gm-Message-State: AGi0PuZ3SU+8vEWABh/C2KLNChPBaQ0Aeb6vtekGxfxrO/jDIFJ5KlpK
        of27rioAdjWU1Xvqv+eldB0=
X-Google-Smtp-Source: APiQypJU/Kc5lMAE3LvrjQh8i7yMWN0pT25HAtOibX6nz7j2qvI09UFCXQY+wJQkpFQzFWGC52jezg==
X-Received: by 2002:a19:700a:: with SMTP id h10mr5770154lfc.184.1586375507684;
        Wed, 08 Apr 2020 12:51:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:47 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 06/36] dt-bindings: display: convert boe,himax8279d to DT Schema
Date:   Wed,  8 Apr 2020 21:50:39 +0200
Message-Id: <20200408195109.32692-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2:
  - Fix entry in MAINTAINERS

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/boe,himax8279d.txt | 24 --------
 .../display/panel/boe,himax8279d.yaml         | 59 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 60 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
deleted file mode 100644
index 3caea2172b1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Boe Himax8279d 1200x1920 TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,himax8279d8p" and one of: "boe,himax8279d10p"
-- reg: DSI virtual channel of the peripheral
-- enable-gpios: panel enable gpio
-- pp33-gpios: a GPIO phandle for the 3.3v pin that provides the supply voltage
-- pp18-gpios: a GPIO phandle for the 1.8v pin that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel {
-			compatible = "boe,himax8279d8p", "boe,himax8279d10p";
-			reg = <0>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
-			pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
-			pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
new file mode 100644
index 000000000000..e42b6a8ae176
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boe Himax8279d 1200x1920 TFT LCD panel
+
+maintainers:
+  - Jerry Han <jerry.han.hq@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: boe,himax8279d8p
+      - const: boe,himax8279d10p
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  pp33-gpios:
+    maxItems: 1
+    description: GPIO for the 3.3v pin that provides the supply voltage
+
+  pp18-gpios:
+    maxItems: 1
+    description: GPIO for the 1.8v pin that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp33-gpios
+  - pp18-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel {
+            compatible = "boe,himax8279d8p", "boe,himax8279d10p";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
+            pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
+            pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b99fa16ba08..dba84e7726b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5255,7 +5255,7 @@ DRM DRIVER FOR BOE HIMAX8279D PANELS
 M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
-F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
+F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
-- 
2.20.1

