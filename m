Return-Path: <SRS0=PDL5=Y3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9F9CA9EB0
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 20:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B38D21744
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 20:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYPPMa+Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfKCU5H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 15:57:07 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42865 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfKCU5H (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 Nov 2019 15:57:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so4378832ljc.9
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7KdH5c11vgvcfbrUMRZBwK/wj3iQHTOBDUEMgbBF7o=;
        b=TYPPMa+QYBVpd5yocUJ15KTLnkA83UNRK08a4/DeZ7HUpLZuH84eBxzF2jKBWvvNPj
         gHkwO/HlTGwlHp3+4BOdFaNp2Pteoah1dZ1krh8UZamKrQODmGPd97g6hQ8IgvgIAWxw
         xQuXdii8SbD9zSVU4tKYJ+avPF4+DmBMTTZfNUOCRLCKdX3T7H72VZy9uTlOoomImJSl
         kxmWMAtI3lhhKb9HaA/XJL6n9K2YdrklYXK4xYkpyqNvKN6bgEhUikmonDV63nNjlsoa
         +sXi7CcDSLmREezRs+lxGWRwHFIGW+OCG4O6zkkxwNJzz+RyKoeQwJ1bhjckQQ4L1znL
         f3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7KdH5c11vgvcfbrUMRZBwK/wj3iQHTOBDUEMgbBF7o=;
        b=HJFaOvavPMb+Ps+TC+wWOezsTF74cWmEXk89TKfmxLZp2WN84J9DfObYbY+htTKuMV
         p5YAGuaLxh6RxQtQnht6pJNF6GzUUMlBOKkHIo7SoUw4VIbVB1TbDXh4XDf1btP7iIf+
         rh82ifLfu3zf+4Xc1+j5BijdraSZwd5HHBvRPSEE5havrQBkB1r98U495Zu67lHaf9mB
         ElDLRVItT+Mpbd6zMvaJWV0bQgvWJiZBwI5ppI8PlEYPa3TDslHjRKouBudmcG2cX0dV
         CxxuCz3kGqVX7Jr8EDGJ7JAP4YcTx+cy1z3fZSfmTmFvzaPU1R1d6GqcGOivE9oImowj
         0UgQ==
X-Gm-Message-State: APjAAAXiNlYvpwvVjOrk893yT6FhH9m2LchSoXGzK99ZkB0xhJ/bwcgm
        xDBccX1O6zU/rT/Kv6tbCZZjSA==
X-Google-Smtp-Source: APXvYqwsQLeZ5wJvU3uN4fZWbOdfilSmiUxV9YCjGHfGn1W5OrH3jAjWuiWzUez5d6aiLnweEsfPfg==
X-Received: by 2002:a2e:8082:: with SMTP id i2mr15757021ljg.211.1572814625205;
        Sun, 03 Nov 2019 12:57:05 -0800 (PST)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id v203sm6936784lfa.25.2019.11.03.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 12:57:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v5] drm/panel: Add generic DSI panel YAML bindings
Date:   Sun,  3 Nov 2019 21:54:58 +0100
Message-Id: <20191103205459.24965-1-linus.walleij@linaro.org>
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
ChangeLog v4->v5:
- Drop the example.
- I still have a vert annoying error message in the Sony
  panel bindings that uses this schema:
  sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
  As this is modeled very closely to
  Documentation/devicetree/bindings/net/mdio.yaml
  and that one doesn't emit this type of warning for its ethernet-phy@0
  etc I am pretty much clueless and just can't see what the problem
  is.
- If I can't figure this out the only viable next step is to drop the
  ambition to create yaml bindings simply because I'm unable to do
  it, and go back to traditional text bindings :(
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
 .../bindings/display/dsi-controller.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
new file mode 100644
index 000000000000..9e2bf7776c15
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/dsi-controller.yaml#
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
+    description: Panels connected to the DSI link
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
+...
-- 
2.21.0

