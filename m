Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA4BC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21C7F217F4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eppuZLmd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgABKR2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 05:17:28 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41355 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgABKR2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 05:17:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so40212259ljc.8
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/MTGfQ5E4qXZEXmnJB6mzgCLib+I9ktBweyOlqsK414=;
        b=eppuZLmdBzgS1sTX+Z5gG2LbjSZHE0h8K2JwE4c0PqZDJWeJdX1YMQI3woI/PAuo+n
         u+lJ2sSYLySZ0r/ZhJTCRoc64sVbh0/SV37x3s8a5gikfD1t+ELaKAYZHqYx/eJkLsOC
         SKJxsb8PCV2F/AQuZY/v0BhSf0p2IJl4KGEvH6PeD2UYts4IRUwbkPHp3/SC/IulJ0TM
         rNxWUYBw6U2c0sNVtI0LjBhrDP0sequC3sGoAjrf+CXQ2sMfrDzzm/VmBeeAgQkiyq7r
         h9ufnOAgg9Xj81D7PlvBzL+OWhqGDYpK6Y1SCFueXcE61zL89dKirUoLtpEPx96tED3y
         Mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/MTGfQ5E4qXZEXmnJB6mzgCLib+I9ktBweyOlqsK414=;
        b=dJMOaJs1wRUBErP2B6P32N9/3j+McidDYTBqvAElvQPTRc2x+jL+7liJ5gDHXC9RvQ
         8/dcSDsGUlbvQqzkMH5IfVP7b+/zHVcsPRZpjfGoa8Yg7nIPVOz3szUNRl7HqzK3pAL/
         5q5daaTGvB+RU20QDyp7RRnXDLXh6wq9+0oCsKOKoqlkhVY0gNFaTuoMbrTkDjpDa94z
         T42e/TZ5ZjUu3POg43ZDg9rhWavj3adzcTjv41LK1+ds8XY/o60VvdsKiU1NMTN2Y1Cu
         PsfIMAxSNVylGG0MRCwg+AjzkHEfCDl5tT+AAZNDggc84oRRDTm5ljWZLa62QeqVWj+b
         qwAw==
X-Gm-Message-State: APjAAAUl2bcQP/L/KvzJoUzCJDQodS8XT4EEb7fZ6DcSu+NJGx63/VB7
        ybCyeNITxfQx6fdlUi+LXaI=
X-Google-Smtp-Source: APXvYqw90yIr0mEonCawBbDO69XetCFU+e3nr8JEvztOZBWzJeqKzqPQd9/z6lkfvHUud7GbKNy1aw==
X-Received: by 2002:a2e:7405:: with SMTP id p5mr48847794ljc.34.1577960245226;
        Thu, 02 Jan 2020 02:17:25 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m21sm23025892lfh.53.2020.01.02.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 02:17:24 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
Date:   Thu,  2 Jan 2020 11:17:11 +0100
Message-Id: <20200102101712.5085-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There is an increasing number of new simple panels.
Common for many of these simple panels are that they have one
mandatory power-supply and some of them have backlight and / or
an enable gpio.

The binding file to describe these panels adds overhead
that really do not add value.
The binding are known and there is nothing gained from a
dedicated binding file nor for any dedicated example.

The following patch introduces a single panel-simple.yaml
and converts two ampire bindings over to the new file.

The conversion - if applied will have following effects:

- The maintainer for the individual file will change
    There is no need for many different maintainers for a simple binding.
    We have the same situation with the panel-simple driver in the kernel.

- The license will change to (GPL-2.0-only OR BSD-2-Clause)
    There is usually only a single line copied from the original
    file, a line that is often copied from a datasheet.
    This license change should be acceptable considered what little
    is copied.
    If the license change is not OK we can use a dedicated binding
    file in these cases.

This is a follow-up on Rob's big patch converting a lot of panel bindings
to individual files:

"dt-bindings: display: Convert a bunch of panels to DT schema"
https://patchwork.ozlabs.org/patch/1197683/

The objectives with one file for the relevant simple panels are:
- Make it simpler to add bindings for simple panels
- Keep the number of bindings file lower and thus easier to find a
  relevant file to copy from when adding new panels.
- Keep the binding documentation for simple panels more consistent
- Make it simpler to add support for new panels

v2:
  - spelling fixes (imirkin via irc, Rob)
  - updated description (Rob)
  - list properires in alphabetical order
  - added power-supply to example (Rob)
  - updated title
  - reworded changelog a little

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
 .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 -------------
 .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
 .../bindings/display/panel/panel-simple.yaml  | 59 +++++++++++++++++++
 3 files changed, 59 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
deleted file mode 100644
index c6e33e7f36d0..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
+++ /dev/null
@@ -1,42 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-t01h.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
-
-maintainers:
-  - Yannick Fertre <yannick.fertre@st.com>
-  - Thierry Reding <treding@nvidia.com>
-
-allOf:
-  - $ref: panel-common.yaml#
-
-properties:
-  compatible:
-    const: ampire,am-480272h3tmqw-t01h
-
-  power-supply: true
-  enable-gpios: true
-  backlight: true
-  port: true
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    panel_rgb: panel {
-      compatible = "ampire,am-480272h3tmqw-t01h";
-      enable-gpios = <&gpioa 8 1>;
-      port {
-        panel_in_rgb: endpoint {
-          remote-endpoint = <&controller_out_rgb>;
-        };
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
deleted file mode 100644
index 83e2cae1cc1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "ampire,am800480r3tmqwa1h"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
new file mode 100644
index 000000000000..51ca50201182
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple panels with one power supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the simple (dumb) panels that
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
+    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
+    - ampire,am-480272h3tmqw-t01h
+    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+    - ampire,am800480r3tmqwa1h
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
+
+examples:
+  - |
+    panel_rgb: panel-rgb {
+      compatible = "ampire,am-480272h3tmqw-t01h";
+      power-supply = <&vcc_lcd_reg>;
+
+      port {
+        panel_in_rgb: endpoint {
+          remote-endpoint = <&ltdc_out_rgb>;
+        };
+      };
+    };
-- 
2.20.1

