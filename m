Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F814C2D0F1
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 11:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4663220776
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 11:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbdDNrTR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbgDALPj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 07:15:39 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38854 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732388AbgDALPj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 07:15:39 -0400
Received: by mail-pj1-f65.google.com with SMTP id m15so2556776pje.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5DAow7umIWoAdNuh/e+goWjtgRcJmCEdNFZmOOCst4=;
        b=FbdDNrTR1rEsjP1N92wJt0BbZU1h1vMbPUnnk+XeEz8HfNkMz4RdOeztgYLcCCLCk8
         V7k223ZleYtO9TFWzl8SeoGowRT8VfOs348F7CwQi5LzFlw7B1LqcpEMWNIXnc/HLJL6
         3Or/vPnKqbpAeluNFB+zBYGLl4Nv6lvZjkUiMq998r/UqMiAbqXy2HgU6p//pYSwzIEI
         GvcJlmdwd6/ceZDUY5TpY7OmiQToa/sOHgTBLTP6f8zCrQlN+R93Smsf/tJJQSNqUdMR
         zZV1wxa6H/+SZ2p5NukrvN348AeC97Av2V5C+6RPf+vttb7ZSw8T8J9d01mRSUx+dLx3
         XmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5DAow7umIWoAdNuh/e+goWjtgRcJmCEdNFZmOOCst4=;
        b=bTv1aNDjuqbMS3A+LZ4m7mT20eNVx7pCQhnbjxKtHR/7AGMPRmpEoejZOumcep2EDS
         hvko9S3xF7KkLx5Vmr7GLxNnXg4u8xJxKTRYksRiwVEClGSMFtJn7kPW3SN3UUnBW9W3
         OX4zv7RDcc54Bxtdz3Oy2mwGEFHBAwle88YuvBv0kKzkK+SJdMOxtchmaaO+mwpuN9ry
         XyF3B42QO3GFu9fxuwQI7mR4UL3ElGnjQHY5B+ZzXfN1+8v3zOPN4q3Jm9bbJBxeo2Y1
         chfqF7fUpJAKOTJF25lkuKWq3EpujVSuPp4bOnuRWIhE0VFTgySN3R+Op0SgHv5q8OPy
         PLww==
X-Gm-Message-State: ANhLgQ1v/PN2bqYnh01saUeTFharTUrueOWo4DUT+4QCv8yhwySmOwJw
        Aj60JN+geRorYGHh505RRMhTFw==
X-Google-Smtp-Source: ADFU+vvVBGvIhVhr1zs31Lyb+iHUNpWCBDeKn6KRUgdZt8UMivaSHVOyGOX91na4FYx2WR1Ob70hjg==
X-Received: by 2002:a17:902:fe06:: with SMTP id g6mr22139809plj.263.1585739737563;
        Wed, 01 Apr 2020 04:15:37 -0700 (PDT)
Received: from localhost ([103.195.202.232])
        by smtp.gmail.com with ESMTPSA id go9sm1388404pjb.27.2020.04.01.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 04:15:36 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, lukasz.luba@arm.com, mka@chromium.org,
        daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: thermal: Add yaml bindings for thermal sensors
Date:   Wed,  1 Apr 2020 16:45:25 +0530
Message-Id: <146b5dfebf23321c1eed8190ada957e2264ffe65.1585738725.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585738725.git.amit.kucheria@linaro.org>
References: <cover.1585738725.git.amit.kucheria@linaro.org>
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
---
 .../bindings/thermal/thermal-sensor.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml

diff --git a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
new file mode 100644
index 0000000000000..920ee7667591d
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
+   - cooling-device: device used to dissipate heat either passively or artively
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

