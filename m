Return-Path: <SRS0=8cl9=3P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AA9C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:42:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1ACDC206D5
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSeI57+f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgAZRmH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 12:42:07 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40184 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgAZRmH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jan 2020 12:42:07 -0500
Received: by mail-pf1-f196.google.com with SMTP id q8so3798187pfh.7
        for <devicetree@vger.kernel.org>; Sun, 26 Jan 2020 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YPWYwna9eUbJMVMEpMCCjX5fN6IHGD9XprcoNOSgUZ4=;
        b=rSeI57+fh6+YKWWu4S4mwVmL/PyzqD9YxpxFufTegZiVV6b2N4tJ37CU+S2HtzsGaE
         eN4q2u5w3KoVJTCbppwyGJfpA8mfnM20esqzAGo1R0kU4Np2Xb9BHyy7ECSQOBF2blN3
         xMTh7O3EARDADsZLDNevE55wXoQlZFbylJyITUq5JL9sAApnOi1Rtl7LQSs/p4z05LKl
         onZ3pMqS251aDODkdNDCCDg9DoFV25dQYdv5hfy1Ctn0rGHAY14k0nINoBgeTn1ERgI3
         q7k215jP3/F/jNg4JEtaj+W5Pt1fSvTZXvezRcNfAHCRognNuazUtA2EqQ4D3M7K63+N
         rC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YPWYwna9eUbJMVMEpMCCjX5fN6IHGD9XprcoNOSgUZ4=;
        b=rStTcxnzAqvzvdC2+rofcKfoYK8z33obhmVifJbTcpGEOXuW6pPXfMFcb4NmJv8sAG
         mARehitzTBMudKPmBDPQI+nXK65PbC6+IxOPXaF2dRI7kczDgzw7nb+SgYY42ZwoJevS
         0T0JQt8pv3SFxagy2fWjkATSIZP/MjQ7xeVG46IGbDxJPrQzg7uTuLaqcpVT7IJ2uleA
         DJ0TSRTCbJbA7DJWG7nCmS+qFiOVTqzCbGan9ghPm/+OHUsgvjzWpvG22IAqwPbDM2Hs
         5DjEONZcO4AEngnA8NiSnVCTUJvPsk5SQqsgdsJFX63jj2rwacxT0wpfTLEY/DZ0KNys
         H7cg==
X-Gm-Message-State: APjAAAXhdqG6Ql8BdnM5vSMsbcWkpL4SeAQzHVFP3K/l4uPNw1X2qbo7
        cDSVxAOIqP3oHqOsVYo7VSc=
X-Google-Smtp-Source: APXvYqw5d4OEoiM9lGZLj95d3o5Xh0UTT99Y0RLfrQ2myysqvEKd9EWSpIssA0CRNMwafgeieiXc9Q==
X-Received: by 2002:aa7:9633:: with SMTP id r19mr13119376pfg.90.1580060526569;
        Sun, 26 Jan 2020 09:42:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id k10sm12388501pjq.14.2020.01.26.09.42.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 26 Jan 2020 09:42:06 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: add binding for tft displays based on ilitek,ili9486
Date:   Sun, 26 Jan 2020 23:12:00 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580059987.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This binding is for the tft displays based on ilitek,ili9486.
ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---

v2 changes:
* Changing file from txt to yaml format
* removed ilitek,ili9486 from compatible string
---
 .../bindings/display/ilitek,ili9486.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
new file mode 100644
index 0000000..dd306c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9486.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9486 display panels device tree bindings
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9486 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Waveshare 3.5" 320x480 Color TFT LCD
+        items:
+          - enum:
+              - waveshare,rpi-lcd-35
+          - const: ilitek,ili9486
+      - description:
+          Ozzmaker 3.5" 320x480 Color TFT LCD
+        items:
+          - enum:
+              - ozzmaker,piscreen
+          - const: ilitek,ili9486
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+
+            display@0{
+                    compatible = "waveshare,rpi-lcd-35";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    rotation = <180>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.7.4

