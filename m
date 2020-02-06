Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE4DC33CAC
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 06:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C52320838
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 06:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="q2VHUClJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgBFGYQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 01:24:16 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:38769 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgBFGYP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 01:24:15 -0500
Received: by mail-pg1-f177.google.com with SMTP id a33so2219978pgm.5
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 22:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izztQoaxTfYh608r7zUZBOPeN+NzswpzW45W6rctyos=;
        b=q2VHUClJwtxwoLcuIMbaSeogVD0FHsqoPIsjw1lNHdRKeKPkhkf/H3p9Gp6zUSh2Sp
         Rd0I9eY2Ffl0iWEecgJCq9lLSE9Kjth0JO/0zdN0Fa+nUK4y0lecWVVJQeMCdjJm5Lj3
         Ia8BTLRccs8w4Hh2EMtfV/ltV6JiIHLnuM/PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izztQoaxTfYh608r7zUZBOPeN+NzswpzW45W6rctyos=;
        b=K5DgNvNr9+7vxIGrvk8qgrEGGKUnoKk692P0yR8H4bBCsgV2edll6ygqbAT6e1mSwg
         zl9u43S6oZEMhaz4jEVLB8FwvtqYNJun3QguAuZuqGqgaMrBRFBI/wl+WNcbctFcsKZA
         Nl3JiKRL+opRoGUM7mJSBGBkn0LAcpOokA1DmxhOhvFaNOnK+Sx+kQAEptg+0VxpeQZC
         u1H2MoXROyg28kynPYb2m7lr+yAIsJJvffOLIi/cEkugXiWtQJz+f06f8B+lG20Z+8+a
         6Vh99zEafwxt3NiXxNhKU+SMKhPVDPEK9DdeLAcwM+3t9pIQbY74FO9L/OlMwoCYHT3e
         T8Iw==
X-Gm-Message-State: APjAAAU3of93bhEJ1csLxOlSVIhoCBMpCPG66SYMybjQx/qcW3krf5qH
        prZWlcoQFkeddzrBtsCCfVH2gQ==
X-Google-Smtp-Source: APXvYqw/vp5LNrRJt/Q+qLAv0gBC5SH+qxAyPYIF93LDaSu/2mohDSBDzGKy6o1Kvmhv0Vwzc6QljA==
X-Received: by 2002:aa7:8149:: with SMTP id d9mr2065758pfn.170.1580970254829;
        Wed, 05 Feb 2020 22:24:14 -0800 (PST)
Received: from virtualbox.hsd1.wa.comcast.net (c-67-171-239-254.hsd1.wa.comcast.net. [67.171.239.254])
        by smtp.gmail.com with ESMTPSA id z127sm1771323pgb.64.2020.02.05.22.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 22:24:14 -0800 (PST)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-iio@vger.kernel.org
Cc:     jic23@kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] dt-bindings: iio: chemical: consolidate atlas-sensor docs
Date:   Wed,  5 Feb 2020 22:13:32 -0800
Message-Id: <20200206061332.20427-4-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206061332.20427-1-matt.ranostay@konsulko.com>
References: <20200206061332.20427-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Since Atlas Scientific device support only varies from the compatible
string is ideal all the respective docs are merged into a single doc
named atlas,sensor.yaml

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../bindings/iio/chemical/atlas,ec-sm.txt     | 21 --------
 .../bindings/iio/chemical/atlas,orp-sm.txt    | 21 --------
 .../bindings/iio/chemical/atlas,ph-sm.txt     | 21 --------
 .../bindings/iio/chemical/atlas,sensor.yaml   | 53 +++++++++++++++++++
 4 files changed, 53 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,ec-sm.txt
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,orp-sm.txt
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,ph-sm.txt
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,ec-sm.txt b/Documentation/devicetree/bindings/iio/chemical/atlas,ec-sm.txt
deleted file mode 100644
index f4320595b851..000000000000
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,ec-sm.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* Atlas Scientific EC-SM OEM sensor
-
-http://www.atlas-scientific.com/_files/_datasheets/_oem/EC_oem_datasheet.pdf
-
-Required properties:
-
-  - compatible: must be "atlas,ec-sm"
-  - reg: the I2C address of the sensor
-  - interrupts: the sole interrupt generated by the device
-
-  Refer to interrupt-controller/interrupts.txt for generic interrupt client
-  node bindings.
-
-Example:
-
-atlas@64 {
-	compatible = "atlas,ec-sm";
-	reg = <0x64>;
-	interrupt-parent = <&gpio1>;
-	interrupts = <16 2>;
-};
diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,orp-sm.txt b/Documentation/devicetree/bindings/iio/chemical/atlas,orp-sm.txt
deleted file mode 100644
index af1f5a9aa4da..000000000000
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,orp-sm.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* Atlas Scientific ORP-SM OEM sensor
-
-https://www.atlas-scientific.com/_files/_datasheets/_oem/ORP_oem_datasheet.pdf
-
-Required properties:
-
-  - compatible: must be "atlas,orp-sm"
-  - reg: the I2C address of the sensor
-  - interrupts: the sole interrupt generated by the device
-
-  Refer to interrupt-controller/interrupts.txt for generic interrupt client
-  node bindings.
-
-Example:
-
-atlas@66 {
-	compatible = "atlas,orp-sm";
-	reg = <0x66>;
-	interrupt-parent = <&gpio1>;
-	interrupts = <16 2>;
-};
diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,ph-sm.txt b/Documentation/devicetree/bindings/iio/chemical/atlas,ph-sm.txt
deleted file mode 100644
index 79d90f060327..000000000000
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,ph-sm.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* Atlas Scientific pH-SM OEM sensor
-
-http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
-
-Required properties:
-
-  - compatible: must be "atlas,ph-sm"
-  - reg: the I2C address of the sensor
-  - interrupts: the sole interrupt generated by the device
-
-  Refer to interrupt-controller/interrupts.txt for generic interrupt client
-  node bindings.
-
-Example:
-
-atlas@65 {
-	compatible = "atlas,ph-sm";
-	reg = <0x65>;
-	interrupt-parent = <&gpio1>;
-	interrupts = <16 2>;
-};
diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
new file mode 100644
index 000000000000..1b0c476838d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/atlas,sensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atlas Scientific OEM sensors
+
+maintainers:
+  - Matt Ranostay <matt.ranostay@konsulko.com>
+
+description: |
+  Atlas Scientific OEM sensors connected via I2C
+
+  Datasheets:
+    http://www.atlas-scientific.com/_files/_datasheets/_oem/DO_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_oem/EC_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_oem/ORP_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
+
+properties:
+  compatible:
+    enum:
+      - atlas,do-sm
+      - atlas,ec-sm
+      - atlas,orp-sm
+      - atlas,ph-sm
+
+  reg:
+     maxItems: 1
+
+  interrupts:
+     maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      atlas@66 {
+        compatible = "atlas,orp-sm";
+        reg = <0x66>;
+        interrupt-parent = <&gpio1>;
+        interrupts = <16 2>;
+      };
+    };
-- 
2.20.1

