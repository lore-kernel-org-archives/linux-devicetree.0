Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A57C38A2A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 684CC206D5
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1zmcWjq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgEFMep (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 08:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728083AbgEFMeo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 08:34:44 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96B7C061A10
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 05:34:43 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so1188187lfe.4
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks2SIJ40qOrlipOob4cbJoDJqJTmjDEZoqHj8ypcF+w=;
        b=w1zmcWjqI9fRpWXLUVm+pPBhruuiC0pIh3Li9mf7wk41MyxI1fVy/cMyeDLlFhjfhC
         2clO7bL7GC7TMaGW3rJcSvL/eGal90zFSWMNhxA5IIA3b22cAj/6lo6pr/LfLNW+YC5C
         89+7dDKBkD8KL7TJ2n/slGcfF141eKxJNjhTXADrYJkhiPH8ARXvkvaRTfOrwHHneSdi
         0IjMnXBbvCr9RDzCNLoCBh2U9v/wPcSeeV0IIl1IxqOWgb1dNlBaI1zXoKPyN1EsCgiU
         T4iQPmF2AfOki1Z2dmudmwSJlaW5+gcRwQgNx2arp5IM77ogzeFhFVhD711F5WdC3e0U
         ZfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks2SIJ40qOrlipOob4cbJoDJqJTmjDEZoqHj8ypcF+w=;
        b=RAPUkLvIwfSAgIcNU0S0D8cL09C+BGxIHiuPmdWBBJ9HmMgAUlxoudzm6IXmlcZtYR
         NomQCgS4PY+tOpT1Hg+R+7A98s2hl/zaCGlHa4OM+dv/HH063z1i3tXURFs5q/sWDAb6
         9yI2kYA07bscvcovEd6yZDDdHmsu+0RHYUQotnnmLdznUUhQrm02ljrcQirpCqH+LS21
         y/xMedw0QHO48wwULYiWH7x75neA/YPcLUIqeuZWtdNyJLv10hRB6vTqOcQysXRS9g4M
         RGg4Oq/1tu3qspRWPKzqGn7FMtTI7ddDPyJQ4ZCxU6GLXa1F+gvx1OQfCP1M3+kcDJ6D
         tvdw==
X-Gm-Message-State: AGi0PuZ5RFfBSos8WU59hI9YUNJKEm5nxeGlbdN5zpt3e4nJ78OMn8J2
        HOcNC3QCKyI272A5i25gfkKpfA==
X-Google-Smtp-Source: APiQypIwDdYOQ9uhN+k+Ylj4ZA4MOTipeO1ze+dSnz65mtK6KiHUAvcDNHHRyQCkZfyc7hEUc6LOQA==
X-Received: by 2002:ac2:41d9:: with SMTP id d25mr5032854lfi.204.1588768481842;
        Wed, 06 May 2020 05:34:41 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id q30sm1522551lfd.32.2020.05.06.05.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:34:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v6] dt-bindings: touchscreen: Add CY8CTMA140 bindings
Date:   Wed,  6 May 2020 14:34:34 +0200
Message-Id: <20200506123435.187432-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Cypress CY8CTMA140
touchscreen.

Cc: devicetree@vger.kernel.org
Cc: Henrik Rydberg <rydberg@bitmath.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Resend with the main driver patch.
ChangeLog v4->v5:
- Fix the unit name in the I2C controller after the building
  bot complained that it cannot be at @00000000 and that it does
  not contain a reg. Just call it "i2c".
ChangeLog v1->v4:
- Drop the description of 'reg', it's surplus.
- Set the I2C frequency to the span 100k to 400k instead
  of hardcoding 400k.
- Collect Rob's review tag.
---
 .../input/touchscreen/cypress,cy8ctma140.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
new file mode 100644
index 000000000000..8c73e5264312
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/cypress,cy8ctma140.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress CY8CTMA140 series touchscreen controller bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: cypress,cy8ctma140
+
+  reg:
+    const: 0x20
+
+  clock-frequency:
+    description: I2C client clock frequency, defined for host
+    minimum: 100000
+    maximum: 400000
+
+  interrupts:
+    maxItems: 1
+
+  vcpin-supply:
+    description: Analog power supply regulator on VCPIN pin
+
+  vdd-supply:
+    description: Digital power supply regulator on VDD pin
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+  touchscreen-max-pressure: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - touchscreen-size-x
+  - touchscreen-size-y
+  - touchscreen-max-pressure
+
+examples:
+- |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@20 {
+        compatible = "cypress,cy8ctma140";
+        reg = <0x20>;
+        touchscreen-size-x = <480>;
+        touchscreen-size-y = <800>;
+        touchscreen-max-pressure = <255>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        vdd-supply = <&ab8500_ldo_aux2_reg>;
+        vcpin-supply = <&ab8500_ldo_aux2_reg>;
+      };
+    };
+
+...
-- 
2.26.2

