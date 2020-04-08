Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9F8C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D4A2075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjySUjaF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgDHTvr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:47 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:39781 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730175AbgDHTvr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:47 -0400
Received: by mail-lf1-f54.google.com with SMTP id m2so6103781lfo.6
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fJEYCr5SGwVqF+Hy6/PLj+9fMT+BeuDPf85OWHTTG7w=;
        b=pjySUjaFk56A6It7X74m6UW7wQMFLT6kz3KxZdvpViNjyYAvFltzj+u1lrA8SbDGA9
         6nyaBHrwkIpWcXfdNW6UEQf+CGdZaI4NcC7f4GszBjx9/MbvHoO/aDaE9QR+g0+Qe5i8
         GuxdxvecPk/CyuvEP/+lpnmKB+M9sI8qjVwDlt82H0HbvbILDBoomsWuf9bdXWP0iL1U
         NsZTp/LPpN/Z1fnLPFdB5NZaKqLqKrNFQ/O4aLv66UjhXZcP9sKcG2+fT4tq55FEzoEm
         nVwNN/r7xx5WtBFqIiFYlNhjt8P2XPxvN6euzbB47ZcfG+EZK2tzK5JqxwNzf404CJDU
         ljow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fJEYCr5SGwVqF+Hy6/PLj+9fMT+BeuDPf85OWHTTG7w=;
        b=Z4Mv3AQHHzkr0OdeiQRYmbqtKciqE5fsZ5hpdb8BkzCikbADDKryM2v2dxZk9v5+Jp
         RdhCjW4EK4tBBq1+joQw4GfwmOsISpnLc0AjndaVKpOceCCwlOgxVgSBiMeZTmwHjq8C
         oZJHt5VXNFcdt1x3pnM9efvO/yK6W8ZIiCfekLLd6E+0bDyDU8QrwSAspcezUbABZDzw
         OILy4QLj6jB6vOq3amjpfo5xZSx4NfVCvW1OvcTbvz37viPOjjlWz1P+aH8ONDA7KbIS
         EQRkJ2HDG5/NlT7aczg4yxeKckmDieKGuZk8JwKeWuTiYdA6tY0u7ku9Iz35knAfkbv+
         bz6g==
X-Gm-Message-State: AGi0PuYI0ZyesIl92VVlRRReiSUC6jQOshy8mNzUpHlAu72LpOn7oYO1
        Yh/YtqCylbG5yIOKbeDWGEK11rE149Q=
X-Google-Smtp-Source: APiQypKVAVQoy4vW5//4ySRgsXIIuZhWqHZbM7YELLJI6NH9mo6bMPRjqkQPo3a3Qw4DXQlw7XC9IQ==
X-Received: by 2002:a19:c356:: with SMTP id t83mr818003lff.186.1586375504879;
        Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 04/36] dt-bindings: display: convert samsung,s6e63m0 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:37 +0200
Message-Id: <20200408195109.32692-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The binding for this panel is a SPI slave.

v2:
  - Drop use of spi-slave (Maxime)
  - Introude unevaluatedProperties (Maxime)
  - Drop reg entry in example (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e63m0.txt         | 33 ----------
 .../display/panel/samsung,s6e63m0.yaml        | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
deleted file mode 100644
index 9fb9ebeef8e4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung s6e63m0 AMOLED LCD panel
-
-Required properties:
-  - compatible: "samsung,s6e63m0"
-  - reset-gpios: GPIO spec for reset pin
-  - vdd3-supply: VDD regulator
-  - vci-supply: VCI regulator
-
-The panel must obey rules for SPI slave device specified in document [1].
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-		s6e63m0: display@0 {
-			compatible = "samsung,s6e63m0";
-			reg = <0>;
-			reset-gpio = <&mp05 5 1>;
-			vdd3-supply = <&ldo12_reg>;
-			vci-supply = <&ldo11_reg>;
-			spi-max-frequency = <1200000>;
-
-			port {
-				lcd_ep: endpoint {
-					remote-endpoint = <&fimd_ep>;
-				};
-			};
-		};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
new file mode 100644
index 000000000000..1dab80ae1d0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e63m0 AMOLED LCD panel
+
+maintainers:
+  - Jonathan Bakker <xc-racer2@live.ca>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e63m0
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "samsung,s6e63m0";
+            reg = <0>;
+            reset-gpios = <&mp05 5 1>;
+            vdd3-supply = <&ldo12_reg>;
+            vci-supply = <&ldo11_reg>;
+            spi-max-frequency = <1200000>;
+
+            port {
+                lcd_ep: endpoint {
+                    remote-endpoint = <&fimd_ep>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

