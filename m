Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7662CC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 13:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59FA620724
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 13:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732647AbgFWNms (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 09:42:48 -0400
Received: from www1102.sakura.ne.jp ([219.94.129.142]:17715 "EHLO
        www1102.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732631AbgFWNms (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 09:42:48 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05NClfLP068785;
        Tue, 23 Jun 2020 21:47:41 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Tue, 23 Jun 2020 21:47:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp [153.232.252.121])
        (authenticated bits=0)
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05NClbP5068743
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 23 Jun 2020 21:47:41 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
From:   Katsuhiro Suzuki <katsuhiro@katsuster.net>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, alsa-devel@alsa-project.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 1/2] dt-bindings: sound: convert rk3328 codec binding to yaml
Date:   Tue, 23 Jun 2020 21:47:33 +0900
Message-Id: <20200623124734.1736470-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Just convert Rockchip rk3328 audio codec binding to DT schema.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/rockchip,rk3328-codec.txt  | 28 ---------
 .../bindings/sound/rockchip,rk3328-codec.yaml | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
deleted file mode 100644
index 1ecd75d2032a..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Rockchip Rk3328 internal codec
-
-Required properties:
-
-- compatible: "rockchip,rk3328-codec"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- rockchip,grf: the phandle of the syscon node for GRF register.
-- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
-- clock-names: should be "pclk".
-- spk-depop-time-ms: speak depop time msec.
-
-Optional properties:
-
-- mute-gpios: GPIO specifier for external line driver control (typically the
-              dedicated GPIO_MUTE pin)
-
-Example for rk3328 internal codec:
-
-codec: codec@ff410000 {
-	compatible = "rockchip,rk3328-codec";
-	reg = <0x0 0xff410000 0x0 0x1000>;
-	rockchip,grf = <&grf>;
-	clocks = <&cru PCLK_ACODEC>;
-	clock-names = "pclk";
-	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
-	spk-depop-time-ms = 100;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
new file mode 100644
index 000000000000..08a74e28e483
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3328-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3328 internal codec
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3328-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for audio codec
+
+  clock-names:
+    items:
+      - const: pclk
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF register.
+
+  spk-depop-time-ms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 200
+    description:
+      Speaker depop time in msec.
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for external line driver control (typically the
+      dedicated GPIO_MUTE pin)
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - rockchip,grf
+
+examples:
+  - |
+    codec: codec@ff410000 {
+      compatible = "rockchip,rk3328-codec";
+      reg = <0xff410000 0x1000>;
+      clocks = <&cru PCLK_ACODEC>;
+      clock-names = "pclk";
+      rockchip,grf = <&grf>;
+      mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
+      spk-depop-time-ms = 100;
+    };
-- 
2.27.0

