Return-Path: <devicetree-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F8CD7D910
	for <lwn-devicetree@archive.lwn.net>; Wed, 11 Mar 2020 16:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgCKQeH (ORCPT <rfc822;lwn-devicetree@archive.lwn.net>);
        Wed, 11 Mar 2020 12:34:07 -0400
Received: from hermes.aosc.io ([199.195.250.187]:58064 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729809AbgCKQeG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 12:34:06 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id B66154C335;
        Wed, 11 Mar 2020 16:34:01 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/5] dt-bindings: panel: add binding for Xingbangda XBD599 panel
Date:   Thu, 12 Mar 2020 00:33:26 +0800
Message-Id: <20200311163329.221840-3-icenowy@aosc.io>
In-Reply-To: <20200311163329.221840-1-icenowy@aosc.io>
References: <20200311163329.221840-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1583944446;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=ryOGBJbE0EZPCIwKdiVXZpn09MvjjBMYu9MRV2Z6xEo=;
        b=qBfqYufKA6WV46oKBRByMkVugBf2lR8zLWOu+gI3ucJ2ZoooPNStJsI4kXFwa+wkIK8fU4
        IH13K/0pI3/zED0kFD9w9Zl7ECGOT4cTZuaC0wIb6x5cNXtJxtadldZwqY5EdcsLp1vp8Z
        milTs2CU64tt69l7ntjJEU5gha8ieWc=
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Archived-At: <http://archive.lwn.net:8080/devicetree/20200311163329.221840-3-icenowy@aosc.io/>
List-Archive: <http://archive.lwn.net:8080/devicetree/>
List-Post: <mailto:devicetree@vger.kernel.org>

Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel.

Add its device tree binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../display/panel/xingbangda,xbd599.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
new file mode 100644
index 000000000000..62816b34de31
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/xingbangda,xbd599.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xingbangda XBD599 5.99in MIPI-DSI LCD panel
+
+maintainers:
+  - Icenowy Zheng <icenowy@aosc.io>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: xingbangda,xbd599
+  reg: true
+  backlight: true
+  reset-gpios: true
+  vcc-supply:
+     description: regulator that supplies the VCC voltage
+  iovcc-supply:
+     description: regulator that supplies the IOVCC voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - vcc-supply
+  - iovcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    &dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "xingbangda,xbd599";
+            reg = <0>;
+            backlight = <&backlight>;
+            iovcc-supply = <&reg_dldo2>;
+            vcc-supply = <&reg_ldo_io0>;
+        };
+    };
+
+...
-- 
2.24.1

