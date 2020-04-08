Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5CFC3815B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CCBC20784
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vPy7rZPV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbgDHTwQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:16 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:34321 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbgDHTwQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:16 -0400
Received: by mail-lf1-f44.google.com with SMTP id x23so6122078lfq.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UaQ+HDWOcDJg2PzIg7A/lDZq8DG/v1aGP7KWn5jo82w=;
        b=vPy7rZPVCZIpcAp/m4emBCBHw13/i02AvxtVLgeSBdcDZxUIImC8OIcfeANDuxVF0c
         J210U2dfRVgAstKRe5NqEB2sXiiIfPiVgFPvbJ7URYDnAhktfwQpB0yZ2nMkcjPJtkRh
         wMFMDYT2YrBjA8lbX2yEhAX4SLICyiCUGYekcFudopCEBCd0lHS3GvJTregTjdXkB0qG
         vCgZS33lDKud6u22wi5BJh7WDbAZlkuqMn6orZM9VCeLb97rPwi0FyWGSLYL5B3HvwaO
         M+7PFd2++5QYNG/YCFY8DWLd2XgSdPgyUzjKCeaCxqar2LRthDKfLAiHk/wpZml0LKFJ
         qAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UaQ+HDWOcDJg2PzIg7A/lDZq8DG/v1aGP7KWn5jo82w=;
        b=gJuaBNXhJFv3mvpbbCkAqXtuaNjEG7AAVIbdPVbBx9IvwpKOpqi5ddiPYcN4nMOPKG
         alOLFxpj1/cxF29lUTG0Hc47LTMcrHuuzrjg26jAcq/e/7OU7h7L9XqmWKD1UdOIGS9I
         iEeNMZeh7mkuU7wP+Q1d50ZgLaE9JtLZuWXjm+OjaLG+kVHYjjYZxBfYWXmedWzAeNHh
         70PjyUA4Na0uoyjUCycHXJtr3RjFGGRwxAGAyxupbJplsBwliqw+jm85wpuYwdTMYD78
         /j26GAYUbJuHWVKRzUjNO51eEOX6hfPa2AyPOqhEn2KG7DL2OzwJCCIMAC6heqaChROx
         ZbHA==
X-Gm-Message-State: AGi0Pubx9+cKwvpmsVwk8Q1tYDgEsAovdTLm+Mmc9ki5v7c28q2KnkzA
        t13JBVNei1qJ3l1lLP5OiLUoAurF2Uc=
X-Google-Smtp-Source: APiQypLhNkpQIAm18LfWKvuhweXYg9cVsI5p1Rb3QOLWv1Vkn7xaGYGKrP7Ob3YMkdvyIda+sLa7OQ==
X-Received: by 2002:a19:760a:: with SMTP id c10mr215115lff.126.1586375534418;
        Wed, 08 Apr 2020 12:52:14 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:13 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v2 31/36] dt-bindings: display: convert sharp,ls037v7dw01 to DT Schema
Date:   Wed,  8 Apr 2020 21:51:04 +0200
Message-Id: <20200408195109.32692-32-sam@ravnborg.org>
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
  - Add min/maxItems to mode-gpios (Rob)
  - Fix bug in description, mode is up to three gpios (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ls037v7dw01.txt       | 43 ------------
 .../display/panel/sharp,ls037v7dw01.yaml      | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
deleted file mode 100644
index 0cc8981e9d49..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-SHARP LS037V7DW01 TFT-LCD panel
-===================================
-
-Required properties:
-- compatible: "sharp,ls037v7dw01"
-
-Optional properties:
-- label: a symbolic name for the panel
-- enable-gpios: a GPIO spec for the optional enable pin.
-  This pin is the INI pin as specified in the LS037V7DW01.pdf file.
-- reset-gpios: a GPIO spec for the optional reset pin.
-  This pin is the RESB pin as specified in the LS037V7DW01.pdf file.
-- mode-gpios: a GPIO
-  ordered MO, LR, and UD as specified in the LS037V7DW01.pdf file.
-
-Required nodes:
-- Video port for DPI input
-
-This panel can have zero to five GPIOs to configure to change configuration
-between QVGA and VGA mode and the scan direction. As these pins can be also
-configured with external pulls, all the GPIOs are considered optional with holes
-in the array.
-
-Example
--------
-
-Example when connected to a omap2+ based device:
-
-lcd0: display {
-	compatible = "sharp,ls037v7dw01";
-	power-supply = <&lcd_3v3>;
-	enable-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;	/* gpio152, lcd INI */
-	reset-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;	/* gpio155, lcd RESB */
-	mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH	/* gpio154, lcd MO */
-		      &gpio1 2 GPIO_ACTIVE_HIGH		/* gpio2, lcd LR */
-		      &gpio1 3 GPIO_ACTIVE_HIGH>;	/* gpio3, lcd UD */
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
new file mode 100644
index 000000000000..8c47a9b0b507
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls037v7dw01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SHARP LS037V7DW01 TFT-LCD panel
+
+description: |
+  This panel can have zero to five GPIOs to configure to change configuration
+  between QVGA and VGA mode and the scan direction. As these pins can be also
+  configured with external pulls, all the GPIOs are considered optional with holes
+  in the array.
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls037v7dw01
+
+  label: true
+  enable-gpios: true
+  reset-gpios: true
+  port: true
+  power-supply: true
+
+  mode-gpios:
+    minItems: 1
+    maxItems: 3
+    description: |
+      GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
+      This panel can have zero to three GPIOs to configure to
+      change configuration between QVGA and VGA mode and the
+      scan direction. As these pins can be also configured
+      with external pulls, all the GPIOs are considered
+      optional with holes in the array.
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    lcd0: display {
+        compatible = "sharp,ls037v7dw01";
+        power-supply = <&lcd_3v3>;
+        enable-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;    /* gpio152, lcd INI */
+        reset-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;     /* gpio155, lcd RESB */
+        mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
+                      &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
+                      &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */
+
+        port {
+            lcd_in: endpoint {
+                remote-endpoint = <&dpi_out>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

