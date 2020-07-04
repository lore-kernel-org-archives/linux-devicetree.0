Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CADC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FAF320870
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIRqKQYC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGDK2V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 06:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDK2V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 06:28:21 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFE7C061794
        for <devicetree@vger.kernel.org>; Sat,  4 Jul 2020 03:28:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so39727873ljm.11
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2020 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5wlEjaiimAhiMOgTbXBv9o5NagLYnP7pgeN7/QqAPI=;
        b=XIRqKQYCa/UTfgcJDFZRIe4yREdW/CHWiTGba7Bnh3IcBNSXGOUQkxMkK8HVkH13x7
         xwHitVh+KadAxHMhKBUcorAEE9JqtsM+3ngLePr5u/MlDZtVRt645TTTuTvrYExn+sW+
         Q1Hx3FpofOoLiizDcui+ljwymGJDshvQfwFleIYiPbeQWbyJX31Io3YdJmPVJWFerrz0
         8Xzh54cz7NjFiKxGjasV4ABRnrvw8IrMUnRwnJCt4cC3LBTvErvYfWJnvt3WAfoWkhww
         BZWYlNb63ODsDET+VnqY/UMnq8IC+HSSYQXFXE2HBmzFrACPC6bDWyjyAdrLvY7ewdKN
         pvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=C5wlEjaiimAhiMOgTbXBv9o5NagLYnP7pgeN7/QqAPI=;
        b=jdGbEPrmI2Y42Kv+1yVn0EFadKMZrnBVLp8iZpuq3iZG1SUApg9yCMNBoXFKbl3eK8
         +Jdb7dT9XvoKyI6j3Do5nzsZmHibwoEitDpaM3mgQj0A1IJlgjDmZ7p9W/+BBxvUlc2z
         BXLsjxvwyVqWWIYuzLZkh3yfURJEDRFbP+HiptI9pKR68Jb3OZL9mQ04GRAGUFdHeDfC
         rPMR+MEncwTjKJCHsvC/ZLk7KYd6XY5toOt49deCsHkDtGL/Eml31bNe+YqkXhmaww93
         d4HguJ56oSz2wUFr/UAzrAlnnvLApjfNk2y+RBgA8UtWlqA6YTZGKXrwbsgo2xDsPxUD
         +adA==
X-Gm-Message-State: AOAM533a5W/6vtK1D+CUYFWPG6Yj5iBX9t5F+GSIV0L+FfRmU/wXp7Ef
        0MVcEh+pqg8o5Xo27tSWEas=
X-Google-Smtp-Source: ABdhPJw2pRII2hvQP7haETvakQpHBTmpwpIYi/7LgPEz9zqy+9Jw3cTCHDnz4eryWRMsjHO5nPd4oQ==
X-Received: by 2002:a2e:9611:: with SMTP id v17mr10006033ljh.110.1593858499494;
        Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 3/3] dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
Date:   Sat,  4 Jul 2020 12:28:06 +0200
Message-Id: <20200704102806.735713-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This binding describes a panel with a secondary channel.

v3:
  - Add reg property and unit-address to dsi nodes (Rob)

v2:
  - add check for required properties if link2 is present (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq101r1sx01.txt       | 49 -----------
 .../display/panel/sharp,lq101r1sx01.yaml      | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
deleted file mode 100644
index f522bb8e47e1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Sharp Microelectronics 10.1" WQXGA TFT LCD panel
-
-This panel requires a dual-channel DSI host to operate. It supports two modes:
-- left-right: each channel drives the left or right half of the screen
-- even-odd: each channel drives the even or odd lines of the screen
-
-Each of the DSI channels controls a separate DSI peripheral. The peripheral
-driven by the first link (DSI-LINK1), left or even, is considered the primary
-peripheral and controls the device. The 'link2' property contains a phandle
-to the peripheral driven by the second link (DSI-LINK2, right or odd).
-
-Note that in video mode the DSI-LINK1 interface always provides the left/even
-pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
-is possible to program either link to drive the left/even or right/odd pixels
-but for the sake of consistency this binding assumes that the same assignment
-is chosen as for video mode.
-
-Required properties:
-- compatible: should be "sharp,lq101r1sx01"
-- reg: DSI virtual channel of the peripheral
-
-Required properties (for DSI-LINK1 only):
-- link2: phandle to the DSI peripheral on the secondary link. Note that the
-  presence of this property marks the containing node as DSI-LINK1.
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties (for DSI-LINK1 only):
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	dsi@54300000 {
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-		};
-	};
-
-	dsi@54400000 {
-		secondary: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
new file mode 100644
index 000000000000..a679d3647dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1), left or even, is considered the primary
+  peripheral and controls the device. The 'link2' property contains a phandle
+  to the peripheral driven by the second link (DSI-LINK2, right or odd).
+
+  Note that in video mode the DSI-LINK1 interface always provides the left/even
+  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
+  is possible to program either link to drive the left/even or right/odd pixels
+  but for the sake of consistency this binding assumes that the same assignment
+  is chosen as for video mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101r1sx01
+
+  reg: true
+  power-supply: true
+  backlight: true
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - link2
+then:
+  required:
+    - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0: dsi@fd922800 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfd922800 0x200>;
+
+        panel: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+
+            link2 = <&secondary>;
+
+            power-supply = <&power>;
+            backlight = <&backlight>;
+        };
+    };
+
+    dsi1: dsi@fd922a00 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfd922a00 0x200>;
+
+        secondary: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+        };
+    };
+
+...
-- 
2.25.1

