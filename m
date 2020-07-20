Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBEEC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 20:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 241CE206F2
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 20:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhkPtvIs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGTUfV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 16:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgGTUfV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 16:35:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2A5C061794
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 13:35:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b25so21674164ljp.6
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2zJYpgDs4IU0fc9VR3TdzhXdQh+0MOJRer0pywnXKA=;
        b=KhkPtvIsDLUNIupaXYNs8UBWIwdZ5u3Ek5KzfJqFq/S0YjXqGAPiLmgJ8ef90Q0q9l
         zXaUKRTw8YvweSdBStgruLCIAPSNwXiiOKMzP+FUmVd7CdH8+m8yks4w7YQbA735nY1m
         Dhf9ftDAXtFClaNUWPGxg4atllIYzWU1vQzjQNFS68jYxjRmHMURVEL84OdGJXRjD8A3
         i0FQSxlq89LbYuIqg68lCArt8ML/2QEDRwashMf9J5pQxQ5kx6s9bm+weCDzNzh4qu3X
         HhdCiEb6DWrcAlOQBt/OQjjqRBzPgposiQLdr7rFarZ4M8llrLhhmOkGZCMiM0ItgmBD
         zt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2zJYpgDs4IU0fc9VR3TdzhXdQh+0MOJRer0pywnXKA=;
        b=OBuPxNxP6daYnZQ7Njsi0uoB8cK399KvNPJ2sZxkVcqe2HyUuIYZrakWt3J+Le0gA6
         wirHjTLjnnL0toM9LNQs5aQNb+xTGrq07Q83b3I0QqMJvDfUZPpCx8Ciwy1LzkXl3OPf
         Rxi61NNJSZnUNk1qFps9iFwBnQ2c02UWX/T5iZhmxNXvKsX7Af7w3iLlhJlq6Z8+KdQy
         RmWuyPWFpjap6R1nOsPXgfzlgkts9Gq7xl97nwCQPs4nLRc6yHpFYDBQcBcKoXzwIZj0
         FFe5iWrzKeoCHjbxPe9DAw+mOjOT8CBY30Kly7Vj7HbPmiG0eZqS7sexmGhgpm0tkyJR
         QbQQ==
X-Gm-Message-State: AOAM533rUp+LCtJHZM8o/Ax2zAtU25uqH6DvVH79PZfN5EOrhyVubrQi
        adeE9PCGVBZbFKemmL1X8W9XPA==
X-Google-Smtp-Source: ABdhPJzvwrDIcDCCe4LB9xTwr68FXr5R+zlTi94XLknZf5DVBVuutopYN4TgqjOAlrk4Du5owjyogQ==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr11490351lji.253.1595277319177;
        Mon, 20 Jul 2020 13:35:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id y24sm3435076ljy.91.2020.07.20.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 13:35:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
Date:   Mon, 20 Jul 2020 22:35:05 +0200
Message-Id: <20200720203506.3883129-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Kinetic KTD253
white LED backlight driver.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
new file mode 100644
index 000000000000..610bf9a0e270
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD253 one-wire backlight
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Kinetic Technologies KTD253 is a white LED backlight that is
+  controlled by a single GPIO line. If you just turn on the backlight
+  it goes to maximum backlight then you can set the level of backlight
+  using pulses on the enable wire.
+
+properties:
+  compatible:
+    const: kinetic,ktd253
+
+  gpios:
+    description: GPIO to use to enable/disable and dim the backlight.
+    maxItems: 1
+
+  default-brightness:
+    description: Default brightness level on boot. 0 is off.
+    minimum: 0
+    maximum: 255
+
+  max-brightness:
+    description: Maximum brightness that is allowed during runtime.
+    minimum: 0
+    maximum: 255
+
+required:
+  - compatible
+  - gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+        compatible = "kinetic,ktd253";
+        gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+        default-on;
+        default-brightness = <160>;
+    };
-- 
2.26.2

