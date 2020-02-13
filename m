Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B8CC2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 12:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B90FF20848
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 12:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iymsOcVz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgBMMq1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 07:46:27 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45164 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729544AbgBMMq1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 07:46:27 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so4146894lfa.12
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVG6n3U//xPXGVSSKSNURJ+hYLlhk5sIndNvOvXvluk=;
        b=iymsOcVz5YQJTiTPW/ZRvBWUVozaeBXfqwxZ7sP92D1AfV4efpUxXKAYi56Qc95YNf
         vEMGleomaQb/rMLP+9xB3B5E7slHRU7deuKFKcsG3IBwUYVzty4dTaCBEKEr9s/RdXf3
         GrZ03Zwkz4L+o4DXPiuiXCpXx5BN35FOxofjp2AFfByh451IAZnnyOCf7soaKJNGC6sK
         TUlX6EVyKI2A2wtUjmB44pTZ0YqrEMNNP/kriYOksnICF+ocGIZOGVrysDN776nKjDAr
         gOx6f1zMgUrwo9AIzOurfAcO3z2f3ce3voNzqwPxXzafFbHuzBsTtFoOKBulI8emL+L/
         BeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVG6n3U//xPXGVSSKSNURJ+hYLlhk5sIndNvOvXvluk=;
        b=nBNXDcROCh4aIMjWNwSg7XsFjYVZkLmP9TgwQIOAoWahOWd0bP12GXZ0NBM5ziWhEU
         i2WDR/TLivahAsF5EzKw6x+mf7Z8X41xa9Gr4ZQKTyzWaswkC8z27cII4LhD1w77Y2G9
         5Zvt7ZoidpeAGP+v8yiBTP6f4Qzyl6IPnT21zSxFllW9La5QD2XCdEEy53k+e/Kdaydg
         8CP0dQSg55rthIEsGrq0mWr6zW6JK/7Zya9uAAN16CpSlpljYnzk4fIiqjx2d3zgIt4w
         mHEEumdpcHdN4wOr63jgQIxaBwgFJZFh/CxvzHcxlQSXa43BqBNiUDVor36+r3Pa2Omw
         jikg==
X-Gm-Message-State: APjAAAUaopXV+117BThAHkU4jnlPfVAzqRo3ObMsh5DvcUmKvPeVIFqJ
        oMendHo7P4W0KJvmeFQNJU3+QA==
X-Google-Smtp-Source: APXvYqyB4Gpi72cah1IhY/oSi6hXj6VsSn/n1Qp+/Gch9IAgCKK9Ns778aCes0djRhsN1LJ2Nwbl9Q==
X-Received: by 2002:a19:c210:: with SMTP id l16mr9431224lfc.35.1581597984516;
        Thu, 13 Feb 2020 04:46:24 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g15sm1398642ljl.10.2020.02.13.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 04:46:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] bus: Add DT bindings for Integrator/AP logical modules
Date:   Thu, 13 Feb 2020 13:46:19 +0100
Message-Id: <20200213124620.34982-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds YAML device tree bindings for the Integrator/AP
logical modules. These are plug-in tiles used typically for
FPGA prototyping.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/bus/arm,integrator-ap-lm.yaml    | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml

diff --git a/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
new file mode 100644
index 000000000000..dfabfa466c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/arm,integrator-ap-lm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Integrator/AP Logical Module extension bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: The Integrator/AP is a prototyping platform and as such has a
+  site for stacking up to four logical modules (LM) designed specifically for
+  use with this platform. A special system controller register can be read to
+  determine if a logical module is connected at index 0, 1, 2 or 3. The logical
+  module connector is described in this binding. The logical modules per se
+  then have their own specific per-module bindings and they will be described
+  as subnodes under this logical module extension bus.
+
+properties:
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  compatible:
+    items:
+      - const: arm,integrator-ap-lm
+
+  ranges: true
+  dma-ranges: true
+
+patternProperties:
+  "^.*@[0-3],[0-9a-f]+$":
+    description: Nodes on the Logical Module bus represent logical modules
+      and are named with index,relative-address. The first module is at
+      0x00000000, the second at 0x10000000 and so on until the top of the
+      memory of the system at 0xffffffff.
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+
+required:
+  - compatible
+
+examples:
+  - |
+    external-bus@c0000000 {
+      compatible = "arm,integrator-ap-lm";
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges = <0 0x0 0xc0000000 0x10000000>,
+               <1 0x0 0xd0000000 0x10000000>,
+               <2 0x0 0xe0000000 0x10000000>,
+               <3 0x0 0xf0000000 0x10000000>;
+      dma-ranges = <0 0x0 0xc0000000 0x10000000>,
+               <1 0x0 0xd0000000 0x10000000>,
+               <2 0x0 0xe0000000 0x10000000>,
+               <3 0x0 0xf0000000 0x10000000>;
+      im-pd1@0,0 {
+        compatible = "simple-bus";
+        ranges = <0 0 0 0x10000000>;
+        dma-ranges = <0 0 0 0x10000000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        uart@c0100000 {
+          compatible = "arm,pl011", "arm,primecell";
+          reg = <0x00100000 0x1000>;
+          interrupts-extended = <&impd1_vic 1>;
+        };
+
+        impd1_vic: interrupt-controller@c3000000 {
+          compatible = "arm,pl192-vic";
+          interrupt-controller;
+          #interrupt-cells = <1>;
+          reg = <0x03000000 0x1000>;
+          valid-mask = <0x00000bff>;
+          interrupts-extended = <&pic 9>;
+        };
+      };
+    };
+
+additionalProperties: false
-- 
2.23.0

