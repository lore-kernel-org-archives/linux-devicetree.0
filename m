Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67256C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33F2621781
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQZ9KLRH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfK1JHf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 04:07:35 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45482 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfK1JHf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 04:07:35 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so19435074lfa.12
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 01:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5UjhnJuEjyj7DznN8ie96zzIoa0qgehxmQpy2Flwiw=;
        b=jQZ9KLRH/IyP7J7f34S59X4Ixad02kof4PXY8+7sdJJV798Q3/puEG50I+ea6cSHeE
         f1McteR0Ll2DfBB3hWoycKwI+Vq/n2ibWW5VqggbNVt1BDbMKHc+Fk5Dibzl502QKDxu
         NifTSUg/07Fa5RU/CbYzSgdkiZ94td3zCvpGMrpIcZgxIi2OGlJInmqeM9vzm1MYp7Y0
         KYJGhc3th9ybGvd1iNbdCaL5h84XuElMImS7geuzXiUP3TjGmo3bddm15Na91TPbvdHE
         tctuE/d5+QPZCSAvaWJzO2J1X9LLiCZsYXtkbKqZeGE6RlKwc2gXUrE5CLkBdBHOyeew
         yHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5UjhnJuEjyj7DznN8ie96zzIoa0qgehxmQpy2Flwiw=;
        b=JOkuypra7IkolOLNZr4+mcx9u8Hnhp8rrs/asUP9wIZGwqWJfa0+Wq5MnCLIx9HJgh
         u36NgXOUefDLOnJNlnNa7R7MJHqivVXq8WCddh3+t9F5sdgKP+Re0RCL9+x1lfm6NljC
         AFTvA7K0H1vV22W/4rPOxd1BV0VfbrqxlsMpmC7c60uuAnkFB9QlTrHJMes6Cydh9Pl+
         UHEYJfX0KIwNT51vHs76kOjigK8LM+h3i8/QMKGzz15SdXZ1FkGOcAv9o4SFZYLnLeKa
         m8E46dg50ewbKhQcT/bDpyIJHw4XjollDuHyL5d4OMUysJY+/YnpKf8MTzJNjlUTcRJe
         0sAg==
X-Gm-Message-State: APjAAAXVfC/SOmtIJMowpxPlJwPt9/8NtRydu45I3U+hE2JHOhTkzvtB
        ExkhO9yFHbzUwPdUa+T89QDSMQ==
X-Google-Smtp-Source: APXvYqxUh3IoX9UT1+UEu8f/UNi7iEEkYiAYl9UMEyr8qEe1TA/mgZrkiAjCEM5tae8KEnBbxNMVDw==
X-Received: by 2002:ac2:5195:: with SMTP id u21mr561024lfi.141.1574932051377;
        Thu, 28 Nov 2019 01:07:31 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g11sm8238595lfb.94.2019.11.28.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 01:07:30 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v6] drm/panel: Add generic DSI display controller YAML bindings
Date:   Thu, 28 Nov 2019 10:07:26 +0100
Message-Id: <20191128090726.51107-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a starting point for processing and defining generic
bindings used by DSI display controllers and panels attached to
the virtual DSI ports.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Rename subject to pertain to DSI display controllers in general.
- Change some of the wording in the DSI controller description text,
  making it clear that the binding pertains to the combination of a
  DSI controller with at least one panel attached.
- Add a proper compiling example.
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
 .../bindings/display/dsi-controller.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
new file mode 100644
index 000000000000..fd986c36c737
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -0,0 +1,91 @@
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
+  Serial Interface controllers and attached panels. It doesn't constitute
+  a device tree binding specification by itself but is meant to be referenced
+  by device tree bindings.
+
+  When referenced from panel device tree bindings the properties defined in
+  this document are defined as follows. The panel device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+  Notice: this binding concerns DSI panels connected directly to a master
+  without any intermediate port graph to the panel. Each DSI master
+  can control one to four virtual channels to one panel. Each virtual
+  channel should have a node "panel" for their virtual channel with their
+  reg-property set to the virtual channel number, usually there is just
+  one virtual channel, number 0.
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
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi-controller@a0351000 {
+        reg = <0xa0351000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "sony,acx424akp";
+            reg = <0>;
+            vddi-supply = <&ab8500_ldo_aux1_reg>;
+            reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.23.0

