Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CE4C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7127E208B8
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsKozLej"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgGDK2U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 06:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDK2T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 06:28:19 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E5AC061794
        for <devicetree@vger.kernel.org>; Sat,  4 Jul 2020 03:28:19 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q7so26537452ljm.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egNFN6wJrz0fv/icBKiyuH1pCdcaQPddX7ketsRVnQg=;
        b=hsKozLejW0y6oPXqOwCX5ttyKK6gpKN6Gl+ycH9VzvqOme6O0vjxw2/BzOATxx1WDW
         bGpSGu+ZcTSU7+VOP6tLEJ4F+z96ZUh6kCkGebwAn3eFaqz42kF9Lt8EqvzUmlKp+x1N
         Wv8NPj6SYKwLzbzcdLyqq6Pthloo2iqbDPMDqgYBT3V+T9q1Yd6z4DTfZR9/c3Y6G580
         3LDtL0B/vpTnmN55gGAaE7dPiX1USrKvaUTz2SNdzmzKcJJnloaPhVBo7d7DLb00QBK3
         VJc00Tou3qCsYaZYQuX9cXReQzfM+IZ2nhmG5w8GFHMEG+njhEB51OVG9lL+4s1IgOXr
         yrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=egNFN6wJrz0fv/icBKiyuH1pCdcaQPddX7ketsRVnQg=;
        b=X18AKHJAxAqFD0VwmuW/2wegKPnPrwVi2jV0Lvn+qC2BwIayZ+0rV2HoHgkRJKO5Bg
         PGB9GPRozQq9qLicMfWwkmD+gfS4vhx6WEzuhuFZFNMZJbdy2LVm+RGzFq5XsRnoWUIN
         l+R0syqP5qKdRbNSs0SG4s2WAbZDHoYM77BClFXDhFcLtmlfQU9exGfPpqomhXW/DZiy
         O1nr4W0oMB1hYNSYPd+p7kBho7qa+dzCy65yDTylqm7J4h39kotOhkgxP8/GkqDDgwsB
         j7emoAf+mj4rt9TuMdyfTPMtm916EcypucBXtcbnF7AEiJp9rt1PchWANS6sFhdkx+iB
         VWVw==
X-Gm-Message-State: AOAM532Qas+HcyiCkVQeTPTB1PFzxoEEwGOezDLhzkJh5u3iggHrYFOj
        8miHwZjil/lZHqtqpqXI4SQ=
X-Google-Smtp-Source: ABdhPJxSL2bWyY24MD/8MmpUA0uTMWzddwS25odkoGDYFZTW0NB6X94wPllX9qd9L92eRx6TGueG9g==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr22733699ljn.198.1593858497688;
        Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 2/3] dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
Date:   Sat,  4 Jul 2020 12:28:05 +0200
Message-Id: <20200704102806.735713-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2:
  - Add missing types (Rob)
  - Fix example to specify panel@0 (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e8aa0.txt         |  56 ----------
 .../display/panel/samsung,s6e8aa0.yaml        | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 56 deletions(-)
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
index 000000000000..f155074726d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -0,0 +1,100 @@
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  reset-delay:
+    description: delay after reset sequence [ms]
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    type: boolean
+
+  flip-vertical:
+    description: boolean to flip image vertically
+    type: boolean
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
+        panel@0 {
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
2.25.1

