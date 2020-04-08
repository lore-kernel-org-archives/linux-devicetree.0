Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55904C2BB85
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2975E20768
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5oFaK8U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgDHTwG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40392 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id 142so4453430ljj.7
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K6Ojd94vjUcgSndzfprDVKF+JSlxG4uGRfRXsYpGzQ0=;
        b=d5oFaK8UwOZi7H5F48rnNaK2R8v6LkGnKwHFDBzDgHi/ojGrvQzjwZ+lzvVLhz0wDG
         lGhd6WN0q1JE2+li4ltylG/TjC0yKBgl0u3sye4rUxxuD3Yz8clpWWNnBhOsFx7/Mafh
         UakuDeyrWRbksFKH9NKCB3XeXOdTpo4myPKOAHrIKOwhajzFT5fBB9DwJHqSpjDIFDtb
         HLcLuC7pPaRLWLxjliscAUvZ9V4W4HxkqdPw92JiOYt/QKYttmCuaxJL9aNbjqaSnbAs
         8WoFH7iow2pBdcaIpYsQ79aKcFx+vXY9K4jLcLPwnz0upKHwAMWmDoONqvOKjBWFHjEe
         Dueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=K6Ojd94vjUcgSndzfprDVKF+JSlxG4uGRfRXsYpGzQ0=;
        b=FGwE9q8Jad2Yt9qpxFc+2oNy+pU/PtkaOZv38to4UbZnjlefT7PFOYKy++6p+MjM9n
         zV0SAAK6UBjOXDgTiBDUP4pq05ydJ96SccKkRt34J91fIeD8Y9pmZ1AppBbozWQ1RgFs
         bsAELSOCZJR5D6XTkJeqz05QOXq304g3Ue+rODnrNdPGIKp0oDwL6ETl8812nqmYogFN
         oPo3BYC1dfDRTmPC7KbbtRVYpofy0QnwNpUSWF9gOMdQMER2nOkt7O3NCaF02/eu1v9y
         PqrK969ad1/W8nFyRiO6+hEa1SQI6A8nZVtaCB/eibngXK+cE5MlafRgUpkXUE25KDN/
         F2sQ==
X-Gm-Message-State: AGi0PuZ7BB40ffbpBE7BvW1nJqIwGkUp+F+HLzmiiVQRV/uP7/ejXJzc
        7a7sHrElGnbrMkkWsrbJblM=
X-Google-Smtp-Source: APiQypJbuaHNQe5dLcOoFSvhluuZKo2c0ks74xx7xSGRxc9QW9zx74abZXhtv300Khuz3xg3CEOWOA==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr6156018ljc.143.1586375522923;
        Wed, 08 Apr 2020 12:52:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:02 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2 20/36] dt-bindings: display: convert samsung AMOLED to DT Schema
Date:   Wed,  8 Apr 2020 21:50:53 +0200
Message-Id: <20200408195109.32692-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For samsung there was two AMOLED panels with the same
description.
Collect them in one binding file.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../panel/samsung,amoled-mipi-dsi.yaml        | 65 +++++++++++++++++++
 .../display/panel/samsung,s6e3ha2.txt         | 31 ---------
 .../display/panel/samsung,s6e63j0x03.txt      | 24 -------
 3 files changed, 65 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
new file mode 100644
index 000000000000..96bdde9298e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,amoled-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMOLED MIPI-DSI panels
+
+maintainers:
+  - Hoegeun Kwon <hoegeun.kwon@samsung.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # Samsung S6E63J0X03 1.63" 320x320 AMOLED panel
+      - samsung,s6e63j0x03
+        # Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
+      - samsung,s6e3ha2
+        # Samsung S6E3HF2 5.65" 1600x2560 AMOLED panel
+      - samsung,s6e3hf2
+
+  reg: true
+  reset-gpios: true
+  enable-gpios: true
+  te-gpios: true
+
+  vdd3-supply:
+    description: I/O voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply
+  - vci-supply
+  - reset-gpios
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e3ha2";
+            reg = <0>;
+            vdd3-supply = <&ldo27_reg>;
+            vci-supply = <&ldo28_reg>;
+            reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+            te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
deleted file mode 100644
index 4acea25c244b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
-Samsung S6E3HF2 5.65" 1600x2560 AMOLED panel
-
-Required properties:
-  - compatible: should be one of:
-    "samsung,s6e3ha2",
-    "samsung,s6e3hf2".
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd3-supply: I/O voltage supply
-  - vci-supply: voltage supply for analog circuits
-  - reset-gpios: a GPIO spec for the reset pin (active low)
-  - enable-gpios: a GPIO spec for the panel enable pin (active high)
-
-Optional properties:
-  - te-gpios: a GPIO spec for the tearing effect synchronization signal
-    gpio pin (active high)
-
-Example:
-&dsi {
-	...
-
-	panel@0 {
-		compatible = "samsung,s6e3ha2";
-		reg = <0>;
-		vdd3-supply = <&ldo27_reg>;
-		vci-supply = <&ldo28_reg>;
-		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
-		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
-		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
deleted file mode 100644
index 3f1a8392af7f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Samsung S6E63J0X03 1.63" 320x320 AMOLED panel (interface: MIPI-DSI command mode)
-
-Required properties:
-  - compatible: "samsung,s6e63j0x03"
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd3-supply: I/O voltage supply
-  - vci-supply: voltage supply for analog circuits
-  - reset-gpios: a GPIO spec for the reset pin (active low)
-  - te-gpios: a GPIO spec for the tearing effect synchronization signal
-    gpio pin (active high)
-
-Example:
-&dsi {
-	...
-
-	panel@0 {
-		compatible = "samsung,s6e63j0x03";
-		reg = <0>;
-		vdd3-supply = <&ldo16_reg>;
-		vci-supply = <&ldo20_reg>;
-		reset-gpios = <&gpe0 1 GPIO_ACTIVE_LOW>;
-		te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
-	};
-};
-- 
2.20.1

