Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A028CC38A29
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A3CC2075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOyPs4QG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbgDHTwG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41180 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTwG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id n17so8976941lji.8
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aenQ+058iB0Lc8M+2E4UVh0+xwRdWKCjLRHP0fNdtw0=;
        b=kOyPs4QGl/rc9TCaQH7buO7wR0c7Pp5/F+Omzd5sidOfpnv7aQKjdvQukkiXXv8Ot4
         f6Hv7diTMA7GkrUXB4vlr7BM4QELbKi7ftBNf63CoJVi1rJfu/aOR/qp9sunDLyez8HU
         EdV9bo1EDwFp+/A6WAYKIvOe6qLCqSqnhIBj7GAdZDWcCoV7FXzeW14JZEYTET8Uujol
         /stCobkEr1T22GLe6i3ME5+HMPJGR+aCa11aODYWa6oSIgLoJhYC2pmWSnXyh61kdjd+
         dli0PyreKrCA34z1xRX3WrPJ1cW+6/JiFt6W3UMA1lh2a2vqEGU9lGC0OpfNTB0SmAMN
         861g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aenQ+058iB0Lc8M+2E4UVh0+xwRdWKCjLRHP0fNdtw0=;
        b=mmWoouQ4REMMreF5tg/BUZjmCDO2Y7GSMoLf/aF+KOQGoGRkx9moCBlGV1OGNkh/Te
         9FEQEXv9yYu++1zol0tcTe936TyeRhEAytSvo9RT2bhBoLSzViNzEwR7E04YUwHgN2+k
         lvY/VMOI+8ohcZYQu1E+AAgLDvkHvUBC4O4EfOhJffgOmNhA0QxrPIXejCpjgvCj1Uai
         NXo0srT6bjMnJ95XtoEz6pvH3Jv2Z1l/pP0hP7rUbG0NEt4VsyiUbCHL3yFnEzQynwPJ
         AM1yHarXw7yCy1sgjIPJSZA2E8WkKn7KDtC/f8WraEBdxhvVfASS0m6jhB/gGEkIVgPL
         inWQ==
X-Gm-Message-State: AGi0PuYjxEW/dBSEzjRDZda08O5UPvP/Ihe8MMd3IIwivNZGSsqNjEfo
        YzNF9SHYcSVct9ggCtXL2qunAXnjxjQ=
X-Google-Smtp-Source: APiQypJVQzOppHYZnedGac8/EzmOFEhtvjdeehlf8bRY45f0HTfWbTcoJs3hO/5LnVou/1csqRHBPw==
X-Received: by 2002:a2e:b888:: with SMTP id r8mr6092691ljp.128.1586375524036;
        Wed, 08 Apr 2020 12:52:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:03 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 21/36] dt-bindings: display: convert samsung,s6d16d0 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:54 +0200
Message-Id: <20200408195109.32692-22-sam@ravnborg.org>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6d16d0.txt         | 30 ----------
 .../display/panel/samsung,s6d16d0.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
deleted file mode 100644
index b94e366f451b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Samsung S6D16D0 4" 864x480 AMOLED panel
-
-Required properties:
-  - compatible: should be:
-    "samsung,s6d16d0",
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd1-supply: I/O voltage supply
-  - reset-gpios: a GPIO spec for the reset pin (active low)
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-&dsi {
-	...
-
-	panel@0 {
-		compatible = "samsung,s6d16d0";
-		reg = <0>;
-		vdd1-supply = <&foo>;
-		reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
new file mode 100644
index 000000000000..66d147496bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d16d0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D16D0 4" 864x480 AMOLED panel
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6d16d0
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+  vdd1-supply:
+    description: I/O voltage supply
+
+required:
+  - compatible
+  - reg
+  - vdd1-supply
+  - reset-gpios
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
+            compatible = "samsung,s6d16d0";
+            reg = <0>;
+            vdd1-supply = <&foo>;
+            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

