Return-Path: <SRS0=6oDv=AJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6B0C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 28 Jun 2020 20:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2DBB206F2
	for <linux-devicetree@archiver.kernel.org>; Sun, 28 Jun 2020 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593376189;
	bh=FEHo1UuIHQpzcajXmsN834ntqjUiX66JOcT9ouERb0M=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=q3UEERIyIepg3btQLLaQPZ/dkWTTyGVdaaJDBy3xS4hQ0YtDn7xOk60sFBpYqoayd
	 jWknl8eGESOH3GMM6bAHpWEDV/9qGRm+AjQRg9gMWEiwgjrDuqbPU6yJhK6qum000k
	 NZgKX2oRyZtqHg4anBM/JJBV2dH2xt8LifJR+yKQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgF1U3t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 28 Jun 2020 16:29:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgF1U3t (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 28 Jun 2020 16:29:49 -0400
Received: from localhost.localdomain (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93BA6206E9;
        Sun, 28 Jun 2020 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593376188;
        bh=FEHo1UuIHQpzcajXmsN834ntqjUiX66JOcT9ouERb0M=;
        h=From:To:Cc:Subject:Date:From;
        b=bn5IELXxAmxqNU2sRFR90ycKiIrAcP0GuoFiGbN201si7H2d9BT20E3Pq4UaqzS83
         GKHm9e5vOTSdEfZy4iEH2bfXeI+00Z7wIgffnyDWE95PYnVyehqMmBnUndZ4pD20u8
         7yG35cwW1Y32Ngam4uQZ9N9r7BzjfFUA3SIGn+Bg=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernelorg, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH] dt-bindings: iio: accel: kionix,kxsd9 yaml conversion.
Date:   Sun, 28 Jun 2020 21:27:32 +0100
Message-Id: <20200628202732.49793-1-jic23@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Convert and flesh out a bit the binding docs for this simple 3 axis
accelerometer.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 .../bindings/iio/accel/kionix,kxsd9.txt       | 22 -------
 .../bindings/iio/accel/kionix,kxsd9.yaml      | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
 create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
deleted file mode 100644
index b25bf3a77e0f..000000000000
--- a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Kionix KXSD9 Accelerometer device tree bindings
-
-Required properties:
- - compatible: 		should be set to "kionix,kxsd9"
- - reg:			i2c slave address
-
-Optional properties:
- - vdd-supply:		The input supply for VDD
- - iovdd-supply:	The input supply for IOVDD
- - interrupts:		The movement detection interrupt
- - mount-matrix:	See mount-matrix.txt
-
-Example:
-
-kxsd9@18 {
-	compatible = "kionix,kxsd9";
-	reg = <0x18>;
-	interrupt-parent = <&foo>;
-	interrupts = <57 IRQ_TYPE_EDGE_FALLING>;
-	iovdd-supply = <&bar>;
-	vdd-supply = <&baz>;
-};
diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
new file mode 100644
index 000000000000..d61ab4fa3d71
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accel/kionix,kxsd9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kionix KXSD9 Accelerometer
+
+maintainers:
+  - Jonathan Cameron <jic23@kernel.org>
+
+description: |
+  3 axis 12 bit accelerometer with +-8G range on all axes. Also has a
+  12 bit auxiliary ADC channel. Interface is either SPI or I2C.
+
+properties:
+  compatible:
+    const: kionix,kxsd9
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  iovdd-supply: true
+
+  interrupts:
+    maxItems: 1
+
+  mount-matrix:
+    description: an optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    # include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        accel@18 {
+            compatible = "kionix,kxsd9";
+            reg = <0x18>;
+            iovdd-supply = <&iovdd>;
+            vdd-supply = <&vdd>;
+            interrupts = <57 IRQ_TYPE_EDGE_FALLING>;
+            mount-matrix = "-0.984807753012208", "0",  "-0.173648177666930",
+                           "0",                  "-1", "0",
+                           "-0.173648177666930", "0",  "0.984807753012208";
+        };
+    };
+  - |
+    # include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        accel@0 {
+            compatible = "kionix,kxsd9";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+        };
+    };
+...
-- 
2.27.0

