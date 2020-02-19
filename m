Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE599C34047
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9233C2465D
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDNT+wLv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgBSPIp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 10:08:45 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40240 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgBSPIo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 10:08:44 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18so717070ljo.7
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GW5v5BX8+tkqxHE6xYMEE58vdhGvaHw9mUA5BJgYcpk=;
        b=SDNT+wLvYQFqipXTK1TpD7uG4xelSkjY1h8N+U+wQ3GZpwzfe6Tyu0MZzQUBHkVxUK
         MIQwcy6EzIVFKTq49D4VXbm+ib98EEeyKzA3zhT4KdfjlYygEZeFDvg68tOQKQ/hRye1
         0RBJb0HXfMZHWJZ+bosGy+d88FGepcoCxu7gN64KsEFI8+AUAbDZP05mW409AEK6rea/
         cXQIvGCz+G7NTa34KsFBIOr6L1c6ubsCA6olxpdrB8S53G2QqUxDAIIML/dBYaJk0QyI
         cz68S4B44lXN1Yf8acFS9j6RGMyujENATUS24aVfjj8DM+/O8SHu4H8CZyG1mfP+DNRD
         37Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GW5v5BX8+tkqxHE6xYMEE58vdhGvaHw9mUA5BJgYcpk=;
        b=Ca7tKr2MiREWOzgW3RI6EcJGdo+tU4OQXQqufELdG0Rfl1YL4bLuMqwljI9ZV3ljXi
         FD5w0y+6Ef0dYMQjymxvpOjS+3g3/nYq5zc2Ji14oqi5bGlsAPiIBM1xqrITuYgf1hs8
         vNjeuhqz6ClET5/Y1gRryNWNM+Sz54VzDRtMWxIsWHX9+MQNsm5EiNRvkq9T8TkVi7WJ
         N0GDpQcCJW0tYZ9StI+4CWmmlR6GZW8FzPL8Wb1rMD6Xo+5sX+6wyPeqUUyW046CnoNP
         8LfwBy0AB8DMhY1vKK6oqtMxQkBzyeQW1kdWtCJq9ucgEzi8sPi3W0enPTrl9oiWYgjC
         p5Cg==
X-Gm-Message-State: APjAAAXTgXAvYUGusfRD/4WIDp9HEwqnPSXkcu+zgs2ynE3gxzHdSKFQ
        NPrjCsjle209O5fv2W3UqCIPUA==
X-Google-Smtp-Source: APXvYqxq9QwwEWQUHZuUzrPDFRAd/veEn/AEdJrsQxUlkSA0VQ9fVRv9rgpN9uJcRMQVB4+BJt/pHA==
X-Received: by 2002:a2e:721a:: with SMTP id n26mr16157864ljc.128.1582124921791;
        Wed, 19 Feb 2020 07:08:41 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m83sm1524809lfa.5.2020.02.19.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 07:08:41 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/2 v2] bus: Add DT bindings for Integrator/AP logic modules
Date:   Wed, 19 Feb 2020 16:08:33 +0100
Message-Id: <20200219150833.126058-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds YAML device tree bindings for the Integrator/AP
logic modules. These are plug-in tiles used typically for
FPGA prototyping.

Cc: devicetree@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix Logical->Logic spelling error
- Set generic names for bus and serial
- Just map the addresses 1:1 and use empty ranges, as the
  LM's don't really translate the address.
- Provide proper DMA ranges: the LM modules see the RAM at
  the system-wide alias @80000000 rather than 1:1.
- Drop the reg from the bus node (we just need the ranges)
- Make the regexp for the bus node such that @address is
  optional, as we don't require any reg on the node
---
 .../bindings/bus/arm,integrator-ap-lm.yaml    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml

diff --git a/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
new file mode 100644
index 000000000000..5db5267410a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/arm,integrator-ap-lm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Integrator/AP Logic Module extension bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: The Integrator/AP is a prototyping platform and as such has a
+  site for stacking up to four logic modules (LM) designed specifically for
+  use with this platform. A special system controller register can be read to
+  determine if a logic module is connected at index 0, 1, 2 or 3. The logic
+  module connector is described in this binding. The logic modules per se
+  then have their own specific per-module bindings and they will be described
+  as subnodes under this logic module extension bus.
+
+properties:
+  "#address-cells":
+    const: 1
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
+  "^bus(@[0-9a-f]*)?$":
+    description: Nodes on the Logic Module bus represent logic modules
+      and are named with bus. The first module is at 0xc0000000, the second
+      at 0xd0000000 and so on until the top of the memory of the system at
+      0xffffffff. All information about the memory used by the module is
+      in ranges and dma-ranges.
+    type: object
+
+    required:
+      - compatible
+
+required:
+  - compatible
+
+examples:
+  - |
+    bus@c0000000 {
+      compatible = "arm,integrator-ap-lm";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+      dma-ranges;
+
+      bus {
+        compatible = "simple-bus";
+        ranges = <0x00000000 0xc0000000 0x10000000>;
+        /* The Logic Modules sees the Core Module 0 RAM @80000000 */
+        dma-ranges = <0x00000000 0x80000000 0x10000000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        serial@00100000 {
+          compatible = "arm,pl011", "arm,primecell";
+          reg = <0x00100000 0x1000>;
+          interrupts-extended = <&impd1_vic 1>;
+        };
+
+        impd1_vic: interrupt-controller@03000000 {
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
2.24.1

