Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685D2C2D0F4
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B46820768
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq1vBgdQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbgDHTvv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:51 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:44551 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTvv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:51 -0400
Received: by mail-lf1-f54.google.com with SMTP id 131so6076828lfh.11
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jl4TeBXIvj1j2ah0iOCjHDspKfoD1nDXi5RooICvQTA=;
        b=Gq1vBgdQYSvk9vKjKfFdiLSCd7dm1zcewTTIyQUyhI2dqI7eM5GwkvN+VIThT/K8qP
         Z+Fr4DYPKEY7RG6jKuG2w8hQnMifg2cSxUpqrQS+iwF75vu/n1CYCsJL8845YT90A7Vz
         AXAtuMWDotQySz8nFCH98dqvEFExzYdCvo+LohAStvQwjRggt7UQ281cMPjXryHvWoWM
         px68/ngE5Vcgg8L3PnDFSEam2j6sPuGZVFNpd1KpUWCTMPb2wRedTKNxmHhtS9CyYQDP
         bKbUbnauAeBpuHM2HzFCNw+sDFLoxorBpgMj6VekJOA8LFawizp79f1ihTxZd6lrYuG+
         riJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Jl4TeBXIvj1j2ah0iOCjHDspKfoD1nDXi5RooICvQTA=;
        b=gNw1cMDMwuOJ/NjmOzBzianTW5lnXQTQTSbATVcglza/O1YPGOCCFvwo4BuV6m5zMr
         VvFIhV0SqeKzJfOKISK2msyAO7JX7VacHfhBVpo23/f08BA8IShcOubVYbJIa3F4QJQQ
         Utos1ZL9G/Bzwma1XED/l8TPmwpMso/ccyPWTDuWEWbsFsKPcPoCn+ItJyWquZtUu2j8
         HIPd7ryF1KYdEz9320ub1hZ/Wq5UYGjUCZSip06Ne1GlliIlWlFTfmX/Q+kR5MOIU2HD
         LWJgeUM2T/LfpSNNXvCsCoIivzZwtppS0ITbA5PORnL7yfqmlRrjPFozSdY8rb/Hoixn
         PemA==
X-Gm-Message-State: AGi0PubtB6YdYwCxI0xLZwRYi11qLQ1Na3m6UR5IbVdfoHgf9h95kk3E
        nnz5UyMWzANO+Yk3qcvqGd0=
X-Google-Smtp-Source: APiQypKlo8hQRYhuUqCnzBFyKf2PQb31p1f/hKodBpR/4Aafy5fzwJVw3BCXk7Z90RRBDCg2Mo6yDQ==
X-Received: by 2002:a19:4f48:: with SMTP id a8mr5474712lfk.174.1586375508822;
        Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 07/36] dt-bindings: display: convert ilitek,ili9322 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:40 +0200
Message-Id: <20200408195109.32692-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The .txt binding explains:

"
    The following optional properties only apply to
    RGB and YUV input modes and
    can be omitted for BT.656 input modes:
"

This constraint is not implmented in the DT Schema.

The original binding from the .txt file referenced
properties that is included in panel-timing.yaml.

The properties in question are:
  - pixelclk-active
  - de-active
  - hsync-active
  - vsync-active

These properties was dropped in the conversion as they are not relevant.

v2:
  - drop properties from panel-timing (Linus)
  - drop use of spi-slave.yaml (Maxime)
  - introduce unevaluatedProperties (Maxime)
  - dropped unused properties (Linus)
  - delete stray spaces

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/ilitek,ili9322.txt | 49 -------------
 .../display/panel/ilitek,ili9322.yaml         | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
deleted file mode 100644
index 3d5ce6ad6ec7..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Ilitek ILI9322 TFT panel driver with SPI control bus
-
-This is a driver for 320x240 TFT panels, accepting a variety of input
-streams that get adapted and scaled to the panel. The panel output has
-960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
-VCOMH outputs.
-
-Required properties:
-  - compatible: "dlink,dir-685-panel", "ilitek,ili9322"
-    (full system-specific compatible is always required to look up configuration)
-  - reg: address of the panel on the SPI bus
-
-Optional properties:
-  - vcc-supply: core voltage supply, see regulator/regulator.txt
-  - iovcc-supply: voltage supply for the interface input/output signals,
-    see regulator/regulator.txt
-  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
-  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
-
-  The following optional properties only apply to RGB and YUV input modes and
-  can be omitted for BT.656 input modes:
-
-  - pixelclk-active: see display/panel/display-timing.txt
-  - de-active: see display/panel/display-timing.txt
-  - hsync-active: see display/panel/display-timing.txt
-  - vsync-active: see display/panel/display-timing.txt
-
-The panel must obey the rules for a SPI slave device as specified in
-spi/spi-bus.txt
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-
-panel: display@0 {
-	compatible = "dlink,dir-685-panel", "ilitek,ili9322";
-	reg = <0>;
-	vcc-supply = <&vdisp>;
-	iovcc-supply = <&vdisp>;
-	vci-supply = <&vdisp>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&display_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
new file mode 100644
index 000000000000..177d48c5bd97
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9322.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9322 TFT panel driver with SPI control bus
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This is a driver for 320x240 TFT panels, accepting a variety of input
+  streams that get adapted and scaled to the panel. The panel output has
+  960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+  VCOMH outputs.
+
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - dlink,dir-685-panel
+
+      - const: ilitek,ili9322
+
+  reset-gpios: true
+  port: true
+
+  vcc-supply:
+    description: Core voltage supply
+
+  iovcc-supply:
+    description: Voltage supply for the interface input/output signals
+
+  vci-supply:
+    description: Voltage supply for analog parts
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: display@0 {
+            compatible = "dlink,dir-685-panel", "ilitek,ili9322";
+            reg = <0>;
+            vcc-supply = <&vdisp>;
+            iovcc-supply = <&vdisp>;
+            vci-supply = <&vdisp>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

