Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F03C352B6
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C485C2075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIdKm/ds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgDHTwL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:11 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46776 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so8966934ljg.13
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fb/O1iqzcyrS2v32LjG3WdrjYOHgeGYkkI2/ikLgijE=;
        b=IIdKm/dsQzEeEE8IwgUYjNSiF4ThVF7FrfU2Do8OhBrAzUWHOpnWItkhjkbKjSZsQ+
         4MnGDdkhyGGNRMkTbV3Yk8igK+BobCgPcvhrnYK3m/TLFuDAi5476fV5wZCnZInL2wFy
         22z6F/DkiNI7p8T190JgKke31C6A0SorYNJoV1A4Ampb1LDT6MGj3RrdZYQcp+alC2cv
         Qa0+vBC70v99g/lEuDtNzHiG7ZETcAuFOdvNV1iy/Sc6fT5X9nF1d1H3C1ktUEqaFsSC
         mNufRPd2/MVA5rizaBrju7nOJcjkl6ixmmKgiB8IPGOIqs0+Ax8KtFB1+y942/M1c/Ia
         dMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fb/O1iqzcyrS2v32LjG3WdrjYOHgeGYkkI2/ikLgijE=;
        b=ilWXZtQ8eRu5h+I8b2LPnxWZKhe5kzsdiZSAPwwg0YPBrJIpxehRo7oneI41xBJ2TJ
         dAzIHrJ5bdamZwzYtRexWTJ8l4/Gazu77i7tfHXX8C+xlvzzax5M8Hm9QfiHIdUVDiVn
         imUII2D06Z4D3RtkqUyA6IKmFHJonXOL4bV9IvH+kf6tiY4gqn4Jo2Y7GK0xqXW9gGZM
         mGE4BZ0KWtmpUJfC4hQ9a5A56N1Pb1A+Jk6H0iiFpXkPmtw3jZzunX1xn4Ube/thEh5+
         UC34XAx/Mw1rGZNb3OEMDpa2iC/vSckIZmAQa3IgC68q1BLIwpcZdnciU4efJ4s+G/6B
         JyGw==
X-Gm-Message-State: AGi0PuYViAgIQCpE82dQrCpS+ggQt/7ztLF4qCEOuPyoHIDE6lEbXXYQ
        nc75pZNjB4x/5yHiNt350zo=
X-Google-Smtp-Source: APiQypJDB0CsAPR1jEdlchfIOvppvvjcTprhDMVNzMBHv/ajNX2nk8Oz7+aBOS6HEvdTY9A9bvRkiA==
X-Received: by 2002:a2e:8903:: with SMTP id d3mr6244305lji.266.1586375529315;
        Wed, 08 Apr 2020 12:52:09 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:08 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 26/36] dt-bindings: display: convert sony,acx565akm to DT Schema
Date:   Wed,  8 Apr 2020 21:50:59 +0200
Message-Id: <20200408195109.32692-27-sam@ravnborg.org>
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
  - drop use of spi-slave.yaml (Maxime)
  - add unevaluatedProperties (Maxime)
  - rename node in example to panel (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/sony,acx565akm.txt | 30 ----------
 .../display/panel/sony,acx565akm.yaml         | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
deleted file mode 100644
index e12333280749..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Sony ACX565AKM SDI Panel
-========================
-
-Required properties:
-- compatible: "sony,acx565akm"
-
-Optional properties:
-- label: a symbolic name for the panel
-- reset-gpios: panel reset gpio
-
-Required nodes:
-- Video port for SDI input
-
-Example
--------
-
-acx565akm@2 {
-	compatible = "sony,acx565akm";
-	spi-max-frequency = <6000000>;
-	reg = <2>;
-
-	label = "lcd";
-	reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&sdi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
new file mode 100644
index 000000000000..95d053c548ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx565akm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony ACX565AKM SDI Panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,acx565akm
+
+  label: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
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
+        panel@2 {
+            compatible = "sony,acx565akm";
+            spi-max-frequency = <6000000>;
+            reg = <2>;
+
+            label = "lcd";
+            reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&sdi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

