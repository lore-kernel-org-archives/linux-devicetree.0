Return-Path: <SRS0=z07g=2W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B084C2D0DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7286D206E6
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MO1HGiBM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgAALZd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jan 2020 06:25:33 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:41693 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgAALZd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jan 2020 06:25:33 -0500
Received: by mail-pf1-f175.google.com with SMTP id w62so20709136pfw.8
        for <devicetree@vger.kernel.org>; Wed, 01 Jan 2020 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdGoH1RBSE0s/FT++wCk+eXRQE/Dps6JokN9W13ec2A=;
        b=MO1HGiBMORzlmmGBTIkfOKcf78TkkSN/9tgtVrUAJc/hRF0XNQaz+yNfURcEgkZtLE
         6LhWWEtQ16lZn4VmnnutJU83l2YZ0Kwi1+mRZ3H9iqS3DSN2jKxEUAZD/v3IeeTSo+Ol
         ovt48RgOeck5uh1ThZ/ZKLFMdDeBwR/dUv+7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdGoH1RBSE0s/FT++wCk+eXRQE/Dps6JokN9W13ec2A=;
        b=W39WEC1tlAuJfJHkUT+QQFpnlTB7J+3/qeLbHAo1r/bLQumkzT2ECwoyjFGgJtz70v
         mzWc+/LCSsDQIedLb7S1d7GhuyjDwSK/Mo3jdalLD8HeG1nx6HWhkectJYXXLNBz4xqW
         Z005qNbY8IVBe44EzkSjG0jIkWn0gvqZCoYXcROHHpmX8Pq3WRenIPYUIP9tuRu8WnMd
         zJzVAEqHx0ZUMXBhskB9MeyDs7Fo+8/OYzUQsVnyBZcSC5jZDLfxtG0wtbZKpTrylMol
         pkvHu5V1/6pGPKqnnNMPIDXlZUySaU0+cyWdJ9HlvmfEPEUx0AvtYDsuzw23hVMd9+eH
         CCBQ==
X-Gm-Message-State: APjAAAUTGitwBy27DRVHQH0yJqmDB04+1ZwKHDOsgVX4kE7b7GQmqkYP
        B57k9CeiqtgNFH44Jkb0xRBFSFXmsUQ=
X-Google-Smtp-Source: APXvYqyhFnef0p6xMGnWn9M8e38I99cM5qjK6fUCTcmrXYfohQ69YIgfsfWMkjrpcd1nvhR1r9Hkmg==
X-Received: by 2002:a65:4587:: with SMTP id o7mr82913622pgq.303.1577877931997;
        Wed, 01 Jan 2020 03:25:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
        by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 03:25:31 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 6/6] dt-bindings: display: panel: Convert koe,tx31d200vm0baa to DT schema
Date:   Wed,  1 Jan 2020 16:54:44 +0530
Message-Id: <20200101112444.16250-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the koe,tx31d200vm0baa panel bindings to DT schema.

Also, drop the description from legacy .txt since the yaml DT schema
of panel-common.yaml already have that information.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/koe,tx31d200vm0baa.txt      | 25 -------------
 .../display/panel/koe,tx31d200vm0baa.yaml     | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
deleted file mode 100644
index 6a036ede3e28..000000000000
--- a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "koe,tx31d200vm0baa"
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LVDS panel input.
-
-Example:
-	panel {
-		compatible = "koe,tx31d200vm0baa";
-		backlight = <&backlight_lvds>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
new file mode 100644
index 000000000000..4b64e8ad8ec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/koe,tx31d200vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: koe,tx31d200vm0baa
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+            compatible = "koe,tx31d200vm0baa";
+            backlight = <&backlight_lcd>;
+
+            port {
+                    panel_in: endpoint {
+                            remote-endpoint = <&lvds0_out>;
+                    };
+            };
+    };
-- 
2.18.0.321.gffc6fa0e3

