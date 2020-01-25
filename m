Return-Path: <SRS0=DFaX=3O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E18FC35246
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 20:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 381572077C
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 20:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uGJ3SPCG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgAYUfQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jan 2020 15:35:16 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:46098 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgAYUfQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jan 2020 15:35:16 -0500
Received: by mail-lj1-f179.google.com with SMTP id x14so4146916ljd.13
        for <devicetree@vger.kernel.org>; Sat, 25 Jan 2020 12:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tL5tN7BFhbx/5tBSxqRSV1CCaw7I2keWgntLNIP9XUE=;
        b=uGJ3SPCGt95PJiZuyAS37YHpzd5r2ksAGnaD/G41dqNDoJTPwwHoLcgAcO1Afp5NHx
         cUzXQDeBfxxIb4NKrE1qAyaEtLs+mh2yH5UxhZZIltO5NRD1xc5/cHSyt38+qJ86247Z
         HlIPzO7XoziaPRwIRXatslmW8DeB6rY/F6HobjLs11YRr/wsYcHJGEawW6nZ+BfMuWJy
         nEvcTCW2XDrQM4CglQkNgETJHN4i3u5HR+GBpps+vz2T6pLc8iQ9xYycAq2xT/Ziqub9
         bWX28yH43zucr1d7hA1ZCs2CqWE0VCvEZGVLh1jMk5gqMeCwwZIUDgDnrEfq7L7+HfeC
         vnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tL5tN7BFhbx/5tBSxqRSV1CCaw7I2keWgntLNIP9XUE=;
        b=syhG4luMr521klG18NkSp5LL1SsUylViGPJtwBYAUTvxvzx+z696iBKo4VhwoDWeae
         Ru8QHldbXBA5q/6wmrLEzI+sRsRY/5TaFh36JrVuaNJ0HLsSwAUUyPvaIxK1Bbgh5dOA
         YYwPoXlHhvWIrLypwg1PiyCsUnbOxR7ZRNH8KXw4SCwNUv6RZsJCPBrC+hUvanaa7IPK
         nv0oUJOZAfUWZKWzsu+2gxZMF23O3cn8efNYd2GY1KkOrj16y/PEqB4ZRKiZFuk5TDSe
         X/dorhv1Fe6480BKdw73XqS7DkzEnt2vXIR8l7n3T5PVrrc9Rj4v6Dz/0Np7Vs09Hsor
         AVFQ==
X-Gm-Message-State: APjAAAXeLfwglbuWL0VsNtb3UYbGQ/4bVdhxtIkE2SQdmkgzehULVSMW
        +LhjtwwW8GG2zfS7cu2oaog=
X-Google-Smtp-Source: APXvYqxhs2nVMYDobyqfXD72yB1NwAL0FeIkeK0VmLND8fACDPFyDqDMS49/8OoBfGoC1MDs6u+plQ==
X-Received: by 2002:a2e:9691:: with SMTP id q17mr5890243lji.91.1579984514704;
        Sat, 25 Jan 2020 12:35:14 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u17sm5393937ljk.62.2020.01.25.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 12:35:14 -0800 (PST)
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
Subject: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT schema
Date:   Sat, 25 Jan 2020 21:34:54 +0100
Message-Id: <20200125203454.7450-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200125203454.7450-1-sam@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/display/panel/panel-dpi.txt      | 50 -------------
 .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 50 deletions(-)
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
index 000000000000..a8e37318ec05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -0,0 +1,71 @@
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
+    contains:
+      const: panel-dpi
+    description:
+      Shall contain "panel-dpi" in addition to an optional panel-specific
+      compatible string defined in individual panel bindings.
+      "panel-dpi" can be used alone, thus no dedicated binding file
+      is required for each and every panel.
+
+  vcc-supply:
+    description: |
+      Regulator that will be used to enable power to the display
+
+  label: true
+  enable-gpios: true
+  reset-gpios: true
+  backlight: true
+  panel-timing: true
+  port: true
+
+required:
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    panel@0 {
+      compatible = "panel-dpi";
+      label = "lcd";
+      vcc-supply = <&vcc_supply>;
+
+      backlight = <&backlight>;
+
+      port {
+        lcd_in: endpoint {
+          remote-endpoint = <&dpi_out>;
+        };
+      };
+      panel-timing {
+        clock-frequency = <9200000>;
+        hactive = <800>;
+        vactive = <480>;
+        hfront-porch = <8>;
+        hback-porch = <4>;
+        hsync-len = <41>;
+        vback-porch = <2>;
+        vfront-porch = <4>;
+        vsync-len = <10>;
+
+        hsync-active = <0>;
+        vsync-active = <0>;
+        de-active = <1>;
+        pixelclk-active = <1>;
+      };
+    };
-- 
2.20.1

