Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4C2C5ACBF
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 13:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C54020724
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 13:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV0R3B2t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgCONph (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 09:45:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33799 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728705AbgCONpg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Mar 2020 09:45:36 -0400
Received: by mail-lf1-f66.google.com with SMTP id f3so1466615lfc.1;
        Sun, 15 Mar 2020 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/0FNX+cjsqJEpADC51sdv98xpVCuA7LVCQopkbVC/Tg=;
        b=gV0R3B2tjHzcEWSiTkPTiPGy8g9AS6rvw7PwXX+LI8GF3v+pE3Cbw5L+ixHChHICsW
         vvfpiaOPEooEOu1KOW7MzAhcfAGc304V4tXWFEV5lIHr8eCsBmt58fG1cvepyCpaJrLH
         8RimUj2igyAXrt86r+Du91NLZmhFjk30ILK4NdpRHFGa8NxsV3Tm/9aFFFUk7l3cs/4s
         kKD+RTTXC70XPMvz4lKfDXi4tNKcfax3P6cOlHCaL4y0ewwirCl5RGNuJ7ldNaRV+a2E
         QDJeXXU1raEi8hPqPjk2LkYKdJwvt6aZ4vHUfxt1pv4oOcm20LyKNA5HTWxyyZ7EGqjA
         gSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/0FNX+cjsqJEpADC51sdv98xpVCuA7LVCQopkbVC/Tg=;
        b=altCLwcuu8fwfHFhHyIj/AHadYiqLEG7gOvI73RT5Lq4wl1ig4AfoNsenaNUds1ZhP
         nCx6kjhiYMb2xA9jt9e4uSZa3DYYNM9A6QikY60TndIhN8Rp/2JnlHMv5mMvcmtGg6k9
         CKvG64nlykaTu482bEUPMtW6eYQtIcXvChk7qDhoHwqL6gfxd63VPju451TFt+ftW1QR
         Kp9Nqw98Rnr5gIWF8U4UD/R/F598YRZUmndMJjoC/OGl1KTBonCYHR4SRpC+DQ6aE6cW
         LPpDEIYf1BP+ebuAkeaTT96IUJ+6+oEHiC6llmha3OHCCh/xcQGKZDgiBKkdXqqzqAsy
         IXpA==
X-Gm-Message-State: ANhLgQ3t0sSOvMU02k18+MmtyK/hWUa7r2jzbrphlWKkWr+sQ6TLedxI
        jcPPAYcvMQMIlCXPeNLWyn8=
X-Google-Smtp-Source: ADFU+vuTV5/5JIRc4afO50rH5s5ft9Y9TYO62OZhur6tWug2yNHygZiD6iecZtaJbOhAWBdgSR//Tw==
X-Received: by 2002:ac2:4201:: with SMTP id y1mr14552743lfh.92.1584279934671;
        Sun, 15 Mar 2020 06:45:34 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id a9sm23025212lfb.21.2020.03.15.06.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 06:45:34 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-spi@vger.kernel.org, Marco Franchi <marco.franchi@nxp.com>,
        Marek Belisko <marek@goldelico.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Rosin <peda@axentia.se>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Werner Johansson <werner.johansson@sonymobile.com>
Subject: [PATCH v1 32/36] dt-bindings: display: convert sharp,ls037v7dw01 to DT Schema
Date:   Sun, 15 Mar 2020 14:44:12 +0100
Message-Id: <20200315134416.16527-33-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ls037v7dw01.txt       | 43 ------------
 .../display/panel/sharp,ls037v7dw01.yaml      | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
deleted file mode 100644
index 0cc8981e9d49..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-SHARP LS037V7DW01 TFT-LCD panel
-===================================
-
-Required properties:
-- compatible: "sharp,ls037v7dw01"
-
-Optional properties:
-- label: a symbolic name for the panel
-- enable-gpios: a GPIO spec for the optional enable pin.
-  This pin is the INI pin as specified in the LS037V7DW01.pdf file.
-- reset-gpios: a GPIO spec for the optional reset pin.
-  This pin is the RESB pin as specified in the LS037V7DW01.pdf file.
-- mode-gpios: a GPIO
-  ordered MO, LR, and UD as specified in the LS037V7DW01.pdf file.
-
-Required nodes:
-- Video port for DPI input
-
-This panel can have zero to five GPIOs to configure to change configuration
-between QVGA and VGA mode and the scan direction. As these pins can be also
-configured with external pulls, all the GPIOs are considered optional with holes
-in the array.
-
-Example
--------
-
-Example when connected to a omap2+ based device:
-
-lcd0: display {
-	compatible = "sharp,ls037v7dw01";
-	power-supply = <&lcd_3v3>;
-	enable-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;	/* gpio152, lcd INI */
-	reset-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;	/* gpio155, lcd RESB */
-	mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH	/* gpio154, lcd MO */
-		      &gpio1 2 GPIO_ACTIVE_HIGH		/* gpio2, lcd LR */
-		      &gpio1 3 GPIO_ACTIVE_HIGH>;	/* gpio3, lcd UD */
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
new file mode 100644
index 000000000000..56bd510ae398
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls037v7dw01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SHARP LS037V7DW01 TFT-LCD panel
+
+description: |
+  This panel can have zero to five GPIOs to configure to change configuration
+  between QVGA and VGA mode and the scan direction. As these pins can be also
+  configured with external pulls, all the GPIOs are considered optional with holes
+  in the array.
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls037v7dw01
+
+  label: true
+  enable-gpios: true
+  reset-gpios: true
+  port: true
+  power-supply: true
+
+  mode-gpios:
+    description: |
+      GPIO ordered MO, LR, and UD as specified in LS037V7DW01.pdf
+      This panel can have zero to five GPIOs to configure to
+      change configuration between QVGA and VGA mode and the
+      scan direction. As these pins can be also configured
+      with external pulls, all the GPIOs are considered
+      optional with holes in the array.
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    lcd0: display {
+        compatible = "sharp,ls037v7dw01";
+        power-supply = <&lcd_3v3>;
+        enable-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;    /* gpio152, lcd INI */
+        reset-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;     /* gpio155, lcd RESB */
+        mode-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH        /* gpio154, lcd MO */
+                      &gpio1 2 GPIO_ACTIVE_HIGH         /* gpio2, lcd LR */
+                      &gpio1 3 GPIO_ACTIVE_HIGH>;       /* gpio3, lcd UD */
+
+        port {
+            lcd_in: endpoint {
+                remote-endpoint = <&dpi_out>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

