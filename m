Return-Path: <SRS0=DFaX=3O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39584C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 20:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0001520708
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jan 2020 20:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uSYa57wC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAYUfN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jan 2020 15:35:13 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:35497 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgAYUfN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jan 2020 15:35:13 -0500
Received: by mail-lf1-f48.google.com with SMTP id z18so3582985lfe.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jan 2020 12:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDsn4U1W83k0QQhjFWJ55QDTTyCPGlXIDjTfXp6DfPY=;
        b=uSYa57wCQlNeJ0M3sliFCTtwUcVkvKfgK8QHDTyTDPEM4MPAiq5eDvlPHqFuG68w9Q
         0GOJPI9ZizuxbR4F2WJNrzwR1Ae0dU1yl7Tsqit8UYKxwm7scvlxS9ufqbz4Ho4HEVlG
         ucHlL37sAC3Zva8/mg6/mqlb+9+1SK4+v8nDzfYg9Zx7sK3RMluP7h69HV2S6hCzXbRX
         /yVZ9I6eJtjqTr4SvjV8+f1B8/B5mKGvDM6Wb6EkvB3zPsRnohv/vHBLa83M3wAEgZzZ
         yoRNK1vI/mzAPSz1duTjqiYRCkAbxv91MGV2RqYQSbZTg2Hr0stY4iSnF7jWfF3LMz3g
         9nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JDsn4U1W83k0QQhjFWJ55QDTTyCPGlXIDjTfXp6DfPY=;
        b=rHmGjqOwUn9VT07r5rWaRVcMbKBuI1HjRjZTiO6KHkFHww9EWws8unwPBp7Sa7olc4
         jcma2JsLXJWr0Dvb4Zu9Vwb4ep5Uqiyk4qbhDs+QLBLiyn/+W+cT+xXfM+zdxr3394je
         QG9zssT8pkwJr6vrUTF0ox9zh/hzTgWoyPbX/WilRVU0+TQ0B8XQgthbZoHS4YMzSFbf
         DKc4z9HyGUQoyOFwBSIA86ttACzLzz1MDLGxHS/o1Q4k3h2tJm9XvpnXRrv/8Oo5GlYH
         vhYxWQg3BHiGG6Kw0cvpEFTcMsJoNr2JNXDE/m/7delEt6iFYA+DjZmQJ5I1nITDxWbp
         4JrA==
X-Gm-Message-State: APjAAAWjSfTIp2RhRZ4Ih6jGTHfLyeufySVd2WTOeueVcS539FgRYnJP
        SlnP30DmLbImJOrwBhyda/w=
X-Google-Smtp-Source: APXvYqxaTjEwhaYYQxUJKmRMxqnhW2x2YjAGAQVpYon/3NCCUqL1QBgMMWN71yW3eK/Sdrl8I06fqg==
X-Received: by 2002:ac2:544f:: with SMTP id d15mr4520428lfn.126.1579984510739;
        Sat, 25 Jan 2020 12:35:10 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u17sm5393937ljk.62.2020.01.25.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 12:35:10 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: display: add panel-timing.yaml
Date:   Sat, 25 Jan 2020 21:34:52 +0100
Message-Id: <20200125203454.7450-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200125203454.7450-1-sam@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add meta-schema variant of panel-timing and
reference it from panel-common.yaml.

Part of this came form other files with other
licenses - original commits:

cc3f414cf2e4 ("video: add of helper for display timings/videomode")
86f46565dff3 ("dt-bindings: display: display-timing: Add property to configure sync drive edge")
9cad9c95d7e8 ("Documentation: DocBook DRM framework documentation")

The original authors acked the license change to:
(GPL-2.0-only OR BSD-2-Clause)

v2:
  - Got OK from original authors for re-license
    Huge thanks for the quick replies!
  - Typo fixes (Oleksandr)
  - Drop -array variant when not needed (Maxime)
  - Replace oneOf:... with enum (Maxime)
  - Drop type from clock-frequency (Rob)
  - Drop "|" when not needed (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/panel-common.yaml  |   7 +-
 .../bindings/display/panel/panel-timing.yaml  | 227 ++++++++++++++++++
 2 files changed, 230 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-timing.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ef8d8cdfcede..8070c439adbd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -54,13 +54,12 @@ properties:
 
   # Display Timings
   panel-timing:
-    type: object
     description:
       Most display panels are restricted to a single resolution and
       require specific display timings. The panel-timing subnode expresses those
-      timings as specified in the timing subnode section of the display timing
-      bindings defined in
-      Documentation/devicetree/bindings/display/panel/display-timing.txt.
+      timings.
+    allOf:
+      - $ref: panel-timing.yaml#
 
   # Connectivity
   port:
diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
new file mode 100644
index 000000000000..bdfb6d461529
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-timing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: panel timing bindings
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  There are different ways of describing the timing data of a panel. The
+  devicetree representation corresponds to the one commonly found in datasheets
+  for panels. If a panel supports multiple signal timings, the native-mode
+  can be specified.
+
+  The parameters are defined as seen in the following illustration.
+
+  +----------+-------------------------------------+----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vback_porch                 |          |       |
+  |          |        v                            |          |       |
+  +----------#######################################----------+-------+
+  |          #        ^                            #          |       |
+  |          #        |                            #          |       |
+  |  hback   #        |                            #  hfront  | hsync |
+  |   porch  #        |       hactive              #  porch   |  len  |
+  |<-------->#<-------+--------------------------->#<-------->|<----->|
+  |          #        |                            #          |       |
+  |          #        |vactive                     #          |       |
+  |          #        |                            #          |       |
+  |          #        v                            #          |       |
+  +----------#######################################----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vfront_porch                |          |       |
+  |          |        v                            |          |       |
+  +----------+-------------------------------------+----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vsync_len                   |          |       |
+  |          |        v                            |          |       |
+  +----------+-------------------------------------+----------+-------+
+
+
+  The following is the panel timings shown with time on the x-axis.
+  This matches the timing diagrams often found in data sheets.
+
+              Active                 Front           Sync           Back
+              Region                 Porch                          Porch
+  <-----------------------><----------------><-------------><-------------->
+    //////////////////////|
+   ////////////////////// |
+  //////////////////////  |..................               ................
+                                             _______________
+
+  Timing can be specified either as a typical value or as a tuple
+  of min, typ, max values.
+
+properties:
+
+  clock-frequency:
+   description: Panel clock in Hz
+
+  hactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Horizontal panel resolution in pixels
+
+  vactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Vertical panel resolution in pixels
+
+  hfront-porch:
+    description: |
+      Horizontal front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  hback-porch:
+    description: Horizontal back porch timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  hsync-len:
+    description: Horizontal sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  vfront-porch:
+    description: Vertical front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  vback-porch:
+    description: Vertical back porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  vsync-len:
+    description: Vertical sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  hsync-active:
+    description: |
+      Horizontal sync pulse.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  vsync-active:
+    description: |
+      Vertical sync pulse.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  de-active:
+    description: |
+      Data enable.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  pixelclk-active:
+    description: |
+      Data driving on rising or falling edge.
+      Use 0 to drive pixel data on falling edge and
+      sample data on rising edge.
+      Use 1 to drive pixel data on rising edge and
+      sample data on falling edge
+    enum: [0, 1]
+
+  syncclk-active:
+    description: |
+      Drive sync on rising or sample sync on falling edge.
+      If not specified then the setup is as specified by pixelclk-active.
+      Use 0 to drive sync on falling edge and
+      sample sync on rising edge of pixel clock.
+      Use 1 to drive sync on rising edge and
+      sample sync on falling edge of pixel clock
+    enum: [0, 1]
+
+  interlaced:
+    type: boolean
+    description: Enable interlaced mode
+
+  doublescan:
+    type: boolean
+    description: Enable double scan mode
+
+  doubleclk:
+    type: boolean
+    description: Enable double clock mode
+
+required:
+ - clock-frequency
+ - hactive
+ - vactive
+ - hfront-porch
+ - hback-porch
+ - hsync-len
+ - vfront-porch
+ - vback-porch
+ - vsync-len
+
+additionalProperties: false
-- 
2.20.1

