Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F4CA9EBB
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:43:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDC0320679
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDAJ/s2T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfJXLnN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:43:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46657 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfJXLnN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:43:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so18857606lfc.13
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YA2/6tugEUXajeImGkJKBKEZmtx66gdb7sqhmJwslGY=;
        b=iDAJ/s2TGKVZ6cOgbobRLZao9OgQZQi4YmUL9dKbcSs9e/KS4Niu41OX1MSx/i5GY7
         PPhVqnHLpGXdNJAiKdPcVumOOKcYfz//oupiPnFZCbsLrtNYDgkYZy0Cirn3qvpxjb20
         5iIKRqM0RltwLAddbhLY4hIK0961eF/WNoi5rAE9X5r3ZtDdqL6z2cF7ge8/NS82H4AO
         YJUxt+tlC9o5KD60L1uGr8CoFCx9qB8gEZPlXyB1S7rAxB6TlxYJOghSGRVJBiqKJ4f7
         IjN4SwgefFkxpBLTKCgS3tvS+QsdWyDy217bxwUsQFWJFJJpEQuiU4sFgTpW21s5junV
         mqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YA2/6tugEUXajeImGkJKBKEZmtx66gdb7sqhmJwslGY=;
        b=KwPK4xyS1zxGbc5LPX7KfWLXBY7f8RtyMlcNSeQqvYqdY+MW5pDaI/Nm0rNSI+lgWh
         0Bu2oC/UNkz7VYIQjgq7CzhkR8UqHXtArQzuB9K0BG/VOqYRjSIfvf7kjZe6KedCgKci
         vN7e+uxEH9WduRbTra/zlrZZOqItRnYIyS0q8ULpPmuvGyk7KbC5VTsqNoW25EVdtXYE
         twQYVqNJ2k0M4xV7P8kHm3GAf0gfEsNlPr9A1JzFTsRQIsQ9qczB7HTPcTtR+eA6Rj1e
         Ga+lBa4sQ9F1kdBZkcMNwDMX/ik7rwa/AFD2d4c9VcPmjO0CW7GerfqA+VN8jTyL0sxA
         AyLw==
X-Gm-Message-State: APjAAAXoL7hdCDRZGFnAsNU7p8MLvd9xb0kDFzoTB9E08TWgXBfuWzC/
        66Xw/eEOD7lODq7X1dfwnCwrFQ==
X-Google-Smtp-Source: APXvYqx8kdrGIfury192V5XJYpRNsCP56CqynHKeZKfMOB1fdCbLg4LcLpygidy1qE2MCVmHRS5ULw==
X-Received: by 2002:ac2:5443:: with SMTP id d3mr24940890lfn.58.1571917390330;
        Thu, 24 Oct 2019 04:43:10 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e14sm4001846ljb.75.2019.10.24.04.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:43:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3 v4] drm/panel: Add generic DSI panel YAML bindings
Date:   Thu, 24 Oct 2019 13:43:03 +0200
Message-Id: <20191024114305.15581-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a starting point for processing and defining generic
bindings used by DSI panels. We just define one single bool
property to force the panel into video mode for now.

Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rename into display/dsi-controller.yaml
- Require a virtual channel number for the DSI panel, as
  DSI have this 2-bit virtual address field.
- Bring in some but not all properties from the existing MIPI
  DSI bindings. This schema can be used with simpler panels but
  not complex panels with multiple virtual channels for the
  moment. Let's handle it when we get there.
- Add an example.
ChangeLog v2->v3:
- Make a more complete DSI panel binding including the controller
  and its address-cells and size-cells and a pattern for the panel
  nodes. The panel is one per DSI master, the reg property is
  compulsory but should always be 0 (as far as I can tell) as
  only one panel can be connected. The bus doesn't really have
  any addresses for the panel, the address/reg notation seems
  to be cargo-culted from the port graphs and is not necessary
  to parse some device trees, it is used to tell whether the
  node is a panel or not rather than any addressing.
- I have no idea how many displays you can daisychain on a single
  DSI master, I just guess 15 will be enough. The MIPI-specs
  are memberwalled. Someone who knows can tell perhaps?
ChangeLog v1->v2:
- New patch after feedback.
---
 .../bindings/display/dsi-controller.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
new file mode 100644
index 000000000000..2a6d872a40c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dsi-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for DSI Display Panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This document defines device tree properties common to DSI, Display
+  Serial Interface panels. It doesn't constitute a device tree binding
+  specification by itself but is meant to be referenced by device tree
+  bindings.
+
+  When referenced from panel device tree bindings the properties defined in
+  this document are defined as follows. The panel device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+  Notice: this binding concerns DSI panels connected directly to a master
+  without any intermediate port graph to the panel. Each DSI master
+  can control exactly one panel. They should all just have a node "panel"
+  for their panel with their reg-property set to 0.
+
+properties:
+  $nodename:
+    pattern: "^dsi-controller(@.*)?$"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^panel@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description:
+          The virtual channel number of a DSI peripheral. Must be in the range
+          from 0 to 3, as DSI uses a 2-bit addressing scheme. Some DSI
+          peripherals respond to more than a single virtual channel. In that
+          case the reg property can take multiple entries, one for each virtual
+          channel that the peripheral responds to.
+
+      clock-master:
+        type: boolean
+        description:
+           Should be enabled if the host is being used in conjunction with
+           another DSI host to drive the same peripheral. Hardware supporting
+           such a configuration generally requires the data on both the busses
+           to be driven by the same clock. Only the DSI host instance
+           controlling this clock should contain this property.
+
+      enforce-video-mode:
+        type: boolean
+        description:
+          The best option is usually to run a panel in command mode, as this
+          gives better control over the panel hardware. However for different
+          reasons like broken hardware, missing features or testing, it may be
+          useful to be able to force a command mode-capable panel into video
+          mode.
+
+    required:
+      - reg
+
+examples:
+  - |
+    dsi-controller@55aa55aa {
+      compatible = "acme,foo";
+      reg = <0x55aa55aa>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "acme,bar";
+        reg = <0>;
+        vddi-supply = <&foo>;
+        reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...
-- 
2.21.0

