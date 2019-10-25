Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A84ACA9EBD
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E217121D7F
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yg3+cfho"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfJYRvo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 13:51:44 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:40441 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfJYRvo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 13:51:44 -0400
Received: by mail-pg1-f174.google.com with SMTP id 15so2001408pgt.7
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h3QJdMfhJbfPOyUujEeH2uCMTYfYjj0kP8BVOZvY6vk=;
        b=yg3+cfhoMvzbNVLOYxlHpxK9zIstoIJ+vmFQRnolgRRIna9gktbKYtnBZ7RBVfRwKn
         hNHOI/2OChFg9xUnidYcX0AONc1idmHcSOFRAMx5zZgLAfR+omQFY5WcMVEQRO+8g1eP
         3uiUrvtY7t0ofUZUIevZNs/EuWWoRUXSp7eOaMHfGkS26igzuxLUnKHx7ArgeVNWWFTl
         5zepKRIYkT/HbMEWB/RIEzhUOX/IhjONMKVbB3KpOiAOs91pXkLpAwgNjikBQrkHRO7K
         C8awJpIDnRKpXJZNzDVCYoxv7jkI1DE0IzqQl0KVVx74h8VhH6pkLsqNvcVYfLSRzm/m
         /HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h3QJdMfhJbfPOyUujEeH2uCMTYfYjj0kP8BVOZvY6vk=;
        b=RaQz8k21tQ8aHPJ0/J1AFqrZHutRhoOGWzwyQ6oy5Wgzm95g81mvkuLBwJJ8Q0ORT/
         Wm3RVaFjFZajjcRffMwsun6ReBNAKrJ4NuzD3pg9uPtd33eL6Pb/XlEEEX2Yt3C3ngai
         e+NIv1oTZKgEiizfsoS1SyF02hkZx/GnxRucxDPO8SHhVzLjdDmvLsTNTexjgc6qJF26
         XpMWOnHxGD/7W0fHhoqy6GbDcld+qk8kHbP3W1kjTtUc8A9ftpPbacX+HxPFN0oWm2f7
         /6HqVNvOnoxHmbgbIzeFdEHxqw7BOJ5WHL6s/5qdS9c1VTeK/iikFzs4POMixdmAtD3l
         qfZw==
X-Gm-Message-State: APjAAAXL6XZLeofEzFhaMgrcWg2mS2IXLsq1/r+zfPdn2GrpVwyFLi8p
        9ziCafcvMJpi/4NRxDCSFmlR
X-Google-Smtp-Source: APXvYqyoCaci5yjaMYOinOTAO7wfDp4OzDWRoNXvt7YtfSuacvKl3MyK2mJVfrQraK7kLO0cDLgpiw==
X-Received: by 2002:a65:4907:: with SMTP id p7mr5957791pgs.429.1572025901575;
        Fri, 25 Oct 2019 10:51:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7108:7f86:4131:5b00:9fc5:5eaa])
        by smtp.gmail.com with ESMTPSA id d14sm3916345pfh.36.2019.10.25.10.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:51:41 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
Date:   Fri, 25 Oct 2019 23:21:17 +0530
Message-Id: <20191025175118.13307-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025175118.13307-1-manivannan.sadhasivam@linaro.org>
References: <20191025175118.13307-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add devicetree binding for IMX296 CMOS image sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
new file mode 100644
index 000000000000..646fe0236138
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |-
+  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
+  sensor with square pixel array and 1.58 M effective pixels. This chip
+  features a global shutter with variable charge-integration time. It is
+  programmable through I2C and 4-wire interfaces. The sensor output is
+  available via CSI-2 serial data output (1 Lane).
+
+properties:
+  compatible:
+    const: sony,imx296
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock for the sensor.
+    items:
+      - const: mclk
+
+  clock-frequency:
+    description:
+      Frequency of the mclk clock in Hertz.
+    default: 37125000
+
+  vddo-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+    maxItems: 1
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+    maxItems: 1
+
+  vddd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+    maxItems: 1
+
+  # See ./video-interfaces.txt for details
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - vddo-supply
+  - vdda-supply
+  - vddd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    imx296: camera-sensor@1a {
+        compatible = "sony,imx296";
+        reg = <0x1a>;
+        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&camera_rear_default>;
+        clocks = <&gcc 90>;
+        clock-names = "mclk";
+        clock-frequency = <37125000>;
+        vddo-supply = <&camera_vddo_1v8>;
+        vdda-supply = <&camera_vdda_3v3>;
+        vddd-supply = <&camera_vddd_1v2>;
+
+        port {
+            imx296_ep: endpoint {
+                remote-endpoint = <&csiphy0_ep>;
+            };
+        };
+    };
+
+...
-- 
2.17.1

