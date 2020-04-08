Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367F0C2BBFD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09AA22075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy7py9mJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgDHTv5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:57 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:35359 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730196AbgDHTv5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:57 -0400
Received: by mail-lj1-f180.google.com with SMTP id k21so9043223ljh.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gts8IBK9sE8CfYbVSsVTkwe650OyDr0ovRiE3fWcD5w=;
        b=fy7py9mJ7xLW9YoKJCavc0rM7N1S2ZJ1i2xWM6bPxAfKhwNLe085VmXMVqSFZ/BUuh
         DsNmYNbLxMgblA74MbUTxY9fwU+cpiKnMoMbWVD00TAjeB0Nmjygu+/zH+ynalzvQYqR
         zdhs8r3/xXKItmbxdnF1Ea7WfXCkPe532WQ0fDXtCBsUSN7CEl/cskfKB43sw2Bbd5Ec
         8AEsA/JTiSn90W1GSBIKwnO7MZyCbB/DBy3zNIaxBIR2fkMORHKNEOb0xoMT/WyDxjR2
         uPEyG7llbcRBVWdqT+KsVUNzsnmxmj74vkKpcu1SJFg/h8fDSN0x745/5wZ71wEVMq6u
         zOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gts8IBK9sE8CfYbVSsVTkwe650OyDr0ovRiE3fWcD5w=;
        b=YwDZFDs6NuG3Eq62ZqBdzEblMBD61IpcuMHNaJ/giraOMLYbTqbgHP2K7Tek74oomX
         /vM52BJjC3rtPggXEd7qzlNcjN3QO5JuQtd2MwJ31QxJhXmr6V11kuD3X2jsHHVsF0gX
         bbCPvSJbcUA7p7hPh86E1NxTs99V+UyNNgndu5rGReBts95zt9slJ4a7mqPFVp6M4dWH
         9ivsNMJvMy+Vj/NBHTw/hoNMrF8E5vuHe9ozATwHzEVVKk+Su5pGnG2B/1/Wmz7E7PHX
         kyXZH/w8jXo8hB0ncC/vdh2p5tHMZP8f79/PggRaJtrG3s7OjQ9ZfrdVrbtyrakIQGwZ
         IRAQ==
X-Gm-Message-State: AGi0PuaXdEHfGUb8RyDWMBhSa7qdg9Y2xEy7863oTv8fxh7saSUuL/Ow
        WEP53dSseN7GAXaMAuy5H28=
X-Google-Smtp-Source: APiQypKE90E7N2o/yHSibcHm+rJeb50Ogag0nb6GTjwrAzUJENGsLHHdGJo+6lW9xokMMiEI0l9e3Q==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr3845652ljg.290.1586375515137;
        Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 13/36] dt-bindings: display: convert kingdisplay,kd035g6-54nt to DT Schema
Date:   Wed,  8 Apr 2020 21:50:46 +0200
Message-Id: <20200408195109.32692-14-sam@ravnborg.org>
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
  - Drop use of spi-slave.yaml (Maxime)
  - Introduce unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../panel/kingdisplay,kd035g6-54nt.txt        | 42 ------------
 .../panel/kingdisplay,kd035g6-54nt.yaml       | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
deleted file mode 100644
index fa9596082e44..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd035g6-54nt"
-- power-supply: See panel-common.txt
-- reset-gpios: See panel-common.txt
-
-Optional properties:
-- backlight: see panel-common.txt
-
-The generic bindings for the SPI slaves documented in [1] also apply.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/graph.txt
-
-Example:
-
-&spi {
-	panel@0 {
-		compatible = "kingdisplay,kd035g6-54nt";
-		reg = <0>;
-
-		spi-max-frequency = <3125000>;
-		spi-3wire;
-		spi-cs-high;
-
-		reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
-
-		backlight = <&backlight>;
-		power-supply = <&ldo6>;
-
-		port {
-			panel_input: endpoint {
-				remote-endpoint = <&panel_output>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
new file mode 100644
index 000000000000..6960036975fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd035g6-54nt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kingdisplay,kd035g6-54nt
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "kingdisplay,kd035g6-54nt";
+            reg = <0>;
+
+            spi-max-frequency = <3125000>;
+            spi-3wire;
+            spi-cs-high;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&ldo6>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

