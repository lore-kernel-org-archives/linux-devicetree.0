Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648B5CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36BEF21835
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auHZttj8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502853AbfJRSY5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 14:24:57 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37068 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502836AbfJRSY5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 14:24:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id l21so7180839lje.4
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYHZuLGg+JGJBwHO1m+JSuqR2RXOf2t8ywlY3WZdrN0=;
        b=auHZttj89zTTWX6QMDr8blBfC+K/EgSELf0teDHp1pkUjxV63etpiqa9A4Qd08STM7
         IMiiWsXaiMaKzdHmXylAP/bj3ts9LRBL5qbSIkL5L6XuGEQTaU7icGOQxSQRzVj1vDur
         Aikyb2mwMmucPPWhTjD58iPhEhZ/lXlMHmosULz+j1kpV7F5ApvX9Wx5jYn90HQLANJ/
         bnABKygJfUUocd53BiIh/CGwCslYNIaQFMGBQgzl9eUt0bTDZnKgEZofPPgyRB/0pg+V
         E/HYvP8i/wFhI1bTBvgv9nObxFtsvTVGdHo0XI6+ZT7CJBL2LAsgViiImxxu8NUsMlA3
         3LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYHZuLGg+JGJBwHO1m+JSuqR2RXOf2t8ywlY3WZdrN0=;
        b=l9aqMxNMQb0z12OS5DxrrHmnGD/tE72MQmS9PTv5uWJNucojsfAtOmCjAD2pSbiF9D
         NqBu7NFmkv/2PsPRDp1MlZLK3AgGHda30B/iSx9xIXiP7YjMwfeLrSeky51sixKGNpEB
         /ylG9aWeQXwV6n2GFekhkvIZ0+N02+NqFs90hxAbdjy9cjilM8T1ehBUqG2gTsdAtp/7
         yTWDTMQgZdPYvlXURLY0Kd7p2fQfjqFrL0eaWMY2EVJtGOCTLQDr/WrefYUhDgJxTvH1
         6+dNSQrW5NqTMdaTJIczVVheT+uUH6eI/QpfdL+EOeMvhr7YY0lynOVB6+Cj+YnqheZW
         Jupw==
X-Gm-Message-State: APjAAAX0slPXmn8bH0JOaFeXIZQvrtoE9LyXEHrvD7G6ezBDuWKOwv6F
        JRL2OYm35gGnjyVB5mj/x3knuw==
X-Google-Smtp-Source: APXvYqzBKy427jd3dlIZ/D555Svg4NIKOAkSrJwvldFXaPFjPxfgRskBmEv1lPaMhwTVADRpb5luKQ==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr7425517lji.87.1571423095129;
        Fri, 18 Oct 2019 11:24:55 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g26sm3020617lje.80.2019.10.18.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:24:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3 v3] drm/panel: Add generic DSI panel YAML bindings
Date:   Fri, 18 Oct 2019 20:24:44 +0200
Message-Id: <20191018182446.26131-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a starting point for processing and defining generic
bindings used by DSI panels. We just define one single bool
property to force the panel into video mode for now.

Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Make a more complete DSI panel binding including the controller
  and its address-cells and size-cells and a pattern for the panel
  nodes. The panel is one per DSI master, the reg property is
  compulsory but should always be 0 (as far as I can tell) as
  only one panel can be connected. The bus doesn't really have
  any addresses for the panel, the address/reg notation seems
  to be cargo-culted from the port graphs and is not necessary
  to parse some device trees, it is used to tell whether the
  node is a panel or not rather than any addressing.
- I have no idea how many displays you can daisychain on a single
  DSI master, I just guess 15 will be enough. The MIPI-specs
  are memberwalled. Someone who knows can tell perhaps?
ChangeLog v1->v2:
- New patch after feedback.
---
 .../display/panel/panel-dsi-common.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml
new file mode 100644
index 000000000000..d63f597eff9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dsi-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for DSI Display Panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This document defines device tree properties common to DSI, Display
+  Serial Interface panels. It doesn't constitute a device tree binding
+  specification by itself but is meant to be referenced by device tree
+  bindings.
+
+  When referenced from panel device tree bindings the properties defined in
+  this document are defined as follows. The panel device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+  Notice: this binding concerns DSI panels connected directly to a master
+  without any intermediate port graph to the panel. Each DSI master
+  can control exactly one panel. They should all just have a node "panel"
+  for their panel with their reg-property set to 0.
+
+properties:
+  $nodename:
+    pattern: "^dsi-controller(@[0-9a-f]+)?$"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^panel$":
+    type: object
+
+    properties:
+      reg:
+        const: 0
+        description:
+          Only one panel can be connected to each DSI controller, but for
+          historical reasons, the reg property must be specified, as the
+          DSI controller can contain other child nodes, and operating
+          systems will identify which child node is the panel by looking
+          for the reg property. It should however always be set to 0.
+
+      enforce-video-mode:
+        type: boolean
+        description:
+          The best option is usually to run a panel in command mode, as this
+          gives better control over the panel hardware. However for different
+          reasons like broken hardware, missing features or testing, it may be
+          useful to be able to force a command mode-capable panel into video
+          mode.
-- 
2.21.0

