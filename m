Return-Path: <SRS0=8u50=4L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC60C35673
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 12:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A71EB20656
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 12:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGguut1p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgBWMS5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 07:18:57 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41893 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgBWMS4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Feb 2020 07:18:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so6945470ljc.8
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 04:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRGzSkSHgczFsciecVAokfTdkPHn+AG3ECWjmVIUPgk=;
        b=dGguut1pzGDsUAgroOEop/ne3R93zfJLfz7iidgWLbPVomYfY7H+SH65RCkUKuMJLc
         BhaobR0xlOyDPyEfv3pF+S50xJjypcTH8M/bLrU+uH+Pdfq0ffWBGk+EIhGb1T/wkYZb
         fBw3s4e7aO8b9H3ZWxxvx4rl4QWLttro0YlKXHFnpkTa78q8bcVudm9vXtzhNEA1WEE5
         /g2Y4U3AQTeqWz7AKJcIny0cPVWQmwT7aer46uUrxRJ20BaMsNdCoGXA6rmqbSe28Zr5
         hxTZJjY44hKq3pvvU5/B1G0bDZ8S0sJhRADHi/C1niJNYt9LGk2yFqyHNEkSlTdbi6Y1
         8dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRGzSkSHgczFsciecVAokfTdkPHn+AG3ECWjmVIUPgk=;
        b=uIlxeT8RNEGvMi59tIsonixuuit93K38I8uZUqrbwKBE/tukHty/3ilcyURZsSUUju
         f/YyYzMQmFTEjjmlFAz8HEGw70iQ/+7/PUA73rg9uBgWTN2FWFlvicb/qsAN2z802uTe
         DMdb6COuv+vaSN+TSt46RkCe0j1WI8TVYGRb53pfbtPJFM8SOLa+vQdeT/wTkKkV1dNI
         G9885hsvg+jET1GZLIXA2SHT6w6i57sxDyVDtzuAWOeXAw1bTlKAMovYjwoNUSgYldHo
         wmuzINrnoq33KAA5OEXr3mc0Cts/yDDdWU6K0rfXg8SgyC9etVNvyHoO24yTMc6BDyvg
         5RPw==
X-Gm-Message-State: APjAAAWz5bSZ6cFwbOzAI63j1HxIaZVH9q6p7iv5h6bs1plk2iv3si4x
        FxtB+x++iC3WkbZSJBLwjHk30g==
X-Google-Smtp-Source: APXvYqwG7AyjEOj+PMsDeBjBb+ptB1qKv1HeFB4H1TfJy+5emdbpard7QQkjhuLvi48koCsYed3HGw==
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr27732613ljk.73.1582460335026;
        Sun, 23 Feb 2020 04:18:55 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id r10sm5458553ljk.9.2020.02.23.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 04:18:54 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3 v2] drm/panel: Add DT bindings for Novatek NT35510-based panels
Date:   Sun, 23 Feb 2020 13:18:40 +0100
Message-Id: <20200223121841.26836-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200223121841.26836-1-linus.walleij@linaro.org>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Novatek NT35510-based
family of panels. Since several such panels are in existence
we define bindings common for all, and define the compatible
string for one certain panel (Hydis HVA40WV1).

As other panels are discovered and investigated, we can add
more compatibles to the binding using oneOf constructions.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rename file to novatek,nt35510,yaml to match the first
  compatible.
- Require both the specific display manufacturer compatible
  and the novatek,nt35510 compatible in strict sequence.
---
 .../display/panel/novatek,nt35510.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
new file mode 100644
index 000000000000..791fc9daa68b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35510.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35510-based display panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: hydis,hva40wv1
+      - const: novatek,nt35510
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35510 panel driver. The compatible
+      string determines how the NT35510 panel driver shall be configured
+      to work with the indicated panel. The novatek,nt35510 compatible shall
+      always be provided as a fallback.
+  reg: true
+  reset-gpios: true
+  vdd-supply:
+     description: regulator that supplies the vdd voltage
+  vddi-supply:
+     description: regulator that supplies the vddi voltage
+  backlight: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi@a0351000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel {
+            compatible = "hydis,hva40wv1", "novatek,nt35510";
+            reg = <0>;
+            vdd-supply = <&ab8500_ldo_aux4_reg>;
+            vddi-supply = <&ab8500_ldo_aux6_reg>;
+            reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+            backlight = <&gpio_bl>;
+        };
+    };
+
+...
-- 
2.21.1

