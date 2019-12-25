Return-Path: <SRS0=FlbI=2P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC74C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Dec 2019 11:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C747207FF
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Dec 2019 11:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WTk1X7px"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfLYL4S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Dec 2019 06:56:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32852 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfLYL4S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Dec 2019 06:56:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so16797303lfl.0
        for <devicetree@vger.kernel.org>; Wed, 25 Dec 2019 03:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5mol6HJrMqqa1NJdam/PhpUhWyScfd+EBsQoCUp51Ik=;
        b=WTk1X7pxTyAFammbLNK7vRIMYYVvfw2Eotomu0eqpjnsMjM6g4FkkLRl4IxXW8ZpYR
         fK9mC6m6vj+Zg0SSU0vc10/4HHMzIRVynhqg5xy7lo2sTGztVriSHbEOSxi0BQZzZ9ui
         J1zC5SbiH2jVooIrPLRpLazyUpTeJ2zJho5KmqhuOc555fPlEz20jYN6a3fmNubU8dGT
         G4hN36M/p1pF+1ecdDwRrO9Mm4JSYSDs89wvm+i/+k66eV5uFvQBHp1GTyl1BxPIDFeB
         qV600Xn8gcOKap9ze+D82ZENpg25e0KHWQ09Ma6HSLmfJEBtZ3Vj1/GDpmfcD+VqP8KH
         JKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5mol6HJrMqqa1NJdam/PhpUhWyScfd+EBsQoCUp51Ik=;
        b=G5ULSEA1LLB6WLV2mLgz+mf8CQo4QUd1H8LuzahuxzLuEp2K94Z/kyPmsixra/34OB
         nMnLONUqWeBUktBuD24j+2YdqPCL4QAgSnM2fFkByj36a0UKeM9Z1DHvuseqpLF2Qtxy
         HnE/0qTejbjCRaBnDSmHHqFrNIGf/PkLlBxzKzAGpjcvsJQwkF6V3OakLxxLW5KkUlnz
         r6FVTahLKf7q+q6JU8n0Ryvck8KgvTcQdY7lBn2ALcQYixFEFPkPhmiAy1xnsqj/C6gw
         HESC/VjhTgjUUZNm9xK35neiJOT7TR9PCw8+4dsvl8SZWveigGAe/mWxXYCw09o6rT8p
         /htQ==
X-Gm-Message-State: APjAAAVtEcPp+ndHNp1Dk3Usftbmy7n6t/ZzZO7JsAHXgH+XSipjG76F
        utG8hYNLbbxhfVfOO7YRWumc5X26pDs=
X-Google-Smtp-Source: APXvYqxsFWA2taLpUG5L1Aq/k8Pfzo9J+USCKy6bqVt61nncQ1kFP0NTXJYLubmK+nxbJwNTqEfwCQ==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr22945983lfg.47.1577274976625;
        Wed, 25 Dec 2019 03:56:16 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
        by smtp.gmail.com with ESMTPSA id o19sm13544465lji.54.2019.12.25.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2019 03:56:15 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] drm/panel: Add DT bindings for Novatek NT35510-based panels
Date:   Wed, 25 Dec 2019 12:56:09 +0100
Message-Id: <20191225115610.14518-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
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
more compatibles to the binding.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../display/panel/novatek-nt35510.yaml        | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
new file mode 100644
index 000000000000..a4a6b5adf15b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek-nt35510.yaml#
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
+    const: hydis,hva40wv1
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35510 panel driver. The compatible
+      string determines how the NT35510 panel driver shall be configured
+      to work with the indicated panel.
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
+            compatible = "hydis,hva40wv1";
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
2.21.0

