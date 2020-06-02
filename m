Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE56C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 19:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2C19206E2
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 19:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmA6aIRL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgFBTJ1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 15:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgFBTJ1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 15:09:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAA4C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 12:09:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u186so9996505ybf.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xTPMZBuYbSiUPEeoH1NWNT8jwWxp891HtegclL1G6P4=;
        b=GmA6aIRLSBu5QYE97Sf64vPrJm5BxUT3U0OlL6+qFr2S3dh1doD1D4Pnstao6+FXTZ
         X1FJxwjcs8RpYd7jJARoihL18u/cJmXTAU4k8gqSAgAxxMQpAkVd3lH4JpMBCyAxusv1
         VISsDkJwEkv70QLsbWdBsaMmWqv9e4MZc+ZAejtxio+LDmyY+8vZ98MEPIqx2t3i4UIV
         3kNB0L36x8/jlMh8iO6wjVZkjnPMHzxyoJsA3Ms9bzv2KhEtJ7soU/cn6xiyM3TtKyhE
         Ugg4MSLOYnspfX3P3Txrr40o5h+BnFAs5uFEogCcHnoq6n615jiZdUhdQ/eBNuS9TjDT
         aDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xTPMZBuYbSiUPEeoH1NWNT8jwWxp891HtegclL1G6P4=;
        b=lwWYf7PDXCOW3YmXtqb3yVg9uw1RwCmZHp2sHwFlT0/HOhjo0ZXJiYOO85z1BditU+
         JCf22KuI2Lm3PVPjtxvcZfhvG8+RNDORAtHUlkVUWiycn6D4gaXPgA/PEtkKRuvTj+qP
         OZo1ZDMRsyVVTzwbxM7XmYpKcVhqjmJPJY3rF50lgWGKwrgaxypcxakQ1LmkOZkDXF4O
         Nvi3eifVfjstM1b/DgEr4v6HWla9PCpjS28LSz2pbubOibHwmX68XqBKXWMsC0DlpueP
         IdXGkJvqMdxjdwz4UZU2m2SaKC+443HkhFSvQI8P9YPonzJF3X0JTpEjqZPoTIve8SBY
         psww==
X-Gm-Message-State: AOAM532JGjSUsLyA2vvjsTFXctO1LgF8ffM9NxjHnHgvK6l1WARa7jFC
        kbs6xmc1tcKPcOqYtXoAhRal2vXuTcF+
X-Google-Smtp-Source: ABdhPJwvzoFgioxOLvonF9YZlQ1WFlE/dxkBSaenw9IWtPb0ySaHo6jPHSUrMMFWvBU713ncToBTFmGCO1Up
X-Received: by 2002:a25:c4c2:: with SMTP id u185mr44511902ybf.79.1591124965998;
 Tue, 02 Jun 2020 12:09:25 -0700 (PDT)
Date:   Tue,  2 Jun 2020 15:09:13 -0400
In-Reply-To: <20200602190914.218541-1-jnchase@google.com>
Message-Id: <20200602190914.218541-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200602190914.218541-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH v4 1/2] dt-bindings: Add ch7322 media i2c device
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
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 ++
 3 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
new file mode 100644
index 000000000000..daa2869377c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,67 @@
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
+description:
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
+    description:
+      Reference to the GPIO connected to the RESET pin, if any. This
+      pin is active-low.
+    maxItems: 1
+
+  standby-gpios:
+    description:
+      Reference to the GPIO connected to the OE pin, if any. When low
+      the device will respond to power status requests with "standby"
+      if in auto mode.
+    maxItems: 1
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
2.27.0.rc2.251.g90737beb825-goog

