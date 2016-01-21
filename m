From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v3 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi compatible string
Date: Thu, 21 Jan 2016 15:09:15 +0800
Message-ID: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

new compatible string: "fsl,ls2080a-qspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v3:
Add the modifier for new compatible string like:
"fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"

Changed in v2:
Update my email to <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
index fa77f87..1ad0fe3 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
@@ -1,7 +1,10 @@
 ARM Freescale DSPI controller
 
 Required properties:
-- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi"
+- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
+		"fsl,ls2085a-dspi"
+		or
+		"fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
 - reg : Offset and length of the register set for the device
 - interrupts : Should contain SPI controller interrupt
 - clocks: from common clock binding: handle to dspi clock.
-- 
2.1.0.27.g96db324
