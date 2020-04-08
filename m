Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E1DC2D0F4
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D932320768
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN+q9T2O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgDHTwG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36910 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730244AbgDHTwG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so6124537lfe.4
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNUYG492p0LzUw743VYzwd+v9kMLkVKaGJFhNA4+IGs=;
        b=mN+q9T2Ox9nNdGI+Bg0QEtZ1gPcvLhLG9wEc3hS7zX1zyZfPfm45LpNnSNu3evoS7W
         fAFVjROotSXtb6Cr/JB4+/iCId9emJM5teg/6n9SXxBAspCr3xTBGYHp1HQgn/wR4pBs
         9ZCxqaY5xxraCyezt9autnPhyalqeuwGmzEEJ+GAWUtjb/bbVFoPrltEMtrwvkxloGfQ
         Q/XemAyoHHOrBw0oe+tO01d/LPzlUUhzcySwncf8jzs0L7+8N6uKA5oD9pChPGzxfJWW
         4wQ32Eqgk5unl3pqwjqls/KkAs7Vl2C8nYwQVxUPuk/gwfyaLS/EcseEaUAt/R9llmWq
         cgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LNUYG492p0LzUw743VYzwd+v9kMLkVKaGJFhNA4+IGs=;
        b=r8AJn/JlNTDzl+nmK+w0d9BQ8KKfIPJO/ChTyB18YCGrUxlE0kWwejqG18N4fBdmi7
         IeT7hyYPuHE9+ZASDafYiELd+4qosUb6y3a6Lu4bT0plpkNEXAgGO8rsk05RmugYSxXr
         rTNhYUaCg2NbbvMNEoC3HzbMih2QL2Yz/BR1mquSLjB7O9522VI0+03ynV/V0RHS/zGI
         oZxnZU3vyISa/PIeUEydQ8Z3li+E0dGha53amn579WH2huREAWRhYFCNgd+qn4JP5H4B
         HLm2o5U3jHKHl2nMI2ieVyh3O6I1EqidWL4NBOv+ySpiXu65lmkloIyI3TuI/Ev+pp8m
         OHbg==
X-Gm-Message-State: AGi0PuZtMvpJ0GK6k4QZy2plxOjNDkj5iJwHQQ6WhbC2TGQrVLxnLkIz
        fXXQo4QYctJJKFXWp5fD6t8=
X-Google-Smtp-Source: APiQypIQDyNx4KNt5NxFsFdlnGw/HmO+tJL9kmeWTmTA6imYTfVNhAX3quWG+Z03RN9unpofs2Hhqw==
X-Received: by 2002:ac2:4426:: with SMTP id w6mr5559037lfl.8.1586375521479;
        Wed, 08 Apr 2020 12:52:01 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:01 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 19/36] dt-bindings: display: convert rocktech,jh057n00900 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:52 +0200
Message-Id: <20200408195109.32692-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2:
  - Fix entry in MAINTAINERS

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/rocktech,jh057n00900.txt    | 23 --------
 .../display/panel/rocktech,jh057n00900.yaml   | 57 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 58 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
deleted file mode 100644
index a372c5d84695..000000000000
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
-
-Required properties:
-- compatible: should be "rocktech,jh057n00900"
-- reg: DSI virtual channel of the peripheral
-- reset-gpios: panel reset gpio
-- backlight: phandle of the backlight device attached to the panel
-- vcc-supply: phandle of the regulator that provides the vcc supply voltage.
-- iovcc-supply: phandle of the regulator that provides the iovcc supply
-  voltage.
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "rocktech,jh057n00900";
-			reg = <0>;
-			backlight = <&backlight>;
-			reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
-			vcc-supply = <&reg_2v8_p>;
-			iovcc-supply = <&reg_1v8_p>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
new file mode 100644
index 000000000000..827417bbff63
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/rocktech,jh057n00900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
+
+maintainers:
+  - Guido Günther <agx@sigxcpu.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: rocktech,jh057n00900
+
+  reg: true
+  reset-gpios: true
+  backlight: true
+
+  vcc-supply:
+    description: The regulator that provides the vcc supply voltage
+
+  iovcc-supply:
+    description: The regulator that provides the iovcc supply voltage
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - backlight
+  - vcc-supply
+  - iovcc-supply
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
+            compatible = "rocktech,jh057n00900";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 33dbe94e03ab..eec316171b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5400,7 +5400,7 @@ M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
-F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
+F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
 
 DRM DRIVER FOR SAVAGE VIDEO CARDS
 S:	Orphan / Obsolete
-- 
2.20.1

