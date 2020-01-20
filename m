Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31E9C33CAA
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6803F2253D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9MTg2sR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgATUHH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:07:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33085 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgATUHG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 15:07:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so405171lji.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DDZtG0fHm3Few9S3Ffbq1g5h/5cEUnOZq02EIkZMN4=;
        b=k9MTg2sRV2KVG7dtOpDwpnuC9u0WBO7odLoXJLo+Hlhi0TUO2Iy5199QRUBysm1uFZ
         RJBqN46N1a8YzrGDuir5KvzCb0lmFBvskHuVXiSFr01Vm3yolctLTnm0xb+eHC2jKGkq
         3Zfsf3+X2oUQ7ci9qmuRg/1GM6tgpls3/Hqdf6XvmO701IGvAUgKSwnHbCxJkNoZ045Y
         zy9QaA5JivtGuoFhHTklA34UfVXtlwPyVKM/GuONRegX4n55qPlT5w1eP6rxZW9ivEIU
         wIG27r0uAdGHVJLR0kQE60ulxyn5nER3O+FyZXOOccvCdwzjIt7BwmvAniFabaEgeq5L
         LUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5DDZtG0fHm3Few9S3Ffbq1g5h/5cEUnOZq02EIkZMN4=;
        b=LwWUhZQMKZeS+eeCQZow61A87cD3CKAf8GyGfu4dx/ifoKV33nBqZ/vrVCrzLYbhnS
         sFZUGuNW0Uj8X4UP1M750vb8YbCx0ceSJOAh9oRZ0rfOBvcBT7UY6Ci75BhD7Tdi0i/3
         XZo3uVkcmbGWCxxGW6MSEZ10y0m8Ou6qvoTSzpxCeqrkLackmZPNjmqkLhjrDov0166o
         a4l4QjMu1hjNRYKb1VADmhCIPn6WQRGsfB233pYByjSX6y46bZN5XkidHWpbWpQyq/sL
         oPyiKr7D8Wy5fqaiMt+tCINdqqd/oFpTV9HG42KEhoo9rI5eHbfcLH6TvQrrSl8vUpNn
         dzsw==
X-Gm-Message-State: APjAAAXVO+yc8TFzVD1aGfYuC6hq2btfyy4hk9o61cXcspqhFuGUpM5u
        vcaMPChnp9bZyIn8dSY10LLPo9vj0Ag=
X-Google-Smtp-Source: APXvYqy7uL9isd/QPuSfvQwX04TrXJYyvG/X1Gk0wKohh3D6Kwz/SfyK68wqwkG2dRohF8Fe3rHYNg==
X-Received: by 2002:a2e:943:: with SMTP id 64mr14479161ljj.17.1579550823843;
        Mon, 20 Jan 2020 12:07:03 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id o12sm17332476ljj.79.2020.01.20.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 12:07:03 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Date:   Mon, 20 Jan 2020 21:06:39 +0100
Message-Id: <20200120200641.15047-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120200641.15047-1-sam@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add meta-schema variant of panel-timing and
reference it from panel-common.yaml.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/panel-common.yaml  |   7 +-
 .../bindings/display/panel/panel-timing.yaml  | 253 ++++++++++++++++++
 2 files changed, 256 insertions(+), 4 deletions(-)
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
index 000000000000..59891c7a58ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -0,0 +1,253 @@
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
+  There are different ways of describing the timing data data of a panel. The
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
+   $ref: /schemas/types.yaml#/definitions/uint32
+   description: |
+     Panel clock in Hz
+
+  hactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+       Horizontal panel resolution in pixels
+
+  vactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Verical panel resolution in pixels
+
+  hfront-porch:
+    description: |
+      Horizontal front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Horizontal back porch timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Horizontal sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical back porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  vsync-active:
+    description: |
+      Vertical sync pulse.
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  de-active:
+    description: |
+      Data enable.
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  pixelclk-active:
+    description: |
+      Data driving on rising or falling edge
+    oneOf:
+      - const: 0
+        description: |
+          Drive pixel data on falling edge and
+          sample data on rising edge
+      - const: 1
+        description: |
+          Drive pixel data on rising edge and
+          sample data on falling edge
+
+  syncclk-active:
+    description: |
+      Drive sync on rising or sample sync on falling edge.
+      If not specified then the same as pixelclk-active
+    oneOf:
+      - const: 0
+        description: |
+          Drive sync on falling edge and
+          sample sync on rising edge of pixel clock
+      - const: 1
+        description: |
+          Drive sync on rising edge and
+          sample sync on falling edge of pixel clock
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

