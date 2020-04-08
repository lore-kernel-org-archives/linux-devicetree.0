Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD76C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4052920769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvxLBa0n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbgDHTvy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:54 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:45697 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgDHTvy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:54 -0400
Received: by mail-lj1-f180.google.com with SMTP id t17so8963556ljc.12
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b92gXAPWMpc0tS9Vby+B+PzcrbaE0rgwDuXebSiFRRg=;
        b=IvxLBa0n2JUNinS2blOc0DW0okymgwZB5gd9SnpHsndS134FrpX2hCLERzqbU6i9dn
         caKSGJkRyA1ufQK2i8ytcAyNs+DyXKCAu1qTv9Ktrsy2fbMXZlfXxLJaRV++8gQT4l9l
         0hZxK7MgfHrsa2lNqT/kxdxwzi7JU01bHlMMWtzDqSsLbyqSa3BqHjuODVuSWrz94rPK
         +4d/Iv5OTq7Z/i19lF1YH+gRNZADjeP/9iKgohKKaauNJjQEHz3dcfGPVJrd3AuVTw8/
         o9/abOqweb5gN4C/B3BjElUJzGuRGFUL6qkcS5Gmc/+U07LklAUObmxblQ1qLsIaSjwB
         HhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=b92gXAPWMpc0tS9Vby+B+PzcrbaE0rgwDuXebSiFRRg=;
        b=aguGLQ1iB/41iqckQCdiMFMKRJ3Owol8ScHPGce3zsdDdP06v1xQ7DTEVkXrNqhaTY
         fIQStvxGf2KwAz6Bg3Q++QHtrs0G5MELTnbeqpum2ZJumsqNRS4B2CVCY0nHB96bGYC0
         Pxbr0z1grRMowwXdtiIC2zVLlcKzRSsafjQtnfuFWNSkwYrxvwRzXTIyobEf6vjZGbrm
         V91gZ4g3G9Y3voPRf6v2JsZFU/SwH/dCZUXYqp8UHjLrA4RzRdcPOO73oXlA47Q3mkU+
         x05aXrVZltp6dnTRfMqomqfp2ZFFXraUuJh+DErRzYEevb2jHvMkmNiDdHh7zapYDGJ0
         2Dcg==
X-Gm-Message-State: AGi0PuZpjF9gmLhq2L/F5U15RfmlGsRzSKMAADEwsYaXSz6VfOI4h+Q8
        xCKhy+hsld10SIpnJk5LqBc=
X-Google-Smtp-Source: APiQypLvBGqysXcl0m2MRJGgJ+NjRBrb9vi3AZyK/BUUCWQED3vSWle/WY0vOUASBXGPdkcMV/gexg==
X-Received: by 2002:a2e:8057:: with SMTP id p23mr5898367ljg.261.1586375513020;
        Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sandeep Panda <spanda@codeaurora.org>
Subject: [PATCH v2 11/36] dt-bindings: display: convert innolux,p120zdg-bf1 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:44 +0200
Message-Id: <20200408195109.32692-12-sam@ravnborg.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sandeep Panda <spanda@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
 .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
deleted file mode 100644
index 513f03466aba..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "innolux,p120zdg-bf1"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- no-hpd: If HPD isn't hooked up; add this property.
-
-Example:
-	panel_edp: panel-edp {
-		compatible = "innolux,p120zdg-bf1";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
-		power-supply = <&pm8916_l2>;
-		backlight = <&backlight>;
-		no-hpd;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
new file mode 100644
index 000000000000..42f97b7b86b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p120zdg-bf1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+  - Douglas Anderson <dianders@chromium.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p120zdg-bf1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  no-hpd: true
+
+required:
+  - compatible
+  - power-supply
+        
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel_edp: panel-edp {
+        compatible = "innolux,p120zdg-bf1";
+        enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
+        power-supply = <&pm8916_l2>;
+        backlight = <&backlight>;
+        no-hpd;
+    };
+
+...
-- 
2.20.1

