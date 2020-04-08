Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E95DC2BBFD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 023632082F
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4qSji+Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbgDHTwT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40415 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgDHTwT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id 142so4454038ljj.7
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
        b=o4qSji+YcgSMO5471iBf0AUlY0576dAVfve1ngk5X9BrdczLd+14WTl1f06KYKayF9
         xaRa+KssaLXwpRpf0gr7GkGBFem3/wXxpzIePd9NLa0I/suWy5nm1nQs7NbgI9Diux1V
         T8czXwaXlp3DK3gftrFkK1mP2+cgV8UXo6Eq4HHVTIinuIF5plU7wBRL/iGvUmWHWT6Y
         KC2/qFC4yRRP1cKoDrqO7YgAouUP3WHkLZk2+yZM0XBiBbBkMH64U7I/GFOYm6bJuvBm
         vnwJeY+J7+MiQw1Z1vS5RI4rUCnCPY4hM1qxbcxbCKWQN5dEKS0/lwMdHKX9JGsyqV8f
         58ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
        b=VHgzHEVSGREyUqIQYEJ24aWAdaoFbKr4Z5envRbVOovDtTqmWUI9OPM5Qc4Ntd9qZi
         evTeIk9Q9MWij5VgiepzqzsI1PHKlDNnTVbO72Wsggd44fVqQuxjU4gtBclWoFUJ8x4Z
         zhhEMVo/9Gr2navoUAhGJV8p2skE2V4zHYFp4seX/qZaFf9DVHQGNIW1p7KvsD+bxyKu
         n2517t3Xj94Sp6O7fSd4O47oBWLNW1TVvLzZtPncdZrzCJ23VnCh3T3FuWJVZ3fFfw0O
         F4KppF1kDAAnzjNSiv0ODOrdFsh8/n57rrW8jQDEX5kFNnp6Db6RPcYCm3u85NFKcOWo
         /nFg==
X-Gm-Message-State: AGi0PuZglVPwftXn1IjYrWLhgKBd9ZrXWf38E/QMJaC8Qpvomre23/mj
        rJvScsjY4kSZXvKRV/OuAps=
X-Google-Smtp-Source: APiQypKlM5BqCZJI+5XgYDDIl17PJ4FdUjhU+cKX3qCB2UaV8cDpfNaFDPbQUZ6d9zYt1Us1kAc7GQ==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr5846746ljc.118.1586375535469;
        Wed, 08 Apr 2020 12:52:15 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:15 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 32/36] dt-bindings: display: convert sharp,lq150x1lg11 to DT Schema
Date:   Wed,  8 Apr 2020 21:51:05 +0200
Message-Id: <20200408195109.32692-33-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq150x1lg11.txt       | 36 ------------
 .../display/panel/sharp,lq150x1lg11.yaml      | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
deleted file mode 100644
index 0f57c3143506..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Sharp 15" LQ150X1LG11 XGA TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq150x1lg11"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-Optional properties:
-- backlight: phandle of the backlight device
-- rlud-gpios: a single GPIO for the RL/UD (rotate 180 degrees) pin.
-- sellvds-gpios: a single GPIO for the SELLVDS pin.
-
-If rlud-gpios and/or sellvds-gpios are not specified, the RL/UD and/or SELLVDS
-pins are assumed to be handled appropriately by the hardware.
-
-Example:
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 100000>;                      /* VBR */
-
-		brightness-levels = <0 20 40 60 80 100>;
-		default-brightness-level = <2>;
-
-		power-supply = <&vdd_12v_reg>;               /* VDD */
-		enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;  /* XSTABY */
-	};
-
-	panel {
-		compatible = "sharp,lq150x1lg11";
-
-		power-supply = <&vcc_3v3_reg>;               /* VCC */
-
-		backlight = <&backlight>;
-		rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
-		sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
new file mode 100644
index 000000000000..92f2d12f4f4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp 15" LQ150X1LG11 XGA TFT LCD panel
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq150x1lg11
+
+  power-supply: true
+  backlight: true
+
+  rlud-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the RL/UD (rotate 180 degrees) pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+  sellvds-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the SELLVDS pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "sharp,lq150x1lg11";
+
+        power-supply = <&vcc_3v3_reg>;               /* VCC */
+
+        backlight = <&backlight>;
+        rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
+        sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
+    };
+
+...
-- 
2.20.1

