Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C3CC2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C2EA20769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcyly17x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730263AbgDHTwP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43841 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbgDHTwO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id k28so6091843lfe.10
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
        b=Wcyly17xbNloQHRr3gJ1Ewo80JQgqvyC16Teu59a9OL4uWC9pb2LvxXD8VL5Qu5Nnp
         Nzv9yu9GSTjnHVQT/33P5xVr2d7FEKBCuzZQv5Wj8V7H5r2TfGVFVItBmbfmm4RRzpfX
         rVOzVdK5FIvgihaMttBf3FIKAL065klTZ/ayHg3MkfLg8SBHz8p3OYpfClosojeXaqm5
         A0wE73PgqWp/Chbv9iI+A3FWyDAPPkmDcDRalbiYpRB0inc1GBh2f9EQ3juh1UuiooLQ
         WT0POz957Jf8amAFare1gdJ5SSSKKEAhG8DiZNjjBIHCRRJ0kEHAAmLaZ7Kd0WSo2z5l
         cAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
        b=mNL+DVxlpTm3C2ilSkRqC1ecEd8wmg+fQEVJzkh+ePjniDT+nNv0I4Sf6ggwinIHNw
         9kyZNgoI0YrNSOj6eqLv5nn1dxc1gbBo0HN7V7SwVnCifyTd83b42pot4/OXQBogpivl
         v3157sH+4RzA1exkmyWrgIptg20Mpo8CsIMjj7Pg4jrzarNeCHAO6LYrzeOtA0NCY6bQ
         41tM962TsxqYEilEosVi0Qcs69B6sQBC94sWFUrXG7mNNM58kMlemtoZgmFC4/4cBYdz
         sDS71Tbawc4YR44G8MLO58n4XBvpDyVmByReEHHwaQfDNJJ4g8eljppN0wmlPuam+AyV
         Q9jw==
X-Gm-Message-State: AGi0PuZ2MmZr8A9xfyBy4SagVNbcVXTceAXvBzq8w7ce6hqJ6SIIOr6e
        6rXJ8IZO2OHZonXJ7AuULnG6S6ZfUdU=
X-Google-Smtp-Source: APiQypLO+c4OXBSTHGpgaACmk6IGVQPJyFCaU+CRJeR0O5n7ofrpY+O9NkbTWmTaG/uewke3JHvs+A==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr2288925lfm.133.1586375532330;
        Wed, 08 Apr 2020 12:52:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Werner Johansson <werner.johansson@sonymobile.com>
Subject: [PATCH v2 29/36] dt-bindings: display: convert sharp,ls043t1le01 to DT Schema
Date:   Wed,  8 Apr 2020 21:51:02 +0200
Message-Id: <20200408195109.32692-30-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The txt binding specified the property "power-supply".
But the example and the actual implementation in the linux-kernel
uses "avdd-supply".
So the binding is adjusted to use avdd-supply as this seems
to be the correct choice.
There are no DT files in the linux kernel to check.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ls043t1le01.txt       | 22 --------
 .../display/panel/sharp,ls043t1le01.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
deleted file mode 100644
index 3770a111968b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sharp Microelectronics 4.3" qHD TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls043t1le01-qhd"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- reset-gpios: a GPIO spec for the reset pin
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "sharp,ls043t1le01-qhd";
-			reg = <0>;
-			avdd-supply = <&pm8941_l22>;
-			backlight = <&pm8941_wled>;
-			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
new file mode 100644
index 000000000000..a90d0d8bf7c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+maintainers:
+  - Werner Johansson <werner.johansson@sonymobile.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls043t1le01-qhd
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls043t1le01-qhd";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&pm8941_wled>;
+            reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
-- 
2.20.1

