Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43097 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387803AbfBMRvk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Feb 2019 12:51:40 -0500
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 1/3] media: dt-bindings: media: document allegro-dvt bindings
Date: Wed, 13 Feb 2019 18:51:22 +0100
Message-Id: <20190213175124.3695-2-m.tretter@pengutronix.de>
In-Reply-To: <20190213175124.3695-1-m.tretter@pengutronix.de>
References: <20190213175124.3695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Add device-tree bindings for the Allegro DVT video IP core found on the
Xilinx ZynqMP EV family.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2 -> v3:
- rename node to video-codec
- drop interrupt-names
- fix compatible in example
- add clocks to required properties

v1 -> v2:
none
---
 .../devicetree/bindings/media/allegro.txt     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt

diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
new file mode 100644
index 000000000000..a92e2fbf26c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro.txt
@@ -0,0 +1,43 @@
+Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
+ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
+decoder ip core.
+
+Each actual codec engines is controlled by a microcontroller (MCU). Host
+software uses a provided mailbox interface to communicate with the MCU. The
+MCU share an interrupt.
+
+Required properties:
+  - compatible: value should be one of the following
+    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
+    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
+  - reg: base and length of the memory mapped register region and base and
+    length of the memory mapped sram
+  - reg-names: must include "regs" and "sram"
+  - interrupts: shared interrupt from the MCUs to the processing system
+  - clocks: must contain an entry for each entry in clock-names
+  - clock-names: must include "core_clk", "mcu_clk", "m_axi_core_aclk",
+    "m_axi_mcu_aclk", "s_axi_lite_aclk"
+
+Example:
+	al5e: video-codec@a0009000 {
+		compatible = "allegro,al5e-1.1", "allegro,al5e";
+		reg = <0 0xa0009000 0 0x1000>,
+		      <0 0xa0000000 0 0x8000>;
+		reg-names = "regs", "sram";
+		interrupts = <0 96 4>;
+		clocks = <&xlnx_vcu 0>, <&xlnx_vcu 1>,
+			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
+		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
+			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
+	};
+	al5d: video-codec@a0029000 {
+		compatible = "allegro,al5d-1.1", "allegro,al5d";
+		reg = <0 0xa0029000 0 0x1000>,
+		      <0 0xa0020000 0 0x8000>;
+		reg-names = "regs", "sram";
+		interrupts = <0 96 4>;
+		clocks = <&xlnx_vcu 2>, <&xlnx_vcu 3>,
+			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
+		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
+			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
+	};
-- 
2.20.1
