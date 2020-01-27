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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18601C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE93F214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvjWptts"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgA0OIX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:08:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46389 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgA0OIX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:08:23 -0500
Received: by mail-pf1-f195.google.com with SMTP id k29so2459210pfp.13
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u78xsBHoRWmrBCkJd5Sg0uInyXB7ez3BBaQ+xCkEex4=;
        b=hvjWptts/TWwtVwrXU2IdLwGu43HKriIlwL3VcsmBLdEyDdbY7TrHWfLUZlyifrs0l
         +6+/c03EQV4t14dbzu6boCbZ3O0zk1cuY/11IEx0MaFHI0islyQtINLgZZEvvUmyHMAm
         Pk9fNYuWiIX+JMYcSQuGsv//hyGu8CtZX5Wa0k1ZF0SA42xZ49KDWHqfHF/fOpNn+5g9
         ghrzhkORjX7KbT7WdUQN7Bf6edkWX2U28ZcJ8cvosO4mL8aU/iJvvM7jDGXtADg2Hqbc
         D+9DWxl/9lOdpd7Lm10hap0SAWbAbyWSAm1jkCLTT/Gc936G+NckYNTOoIRoXHzHWh+E
         5UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u78xsBHoRWmrBCkJd5Sg0uInyXB7ez3BBaQ+xCkEex4=;
        b=dVOqSHEv0s9SZbvKCe3yE+2i0bfGQzzmGpKsBl1o3GL7x1IdP2zD2QRzKuBKtCPsOX
         cHgZFQFlGnJ8DWXvQkpMq2EVcGWsXy2mWC8Fvn4CLMaR/Vm837JYCtQc4GqLXdV50DTB
         Udo1FcVkcla7vPZdqyWcqarxxyCMDl8vL+7YxnPvl4M6AY04JuvboaLuR3fq4DtXkngZ
         V0QpKKE8iupcgXUz8sYiCtsj789KYVHkQusnFZSNGYinGk50btqgYhihi1G08EynEXNz
         NJboTq08zmqicONFtJ73jxW0UTcOS/qB1S6hwLKc+Mp61WWHkzQy6PHBzQCD+WTuCb5/
         +WBg==
X-Gm-Message-State: APjAAAWHKaswkXtlqL/mdQ7QC6mzvRlwynt007V34sgt5kRV2haQGW9I
        MQZ0ROTkkQlAyR6w7yG+gVk=
X-Google-Smtp-Source: APXvYqwDiHPcnJloMB8Q9IsXFFkyY3GYscvI6xaaTckkJPAG7sTHVCDqmTV5bCVWK2YdBOTDCRmqXw==
X-Received: by 2002:a63:642:: with SMTP id 63mr19076704pgg.73.1580134102833;
        Mon, 27 Jan 2020 06:08:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id 13sm16004582pfi.78.2020.01.27.06.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:08:22 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: add binding for tft displays based on ilitek,ili9486
Date:   Mon, 27 Jan 2020 19:37:56 +0530
Message-Id: <a37d95cbfc9603265ed15916cdd2fb69e8c5f041.1580133212.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
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

