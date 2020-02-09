Return-Path: <SRS0=ahG+=35=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231E7C2BA83
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 18:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBCC020715
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 18:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2Qss8dP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgBISGd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 9 Feb 2020 13:06:33 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44064 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgBISGd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 9 Feb 2020 13:06:33 -0500
Received: by mail-pg1-f195.google.com with SMTP id g3so2608278pgs.11
        for <devicetree@vger.kernel.org>; Sun, 09 Feb 2020 10:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JZlAL4NuWzFvfP/W/48KSozeEPDNM5gniNDWfhy9y5g=;
        b=s2Qss8dPdOLCCEfMPKu6Xcbd6DM3n67ZPOshUeQVx7Cev1cS8jTx9olmbHQDSnYu+l
         eHolgl/MgC2HWZor6nBWReFb3QkLfQqODI7Z5BUpD27KS655bK2AdPYcss5FljdhEn/d
         0/jiMQsXT+RYQdmy142UJNyxwHGzDF8hsKUCvQjVR+eWPic9ZSipOkF3jyCt2ddy93uM
         4qSSFe/dEtkXBSeYSMC497rwxe9P1BNYSWbgTwl3QsIf0RaKtPOu7wt0j0HT9dYpFhjR
         z3P2ZOb7IshhaJP1tFFELinKdSaEjHTwoW4XPIkpKdTh0utRr9dsl/4wfMYM/DQ3n7QD
         G2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JZlAL4NuWzFvfP/W/48KSozeEPDNM5gniNDWfhy9y5g=;
        b=Z4oExbW9crH36uFPLr2UMsPzjfUZwRraigTRjXkkllj8VkzGacJSOcKY1rW1KJlQKu
         Zbg8Eqyoa+pCXT8qo3QEo3xm9h4VuJucqdfsi29FIBV9CbIJrdAWg8uAF6ZWfqsYMFxq
         7aFG7qAqGeOYnjw+CJ+P4c4a0+gCQSm3Bp7oVpt2O+MU6dThCLzxrp98Rf4B/OE242a8
         HT5m/9DKUNVBize1E3XaipveICzoGM33XRF6F+Z3zKlxHnRc/44pFfzPXIFSH/gaYZFo
         J5FmJ7qMq+R9RAvoaHmZmPNH/qO8QzuBeIXGw28pKcbofDWS9xuPsiyyj4KAcKWVwzez
         wlbw==
X-Gm-Message-State: APjAAAXxz1AsNBGxLCHR0GApdDldrcA6V8qJNihEYmvDkCcgyiI+ZbTM
        yHxH8Er8rs3HCmjWkRCc9N7ggAdpBQLwbQ==
X-Google-Smtp-Source: APXvYqx+6H4wFOF17krW/I9xmVFN3KeVeN4skXjNQPbOkSDavEyC0oNINkk2bbEjkpcfnCbhNmwVWg==
X-Received: by 2002:aa7:95b0:: with SMTP id a16mr8883719pfk.253.1581271592875;
        Sun, 09 Feb 2020 10:06:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:508e:1313:1d5a:1ea5])
        by smtp.gmail.com with ESMTPSA id d73sm9758518pfd.109.2020.02.09.10.06.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 09 Feb 2020 10:06:32 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Noralf Tronnes <noralf@tronnes.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: add binding for tft displays based on ilitek,ili9486
Date:   Sun,  9 Feb 2020 23:36:26 +0530
Message-Id: <8938c7a53598db793bbcddf205dcf35bcc19a18e.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
References: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
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

v5 changes:
* made changes according to Sam Ravnborg's comment
  for making compatible part less complex
---
 .../bindings/display/ilitek,ili9486.yaml           | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
new file mode 100644
index 0000000..66e93e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -0,0 +1,73 @@
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
+    items:
+      - enum:
+          # Waveshare 3.5" 320x480 Color TFT LCD
+        - waveshare,rpi-lcd-35
+          # Ozzmaker 3.5" 320x480 Color TFT LCD
+        - ozzmaker,piscreen
+      - const: ilitek,ili9486
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
+                    compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
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

