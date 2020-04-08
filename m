Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B361CC38A2D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DCA620784
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vJCodok9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgDHTwQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33688 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id q22so5253825ljg.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=suEzlqh4afqhEw2Ww2mplEXF7wOhnfd4sMyHNvHCYpk=;
        b=vJCodok97LC8P6Lvhb5ZqFYpj7CCVZYMer7kVf9Yxa+TvurROq/YQaaOUTHnuApn1h
         v7P9MXCoHl4BWNwY3hK0Adz2tRJBNIHZPOy14PTpb9xpQfNqppblrnUD3Aw7olHxi2YM
         LHC72hkN5kw0kU/ADaKdg4EktaOd0/F9BT4pKoGHnX2qRBfmFzFlO3jm8JbZ2COuc9vz
         2uvU8QsK+lbPg1Vt+OxAH3O/UfcsInZMBkvB/g8z7XfjrqWpqvvhV4O/2jqds2MBqg+t
         7MMWtcPorHT3zp9Vav7+zx2wTxNHxamlkNKIJWLAhSk32sOy59ry6/6uIl0TE8hSdnE7
         ZaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=suEzlqh4afqhEw2Ww2mplEXF7wOhnfd4sMyHNvHCYpk=;
        b=mvBnnLSpGCYqemdIkj6/By3SY0OSftbV/9L7VUNmi5Pbz5JMeu2jDaSU8XSX6KKXmq
         SzGsPr/p2tN0B8iof44diVgvqcob008fLVdOSn3jNyMm7gLqNNAlNHk3q2KI0E/r0sgc
         EZJKJWy5XK36Kv8kt786WqsbAR7tzTsw/VVQwkDlAleuUZS7V9f/IW5Nso6Yiv5oJ0y5
         Y94OAKTUzbSbszJmk7xQBVP6oI3QSsB/dAIxq5CDyHAxb419NXD8EQuM9KVg3ULmOZHl
         BpAjupLJWZW09D+axsFSMddt0T9Rs75A2uaPa09p+aV/prXkEzY6Aow9fTjbVT0rcdYo
         g17w==
X-Gm-Message-State: AGi0PuYGOmTprawgoslY8lF3v9lpj8GbzLe+Sl41CVLZEesV65b1Mc/0
        UxYWOAfsvwS3NFE9+FLll0Y=
X-Google-Smtp-Source: APiQypIDDL0YGzy2cn/gU/4C+B8rnL9iXWO5mnpo/vhV4zasXGY0NQzkcPYldKWuIKqKqBjIsDD0Qg==
X-Received: by 2002:a2e:8914:: with SMTP id d20mr5771584lji.148.1586375533346;
        Wed, 08 Apr 2020 12:52:13 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:12 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 30/36] dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
Date:   Wed,  8 Apr 2020 21:51:03 +0200
Message-Id: <20200408195109.32692-31-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This binding describes a panel with a secondary channel.

v2:
  - add check for required properties if link2 is present (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq101r1sx01.txt       | 49 -----------
 .../display/panel/sharp,lq101r1sx01.yaml      | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
deleted file mode 100644
index f522bb8e47e1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Sharp Microelectronics 10.1" WQXGA TFT LCD panel
-
-This panel requires a dual-channel DSI host to operate. It supports two modes:
-- left-right: each channel drives the left or right half of the screen
-- even-odd: each channel drives the even or odd lines of the screen
-
-Each of the DSI channels controls a separate DSI peripheral. The peripheral
-driven by the first link (DSI-LINK1), left or even, is considered the primary
-peripheral and controls the device. The 'link2' property contains a phandle
-to the peripheral driven by the second link (DSI-LINK2, right or odd).
-
-Note that in video mode the DSI-LINK1 interface always provides the left/even
-pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
-is possible to program either link to drive the left/even or right/odd pixels
-but for the sake of consistency this binding assumes that the same assignment
-is chosen as for video mode.
-
-Required properties:
-- compatible: should be "sharp,lq101r1sx01"
-- reg: DSI virtual channel of the peripheral
-
-Required properties (for DSI-LINK1 only):
-- link2: phandle to the DSI peripheral on the secondary link. Note that the
-  presence of this property marks the containing node as DSI-LINK1.
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties (for DSI-LINK1 only):
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	dsi@54300000 {
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-		};
-	};
-
-	dsi@54400000 {
-		secondary: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
new file mode 100644
index 000000000000..956608cada77
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1), left or even, is considered the primary
+  peripheral and controls the device. The 'link2' property contains a phandle
+  to the peripheral driven by the second link (DSI-LINK2, right or odd).
+
+  Note that in video mode the DSI-LINK1 interface always provides the left/even
+  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
+  is possible to program either link to drive the left/even or right/odd pixels
+  but for the sake of consistency this binding assumes that the same assignment
+  is chosen as for video mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101r1sx01
+
+  reg: true
+  power-supply: true
+  backlight: true
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - link2
+then:
+  required:
+    - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+
+            link2 = <&secondary>;
+
+            power-supply = <&power>;
+            backlight = <&backlight>;
+        };
+    };
+
+    dsi1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        secondary: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+        };
+    };
+
+...
-- 
2.20.1

