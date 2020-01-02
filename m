Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E650C2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3705215A4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi2UNwLc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgABKRc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 05:17:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37364 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgABKRc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 05:17:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so28787863ljg.4
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 02:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HdveirHsIPhVU+fkPoTDfHHFQp2fyC7pfB55HT7qYno=;
        b=Gi2UNwLci+se0PFY20T/OhetLxIvvY9XgaIoO/69Ge9J7EMtBQkLOmzkSiKVPTsHqi
         m/n5EJHzYv9ZUNtDGsDm6KtJPN+x47lziTzAT14ifbh/R0B9EQP4KnMI2HRKZ9ZNjVTA
         fJRULq1jN7RgL1FjM8b+fZOK0B4j5m4y/B7wQSBqw4us0hQceRyhfvj3+Q0HD+TmT0dW
         psNjnBQFRWQgNyAxRONo/vzjIrs+ahhXy90UtLtzbf3aUqe4WwGexktmrQyWG8HTNCEt
         joYi3o2KMkxGnOYo3woTSdeaa3Dy3ljggjDdjNcuupny+t3UrY4Czm+se2NvJ93Yj9yr
         7F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=HdveirHsIPhVU+fkPoTDfHHFQp2fyC7pfB55HT7qYno=;
        b=F60WMM4I+XR+y7hqHe7CY6xeXIYn1g9hw/xIxw5BHHSGKET6hMqo/BB6LXFqJv+9PG
         gHdOSK1AiaXC62PBTq+kIwS5k+FjHWrqu4jh2uYdyb4VnyUBsU/o4jY3FNqZdO9SIxxu
         oFZGWqgSBWN5bba22JlYGMU5BQoLlxYbMdPMkZkjk4q0AOCQQyVMKKQzsBGo/yduDyjw
         WiP1C2lH1j41KprcnhgxZrzPsgcgvi8QqsFqerDvczEelX+YfkfzWMQFuwj0Q9HIAxIq
         AKo5ePrcYAHp1iZS9UhQAbsetcEVQ4YMTyFYOCfPOcq/6Psi/F5MplIYUoWa797ICPMB
         wYhA==
X-Gm-Message-State: APjAAAXqcZshkfiJ8koKR9pZap+e5aw6aGd0Imbu/f4g+UVIeEfdUZky
        l/YHGecj7I8UfkVdBqYxLZ4=
X-Google-Smtp-Source: APXvYqwAfBJWKYJujoq+TGAXqse2IxVi61pyufbfiuaJuxfXkOqmwL3oeQs76MNJPkqXVznqLQP5Iw==
X-Received: by 2002:a05:651c:1a8:: with SMTP id c8mr35734831ljn.207.1577960249839;
        Thu, 02 Jan 2020 02:17:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m21sm23025892lfh.53.2020.01.02.02.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 02:17:27 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
Date:   Thu,  2 Jan 2020 11:17:12 +0100
Message-Id: <20200102101712.5085-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

To complement panel-simple.yaml, create panel-simple-dsi.yaml.
panel-simple-dsi-yaml are for all simple DSP panels with a single
power-supply and optional backlight / enable GPIO.

Migrate panasonic,vvx10f034n00 over to the new file.

The objectives with one file for all the simple DSI panels are:
    - Make it simpler to add bindings for simple DSI panels
    - Keep the number of bindings file lower
    - Keep the binding documentation for simple DSI panels more consistent

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
 .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
deleted file mode 100644
index 37dedf6a6702..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Panasonic 10" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f034n00"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "panasonic,vvx10f034n00";
-			reg = <0>;
-			power-supply = <&vreg_vsp>;
-			backlight = <&lp8566_wled>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
new file mode 100644
index 000000000000..05c52390269e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple DSI panels with a single power-supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  requires only a single power-supply.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+    # Panasonic 10" WUXGA TFT LCD panel
+    - panasonic,vvx10f034n00
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reg
+
+examples:
+  - |
+    mdss_dsi@fd922800 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "panasonic,vvx10f034n00";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&ltdc_out>;
+          };
+        };
+      };
+    };
-- 
2.20.1

