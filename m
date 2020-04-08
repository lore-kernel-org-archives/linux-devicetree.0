Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0640AC38A2F
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBC772078E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXoGtZr+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbgDHTwT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37455 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730271AbgDHTwT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so9016774ljd.4
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glF1/rVfsCqrnm2QIZUd5FUTcYcMxvbPO7G9VlD0g4o=;
        b=TXoGtZr+nOtgB4VYGHxmb1dac8cIditt0jI3CI66PoqGALYR0EUPgcdkMG6+2+M4+J
         3WlTyLSL0z+kidOINhHYirgfHe+zZmaVoVraqDorCICi48DE4hB/XVwmM/SGmP2qQsBp
         4aJYupEbERILN8JBTfBdnvJUIJMEc4XlAAzxC+HTu/uU1p0wn5UuLPUbNyhhnpxtM9sC
         PPaJ+U81+HTYa1RyklZQ5EnBiiZ+TbLFX4muBDB6LWL+bnH0P5Cc5k8BrKBzD7hS5QtC
         b6rfukPO9Jt/ix6KSRBODx8Fr4hzgbKEksq7C1aS+MpiQAAtPG+ucKOUrEkO4SGYyXiz
         Mmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=glF1/rVfsCqrnm2QIZUd5FUTcYcMxvbPO7G9VlD0g4o=;
        b=lZDjRbzwuriWzEoYVv+u6FpUMOUYonn93TDb72aSsWyqMRumPVlj6+nCnKBr2x1xH0
         nnQnUm33YNVagYLMZHbMnKFDLPJynevkNo2YQ1fYcfvzlzZm3X0qfFTJpkg0WxDdl/CN
         3qnLcj6YFBTJuZKb4R6rkBDoxzJcNyURlhNIHvUD1FSGSe9YlFad8k/kNhSxz8EmpObs
         gcF9oQK8yTTdHYLXWfiIbCkH38Ri8DYftklehJaQjBqww4a+Hf9+DBcnjZ8Pu9piL2ES
         JSzspBRHXYDGnfGb9iGt7w0nJeb36CetytW+tkW3RmxLYhskQubYoT7Lzw27XeOYQMsI
         6uiA==
X-Gm-Message-State: AGi0PuZypofpTPMtQvpbdsi9oWYuiUJ/tiq8yb2TpS9XBcwvi3KWIy3s
        cE79HLeQu7CsOAHfvu8IV+g=
X-Google-Smtp-Source: APiQypJnTzh3Rj9Tbc9V7SJA2WdEqENi7hFVY0Mw/3rDIyFcahVAgmxEafb6PRDsyIx8x0U6Fe5MpA==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr845431ljn.28.1586375537466;
        Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 34/36] dt-bindings: display: convert lgphilips,lb035q02 to DT Schema
Date:   Wed,  8 Apr 2020 21:51:07 +0200
Message-Id: <20200408195109.32692-35-sam@ravnborg.org>
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
  - drop use of spi-slave.yaml (Maxime)
  - added unevaluatedProperties (maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/lgphilips,lb035q02.txt      | 33 -----------
 .../display/panel/lgphilips,lb035q02.yaml     | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
deleted file mode 100644
index 1a1e653e5407..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-LG.Philips LB035Q02 Panel
-=========================
-
-Required properties:
-- compatible: "lgphilips,lb035q02"
-- enable-gpios: panel enable gpio
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
-	compatible = "lgphilips,lb035q02";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-
-	enable-gpios = <&gpio7 7 0>;
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
new file mode 100644
index 000000000000..830e335ddb53
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgphilips,lb035q02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG.Philips LB035Q02 Panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lgphilips,lb035q02
+
+  label: true
+  enable-gpios: true
+  port: true
+
+required:
+  - compatible
+  - enable-gpios
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
+            compatible = "lgphilips,lb035q02";
+            reg = <0>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            label = "lcd";
+
+            enable-gpios = <&gpio7 7 0>;
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
-- 
2.20.1

