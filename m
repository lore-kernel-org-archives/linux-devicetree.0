Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F5DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7F252065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="KxSaq5XT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgENIBl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726088AbgENIAJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:00:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A07C05BD43
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k12so29101340wmj.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
        b=KxSaq5XTxVnVtwBXUOoDMp6SZenmSrmrS6gLUnxY6vLkzVplpObQpbGhAWb5e3scZb
         G32p4TJzF966nh1yZL9JpgsEt6Uc5gC99jEqeY5/lBrPjylopUDYUbnK02TMyTRx3iz6
         YucGl5to1Lmqvw4cFTcJf3TNiiFaLe8dp/49nGOEraC/fqVDh809GAiaP+eWfz3RQ9ZD
         q3nxMOvfy/S+ebWg7OjLrnGysj3nnHoIdEeh8QBNvJq/80dzMrMvHc/0O4SezOAYmzRh
         oynPjujMBWCtxL8iaOIFsZG06Pg2JdJBv8jBrp/PxoUNR0FZktPl1YfltiLh7wYyhe3h
         Z3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAzJNRl7denaMJiKd3+TRewxkBzsyKS+1FyrOm5aCWE=;
        b=k16yZ2fLsPLJDNiO1GS2OWPaxBzXi6Fdrl65tD4cmAPX2N4mxxVOXRzIIqpUYc3D55
         Mm1wqZ0ufyZfftCrxpCw17oLweru7TRgToa4luwurC2SJL+InpWuNjkUkWbXA/mruEII
         H6pXyiFSf7TAXK9uJmpyGlwzv61v1P0ys9G0YcuR3ZuYcSLveVQIEkgceEmbMqjrObk8
         qAwEY9L1FG97zpiBdlzHCbpK5WbRAgk8jWinwJEMKlSQso9uxANJUhbMVHU6r+ifdUeU
         7YNhh7RuwM5ZRdK9GLjepEuVfNHAxC/f+uQxLhmSUJlfxybSI/tCzsrx/dbMo9QYiKSH
         ylBg==
X-Gm-Message-State: AGi0PubwsHxOuGltFDvGgPjqDm5kJHDrDZf6dz6cO/qQ1eVtZBs43FIk
        fh8vOoYa/BJJMYob/CDssxEGiA==
X-Google-Smtp-Source: APiQypIcLG6kxXh59WxYMGwxMY8DTBtvFFG3hqTEALY2eBNk672ZnvUMGUIpRZsXEJD2i9XhJXK2gQ==
X-Received: by 2002:a1c:7e03:: with SMTP id z3mr35139048wmc.88.1589443205805;
        Thu, 14 May 2020 01:00:05 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:00:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 01/15] dt-bindings: convert the binding document for mediatek PERICFG to yaml
Date:   Thu, 14 May 2020 09:59:28 +0200
Message-Id: <20200514075942.10136-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the DT binding .txt file for MediaTek's peripheral configuration
controller to YAML. There's one special case where the compatible has
three positions. Otherwise, it's a pretty normal syscon.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../arm/mediatek/mediatek,pericfg.txt         | 36 -----------
 .../arm/mediatek/mediatek,pericfg.yaml        | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
deleted file mode 100644
index ecf027a9003a..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Mediatek pericfg controller
-===========================
-
-The Mediatek pericfg controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-pericfg", "syscon"
-	- "mediatek,mt2712-pericfg", "syscon"
-	- "mediatek,mt7622-pericfg", "syscon"
-	- "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon"
-	- "mediatek,mt7629-pericfg", "syscon"
-	- "mediatek,mt8135-pericfg", "syscon"
-	- "mediatek,mt8173-pericfg", "syscon"
-	- "mediatek,mt8183-pericfg", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The pericfg controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-Also it uses the common reset controller binding from
-Documentation/devicetree/bindings/reset/reset.txt.
-The available reset outputs are defined in
-dt-bindings/reset/mt*-resets.h
-
-Example:
-
-pericfg: power-controller@10003000 {
-	compatible = "mediatek,mt8173-pericfg", "syscon";
-	reg = <0 0x10003000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
new file mode 100644
index 000000000000..1340c6288024
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Peripheral Configuration Controller
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description:
+  The Mediatek pericfg controller provides various clocks and reset outputs
+  to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - mediatek,mt2701-pericfg
+          - mediatek,mt2712-pericfg
+          - mediatek,mt7622-pericfg
+          - mediatek,mt7629-pericfg
+          - mediatek,mt8135-pericfg
+          - mediatek,mt8173-pericfg
+          - mediatek,mt8183-pericfg
+        - const: syscon
+      - items:
+        # Special case for mt7623 for backward compatibility
+        - const: mediatek,mt7623-pericfg
+        - const: mediatek,mt2701-pericfg
+        - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pericfg@10003000 {
+        compatible = "mediatek,mt8173-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+  - |
+    pericfg@10003000 {
+        compatible =  "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.25.0

