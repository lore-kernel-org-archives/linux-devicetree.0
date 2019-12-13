Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A12C3524B
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CF762472C
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLMMyX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 07:54:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57218 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLMMyX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 07:54:23 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C190C292CD9;
        Fri, 13 Dec 2019 12:54:21 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 5/7] media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
Date:   Fri, 13 Dec 2019 13:54:12 +0100
Message-Id: <20191213125414.90725-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213125414.90725-1-boris.brezillon@collabora.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the Rockchip RK3399 Video Decoder bindings.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* Fix dtbs_check failures
---
 .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
new file mode 100644
index 000000000000..7167c3d6a389
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Video Decoder (VDec) Device Tree Bindings
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |-
+  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
+  HEVC an VP9 streams.
+
+properties:
+  compatible:
+    const: rockchip,rk3399-vdec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The Video Decoder AXI interface clock
+      - description: The Video Decoder AHB interface clock
+      - description: The Video Decoded CABAC clock
+      - description: The Video Decoder core clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: iface
+      - const: cabac
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vdec: video-codec@ff660000 {
+        compatible = "rockchip,rk3399-vdec";
+        reg = <0x0 0xff660000 0x0 0x400>;
+        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
+                 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
+        clock-names = "aclk", "iface", "cabac", "core";
+        power-domains = <&power RK3399_PD_VDU>;
+        iommus = <&vdec_mmu>;
+    };
+
+...
-- 
2.23.0

