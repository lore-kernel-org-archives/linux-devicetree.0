Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF514C38A2A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8082F20769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vcHdk6V7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbgDHTwI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:08 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:39250 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:07 -0400
Received: by mail-lj1-f179.google.com with SMTP id i20so8991090ljn.6
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TqzV4MPdGVVHtAbugCExEo6BeL07NygrdK5YIjL8Q/Q=;
        b=vcHdk6V7p/5lvirdWFpNPQcRbqx5cD+mtI7uD4T8oLusG0CR/y0bhbc6+Oiwt5UXMo
         Jj7Zjc/msfeCLbvA18ikGO5cJN33BMywxhSh6KNbpRf7pLkt0800ALMN0PGojm49Tlfb
         xbw4gkwThDqL9pL4ydW0vpyR7YNVWP/bacnDfBregAiubw4I5IV3SUjwAnOfQ+6VFy2V
         mj2M8B86onRW3IM4EDdv7c0J5Qfomf/3ygf2IFF0aWRFegMCR3iDkQDEQ2537jxitsHq
         Hr3ftMMhSdPwfXMcdG+F+cAAboXHxM8am2DeiL5PhL5Cpx0ybSDVXg9c0qlLXLu4d7BZ
         whqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TqzV4MPdGVVHtAbugCExEo6BeL07NygrdK5YIjL8Q/Q=;
        b=amwrKYK4zGcRPwIdtRuy7Jz7wnPjG1+vKlSNElAmRI8famw8LaTsjfpj2U4YCEr6Z4
         mBgHcZfxrwly//LfY0u3jIps4LbGhbA5Ns1vCUVgWGl14CV6KWuiIm7uoPWnvt3LYUbi
         4WeW6w2+pxZfryjrHU9maV1t2Z1kE8ZxJGB7UuAyR+vl01bPfaGS8ctM335/88QeF3Cy
         xuIoUr/OgifiCZCRiGG8bIBuLHK5F3SHqgDnYfSwzkFTNJoqb/lDVuqkkOVMTc+f+L9T
         ORmRvuh0S8ay31Vy/3z4pw2bOX68I6N3eG8EnJWZRbNH1zu27G2oZnWezuYlSrDo0i3t
         gM2w==
X-Gm-Message-State: AGi0Puas9u5CixmyJ8VCvPFCPj7RI4de7KsBZ4nCsHdzptGkaF/lZEuP
        w6RVf/tYd4HFewF0sKt1wMs=
X-Google-Smtp-Source: APiQypL8PXxu9oEBPxLhH/oTLKAHkkiP8CiHzd1VfpObLjBK2GqPULA5CH3ShDykbJhXvtArNFoYCw==
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr24549ljr.121.1586375525862;
        Wed, 08 Apr 2020 12:52:05 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:05 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 23/36] dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:56 +0200
Message-Id: <20200408195109.32692-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e8aa0.txt         | 56 -----------
 .../display/panel/samsung,s6e8aa0.yaml        | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
deleted file mode 100644
index 9e766c5f86da..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
-
-Required properties:
-  - compatible: "samsung,s6e8aa0"
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd3-supply: core voltage supply
-  - vci-supply: voltage supply for analog circuits
-  - reset-gpios: a GPIO spec for the reset pin
-  - display-timings: timings for the connected panel as described by [1]
-
-Optional properties:
-  - power-on-delay: delay after turning regulators on [ms]
-  - reset-delay: delay after reset sequence [ms]
-  - init-delay: delay after initialization sequence [ms]
-  - panel-width-mm: physical panel width [mm]
-  - panel-height-mm: physical panel height [mm]
-  - flip-horizontal: boolean to flip image horizontally
-  - flip-vertical: boolean to flip image vertically
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	panel {
-		compatible = "samsung,s6e8aa0";
-		reg = <0>;
-		vdd3-supply = <&vcclcd_reg>;
-		vci-supply = <&vlcd_reg>;
-		reset-gpios = <&gpy4 5 0>;
-		power-on-delay= <50>;
-		reset-delay = <100>;
-		init-delay = <100>;
-		panel-width-mm = <58>;
-		panel-height-mm = <103>;
-		flip-horizontal;
-		flip-vertical;
-
-		display-timings {
-			timing0: timing-0 {
-				clock-frequency = <57153600>;
-				hactive = <720>;
-				vactive = <1280>;
-				hfront-porch = <5>;
-				hback-porch = <5>;
-				hsync-len = <5>;
-				vfront-porch = <13>;
-				vback-porch = <1>;
-				vsync-len = <2>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
new file mode 100644
index 000000000000..67c99b0492e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
+
+maintainers:
+  - Andrzej Hajda <a.hajda@samsung.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8aa0
+
+  reg: true
+  reset-gpios: true
+  display-timings: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+ 
+  power-on-delay:
+    description: delay after turning regulators on [ms]
+
+  reset-delay:
+    description: delay after reset sequence [ms]
+
+  init-delay:
+    description: delay after initialization sequence [ms]
+
+  panel-width-mm:
+    description: physical panel width [mm]
+
+  panel-height-mm:
+    description: physical panel height [mm]
+
+  flip-horizontal:
+    description: boolean to flip image horizontally
+
+  flip-vertical:
+    description: boolean to flip image vertically
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply 
+  - vci-supply
+  - reset-gpios
+  - display-timings
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel {
+            compatible = "samsung,s6e8aa0";
+            reg = <0>;
+            vdd3-supply = <&vcclcd_reg>;
+            vci-supply = <&vlcd_reg>;
+            reset-gpios = <&gpy4 5 0>;
+            power-on-delay= <50>;
+            reset-delay = <100>;
+            init-delay = <100>;
+            panel-width-mm = <58>;
+            panel-height-mm = <103>;
+            flip-horizontal;
+            flip-vertical;
+
+            display-timings {
+                timing0: timing-0 {
+                    clock-frequency = <57153600>;
+                    hactive = <720>;
+                    vactive = <1280>;
+                    hfront-porch = <5>;
+                    hback-porch = <5>;
+                    hsync-len = <5>;
+                    vfront-porch = <13>;
+                    vback-porch = <1>;
+                    vsync-len = <2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

