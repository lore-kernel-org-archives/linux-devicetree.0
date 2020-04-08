Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59D6C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 874312075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUScjKUJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgDHTwL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:11 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:41326 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730247AbgDHTwK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:10 -0400
Received: by mail-lj1-f171.google.com with SMTP id n17so8977115lji.8
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+CVMxbsPicV/fwxP5mLwljkIZSzu8S5meR2w3434dc=;
        b=VUScjKUJ3sRl7kSkeR5/ppr6loUiu+5tonJIGWpPCL4kNi8kR5Zoy7JiymR25oaCA/
         nJeOn2hvFFWA5WOSMJetivEqX3v71zZx5Wa4qNi5J6Nfa7K9G5+bmsca3b6CihJf5r3F
         xqPPR8zpcvzEpN/5XcELi5QROI+ps1g8VjaC9azMRmwvCGwDMtEfJ4V/Bcvoz9gJizkU
         z1hqxliuOC+Xwyh3gqKIuPZqbJ3Dwtxe9iQB4aR1kQoaWbgmrmmlHY4Qli+xK1QA8hmH
         oEENC4oeIjQGIvp2YXQj2dyqFyjlLssBYmkXrE4aclCdclO5ZEQS3JIt8L81dehUocjK
         1BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7+CVMxbsPicV/fwxP5mLwljkIZSzu8S5meR2w3434dc=;
        b=WAWsT31N4AwbC6mIj38O8jO5yIx1gd8t03x3i4gG8sXOT6FUtwedL0Nez2KjSY3Djj
         IELRluZ6CyM07uo25eZn2YzZLz0lyGHBptJD3YHYQV4txtsQugmtThkniQyX+HuKxmUB
         2CVSx7U+9L7y1DLoues7z2nh/TtE12qU5dgyDBlOnNspoGTp/5mzvwDkW66P61dq2KWx
         GcVfxyPbtm/rHoxbs0fnEhhUnlbz8svyoiX1IEehvcFu2rbitSDXmQ3xLmr+samySzMV
         bTtK8tcGotvr5/kD83VTEXGg91Pf1aVCnuB5v84gNvKKNr1ECOfvz/HFpuiZlWBwK7bF
         TUWA==
X-Gm-Message-State: AGi0PuZ9CO7AGDO/a3h10Hm1PtHbxfgqV5L0NA9eKcQd/EH+pdjdj1HP
        ZIwg6xatijg3yetijn8gBCM=
X-Google-Smtp-Source: APiQypIal03E0aeSlBE0puxuSkmOeXenB82LUpmrGBHh3y9Jup2eKAtFoxcs2ML/dx2TxC9LBhctiw==
X-Received: by 2002:a2e:804a:: with SMTP id p10mr6314584ljg.289.1586375527126;
        Wed, 08 Apr 2020 12:52:07 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:06 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Marek Belisko <marek@goldelico.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to DT Schema
Date:   Wed,  8 Apr 2020 21:50:57 +0200
Message-Id: <20200408195109.32692-25-sam@ravnborg.org>
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
  - dropped use of spi-slave.yaml (Maxime)
  - added unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Marek Belisko <marek@goldelico.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
 .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
 .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
 3 files changed, 65 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
new file mode 100644
index 000000000000..4aa605613445
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toppoly TD Panels
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Marek Belisko <marek@goldelico.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # Toppoly TD028TTEC1 Panel
+      - tpo,td028ttec1
+        # Toppoly TD043MTEA1 Panel
+      - tpo,td043mtea1
+
+  reg: true
+  label: true
+  reset-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: panel@0 {
+            compatible = "tpo,td043mtea1";
+            reg = <0>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            label = "lcd";
+
+            reset-gpios = <&gpio7 7 0>;
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
deleted file mode 100644
index 898e06ecf4ef..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Toppoly TD028TTEC1 Panel
-========================
-
-Required properties:
-- compatible: "tpo,td028ttec1"
-
-Optional properties:
-- label: a symbolic name for the panel
-- backlight: phandle of the backlight device
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: td028ttec1@0 {
-	compatible = "tpo,td028ttec1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-	backlight = <&backlight>;
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
deleted file mode 100644
index ec6d62975162..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-TPO TD043MTEA1 Panel
-====================
-
-Required properties:
-- compatible: "tpo,td043mtea1"
-- reset-gpios: panel reset gpio
-
-Optional properties:
-- label: a symbolic name for the panel
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: panel@0 {
-	compatible = "tpo,td043mtea1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-
-	reset-gpios = <&gpio7 7 0>;
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-- 
2.20.1

