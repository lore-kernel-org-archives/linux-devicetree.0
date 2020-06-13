Return-Path: <SRS0=mubR=72=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B864C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A08B2074D
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOtQ6p4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgFMOHK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 13 Jun 2020 10:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgFMOHJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jun 2020 10:07:09 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC15C03E96F;
        Sat, 13 Jun 2020 07:07:09 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so3238114pge.12;
        Sat, 13 Jun 2020 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sINdMhFbZdpubyb64Rbv6xvZZ8jKZulgvmVTTGZUUz0=;
        b=SOtQ6p4sRhtg8JfNrmFIiArKm9kS2Voa7R+LcgGAoLPlXv1mim8jjYbAdhsP/US4iy
         CZkhC//ER9jywCGZWUCkxOe8ad4FPO8efFjEURBIX+87aiWUV3ZU7kHrY+JaY4qdUYLT
         +Zb5MftWmrYalJ8IuJv2Pl8IwV8dArcDytD+GECy0Vs0MMFfXZIApas1tj2tSq7kz+5Q
         /sMFMLVTtqaT5L+oGX0Ye1shF87qjQjdA/S8xvmnAmvqa7MKkSesmnAM1bEaNpO1NoNU
         +0pUroaN0NObpyqBmCPqCt56K8DPVMMXtr3QxlM5NDl0J4ewpwFlJ7ROPY0apRhKdTpu
         E0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sINdMhFbZdpubyb64Rbv6xvZZ8jKZulgvmVTTGZUUz0=;
        b=kLhhAbRUeVvx6GdrzJ2hyvjZsbqKJ0QHfF+vsFRXhl7mKgLdGJUzVq8hjiTFw4WS7X
         E2iegdUcB7g4xfbsSNp2i+b+3dIRIbuR5trEcMNIA1HPXSM6/SsZ5lKfU/4Yaa2BQsGO
         0anE0mAx0ybsiciPpolMgLf4IG7w/C23rLjirr4TyNMS0OX5sxklTZV9lZNKIju6vyR7
         Wa5EPfm/IJ9eDERQPA6B2a03Afy+uEplD/TGzuWq58Xn7HnfhjKTOlarK/BuqlMZ69Lg
         EQ6OnK5g60iH27U+s18a9eCvHQmt2ET9Glm7p2Oh/kO4EmGgBAbaPHvPD1zl+SluYjO9
         e/og==
X-Gm-Message-State: AOAM532ynKxqHJdV36tZGSt6mRjs184wXmPoBbDYRLlzyveodnFGyf0D
        WbA9ZCtHUWhyPXLEOY+xaBAdZUco3YAp8Q==
X-Google-Smtp-Source: ABdhPJzWRzBsKF5jXuCP6Vo0CT+Kzi9M0c71c4GoGH0lck2uJS/Iq9Idpmd9I51GdBt1cDCCx7POoQ==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr16218148pfb.58.1592057229307;
        Sat, 13 Jun 2020 07:07:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
        by smtp.gmail.com with ESMTPSA id w6sm7825022pjy.15.2020.06.13.07.07.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 07:07:08 -0700 (PDT)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Noralf Tronnes <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: add binding for Ilitek ili9488 based display panels
Date:   Sat, 13 Jun 2020 19:37:03 +0530
Message-Id: <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds binding for ilitek,ili9488 based display panels

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 .../bindings/display/ilitek,ili9488.yaml           | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
new file mode 100644
index 0000000..61e7a63
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 display panels device tree bindings
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9488 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Eastrising 3.5" 320x480 Color TFT LCD
+        - eastrising,er-tft035-6
+      - const: ilitek,ili9488
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
+                    compatible = "eastrising,er-tft035-6", "ilitek,ili9488";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    rotation = <90>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.7.4

