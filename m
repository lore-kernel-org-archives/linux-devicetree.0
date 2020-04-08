Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35569C2BB55
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08F5320769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkcHjNsQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbgDHTvy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36791 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTvy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id b1so9036783ljp.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
        b=CkcHjNsQ20m+yqfOzKHjMytfQoQkJG2wXH71UADD/ktN2zoVZeZ96XX0heMGOm//6t
         8K8huxzPx4uSJmqo70qEASm66u4HPllzSthMpTXQL4L+v+NFYblZLscv90xPt1BMPdxF
         wUYq3lS/wGAHjKteAaFK0e1DYemmbfldXefSO81xKMQVyaIksDe//blzgSR+RjJM3UBs
         CuC3OEeSqTMB2HNur6tG4z4WRmcgBoWXqiUU35daO7178UmQ6y0KHdEc79xS/JP7EezZ
         0iUAnJ+3iWMYd3u5/0+dacgP8FAAbnOy6QSfL5f3jAhE1SOd2El9KP1NDfoPoEaQB3zv
         1dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
        b=kOCCVQT4pjjEa6303MmLZBWqdxZLZN3gyoYfC5lxHrXu8RVNTVFp6mwLUdUa3NpCRt
         h03XJWbHjzJ4TEO28ZinxarWIjdFUaFo1TiWLhUYrbTAY1V5u8foqpTajToYJ2fv3XWs
         htvUKYwhGhfKtRbVFF9Ll0wKn6Uyf5PpKXVKbm3+R3BagaWpnEyMouv8HG7UT3mN/rZC
         7VXXJqxSY79X0no2a8X0hpjYyxnhx8nvUdQFs+PxUcoySOqtWJHpA7JZEkfjH1fyMgMa
         sGlGVzGyzghzEcbP48K2W+excR5Ju8Awl6GiTmb2hvcY+cCnI7IZfeDg+8fiz8vT2jSK
         eicA==
X-Gm-Message-State: AGi0PuaEKB2b8LI3T6CDzfyulq2vZnoLtcahv+G0ix92TsCUA+W5XUO1
        gofxli/x+ZxeEmfmM3GSFIBMTFbB/fc=
X-Google-Smtp-Source: APiQypJVKiKV3cQwYN7WSMqnPehfuKwlFS/3MwFscNM08RSykhQTIIaKCjs+GhUyHKjtquZVJhNjOA==
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr5583286ljc.285.1586375512022;
        Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:51 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Lin Huang <hl@rock-chips.com>
Subject: [PATCH v2 10/36] dt-bindings: display: convert innolux,p097pfg to DT Schema
Date:   Wed,  8 Apr 2020 21:50:43 +0200
Message-Id: <20200408195109.32692-11-sam@ravnborg.org>
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
Cc: Lin Huang <hl@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p097pfg.txt         | 24 --------
 .../display/panel/innolux,p097pfg.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
deleted file mode 100644
index d1cab3a8f0fb..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p097pfg"
-- reg: DSI virtual channel of the peripheral
-- avdd-supply: phandle of the regulator that provides positive voltage
-- avee-supply: phandle of the regulator that provides negative voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			avdd-supply = <...>;
-			avee-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
new file mode 100644
index 000000000000..5a5f071627fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
+
+maintainers:
+  - Lin Huang <hl@rock-chips.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p097pfg
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  avdd-supply:
+    description: The regulator that provides positive voltage
+
+  avee-supply:
+    description: The regulator that provides negative voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - avee-supply
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "innolux,p097pfg";
+            reg = <0>;
+            avdd-supply = <&avdd>;
+            avee-supply = <&avee>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
-- 
2.20.1

