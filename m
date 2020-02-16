Return-Path: <SRS0=AK1n=4E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1119C76199
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 818692086A
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ9WP5Cc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgBPSPl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 13:15:41 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:34631 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgBPSPk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Feb 2020 13:15:40 -0500
Received: by mail-lj1-f180.google.com with SMTP id x7so16227649ljc.1
        for <devicetree@vger.kernel.org>; Sun, 16 Feb 2020 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M576Y01Az48NWOqCNh5DN/YDcZWavtf35b6+dPcXGTk=;
        b=gZ9WP5CcdrghC+ukDbXDAeh1kCxoRfVDDhtYvgZI5hpMLqbWi5zVdLOlsNBRnOStSP
         mPtzcxssX4wN2peaZBX7GXQJoW2LZZumFy7biE+3WlucCAohrN41+5FlFlIQIOSNNJRA
         r9hksG9/hz0XpoXGsRQEJ8TUHvdSKWya0lVAEUVyTOh4ZZ1+3Kqu4les5eK44yeTDN5x
         vQsZyHcoZdOO7AGHHBOez8PyxivvNNbexGjIzo1KMpy59tRLs+ZxbyMMTkafvj+w/lwt
         FAXLeiwSF3FFpWVDYvSAGjXsVE8SEey4DqegEtsOBRRhj1tIJqXiKvo/80XvJd5L4O5u
         Q6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=M576Y01Az48NWOqCNh5DN/YDcZWavtf35b6+dPcXGTk=;
        b=X4jef+YE7qjR/f5Y1W25eiS78lu9kXy6e21UXFz88J6G+9DN6AvvhGncQkR4hckwEE
         ig51W4EvhKkxPMB3FePznwqwJcfLbYMZ871awGRj3j65YPHX9fV1IW2aHZ+qB6yjTXrL
         vGmfLl4f1l74QSnk8m8wWnjxylrvMYLJ1uWmNjxFr+e2IpsQq1O9fMhWS9q8QFnzQhRP
         QIsmqsw9eBdkVxa6SUdCSLnhyz4YRMQ7Oi/hA7e6YErw2bny8/rP5BMnfdx5HBZG5CGh
         0869sFiSHCFBaOzP84cuN0rw37tbHGhAYx8cuGz3KPDIqdypo78bDHAwK3in10bQU9Fv
         xv0w==
X-Gm-Message-State: APjAAAUf4J5JXEShd5SSJ0tYRnuhdQP5v2QdgSDg9dRl/U3TpIZnZV2v
        nNj3xxU7/W6GfK3i/ufzgsE=
X-Google-Smtp-Source: APXvYqyDwVpMc2gasRlyFfrK1g7kFEUVRNpPpv3Evz79tUnzi3bdDHfsXOT+loxfVFDLyfIY2V+WxA==
X-Received: by 2002:a2e:909a:: with SMTP id l26mr7450153ljg.209.1581876937673;
        Sun, 16 Feb 2020 10:15:37 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u15sm6157431lfl.87.2020.02.16.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 10:15:37 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/5] dt-bindings: display: convert panel-dpi to DT schema
Date:   Sun, 16 Feb 2020 19:15:11 +0100
Message-Id: <20200216181513.28109-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With panel-timing converted, now convert the single
remaining .txt user in panel/ of panel-timing to DT schema.

v2:
  - Drop Thierry as maintainer, as this is not a general panel binding
    and I have no acks.
  - Drop requirement for a panel- specific binding - "panel-dpi" is enough
  - Updated example

v3:
  - added yaml document terminator "..."
  - always require a specific binding - panel-dpi (based on feedback from Rob)
  - use "power-supply" for the supply property, and made it mandatory
    "power-supply" is the standard property for panels

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/display/panel/panel-dpi.txt      | 50 -------------
 .../bindings/display/panel/panel-dpi.yaml     | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
deleted file mode 100644
index 6b203bc4d932..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Generic MIPI DPI Panel
-======================
-
-Required properties:
-- compatible: "panel-dpi"
-
-Optional properties:
-- label: a symbolic name for the panel
-- enable-gpios: panel enable gpio
-- reset-gpios: GPIO to control the RESET pin
-- vcc-supply: phandle of regulator that will be used to enable power to the display
-- backlight: phandle of the backlight device
-
-Required nodes:
-- "panel-timing" containing video timings
-  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
-- Video port for DPI input
-
-Example
--------
-
-lcd0: display@0 {
-        compatible = "samsung,lte430wq-f0c", "panel-dpi";
-        label = "lcd";
-
-        backlight = <&backlight>;
-
-        port {
-            lcd_in: endpoint {
-                    remote-endpoint = <&dpi_out>;
-            };
-        };
-
-        panel-timing {
-                clock-frequency = <9200000>;
-                hactive = <480>;
-                vactive = <272>;
-                hfront-porch = <8>;
-                hback-porch = <4>;
-                hsync-len = <41>;
-                vback-porch = <2>;
-                vfront-porch = <4>;
-                vsync-len = <10>;
-
-                hsync-active = <0>;
-                vsync-active = <0>;
-                de-active = <1>;
-                pixelclk-active = <1>;
-        };
-};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
new file mode 100644
index 000000000000..40079fc24a63
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI DPI Panel
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    description:
+      Shall contain a panel specific compatible and "panel-dpi"
+      in that order.
+    items:
+      - {}
+      - const: panel-dpi
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  reset-gpios: true
+  width-mm: true
+
+required:
+  - panel-timing
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel@0 {
+        compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
+        label = "osddisplay";
+        power-supply = <&vcc_supply>;
+
+        backlight = <&backlight>;
+
+        port {
+            lcd_in: endpoint {
+                remote-endpoint = <&dpi_out>;
+            };
+        };
+        panel-timing {
+            clock-frequency = <9200000>;
+            hactive = <800>;
+            vactive = <480>;
+            hfront-porch = <8>;
+            hback-porch = <4>;
+            hsync-len = <41>;
+            vback-porch = <2>;
+            vfront-porch = <4>;
+            vsync-len = <10>;
+
+            hsync-active = <0>;
+            vsync-active = <0>;
+            de-active = <1>;
+            pixelclk-active = <1>;
+        };
+    };
+
+...
-- 
2.20.1

