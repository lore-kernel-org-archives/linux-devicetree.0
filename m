Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8540C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 11:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B1D8214D8
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 11:55:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSf22LmP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbfLKLzX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 06:55:23 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39080 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbfLKLzW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 06:55:22 -0500
Received: by mail-lj1-f194.google.com with SMTP id e10so23712403ljj.6
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 03:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OF56zXhdjGUx6RHLdRal7OMJ6MFr6ViKDJ0o80jzbuo=;
        b=vSf22LmP0Cn3bRIqS86tNWpO9wCQHoulBfeNGhhxRAHwRBkDt/FS1UMW1K5F6bh73p
         8RAQUSf2I/a7Pib7NrnMqrPbR1dvHLsU2htaelJtdLl5V/A7NzdaaCQ/W8T64vUADEyZ
         ANvcLYs8zQZkedM8+pL1SzQ7xx0IBp6TDKKXPvEd8OaRjcJuNDCyb+/ikjgj8leSHjKp
         3aa43K8VpIlVclgz9EGJp4PgdBAhz2tRlrRYNAhmc1Yg5oqOBm3MsPtuVUJ81affg3Dw
         RUsNEGFFD6LmfNQOTNlP2ArnctnpWO5UkJND9F4fV6szf/oRS9IY9abmrjM4PCpUFGBy
         f/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OF56zXhdjGUx6RHLdRal7OMJ6MFr6ViKDJ0o80jzbuo=;
        b=o3NCjWiY5VbmsIl/b/E8tvAu3MHLYwn19qnWoFm2309IQYvoywdL/8sTmP9MjU7l7W
         GQADqys0hoHqOnbj3F9zm/898iEhaSSyXmgbCOt/uWcOd3bsvoAXTU7/exWc0KVRPCI7
         BXQVz6mDgubRW1NsWIr8fbUJdDso1JvK6+Fs/rzbG3nufAvz7Z2hl9THxpEQfSHmx0Yy
         pDUb5GEtRoyyjAZI/Yfdvwt8p/RRantWdK1pWTpsdpLWIYyue1BGT43x8celtaltJnB6
         H9eP54eEDO3nIMhnbMDJzjwmr0aFnoNvNTc8EmaIRGoxDGoBVJ4rnsK15mpjSQzrhDXs
         GNgw==
X-Gm-Message-State: APjAAAU7CXuLbUazrF1HGExDGpjZin9+PE7WkEvl2Zch67rdh7LSvQ4o
        TXTMO1BNSzpqpdGWnWMI30kimg==
X-Google-Smtp-Source: APXvYqxtceLbJ4OkYLp6/xWzYG06QrVtR6KvFuz4PddCRzdQkzqAkrr2CHxPaLZr1tiHrZ/Rsyhw2Q==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr1870701ljg.24.1576065319781;
        Wed, 11 Dec 2019 03:55:19 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id 138sm1055875lfa.76.2019.12.11.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 03:55:19 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dave.stevenson@raspberrypi.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
Date:   Wed, 11 Dec 2019 14:54:40 +0300
Message-Id: <20191211115441.10637-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211115441.10637-1-andrey.konovalov@linaro.org>
References: <20191211115441.10637-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add YAML device tree binding for IMX219 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx219.yaml | 112 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
new file mode 100644
index 000000000000..5e4293c21933
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description: |-
+  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
+  with an active array size of 3280H x 2464V. It is programmable through
+  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx219
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xclk
+
+  VDIG-supply:
+    description:
+      Digital I/O voltage supply, 1.8 volts
+
+  VANA-supply:
+    description:
+      Analog voltage supply, 2.8 volts
+
+  VDDL-supply:
+    description:
+      Digital core voltage supply, 1.2 volts
+
+  xclr-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released after all supplies are applied.
+      This is an active high signal to the imx219.
+
+  clock-noncontinuous:
+    description: |-
+      Presence of this boolean property decides whether the MIPI CSI-2 clock
+      is continuous or non-continuous.
+
+  camera-clk: true
+
+  port: true
+
+  data-lanes:
+    description: |-
+      Should be <1 2 3 4> for four-lane operation, or <1 2> for two-lane
+      operation.
+    const: <1 2>
+  clock-lanes:
+    const: <0>
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - VANA-supply
+  - VDIG-supply
+  - VDDL-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx219: sensor@10 {
+            compatible = "sony,imx219";
+            reg = <0x10>;
+            clocks = <&imx219_clk>;
+            clock-names = "xclk";
+            VANA-supply = <&imx219_vana>;   /* 2.8v */
+            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
+            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
+
+            imx219_clk: camera-clk {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <24000000>;
+            };
+
+            port {
+                imx219_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                    bus-type = <4>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 02d5278a4c9a..3baf2954d2f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15339,6 +15339,14 @@ S:	Maintained
 F:	drivers/media/i2c/imx214.c
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
 
+SONY IMX219 SENSOR DRIVER
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx219.c
+F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+
 SONY IMX258 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

