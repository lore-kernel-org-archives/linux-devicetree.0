Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE3AFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 17:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 493C5206C3
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 17:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fS9Cf1UP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfKHR7z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 12:59:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfKHR7z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 12:59:55 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0581031D;
        Fri,  8 Nov 2019 18:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573235991;
        bh=VyloTpR4Cy9JmAB7UPEVI+Tg4F9H2KlS0W+8W1VZ7VU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fS9Cf1UPdf91MnyylSKnKsLiLyV7A9WtNMX979QjJNNxjbx6Wy9BirP8vSS7pzwYF
         OeKQkZZWgXAylSwf9db0kFfnbhD++4XXLgtYbIotxOG6Ho5S/hysc/grc9HTOwjyAG
         S8AhZXobHp42hDMAt7IaPVLWrvdfR0pQnhoBFY5E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 1/4] dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
Date:   Fri,  8 Nov 2019 19:59:32 +0200
Message-Id: <20191108175935.29766-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Hyun Kwon <hyun.kwon@xilinx.com>

The bindings describe the ZynqMP DP subsystem. They don't support the
interface with the programmable logic (FPGA) or audio yet.

Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v9:

- Fix constraints on clock-names
- Document dp_apb_clk as the APB clock, not the AXI clock

Changes since v8:

- Convert to yaml
- Rename aclk to dp_apb_clk
---
 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
new file mode 100644
index 000000000000..ffdebe195751
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx ZynqMP DisplayPort Subsystem
+
+description: |
+  The DisplayPort subsystem of Xilinx ZynqMP (Zynq UltraScale+ MPSoC)
+  implements the display and audio pipelines based on the DisplayPort v1.2
+  standard. The subsystem includes multiple functional blocks as below:
+
+               +------------------------------------------------------------+
+  +--------+   | +----------------+     +-----------+                       |
+  | DPDMA  | --->|                | --> |   Video   | Video +-------------+ |
+  | 4x vid |   | |                |     | Rendering | -+--> |             | |   +------+
+  | 2x aud |   | |  Audio/Video   | --> | Pipeline  |  |    | DisplayPort |---> | PHY0 |
+  +--------+   | | Buffer Manager |     +-----------+  |    |   Source    | |   +------+
+               | |    and STC     |     +-----------+  |    | Controller  | |   +------+
+  Live Video --->|                | --> |   Audio   | Audio |             |---> | PHY1 |
+               | |                |     |   Mixer   | --+-> |             | |   +------+
+  Live Audio --->|                | --> |           |  ||   +-------------+ |
+               | +----------------+     +-----------+  ||                   |
+               +---------------------------------------||-------------------+
+                                                       vv
+                                                 Blended Video and
+                                                 Mixed Audio to PL
+
+  The Buffer Manager interacts with external interface such as DMA engines or
+  live audio/video streams from the programmable logic. The Video Rendering
+  Pipeline blends the video and graphics layers and performs colorspace
+  conversion. The Audio Mixer mixes the incoming audio streams. The DisplayPort
+  Source Controller handles the DisplayPort protocol and connects to external
+  PHYs.
+
+  The subsystem supports 2 video and 2 audio streams, and various pixel formats
+  and depths up to 4K@30 resolution.
+
+  Please refer to "Zynq UltraScale+ Device Technical Reference Manual"
+  (https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf)
+  for more details.
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-dpsub-1.7
+
+  reg:
+    maxItems: 4
+  reg-names:
+    items:
+      - const: dp
+      - const: blend
+      - const: av_buf
+      - const: aud
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      The APB clock and at least one video clock are mandatory, the audio clock
+      is optional.
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: dp_apb_clk is the APB clock
+      - description: dp_aud_clk is the Audio clock
+      - description:
+          dp_vtc_pixel_clk_in is the non-live video clock (from Processing
+          System)
+      - description:
+          dp_live_video_in_clk is the live video clock (from Programmable
+          Logic)
+  clock-names:
+    oneOf:
+      - minItems: 2
+        maxItems: 3
+        items:
+          - const: dp_apb_clk
+          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
+          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
+      - minItems: 3
+        maxItems: 4
+        items:
+          - const: dp_apb_clk
+          - const: dp_aud_clk
+          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
+          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
+
+  power-domains:
+    maxItems: 1
+
+  dmas:
+    maxItems: 4
+    items:
+      - description: Video layer, plane 0 (RGB or luma)
+      - description: Video layer, plane 1 (U/V or U)
+      - description: Video layer, plane 2 (V)
+      - description: Graphics layer
+  dma-names:
+    items:
+      - const: vid0
+      - const: vid1
+      - const: vid2
+      - const: gfx0
+
+  phys:
+    description: PHYs for the DP data lanes
+    minItems: 1
+    maxItems: 2
+  phy-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: dp-phy0
+      - const: dp-phy1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - dmas
+  - dma-names
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    display@fd4a0000 {
+      compatible = "xlnx,zynqmp-dpsub-1.7";
+      reg = <0x0 0xfd4a0000 0x0 0x1000>,
+            <0x0 0xfd4aa000 0x0 0x1000>,
+            <0x0 0xfd4ab000 0x0 0x1000>,
+            <0x0 0xfd4ac000 0x0 0x1000>;
+      reg-names = "dp", "blend", "av_buf", "aud";
+      interrupts = <0 119 4>;
+      interrupt-parent = <&gic>;
+
+      clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
+      clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
+
+      power-domains = <&pd_dp>;
+
+      dma-names = "vid0", "vid1", "vid2", "gfx0";
+      dmas = <&xlnx_dpdma 0>,
+             <&xlnx_dpdma 1>,
+             <&xlnx_dpdma 2>,
+             <&xlnx_dpdma 3>;
+
+      phys = <&lane1>, <&lane0>;
+      phy-names = "dp-phy0", "dp-phy1";
+    };
+
+...
-- 
Regards,

Laurent Pinchart

