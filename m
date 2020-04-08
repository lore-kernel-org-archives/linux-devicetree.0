Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E70CC2BA1A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11CD720784
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URahBBG9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgDHTvx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45879 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgDHTvx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id f8so6075416lfe.12
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZKT7JkrbeBe76Ve38Y5DpAsdq4DLeWVuQYfutOWAJM=;
        b=URahBBG9uTjbmyo//FFPxYRdWnD+o95TfL+CP9E/7AZh9mvnudlsHFuDc1TUHl0hLk
         ggyBbGmCO8oeB6kq/gtkD1mKMpZt0xp03yF69aNPCiheVFAI0BDJ5GG4iXe05xAYS6uj
         rprzsGQGnso64n2vsisazZZqGJJ1v2YE4UXfJh2DT3/jBozbxOWsnHC33QZ6IPzpBW7X
         ZKDFST8r8uDg88A+LfaqXXjZcW6Sf57Kg7A3yjsTFlcahh7uyalTLqd9tt4r37lDj+Lt
         CW6KAGf/bUWaPPph9pmop0uLtTWd/d7yBUP38dJxIxlpoB2IVtSW5476aZSuzBBw9KHL
         qwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fZKT7JkrbeBe76Ve38Y5DpAsdq4DLeWVuQYfutOWAJM=;
        b=BxEsLjqERHwXe7gSJ1VPY4+/iLrqqr12Qj4Pu0O1qD3GGznNREbGjbeW+fDg4ks5xQ
         Lpx2eFKSG0AqYhrG7e/uv/35J7ckPgaQF+SlX9JIiWrxqeDrATJQz3YAQMKAftddlY9J
         95mBDHHkfVzW38PShZJC0ae1IZ9gGzubsN4OGccEgk4b1ovZYaIb6EtKUAHKpo7QexWb
         3bQQXGuaCiOs31FK7ltcMpUcuknhFw4CmWq6+qyAi1ShF0MZIVIpz+rTNecQ5gCuWwfJ
         T+6jd5j5/qC6gr4RBb0mL9I36bXR9xyFXGrMoN36ALkqr7h/nBcrPNUfOXQnVHp0jUG3
         wENg==
X-Gm-Message-State: AGi0PuY5r8hg6YVFdaC7CzdaRzMM3XXZoUFonT1+colFs/s0pCExStzB
        NN+zh/3qWt3gmNe2hn/ZPc8=
X-Google-Smtp-Source: APiQypJ1QMHvaBeudTgdwstq727Ayqc/njis4k7wye7jYxfGodVZPr9hlCf8UfhdXzDPyMbtHdr3Hg==
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr5499182lfe.178.1586375509805;
        Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 08/36] dt-bindings: display: convert ilitek,ili9881c to DT Schema
Date:   Wed,  8 Apr 2020 21:50:41 +0200
Message-Id: <20200408195109.32692-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Updating this binding identified an issue in the example in
the allwinner,sun6i-a31-mipi-dsi binding.
Fix the example so no new warnings are introduced.

v2:
  - fix example in allwinner,sun6i-a31-mipi-dsi (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  2 +-
 .../display/panel/ilitek,ili9881c.txt         | 20 --------
 .../display/panel/ilitek,ili9881c.yaml        | 50 +++++++++++++++++++
 3 files changed, 51 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index 9e90c2b00960..e73662c8d339 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -119,7 +119,7 @@ examples:
         panel@0 {
                 compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
                 reg = <0>;
-                power-gpios = <&pio 1 7 0>; /* PB07 */
+                power-supply = <&reg_display>;
                 reset-gpios = <&r_pio 0 5 1>; /* PL05 */
                 backlight = <&pwm_bl>;
         };
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
deleted file mode 100644
index 4a041acb4e18..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ilitek ILI9881c based MIPI-DSI panels
-
-Required properties:
-  - compatible: must be "ilitek,ili9881c" and one of:
-    * "bananapi,lhr050h41"
-  - reg: DSI virtual channel used by that screen
-  - power-supply: phandle to the power regulator
-  - reset-gpios: a GPIO phandle for the reset pin
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-Example:
-panel@0 {
-	compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
-	reg = <0>;
-	power-supply = <&reg_display>;
-	reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
-	backlight = <&pwm_bl>;
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
new file mode 100644
index 000000000000..a39332276bab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9881c based MIPI-DSI panels
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - bananapi,lhr050h41
+
+      - const: ilitek,ili9881c
+
+  backlight: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reg
+  - reset-gpios
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
+
+        panel@0 {
+            compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
+            reg = <0>;
+            power-supply = <&reg_display>;
+            reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
+            backlight = <&pwm_bl>;
+        };
+    };
+
+...
-- 
2.20.1

