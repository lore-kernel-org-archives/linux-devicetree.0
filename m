Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC49C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D8852075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4QY9Plz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgDHTv5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34508 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTv4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so787586lji.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYrJF3e3mbjgA2vboUYUSfmWZgwbVtyg97lpyl5MNOk=;
        b=Y4QY9PlzEU8bKwgDXL4k//gLi61hy+UdFpBsQNpdj4tmmKkkLWOhAc/NWh1XdFnn8l
         IY8hG28rHPAVuUgY372H3ISJBoCr4FepMZjOB4xi8uL9N3JlSvGaI1HBxvS23T+43u2S
         r/qGG/MBsjGVCKUHJSZPlLCJLrcSGj2U5q3NyvjBya4qbdEVVTWrLSRGnrk0XXApK4mB
         /4/VabLI5yK+fwx9XHwgQZMLNHLlrF1s4hnj94lfGjBIwPc4TugcLEFH7oIAodA21Eth
         RKalbNTrRDIeDqhyd6nN8N0acUlnGjymoI5Qaoe1TrkJwA2F/70vS7OUuZmWX/T0k7+i
         H5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WYrJF3e3mbjgA2vboUYUSfmWZgwbVtyg97lpyl5MNOk=;
        b=CuFixOyOI7Odq+QQECYpJCwxNGCsElWU/ntIIHN8JrAAp8CvDF1McMfUwVXcbiaB0H
         Q95F2P3YpGpfPLBHKzR15XokR6F5MHxxb/sqs5kEKUy2Yk3T4ywb5M7e5wYbgR4MMp4B
         IsS4dGaVNepBEKwLwZmZg+JWpQyKF0IVaL19eYzzprTTKWdnPgugHuj1hjkwzEpCSa+k
         UjVdrWe62+C4kDBi2aR+CJrmRdjeRGLD8k3u46ysHCOXFR+i8oMs7bxJoIHSSV81Eadv
         BUY9BUcyCIksw3aNyANDbnUbRXrbPupuziicKNFYknUeXvuecAvt9axorb2ADfjzKWXn
         cxGw==
X-Gm-Message-State: AGi0Pub0v9nQ7yG7sTFQ5EI4vjfr+xf/ZGRm4iYNxqRXEqJLF4N2ZGJq
        /gAMEj4Tcc3OUrdovm8JjpCB8B2Wus8=
X-Google-Smtp-Source: APiQypLzGKldww2n+Vwp7AHRsEz47XrLIb/udKNAA5/wh2B9FGEsWgQFZkKgXU3CiNndY2FqrQCaSw==
X-Received: by 2002:a05:651c:50a:: with SMTP id o10mr5636420ljp.163.1586375514023;
        Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH v2 12/36] dt-bindings: display: convert jdi,lt070me05000 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:45 +0200
Message-Id: <20200408195109.32692-13-sam@ravnborg.org>
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
  - drop address in dsi node in example (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/jdi,lt070me05000.txt        | 31 ---------
 .../display/panel/jdi,lt070me05000.yaml       | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
deleted file mode 100644
index 4989c91d505f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-JDI model LT070ME05000 1200x1920 7" DSI Panel
-
-Required properties:
-- compatible: should be "jdi,lt070me05000"
-- vddp-supply: phandle of the regulator that provides the supply voltage
-  Power IC supply (3-5V)
-- iovcc-supply: phandle of the regulator that provides the supply voltage
-  IOVCC , power supply for LCM (1.8V)
-- enable-gpios: phandle of gpio for enable line
-  LED_EN, LED backlight enable, High active
-- reset-gpios: phandle of gpio for reset line
-  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
-  XRES, Reset, Low active
-- dcdc-en-gpios: phandle of the gpio for power ic line
-  Power IC supply enable, High active
-
-Example:
-
-	dsi0: qcom,mdss_dsi@4700000 {
-		panel@0 {
-			compatible = "jdi,lt070me05000";
-			reg = <0>;
-
-			vddp-supply = <&pm8921_l17>;
-			iovcc-supply = <&pm8921_lvs7>;
-
-			enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
-			dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
new file mode 100644
index 000000000000..b8b9435e464c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jdi,lt070me05000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JDI model LT070ME05000 1200x1920 7" DSI Panel
+
+maintainers:
+  - Vinay Simha BN <simhavcs@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: jdi,lt070me05000
+
+  enable-gpios: true
+  reg: true
+  reset-gpios: true
+
+  vddp-supply:
+    description: |
+      The regulator that provides the supply voltage Power IC supply (3-5V)
+
+  iovcc-supply:
+    description: |
+      The regulator that provides the supply voltage IOVCC,
+      power supply for LCM (1.8V)
+
+  dcdc-en-gpios:
+    description: |
+      phandle of the gpio for power ic line
+      Power IC supply enable, High active
+
+required:
+  - compatible
+  - reg
+  - vddp-supply
+  - iovcc-supply
+  - enable-gpios
+  - reset-gpios
+  - dcdc-en-gpios
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
+            compatible = "jdi,lt070me05000";
+            reg = <0>;
+
+            vddp-supply = <&pm8921_l17>;
+            iovcc-supply = <&pm8921_lvs7>;
+
+            enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
+            dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
-- 
2.20.1

