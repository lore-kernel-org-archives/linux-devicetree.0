Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662E2C32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3255422522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofFq177G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgATUHI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:07:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46707 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATUHI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 15:07:08 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so335336ljc.13
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wIgJpCggonE7UZ122+IBk6BnPaiF15J3iohjxlO8A6I=;
        b=ofFq177Gkb+pAT23vs0FS88Bbt8L8mirBnSUz4vUffrt5klAOmwmSmkfxBCeq+SDz0
         HHxLajFStNxPM8UxqkH45iPZm+9I2AiGxOxgw5kFV5iBNohL+10d4MQM67NAMfqPCYll
         uNr8PzcbFavrrFqF+WqoqcwLuAyyFfghZQVOPmOYM7f1gYUr902Yo6dpfLiylf369ura
         P7BC37Bx4r6ZMFCTD9Eho04PPSPNOwix7mdxAtyLzu278ZntHVFjhQZQP4Dqgj1jhx/u
         wLieAEpEKuZkGL2t17h5vFhzOmSfjBGn9HALDdreFBGQWwdbhmxawOc3A7GTuigthZJV
         +5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wIgJpCggonE7UZ122+IBk6BnPaiF15J3iohjxlO8A6I=;
        b=MTlkJBMHtvSZ1V5a5D5XUuWI/d0YCDmejmiAPAxuDgZAiCAgzW1KGvXYd/XBzfY2hl
         HvehetamSfEOxmHBEcy03fA67NMtqiFXWYpi0rwxI4Ay4MW4ORaCu3QdzYFbEbdjiYDh
         7plz1d4SZBgyw7cWhaeqrcg9OXU114SfErY+zPOgP6t7dRPciqZ0PHf/Lqqc3acb9e6g
         sMFCZ8pqPUgG8Mr1927VOwbCOtdRU43uFoQmPFpPP/AbxTGZKVTeWWWfCFJryaElpmPI
         Jywk+8fyxPKGQr0RiHNQwZv969+pLLUMSjCv3FxNxJNJbdtdAqTNNUlONcPfjqnjw+w+
         IfDA==
X-Gm-Message-State: APjAAAWVj5arELIEH7e5SdIDQnPH4B3nXNrwCGMDrHvt7puRdcZNabct
        Q599qAkvDQajelhTLgW4218=
X-Google-Smtp-Source: APXvYqycBA8ReXTb8PzNHUywecDeWVtJdMFf9euEIoEEftx+xsYnhN8B3/TH9qY4MHC3SpJ3zgBMVQ==
X-Received: by 2002:a2e:9883:: with SMTP id b3mr14511352ljj.80.1579550826200;
        Mon, 20 Jan 2020 12:07:06 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id o12sm17332476ljj.79.2020.01.20.12.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 12:07:05 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 2/3] dt-bindings: display: convert display-timings to DT schema
Date:   Mon, 20 Jan 2020 21:06:40 +0100
Message-Id: <20200120200641.15047-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120200641.15047-1-sam@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add display-timings.yaml - that references panel-timings.yaml.
display-timings.yaml will be used for display bindings
when they are converted to meta-schema format.

For now the old display-timing.txt points to the new
display-timings.yaml - and all users are left as-is.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/display-timing.txt | 124 +-----------------
 .../display/panel/display-timings.yaml        |  67 ++++++++++
 2 files changed, 68 insertions(+), 123 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/display-timings.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
index 78222ced1874..7f55ad4a40c4 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
+++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
@@ -1,123 +1 @@
-display-timing bindings
-=======================
-
-display-timings node
---------------------
-
-required properties:
- - none
-
-optional properties:
- - native-mode: The native mode for the display, in case multiple modes are
-		provided. When omitted, assume the first node is the native.
-
-timing subnode
---------------
-
-required properties:
- - hactive, vactive: display resolution
- - hfront-porch, hback-porch, hsync-len: horizontal display timing parameters
-   in pixels
-   vfront-porch, vback-porch, vsync-len: vertical display timing parameters in
-   lines
- - clock-frequency: display clock in Hz
-
-optional properties:
- - hsync-active: hsync pulse is active low/high/ignored
- - vsync-active: vsync pulse is active low/high/ignored
- - de-active: data-enable pulse is active low/high/ignored
- - pixelclk-active: with
-			- active high = drive pixel data on rising edge/
-					sample data on falling edge
-			- active low  = drive pixel data on falling edge/
-					sample data on rising edge
-			- ignored     = ignored
- - syncclk-active: with
-			- active high = drive sync on rising edge/
-					sample sync on falling edge of pixel
-					clock
-			- active low  = drive sync on falling edge/
-					sample sync on rising edge of pixel
-					clock
-			- omitted     = same configuration as pixelclk-active
- - interlaced (bool): boolean to enable interlaced mode
- - doublescan (bool): boolean to enable doublescan mode
- - doubleclk (bool): boolean to enable doubleclock mode
-
-All the optional properties that are not bool follow the following logic:
-    <1>: high active
-    <0>: low active
-    omitted: not used on hardware
-
-There are different ways of describing the capabilities of a display. The
-devicetree representation corresponds to the one commonly found in datasheets
-for displays. If a display supports multiple signal timings, the native-mode
-can be specified.
-
-The parameters are defined as:
-
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vback_porch                 |          |       |
-  |          |        v                            |          |       |
-  +----------#######################################----------+-------+
-  |          #        ^                            #          |       |
-  |          #        |                            #          |       |
-  |  hback   #        |                            #  hfront  | hsync |
-  |   porch  #        |       hactive              #  porch   |  len  |
-  |<-------->#<-------+--------------------------->#<-------->|<----->|
-  |          #        |                            #          |       |
-  |          #        |vactive                     #          |       |
-  |          #        |                            #          |       |
-  |          #        v                            #          |       |
-  +----------#######################################----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vfront_porch                |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vsync_len                   |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
-
-Note: In addition to being used as subnode(s) of display-timings, the timing
-      subnode may also be used on its own. This is appropriate if only one mode
-      need be conveyed. In this case, the node should be named 'panel-timing'.
-
-
-Example:
-
-	display-timings {
-		native-mode = <&timing0>;
-		timing0: 1080p24 {
-			/* 1920x1080p24 */
-			clock-frequency = <52000000>;
-			hactive = <1920>;
-			vactive = <1080>;
-			hfront-porch = <25>;
-			hback-porch = <25>;
-			hsync-len = <25>;
-			vback-porch = <2>;
-			vfront-porch = <2>;
-			vsync-len = <2>;
-			hsync-active = <1>;
-		};
-	};
-
-Every required property also supports the use of ranges, so the commonly used
-datasheet description with minimum, typical and maximum values can be used.
-
-Example:
-
-	timing1: timing {
-		/* 1920x1080p24 */
-		clock-frequency = <148500000>;
-		hactive = <1920>;
-		vactive = <1080>;
-		hsync-len = <0 44 60>;
-		hfront-porch = <80 88 95>;
-		hback-porch = <100 148 160>;
-		vfront-porch = <0 4 6>;
-		vback-porch = <0 36 50>;
-		vsync-len = <0 5 6>;
-	};
+See display-timings.yaml in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
new file mode 100644
index 000000000000..4f93a4a287d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: display timing bindings
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+properties:
+  $nodename:
+    const: display-timings
+
+  native-mode:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The native mode for the display, in case multiple modes are
+      provided. When omitted, assume the first node is the native.
+
+patternProperties:
+  "^timing.*$":
+    allOf:
+      - $ref: panel-timing.yaml#
+
+additionalProperties: false
+
+examples:
+  - |+
+
+    /*
+     * Example that specifies panel timing using minimum, typical,
+     * maximum values as commonly used in datasheet description.
+     * timing1 is the native-mode.
+     */
+    display-timings {
+      native-mode = <&timing1>;
+      timing0 {
+        /* 1920x1080p24 */
+        clock-frequency = <148500000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hsync-len = <0 44 60>;
+        hfront-porch = <80 88 95>;
+        hback-porch = <100 148 160>;
+        vfront-porch = <0 4 6>;
+        vback-porch = <0 36 50>;
+        vsync-len = <0 5 6>;
+      };
+      timing1 {
+        /* 1920x1080p24 */
+        clock-frequency = <52000000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hfront-porch = <25>;
+        hback-porch = <25>;
+        hsync-len = <0 25 25>;
+        vback-porch = <2>;
+        vfront-porch = <2>;
+        vsync-len = <2>;
+        hsync-active = <1>;
+        pixelclk-active = <1>;
+      };
+    };
-- 
2.20.1

