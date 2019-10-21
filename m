Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE2ECA9EB7
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 13:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 346B12166E
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 13:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o3pc+fU/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbfJUNjz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 09:39:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38194 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbfJUNjy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 09:39:54 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so12858728wmi.3
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxZzIwlDD5DO3Dig1AAmB3NX72gSPtCfOYTtxG2Ms5Q=;
        b=o3pc+fU/IFhuH3lLsX421aMMLNgviKUCS8A1bpdOmWwPY+qswyHRHsftp/JYKIgYCT
         FDKGAHGBuyqR6IE5DhsJIbh1tZwPUOfQC9iRtmBMXQINkFEeWondGaIU4S0d3uPPlvZ1
         RywTXQ0VjFlT5oqDG151fTDTrhpQqSr8vUdHplHloWnbCANc+Y0iKvua71c+LMkCJZq/
         a3gXTpfWTSZIYtv+XBfny+NVQIojTHjJbK9l/GUakkcOSw8FqYpwiQJuEV2bhPXsvCui
         RN4vRrsTpwB4XDDjLBDDLu3/nN/uCyuugzpAmsBVbeSzcTya/2YiF2eOS/d1hHTcNSXN
         cPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxZzIwlDD5DO3Dig1AAmB3NX72gSPtCfOYTtxG2Ms5Q=;
        b=SKGWFqYycbxF+ZXbWUCgkAFexCTN+Jz0Z9mterMsh78SbWHQnDaORZpE3KNe/bWqJk
         RZAiE0SybV0cYI5+emoa/usvAzeVk+QKJ44kIl9TsweAKjNu6pBsvfJI5+i94Gr+mbKa
         n1tUgiuyr14ExiLgfGa3WG+GpnraRGYOswfaMNH++TAv19zBBGwji6aeKfknHhWGlUTn
         /QR56bLa9c/34cJvmNaqoOotghBDvrhKcrdAVUpm1FqC5NV/6OBl+R5fyzWWKt31hnOd
         dkQIqtwWNJBueXP8ocgzZPWC+rDObprxt4DFakQglIv/kwEH2MDG9FGudVoFpHAJZY7w
         Gz8A==
X-Gm-Message-State: APjAAAVBV8mSS0HQOqzRQdM+hXU2jvqTNTi3XD9m6muKqPLMAFYPAMzL
        n16kj2vDVcVYrPIX0OCnTQk64A==
X-Google-Smtp-Source: APXvYqzYcRG7qQc57VrQDTccwlNW2H5DWKsVDXNVe8OUa6L1J6a/dYF402AJ/L9jlUOo8hOKSLt6TA==
X-Received: by 2002:a1c:39c1:: with SMTP id g184mr1936913wma.75.1571665192059;
        Mon, 21 Oct 2019 06:39:52 -0700 (PDT)
Received: from localhost.localdomain (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 17sm4050552wmg.29.2019.10.21.06.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 06:39:51 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        mjourdan@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] dt-bindings: soc: amlogic: canvas: convert to yaml
Date:   Mon, 21 Oct 2019 15:39:50 +0200
Message-Id: <20191021133950.30490-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Canvas over to a YAML schemas.

Cc: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/soc/amlogic/amlogic,canvas.txt   | 33 -------------
 .../bindings/soc/amlogic/amlogic,canvas.yaml  | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
deleted file mode 100644
index e876f3ce54f6..000000000000
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Amlogic Canvas
-================================
-
-A canvas is a collection of metadata that describes a pixel buffer.
-Those metadata include: width, height, phyaddr, wrapping and block mode.
-Starting with GXBB the endianness can also be described.
-
-Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
-rather than use the phy addresses directly. For instance, this is the case for
-the video decoders and the display.
-
-Amlogic SoCs have 256 canvas.
-
-Device Tree Bindings:
----------------------
-
-Video Lookup Table
---------------------------
-
-Required properties:
-- compatible: has to be one of:
-		- "amlogic,meson8-canvas", "amlogic,canvas" on Meson8
-		- "amlogic,meson8b-canvas", "amlogic,canvas" on Meson8b
-		- "amlogic,meson8m2-canvas", "amlogic,canvas" on Meson8m2
-		- "amlogic,canvas" on GXBB and newer
-- reg: Base physical address and size of the canvas registers.
-
-Example:
-
-canvas: video-lut@48 {
-	compatible = "amlogic,canvas";
-	reg = <0x0 0x48 0x0 0x14>;
-};
diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
new file mode 100644
index 000000000000..4322f876753d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/amlogic/amlogic,canvas.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Canvas
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Maxime Jourdan <mjourdan@baylibre.com>
+
+description: |
+  A canvas is a collection of metadata that describes a pixel buffer.
+  Those metadata include: width, height, phyaddr, wrapping and block mode.
+  Starting with GXBB the endianness can also be described.
+
+  Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
+  rather than use the phy addresses directly. For instance, this is the case for
+  the video decoders and the display.
+
+  Amlogic SoCs have 256 canvas.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - amlogic,meson8-canvas
+          - amlogic,meson8b-canvas
+          - amlogic,meson8m2-canvas
+        - const: amlogic,canvas
+      - const: amlogic,canvas # GXBB and newer SoCs
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    canvas: video-lut@48 {
+        compatible = "amlogic,canvas";
+        reg = <0x48 0x14>;
+    };
+
-- 
2.22.0

