Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D59C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 890B020768
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoApHJB9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgDHTvu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:50 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36480 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730175AbgDHTvu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:50 -0400
Received: by mail-lf1-f65.google.com with SMTP id w145so6124431lff.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3NIwy6DH0VrIMtQZkqmRlNU3O8nwIcRPTornYJG1h+Y=;
        b=eoApHJB9l6wRj6v7Z4WjeTe605zriNJCb5fe2jR1gDUBJ4kb8CEjrTyVDhFdvnskfy
         knEn2es9tTT00LXR1mD2D3SBiPI8MOXv1FGZiS+RM9XIXvCOo5BsC9Tuhm4ByVjLZrHt
         EgAEYiNixcUQynjEkR8dVicbXSE253j48Ny4jUncEaGaFgOAGqA8wUrqYvM0bQJKjj+y
         ix+7vf8TcjX96vnJRKGcRpiUMkx8Gn9kQByD2bFJn0nH9ebYwGORPJuLkrvRluotCIo7
         kJHJekLjOkOMYzRs1x4NQN6DHpkNMyjGaEFzo4n2gw+ksAzKndIjuxwpqaOatVDUsoAP
         Xk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3NIwy6DH0VrIMtQZkqmRlNU3O8nwIcRPTornYJG1h+Y=;
        b=UlKUK3LvpVssx4b6bwIvfuIKrp+CZccMcsZ24iYkq3y5XhJTvBJaZdiHmjqHwCmX8M
         pT6e4KfTT9ERYnOFN33RzdarJVctzWGAc/AH4xoJHCMh3PNSd+yP0latUztdLTquXxD0
         +9xEKjvya6aRnneL0u6gD8HxoDxnEoim19aBV91GpHSnHDZ1MfbH9d0Obld4/ohwh1n4
         reOBMo9rrfaufvFH1WBVWjRb6EJuf3aSV+hmxSdJ6srNkdwYtH1wdgBBvDYtkUrDS79n
         fP60ywYCEAohCdGQ9SlnuXMiedhgfeqW3JOOwWMVAd5EtVPcNxw3J0ITnKlWlljGdchU
         hdgw==
X-Gm-Message-State: AGi0PuaaUTJoE5B/mZpH95c+b2BcQATDpK5R1Kao+xqRB+kmC6+Ykmn2
        fvso7JLVRV/+rfUEguyUd34=
X-Google-Smtp-Source: APiQypJLcrrKHvO9hWsDO30ITUy60HaEorZN6HkcRibU4WCr3XXCDrQaT+FDXLlVex8Naylk7snOsQ==
X-Received: by 2002:ac2:5684:: with SMTP id 4mr5411988lfr.88.1586375506282;
        Wed, 08 Apr 2020 12:51:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:45 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 05/36] dt-bindings: display: convert arm,versatile-tft-panel to DT Schema
Date:   Wed,  8 Apr 2020 21:50:38 +0200
Message-Id: <20200408195109.32692-6-sam@ravnborg.org>
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
  - Fix entry in MAINTAINERS

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
 .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 52 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
deleted file mode 100644
index 0601a9e34703..000000000000
--- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-ARM Versatile TFT Panels
-
-These panels are connected to the daughterboards found on the
-ARM Versatile reference designs.
-
-This device node must appear as a child to a "syscon"-compatible
-node.
-
-Required properties:
-- compatible: should be "arm,versatile-tft-panel"
-
-Required subnodes:
-- port: see display/panel/panel-common.yaml, graph.txt
-
-
-Example:
-
-sysreg@0 {
-	compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
-	reg = <0x00000 0x1000>;
-
-	panel: display@0 {
-		compatible = "arm,versatile-tft-panel";
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&foo>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
new file mode 100644
index 000000000000..68cfdb90f54b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/arm,versatile-tft-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile TFT Panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  These panels are connected to the daughterboards found on the
+  ARM Versatile reference designs.
+
+  This device node must appear as a child to a "syscon"-compatible
+  node.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: arm,versatile-tft-panel
+
+  port: true
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    sysreg {
+        compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
+        reg = <0x00000 0x1000>;
+
+        panel {
+            compatible = "arm,versatile-tft-panel";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&foo>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 50b068f3580a..2b99fa16ba08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5229,7 +5229,7 @@ M:	Linus Walleij <linus.walleij@linaro.org>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-arm-versatile.c
-F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
+F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
 
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
-- 
2.20.1

