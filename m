Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6809AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 08:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45CB1207C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 08:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PFpYCai3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgFKIFe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 04:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgFKIFe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 04:05:34 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FB3C08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 01:05:34 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id d10so2221569pgn.4
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 01:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2mL8Vdc/hN9rg4umfGZVTgs8fFqgzoMMWnZLaRwNA48=;
        b=PFpYCai3rPjZ5IcPE/K2WED1cVzuOrHovRWbCxFzlJlBNUBJ8LPDW0NwPIQhPWm8a+
         F6lFHUhRr4qOKCq6hlp2emabs0Tmsj5VXfYoY4dObDp1b4Hz9Q57WlmtmyiWCh8XFQzu
         wF8n3gJa9/RB0805X/U6AMW5uaDo6kPZbMlaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2mL8Vdc/hN9rg4umfGZVTgs8fFqgzoMMWnZLaRwNA48=;
        b=eBv9v9Ru8kYIAwy+rJBVivitCFoAtUbAxgdndFnMqn3iHzNlW5cLKQvwKtaNIh59Wq
         Nzo7IybGMOOtJ6y2ajuypryurFnMHIxomvIQfUNvBSqnUSYtt7QxjE/h3WKzPXfTekXH
         zJeDfd/GkfRqKaek8FRzMkcmwmw0/2z9VP6SCw60eKEK9uSrGtbC8KwJ24+CU0FHA/Vt
         +ZBsUZ8TnaxS3jJq8hiur1QvU9sB+qjPRQRITJ3DlkzcBkXT6fCYLN8GggSMhRIFKMI3
         FbPLI80O78yRyZGTf/qXIaToOfgjh+taiLhCAsyzhKdDjPzp4ycKN5tA3Gl0bYHTk+VI
         y66Q==
X-Gm-Message-State: AOAM530IsETUV3J8ntsaAVYXq2txzHF6NWkfnNsYjOJjNcVvrbU2mGTF
        +ithnr3a02b4LI3HRFcLE+7C/Q==
X-Google-Smtp-Source: ABdhPJxOVQbqRqWrkq+Hwkv2PTPbN3v+YGJ9ilWAWeW3Y8xJJoqt3wNJjp6BCtBXQGyX5VKT9jvy4Q==
X-Received: by 2002:a05:6a00:15c7:: with SMTP id o7mr5984862pfu.51.1591862733271;
        Thu, 11 Jun 2020 01:05:33 -0700 (PDT)
Received: from pihsun-glaptop.roam.corp.google.com (2001-b400-e256-fea4-a6c2-ff17-248d-0f67.emome-ip6.hinet.net. [2001:b400:e256:fea4:a6c2:ff17:248d:f67])
        by smtp.googlemail.com with ESMTPSA id n69sm2155509pjc.25.2020.06.11.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 01:05:32 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH v4 1/2] dt-bindings: regulator: Add DT binding for cros-ec-regulator
Date:   Thu, 11 Jun 2020 16:04:58 +0800
Message-Id: <20200611080505.140731-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611080505.140731-1-pihsun@chromium.org>
References: <20200611080505.140731-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT binding documentation for cros-ec-regulator, a voltage regulator
controlled by ChromeOS EC.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
Changes from v3:
* Fix dt bindings file name.
* Add full example.

Changes from v2:
* No change

Changes from v1:
* Change compatible string to google,regulator-cros-ec.
* Use reg property in device tree.
* Change license for dt binding according to checkpatch.pl.
---
 .../regulator/google,cros-ec-regulator.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
new file mode 100644
index 000000000000..7e341b65b2dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/google,cros-ec-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC controlled voltage regulators
+
+maintainers:
+  - Pi-Hsun Shih <pihsun@chromium.org>
+
+description:
+  Any property defined as part of the core regulator binding, defined in
+  regulator.yaml, can also be used.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: google,regulator-cros-ec
+
+  reg:
+    maxItems: 1
+    description: Identifier for the voltage regulator to ChromeOS EC.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cros_ec: ec@0 {
+            compatible = "google,cros-ec-spi";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            regulator@0 {
+                compatible = "google,regulator-cros-ec";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                reg = <0>;
+            };
+        };
+    };
+...
-- 
2.27.0.278.ge193c7cf3a9-goog

