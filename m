Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686E6C38A24
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B96A20771
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgHB+vU0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730246AbgDHTwD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35489 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id r17so6120040lff.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eb49ZuvI3f7DDW48zoIuxR6GcmzkcmV13fqoE06Migw=;
        b=RgHB+vU0JT/cP5j8wdXpTw2ra/VmeMQfZY2OkY+7pKt7dCJdWgSbGOr/7hSXGWRUEP
         S5H4Uw+n0I04CmNzsTgYfZczuwqF5eSlv83tvexHfMcaHcg0Vd4m1H4gkbyyoqL6VgZF
         xILgSKhZbrx7dGPLjc1ShxKfMMPAjsD00Ka12wWylEZeLxgdVwYzhOK1EIu1GHhf/euU
         fdGBJKe0SRILvZGlYBVn+mCMK+kEHMGMqotQC+wFluWViAynEROPErtuJcsvRHhYjtvy
         6TmhPmGy2teKId5XLe98cZXJkW8JQjRa6yMnDkf0CypxomPWe+AFzsDrQe0pi5Nt3HRE
         ZlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Eb49ZuvI3f7DDW48zoIuxR6GcmzkcmV13fqoE06Migw=;
        b=U6JrxKCcIPWRcKadwX7sLQnfqbhK99gfJRkPzhttIwO/IFeO8He6VcOHpj1qh9UeuZ
         5itjK4WKPyP2nMxuXxh2r2DVrTOn5NeKkSjvTsXSg7xcpGJf6utmUilAybxB4mQMMHic
         RmEmCx8rQYlgcwoqpJmXpo3bo8OW/3y8zCr05rqGAQJtPuVgRTX2MpLrrgb9mvmo+ZAz
         2j2oNuHEmfl8ZL8OET0AUj6U3Ip8w9QF3ZxvYoJrofZ1Vz2Cve2nuAiqj8FRopg10a7W
         fTXBnBj1HACdqrf9qif+XWucr8ArfG46RysYzhKrDM6ZcO16s4mNArZbP6TqY++6ssnv
         vwoQ==
X-Gm-Message-State: AGi0PuZgNiTaZ24k780AHtzeaeg7xQ3plOBjl9zFmnbadnpy2vpVtdAK
        q+kilblOfQ0KvExSsfTXYcU=
X-Google-Smtp-Source: APiQypLtbfFhvPCLUgnNiNW/30yqgnvPpjBjpJhOgDTx8jktct5hMNJjGyD95RkAZONZ9dfuqv6hsA==
X-Received: by 2002:a19:ac41:: with SMTP id r1mr5536385lfc.113.1586375520379;
        Wed, 08 Apr 2020 12:52:00 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:59 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 18/36] dt-bindings: display: convert raydium,rm67191 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:51 +0200
Message-Id: <20200408195109.32692-19-sam@ravnborg.org>
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
  - Add reg number to node name (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/raydium,rm67191.txt         | 41 ----------
 .../display/panel/raydium,rm67191.yaml        | 75 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 76 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
deleted file mode 100644
index 10424695aa02..000000000000
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
-
-Required properties:
-- compatible: 		"raydium,rm67191"
-- reg:			virtual channel for MIPI-DSI protocol
-			must be <0>
-- dsi-lanes:		number of DSI lanes to be used
-			must be <3> or <4>
-- port: 		input port node with endpoint definition as
-			defined in Documentation/devicetree/bindings/graph.txt;
-			the input port should be connected to a MIPI-DSI device
-			driver
-
-Optional properties:
-- reset-gpios:		a GPIO spec for the RST_B GPIO pin
-- v3p3-supply:		phandle to 3.3V regulator that powers the VDD_3V3 pin
-- v1p8-supply:		phandle to 1.8V regulator that powers the VDD_1V8 pin
-- width-mm:		see panel-common.txt
-- height-mm:		see panel-common.txt
-- video-mode:		0 - burst-mode
-			1 - non-burst with sync event
-			2 - non-burst with sync pulse
-
-Example:
-
-	panel@0 {
-		compatible = "raydium,rm67191";
-		reg = <0>;
-		pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;
-		pinctrl-names = "default";
-		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
-		dsi-lanes = <4>;
-		width-mm = <68>;
-		height-mm = <121>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&mipi_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
new file mode 100644
index 000000000000..8fdd4e56aedf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm67191.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
+
+maintainers:
+  - Robert Chiras <robert.chiras@nxp.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: raydium,rm67191
+
+  reg: true
+  port: true
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+ 
+  dsi-lanes:
+    description: Number of DSI lanes to be used must be <3> or <4>
+    enum: [3, 4]
+
+  v3p3-supply:
+    description: phandle to 3.3V regulator that powers the VDD_3V3 pin
+
+  v1p8-supply:
+    description: phandle to 1.8V regulator that powers the VDD_1V8 pin
+
+  video-mode:
+    description: |
+      0 - burst-mode
+      1 - non-burst with sync event
+      2 - non-burst with sync pulse
+    enum: [0, 1, 2]
+
+required:
+  - compatible
+  - reg
+  - dsi-lanes
+  - port
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
+            compatible = "raydium,rm67191";
+            reg = <0>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+            dsi-lanes = <4>;
+            width-mm = <68>;
+            height-mm = <121>;
+            video-mode = <1>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mipi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index dba84e7726b7..33dbe94e03ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5388,7 +5388,7 @@ DRM DRIVER FOR RAYDIUM RM67191 PANELS
 M:	Robert Chiras <robert.chiras@nxp.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
-F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
+F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 
 DRM DRIVER FOR RAGE 128 VIDEO CARDS
 S:	Orphan / Obsolete
-- 
2.20.1

