Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4350AC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 152FD20716
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSMEE1B5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgA0O0V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:26:21 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51166 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0O0V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:26:21 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so3026337pjb.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xzArnJ4nbXkSs60iOFR6uhKTS+Tvj4YygIxD9MfWiRA=;
        b=hSMEE1B5iSa+2xKjYf4EB30SIERgx+rjJJ9WMZIvQgxhWxgasCg25yxXD1CPr/u/93
         uhoe/8m5NcL0C/4YDPDoETvfZU1kenKFT+3sPA8/JnKw64umkTW7CvAlgppOdGGTs9ve
         KqWw7zWpSRxMkefoulqmobc7focOHlG+tr2HnwCVQ1mU1IHzM85Tfu/CPrmW3H9QJ+o5
         BHC5VfCWw2a3dB7J3uthnD97W7uc29Jv9lowuIP53fpMwAnKQDP+AzvMjeBhwqnjFR6y
         Z5jzZMt0G9atPj8QkFhmyh9QtbMMyI+sw+LYl0YK0WiWfOeDJ18d2zcuibpkio8mAl5T
         IJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xzArnJ4nbXkSs60iOFR6uhKTS+Tvj4YygIxD9MfWiRA=;
        b=WmbvzfjlULj1Q/fEHPJ8A7lzj/DHc0iA5CLu482T6fMCtjaJM2qxAVJtlfHQ0iAHta
         8bWyCidQXzv+3zen9HMkmGOowOqTrUz1aPkUfK35PV/wmNasgM2EJSSgF8G0L/kEvXqv
         EqyVmx7opBdLSFKkPS4r0ltRwTQURXb6cOuur9db31q8jCj0dlNZyYjFT0Ui7//p4xvR
         JHFZLiIa/sRUqEdbVxiU3en/boctKifib/OOr085llBAbjlnw9Qje90DhZ5/Vl63oqRa
         3BVyI89WlWb1MqrzQn0GywMB/Ja3Vh81MveSXAk5vmgsuI3EuVuznc3ND2yZu2BitymZ
         UtwQ==
X-Gm-Message-State: APjAAAX8Na/n81NWe14+kFVG0k3kHrKJCAE5fAaJufjWRRMR7THlE3dr
        VaixssRhqkJaQWd9uXsQ5N8=
X-Google-Smtp-Source: APXvYqyTcIXitQoWpeemzRjVONjwGn1dlh/73PwPJXsBE8iCjmuflUK9yssu8BE53heR85oV9RCdJA==
X-Received: by 2002:a17:902:a416:: with SMTP id p22mr18067830plq.107.1580135180945;
        Mon, 27 Jan 2020 06:26:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id y23sm4725690pfn.101.2020.01.27.06.26.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:26:20 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: add binding for tft displays based on ilitek,ili9486
Date:   Mon, 27 Jan 2020 19:56:14 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580134320.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
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

v3 changes:
* no changes

v4 changes:
* no changes
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

