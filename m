Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691CFC2BA1A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D18C20769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEaJe1JC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgDHTwO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:14 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:39255 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730263AbgDHTwO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:14 -0400
Received: by mail-lj1-f177.google.com with SMTP id i20so8991303ljn.6
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLwmLLXxp+3at3NXYeHsZbtqN22J5m0j84C8EY0Tpvw=;
        b=SEaJe1JCrR9zDU7Y5BWPoYjiMOXkt9vafq1EBfXteVwRxHKgifJ+HakQtmQ/Si6ZY7
         ekAXqqx2IVDfAjaBmxvkCPvuAqtzgdErjtQB7J7hgbY75nP31S7zcT3qGiTt0AuV0yze
         6cuRxXpdCcqE4HwfRIRCM5idnU8NyCzQbxH9psr4tPYShikjPWDpdfOBHL4iG5Z0jJOS
         TlYbyoyyNqUr4TW4LEZVR4edb5QkIZpEt/at7qqV7SD8w68yiON56vJhuZkv2ROWHTej
         oxFIW8okNZ8L9gx2P5aApRjDThaYbWsUgt9Bxj578teWqu/Dg7qr1pC/lsT23sqTolKV
         TsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iLwmLLXxp+3at3NXYeHsZbtqN22J5m0j84C8EY0Tpvw=;
        b=Od6GSSzRQmXJf9bLYle+BMMUo4P+uRXgkl19ol+0AMA4QRFOzvZ74jDVHD/xHOh6Hh
         euQq1MiagN11ghKFGsOv4fiGoo0UiWoOzdhsyevbXJl1HYIqC0zgw+Lk3hYUGX0c6Dht
         V5HR40yp+ruZyh/kNzz2qX5Rw0IiHMdvq2umP2hoQx7N6H9DvMi0VF/ZfUmZu8+oljsR
         nN32ehMMaq71ei00q30k6nj4lBf8ZjKFDTHPLEb59IMrebYg6mymblc10XXdnOLv+Yic
         +y6eqfRUUKIligSGhkZYzX4NKDeqmHsuZKVdRS796lx5jHYZled6CBC0ebcgB/xSWaY1
         POdQ==
X-Gm-Message-State: AGi0PuYssZdnIvEwTCJ0YDx15eE7wIpjWOwPD4ZwoAiw/b1V2T25EK7Z
        SbCIP3prnd3mTf+37bsgYg0=
X-Google-Smtp-Source: APiQypJux+tS4zCz4JUzc/4t/XTEpugkfLJZ0kNiGF6FynCxhE+ZODVIFmH2shE8oLIJFFG/2qxtIQ==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr6062408lji.222.1586375530300;
        Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:09 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 27/36] dt-bindings: display: convert sitronix,st7789v to DT Schema
Date:   Wed,  8 Apr 2020 21:51:00 +0200
Message-Id: <20200408195109.32692-28-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2:
    - dropped use of spi-slave.yaml (Maxime)
    - added unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sitronix,st7789v.txt        | 37 -----------
 .../display/panel/sitronix,st7789v.yaml       | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
deleted file mode 100644
index c6995dde641b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Sitronix ST7789V RGB panel with SPI control bus
-
-Required properties:
-  - compatible: "sitronix,st7789v"
-  - reg: Chip select of the panel on the SPI bus
-  - reset-gpios: a GPIO phandle for the reset pin
-  - power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-The generic bindings for the SPI slaves documented in [1] also applies
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/graph.txt
-
-Example:
-
-panel@0 {
-	compatible = "sitronix,st7789v";
-	reg = <0>;
-	reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
-	backlight = <&pwm_bl>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&tcon0_out_panel>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
new file mode 100644
index 000000000000..fa46d151e7b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7789V RGB panel with SPI control bus
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7789v
+
+  reg: true
+  reset-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - power-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sitronix,st7789v";
+            reg = <0>;
+            reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+            power-supply = <&power>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&tcon0_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

