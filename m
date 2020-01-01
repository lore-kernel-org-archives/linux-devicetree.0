Return-Path: <SRS0=z07g=2W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E66C2D0DC
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B52E0206E6
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="e76aESV8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgAALZ0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jan 2020 06:25:26 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53783 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgAALZZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jan 2020 06:25:25 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so2060257pjc.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jan 2020 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aAzFwJEYuGgvW/P9IbRhSf+XnGQckgZrqUZat3QeX28=;
        b=e76aESV8OxAQ+1VReIRY8qExAktiTMGpxkgpQS4hc8yEWCX2XUpVgRMyQ0P+3VhGxx
         cG+Dvzo+9tQIGq5JLT76qntE2V5+hVAB99vO8Cz1zO/6WgM+qGy/PgKfaAswdNYIsyQh
         Bu2Vy4n7gYkG3IXYbGQsVR3lCVEYmT4YSAHDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aAzFwJEYuGgvW/P9IbRhSf+XnGQckgZrqUZat3QeX28=;
        b=Ei7HUjOwVQ53JDc8AfNCok6Sy+awYJvXELCmMySbBvFcJZfMH8nwCifZ4LY7dyUTGE
         VtiJfVlYc3G0g9i8N8AqvONDuVrtUu5I4gqMrc+GRZ0MMIbw6dY0HR1iCHksyN5lUdYj
         22tHOC+OMLr3MbJZ0q9azIzWXjatTeM7FazOM0RONtRHI8bOcDAOpW0d0w3CBbchaNr0
         T4HP1kE2YmBE9KZ5+e7QbS0t8DaDiuum/FxV0nN93+5IIc4THuMmquBOPOKIqD+LwW7A
         86Ok9+o1M0DVBeKD731jkbMmmfc0AEV4MNu75ZqvWZqu4Ovy2yM3CjbG2d0F4Y76196Z
         y3Mw==
X-Gm-Message-State: APjAAAWpeGsXogRgd0OUKI2fMA4XL5Q2tdBc9woNSpSYiHwJ6z79rYSN
        lvreQruj9CXzQZ/nOYyrEgwTcQ==
X-Google-Smtp-Source: APXvYqzkSctdjdd9fJlMbQsYlI1poSSJCvWf4LUQ6JA98+/eq25mxnQcgX+A0QG3VgKbw4bWIYZk/Q==
X-Received: by 2002:a17:902:d906:: with SMTP id c6mr35495504plz.137.1577877925003;
        Wed, 01 Jan 2020 03:25:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
        by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 03:25:24 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 4/6] dt-bindings: display: panel: Convert friendlyarm,hd702e to DT schema
Date:   Wed,  1 Jan 2020 16:54:42 +0530
Message-Id: <20200101112444.16250-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the friendlyarm,hd702e panel bindings to DT schema.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/friendlyarm,hd702e.txt      | 32 -------------
 .../display/panel/friendlyarm,hd702e.yaml     | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
deleted file mode 100644
index 6c9156fc3478..000000000000
--- a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-FriendlyELEC HD702E 800x1280 LCD panel
-
-HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
-resolution. It has built in Goodix, GT9271 captive touchscreen
-with backlight adjustable via PWM.
-
-Required properties:
-- compatible: should be "friendlyarm,hd702e"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LCD panel input.
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Example:
-
-	panel {
-		compatible ="friendlyarm,hd702e", "simple-panel";
-		backlight = <&backlight>;
-		power-supply = <&vcc3v3_sys>;
-
-		port {
-			panel_in_edp: endpoint {
-				remote-endpoint = <&edp_out_panel>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
new file mode 100644
index 000000000000..0509c34d98b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/friendlyarm,hd702e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FriendlyELEC HD702E 800x1280 LCD panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
+  resolution. It has built in Goodix, GT9271 captive touchscreen
+  with backlight adjustable via PWM.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: friendlyarm,hd702e
+
+  power-supply:
+    description: regulator to provide the supply voltage
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+            compatible ="friendlyarm,hd702e", "simple-panel";
+            backlight = <&backlight>;
+            power-supply = <&vcc3v3_sys>;
+
+            port {
+                    panel_in_edp: endpoint {
+                            remote-endpoint = <&edp_out_panel>;
+                    };
+            };
+    };
-- 
2.18.0.321.gffc6fa0e3

