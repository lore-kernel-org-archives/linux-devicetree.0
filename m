From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RESEND PATCH 2/4] dt-bindings: add "reduced-width" property for Armada XP SDRAM controller
Date: Mon,  7 Aug 2017 13:46:39 +1200
Message-ID: <20170807014641.4003-3-chris.packham@alliedtelesis.co.nz>
References: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregory.clement@free-electrons.com, bp@alien8.de, jlu@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some SoC implementations that use this controller have a reduced pin
count so the meaning of "full" and "half" with change.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/memory-controllers/mvebu-sdram-controller.txt          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
index 89657d1d4cd4..3041868321c8 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
@@ -13,6 +13,12 @@ Required properties:
  - reg: a resource specifier for the register space, which should
    include all SDRAM controller registers as per the datasheet.
 
+Optional properties:
+ - marvell,reduced-width: some SoCs that use this SDRAM controller have
+   a reduced pin count. On such systems "full" width is 32-bits and
+   "half" width is 16-bits. Set this property to indicate that the SoC
+   used is such a system.
+
 Example:
 
 sdramc@1400 {
-- 
2.13.0
