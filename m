Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69587C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CAE92075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6N4YJK8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgDHTwS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36925 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbgDHTwS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id t11so6125002lfe.4
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNIDvAoEerZAuf8dJ+yQQsEQf67OS8CEL+Bx3wu/FhI=;
        b=M6N4YJK8WMnJe09nboa+mfd0cdhhop7Ev2LuL84UYPhkVG81VbEynHD7pJHQBqwqRp
         jYppLlaT4ScHajRT2P1ch4KatWic5vP8gjrx7JRNhIfLMkeCmYwEvuXfcEM9jF1G3ZcH
         7YSZJdNPFWUysk0PAu/ryB90mmp7JEJx3uF7HJj/0ZSHxHzq217VTEbdL9mbWfSYatVp
         jWCk7O3c3TJ1mSosBoLFMz/ElbwDvjE/FLHsLY+uYCdJmpyywQGsMbO+4MV9owB2vY9H
         jviyjSu/eOZEz312jFizJpkwGcto3nA0WzC+OpGAbv90b0fBceIxXq1HEar1hamy8eAn
         Fk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=vNIDvAoEerZAuf8dJ+yQQsEQf67OS8CEL+Bx3wu/FhI=;
        b=VtgHDY+prLkAywTOP9AhomkEC3WsUNHFLCcQ8q3z+z94LlurvpjLZPPazWzEgFX1Zh
         sjqkVvU3qwP8A2ugjGUtksntv34jDVPi/4MXFeJnCP+/Y6Gd/64aXDTBh64OQDihIJUd
         LfZmYFmW2+cwJLorGon033uhAprMw/Y0bqgeL0Cz9tFwphAJL0spaJsEj4KyHojlxw/k
         WlBs3toNxzjIE5JcjGN3UaJB70kmXJr/T8TiljwoqNDi8Kb2ZEmKKWQSGYdfIf6bjtDZ
         6jaxgTnn7WoWQBMdTyuhtivEoVkJ5PmYrJuXntumBJuyPAWog4KfZrAUR1om0QH4/Pr2
         Oilw==
X-Gm-Message-State: AGi0Pub81Vdou1hh+cS+Iedd+dU8IIwlXvd67yvV5V+7y9vaB4sxg8m8
        wf7wIu+nl/cbNXJ2yZ14g8k=
X-Google-Smtp-Source: APiQypJi0xt++3QZ2oXMVrgH/Hf2EGq34NaSdgMCRANHDzwvodSzX3HxcyQlllhdQTrSPIBLbX9dxQ==
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr5622578lfp.160.1586375536484;
        Wed, 08 Apr 2020 12:52:16 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:16 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v2 33/36] dt-bindings: display: convert seiko,43wvf1g to DT Schema
Date:   Wed,  8 Apr 2020 21:51:06 +0200
Message-Id: <20200408195109.32692-34-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Marco Franchi <marco.franchi@nxp.com>
Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/seiko,43wvf1g.txt  | 23 ---------
 .../bindings/display/panel/seiko,43wvf1g.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
deleted file mode 100644
index aae57ef36cdd..000000000000
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
-
-Required properties:
-- compatible: should be "sii,43wvf1g".
-- "dvdd-supply": 3v3 digital regulator.
-- "avdd-supply": 5v analog regulator.
-
-Optional properties:
-- backlight: phandle for the backlight control.
-
-Example:
-
-	panel {
-		compatible = "sii,43wvf1g";
-		backlight = <&backlight_display>;
-		dvdd-supply = <&reg_lcd_3v3>;
-		avdd-supply = <&reg_lcd_5v>;
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
new file mode 100644
index 000000000000..9195de40b21b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
+
+maintainers:
+  - Marco Franchi <marco.franchi@nxp.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sii,43wvf1g
+
+  backlight: true
+  port: true
+
+  dvdd-supply:
+    description: 3v3 digital regulator
+
+  avdd-supply:
+    description: 5v analog regulator
+
+required:
+  - compatible
+  - dvdd-supply
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+        compatible = "sii,43wvf1g";
+        backlight = <&backlight_display>;
+        dvdd-supply = <&reg_lcd_3v3>;
+        avdd-supply = <&reg_lcd_5v>;
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&display_out>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

