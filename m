Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB50EC32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E9A922522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4qJLGC+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgATUHL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:07:11 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:33845 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATUHL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 15:07:11 -0500
Received: by mail-lj1-f175.google.com with SMTP id z22so401712ljg.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kuJ/ORP4+g5NQP/GE+6GKKCVKyl0ll30JpRdoi6mUI=;
        b=N4qJLGC+mHLDoOa+V03ddJmWtCrUqnYp/lelQvjXdWBodpfJaKSKgJtAFyXscGWlCn
         O6NW8DNmHhTMCM6THNDoTcCE3G0zC20ekhZN8AWxY4LDJUAG9r4pGiG2uotcb/sRTbgY
         iC576c7JE8HnK7FbJT9FqMaVQQTrvCOyfqOLt8Quhx46I4/knegl7A5YXIuN1s/R+ii5
         iAuhVi6ytqqGJqqwMZBlZgEaCEYF+Avpq5oB3hw80GY+mjr3RddGaxktT6l/7f38fm0I
         FrQCmQM2CN08hDn0OvF8zQWdKUVDP/E4eT6ICyfCJanylyhOcXucKjl+7k8P8jDj1+6X
         zMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/kuJ/ORP4+g5NQP/GE+6GKKCVKyl0ll30JpRdoi6mUI=;
        b=Ky1HWHQvkrVPnlJ8UG/g9FiCzDVphREJZgY1uEAJSlFDPpvtboftIz1lOu6arfgJWS
         dXZiW1bB0PvQ5X41loCkM1mlLnPuNjph0DoptCLAozn8zE9nruZZjTN5nLsP9JM++qCD
         cOrrllYAxfrRRwyQ+68kgdrfXhibd+W64FIdzVgMLdAoc33oqGAO7yt/8v+TufUTTlMu
         lzZfxTLwXhbqrHqeSu/abzNMlRIOduPLdMQzLv7v2YTNp4Zl8iXrq/zCwHqHiiAfasHy
         uQLqUfdtTjZgIUZecYAeGOpRijbTmz6Oyz4JyXtWKqEupKl8DXL6n+2uCp8NZgYwvnKN
         gohw==
X-Gm-Message-State: APjAAAXy2FGd654DX+9DtFisrwqtforP0UXPjmhkpjXL5kX//p5qobn2
        BZzu9GGSWjrhqaCgl30CmDK51bfY8CU=
X-Google-Smtp-Source: APXvYqxzOSkcdvvVhIic2TIHiodXwPKStxIxK5q0hSK/EiKI4O/bfEKZ1w+CxsiF0KfqjfVm29ygxQ==
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr13085114ljh.136.1579550828414;
        Mon, 20 Jan 2020 12:07:08 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id o12sm17332476ljj.79.2020.01.20.12.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 12:07:07 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 3/3] dt-bindings: display: convert panel-dpi to DT schema
Date:   Mon, 20 Jan 2020 21:06:41 +0100
Message-Id: <20200120200641.15047-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120200641.15047-1-sam@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With panel-timing converted, now convert the single
remaining .txt user in panel/ of panel-timing to DT schema.

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
index 000000000000..4e19c1fd52c3
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
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: panel-dpi
+    description:
+      Shall contain "panel-dpi" in addition to a mandatory panel-specific
+      compatible string defined in individual panel bindings. The "panel-dpi"
+      value shall never be used on its own.
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
+      compatible = "samsung,lte430wq-f0c", "panel-dpi";
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
+        hactive = <480>;
+        vactive = <272>;
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

