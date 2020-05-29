Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A3EC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3B5720B80
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N9Z6o0DN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391740AbgE2DAZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 23:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391736AbgE2DAX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 23:00:23 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8884AC08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:00:23 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id p5so824061qkg.12
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cS4si54+VztcokwIEGGa2QcG5KXJXjA3buAtdrcGL0k=;
        b=N9Z6o0DNi0KO2ImFNYIDngM3aZGY0t9BFs0K9ple8Fxk8OPFvyu2Wnu7BTUIFjxhgk
         ezvHP3FIHxlAD/DRr7r1UfbbQi4qK+qyGSg7VWQuBYK0N2Nget9VVDpNAw3upA0ZX8ID
         D4q5/XZaiepxcQCzOB8eQ0uEChm+YJR1RWrjXBYwC1ljbTgb2QR3w4t/JV6MD2oCOXIA
         Clch8Jvj9ygpkDWcf7culwFYUbohjJmZilW+4KUS3QHRWIHXUPQXH9qGWDpnoGoAUype
         fg6ugdky5GJa3vtTuvgSH3Nb2ju87Zl6xtKzGQaAauGhQDR1Drd8JRE1H9aNtJnak0Fn
         cS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cS4si54+VztcokwIEGGa2QcG5KXJXjA3buAtdrcGL0k=;
        b=An/Vsc65mGrW9qU2bId2aHbeiPaRfJ7NaFkQlH12jNOizKGayNmBONBkESKkwWUSRH
         n5uFgWioZ6faJgAyADEOAPsWiGafYLDfqbQjXrJRdGal8wUHI80fSgM84u4TPuWU1Ezz
         1O0JXUi7wfcenFnBKtflMsY0cOhdos28E2+Ii+Ynbam8CKt6ydhWWdlFWlJ4IlXsMWlM
         2CraUg5VDZDXNxyjAGDOw2Y/HoO3/snuqZ1vGZVBbYRzJ+bUIcHggL87nUyFTHtMfWYh
         6pL9LK+Mp7vQKbDW/91eVHBSoog590dZUiGKkAVf54WL0Q7hsPwk4RFGibV2QWqoYL3b
         nubQ==
X-Gm-Message-State: AOAM5339r0u6r6JLCimUw7RXUef0OH+VDfEZPt0fwBXpmuAIn8SuAKe8
        cjOqyvra/eF7E67323uIm7xb8hhrYgc7
X-Google-Smtp-Source: ABdhPJy2Pzre33NU/5sexpjt2hQiFOUb+Roc0/4YAU5G5iP/Qzkklom86i16T7JdL69yZ+E7mHq8kkFsVWlZ
X-Received: by 2002:ad4:43cc:: with SMTP id o12mr6373096qvs.62.1590721222710;
 Thu, 28 May 2020 20:00:22 -0700 (PDT)
Date:   Thu, 28 May 2020 23:00:11 -0400
In-Reply-To: <20200529030012.254592-1-jnchase@google.com>
Message-Id: <20200529030012.254592-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3 1/2] dt-bindings: Add ch7322 media i2c device
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ch7322 is a Chrontel CEC controller.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 65 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 ++
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
new file mode 100644
index 000000000000..d5706e08164c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Chrontel HDMI-CEC Controller
+
+maintainers:
+  - Jeff Chase <jnchase@google.com>
+
+description: |-
+  The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
+  programmable through I2C and drives a single CEC line.
+
+properties:
+  compatible:
+    const: chrontel,ch7322
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the RESET pin, if any. This
+      pin is active-low.
+
+  standby-gpios:
+    description: |-
+      Reference to the GPIO connected to the OE pin, if any. When low
+      the device will respond to power status requests with "standby"
+      if in auto mode.
+
+  # see ../cec.txt
+  hdmi-phandle:
+    description: phandle to the HDMI controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      ch7322@75 {
+        compatible = "chrontel,ch7322";
+        reg = <0x75>;
+        interrupts = <47 IRQ_TYPE_EDGE_RISING>;
+        standby-gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+        reset-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+        hdmi-phandle = <&hdmi>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..7794ffccd325 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -187,6 +187,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chrontel,.*":
+    description: Chrontel, Inc.
   "^chrp,.*":
     description: Common Hardware Reference Platform
   "^chunghwa,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index d633a131dcd7..34c6d30e61e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4047,6 +4047,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
 N:	cros_ec
 N:	cros-ec
 
+CHRONTEL CH7322 CEC DRIVER
+M:	Jeff Chase <jnchase@google.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
+
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
 M:	David Rhodes <david.rhodes@cirrus.com>
-- 
2.27.0.rc0.183.gde8f92d652-goog

