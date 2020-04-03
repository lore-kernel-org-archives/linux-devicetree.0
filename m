Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958DEC43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 07:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DC942063A
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 07:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvfXeIBa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388907AbgDCHCA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 03:02:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41622 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgDCHCA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 03:02:00 -0400
Received: by mail-pl1-f195.google.com with SMTP id d24so2350810pll.8
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 00:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6x3raJsWJrKBOs4KmDhl3DHzaY6d4WRAbl46YPhMahs=;
        b=TvfXeIBa30JUm4/yO+K2Y3WiNj+8gvaEw+eZ/ORQgbnxUPkb/bXsI/mMkjOJ0iMZap
         sjDs170Wt4iFY6vnpwFJk4ZlRjsgIpbgfS951YM5+hjnzTxaQLf4oEyEt7j5cD+hoIcA
         8RnzuevlG/yQ6z/2g/AUIeCmb83XbuhhFDaAWdfBbL0MfwTBcr1efVYrZwzd4NJIO4Lq
         dVhaMsFnYrnC+iY5zvmtZTiUZp8c5WL5okSo7jnXcrqrJO3zUvWYmvXcr0eSE0NC39Ve
         BatwD+9kYwXyOgd0LYtTgTecHJEGesqRa/BjPyraJeYi6k+u4U9BPBIhk/E8L14s18L4
         yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6x3raJsWJrKBOs4KmDhl3DHzaY6d4WRAbl46YPhMahs=;
        b=Dc/xzwf+o2j25CMMH8lFLxpVogICdWf9mqVdE+3cvtfHqDZVb/XEt4iw5UXHEo8SV4
         9ZDHrsRkNF7Mb973s6MkbBPn16mMlH30g1QJGQBKFTaahbCvvAej+vXv0BZFOso+kstn
         DPUcvTexOcCeq1JFMNSA4O6ZkjJSt0YSP0Dv1OGyMuMs+kVAbvkm4IzGK2tvw/CFQazh
         eByrOe56kDBNa/aI5DD7B10lmlI0uf0kgITK4Sm40ROa5pSrLiIb+vi1ayM+1fD1dQ14
         gOo6TL4zL7R9IadVtV5yunvulnIj2e+H7Ak3WITsJq/ZrBD5NBTvXuKlKWIMuk/YPCP9
         4wnw==
X-Gm-Message-State: AGi0PuYnUoZrJTDAPlhSBhFMuAMnVBKns5RG/QlhUpZ1i3w/S5nWFDLo
        xu0gPvYCFqIKWcblgP3xHxnJeg==
X-Google-Smtp-Source: APiQypLH2xma3A/qCqnkzFp+pxTjvIbI9dx5dmYQp68ewi2c/AYzvdEjeRX97EIuL2QUocN7/X37PQ==
X-Received: by 2002:a17:902:7c89:: with SMTP id y9mr6424581pll.49.1585897319187;
        Fri, 03 Apr 2020 00:01:59 -0700 (PDT)
Received: from localhost ([45.127.44.53])
        by smtp.gmail.com with ESMTPSA id a24sm5195500pfl.115.2020.04.03.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 00:01:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, lukasz.luba@arm.com, mka@chromium.org,
        daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: thermal: Add yaml bindings for thermal sensors
Date:   Fri,  3 Apr 2020 12:31:46 +0530
Message-Id: <a91b5603caea5b8854cc9f5325448e4c7228c328.1585748882.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585748882.git.amit.kucheria@linaro.org>
References: <cover.1585748882.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As part of moving the thermal bindings to YAML, split it up into 3
bindings: thermal sensors, cooling devices and thermal zones.

The property #thermal-sensor-cells is required in each device that acts
as a thermal sensor. It is used to uniquely identify the instance of the
thermal sensor inside the system.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
 .../bindings/thermal/thermal-sensor.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml

diff --git a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
new file mode 100644
index 0000000000000..fcd25a0af38c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0)
+# Copyright 2020 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/thermal-sensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Thermal sensor binding
+
+maintainers:
+  - Amit Kucheria <amitk@kernel.org>
+
+description: |
+  Thermal management is achieved in devicetree by describing the sensor hardware
+  and the software abstraction of thermal zones required to take appropriate
+  action to mitigate thermal overloads.
+
+  The following node types are used to completely describe a thermal management
+  system in devicetree:
+   - thermal-sensor: device that measures temperature, has SoC-specific bindings
+   - cooling-device: device used to dissipate heat either passively or actively
+   - thermal-zones: a container of the following node types used to describe all
+     thermal data for the platform
+
+  This binding describes the thermal-sensor.
+
+  Thermal sensor devices provide temperature sensing capabilities on thermal
+  zones. Typical devices are I2C ADC converters and bandgaps. Thermal sensor
+  devices may control one or more internal sensors.
+
+properties:
+  "#thermal-sensor-cells":
+    description:
+      Used to uniquely identify a thermal sensor instance within an IC. Will be
+      0 on sensor nodes with only a single sensor and at least 1 on nodes
+      containing several internal sensors.
+    enum: [0, 1]
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    // Example 1: SDM845 TSENS
+    soc: soc@0 {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            /* ... */
+
+            tsens0: thermal-sensor@c263000 {
+                    compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
+                    reg = <0 0x0c263000 0 0x1ff>, /* TM */
+                          <0 0x0c222000 0 0x1ff>; /* SROT */
+                    #qcom,sensors = <13>;
+                    interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                                 <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+                    interrupt-names = "uplow", "critical";
+                    #thermal-sensor-cells = <1>;
+            };
+
+            tsens1: thermal-sensor@c265000 {
+                    compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
+                    reg = <0 0x0c265000 0 0x1ff>, /* TM */
+                          <0 0x0c223000 0 0x1ff>; /* SROT */
+                    #qcom,sensors = <8>;
+                    interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                                 <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+                    interrupt-names = "uplow", "critical";
+                    #thermal-sensor-cells = <1>;
+            };
+    };
+...
-- 
2.20.1

