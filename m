Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D4BC4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A82120722
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RHuPFZ0B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgCTNph (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 09:45:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34726 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCTNph (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 09:45:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id s13so6478100ljm.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dhev12vgplB0YGPEx4Uruvjf1kUwXHqE9D1Ta1+i8vc=;
        b=RHuPFZ0By7Ocjqg0xJ137qu2BhNeFIluwAlqvDjoCWiUFCANyfPo/DXo6N7s0izeEv
         rGNNiqF1nbSD/bWQGoqQ0Du8B/OP+0ZFkOlsnHhyh9Gm4UhNNNkm6MBBgOHo+svFLfps
         PerY3tm6F9ut4TsS1kFuFO16G9JDi0Jljh2Y8iflRcG2KfrKUVQL6ub8UdIp4t0+X8D5
         VJVB8b99nmDtsZE/yThHYVWeG03DgWBd3xDPXOkonKvBxXgl/iY9pmhojZXc68OO6Jmo
         N8vU2/mkJ1ugWHiVZvzggi10tLJnjP0afQI2qqqawmwoDJQP2+xo4yqouRk2xTbVAiEo
         4bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dhev12vgplB0YGPEx4Uruvjf1kUwXHqE9D1Ta1+i8vc=;
        b=JAnSHtV93hEND/2+aDNWN1Z5mKGjEOEIjLgZqpKwjiGLadD3JlHZbRuG5ajSVU+ttu
         HUr0+noH12WddgYx6zxOFfmdAicN/ghFhNVaY02NdL0TCV1t2j9ubk37/JOw7FU1gTKC
         z8kOZ0VuAYabtTOiEjCa21oOFt8/kBBZ6WZdr1xWwrvyZnk3Ra3LAeC+uyt/VuXttc4X
         pfA4JB8xncJgU1CNbb8BrhF1VeL0gl3JKmAJUtmB9w2O+DeOsMYQZTwX6i/Ra5z+DZJO
         UWff9HqeaXvfpDZJMiIeZGDalpIAB/oNYqopb5hehVNqVTSV1GfUzVZYLHWb1G+G8syL
         /bAA==
X-Gm-Message-State: ANhLgQ1u0bXrY73QZk8Syj2NrlXeE7fY1cj9gJIkCfUkEiyo7tTwxxuj
        twBbbn4alN0M3dKOex1yIqBiOw==
X-Google-Smtp-Source: ADFU+vuOWEFVG0gP0Elps6dSYnypfg2BpwEqEMPnvtzDEJ3aXMvLcW1YXcAAOXoOYo5VB6AyB+rNkg==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr5744206ljk.220.1584711933927;
        Fri, 20 Mar 2020 06:45:33 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id t12sm3372135ljc.69.2020.03.20.06.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 06:45:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/2 v3] bus: Add DT bindings for Integrator/AP logic modules
Date:   Fri, 20 Mar 2020 14:45:24 +0100
Message-Id: <20200320134524.52140-1-linus.walleij@linaro.org>
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
ChangeLog v2->v3:
- Put proper ranges around the addresses managed by the
  LM bus, 0xc0000000-0xffffffff as
  <0xc0000000 0xc0000000 0x40000000>
- Put unit name on the first LM bus bus@c0000000 in the
  example in the bindings.
- Drop leading zeroes in the unit names of the devices
  in the example.
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
index 000000000000..47227427c1c0
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
+      ranges = <0xc0000000 0xc0000000 0x40000000>;
+      dma-ranges;
+
+      bus@c0000000 {
+        compatible = "simple-bus";
+        ranges = <0x00000000 0xc0000000 0x10000000>;
+        /* The Logic Modules sees the Core Module 0 RAM @80000000 */
+        dma-ranges = <0x00000000 0x80000000 0x10000000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        serial@100000 {
+          compatible = "arm,pl011", "arm,primecell";
+          reg = <0x00100000 0x1000>;
+          interrupts-extended = <&impd1_vic 1>;
+        };
+
+        impd1_vic: interrupt-controller@3000000 {
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

