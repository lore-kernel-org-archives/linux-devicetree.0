From: Hao Zhang <hao5781286@gmail.com>
Subject: [PATCH v4 1/3] Documentation: DT: add dma compatible for sun50i A64 SOC
Date: Sun, 20 Nov 2016 18:45:38 +0800
Message-ID: <1479638740-20520-2-git-send-email-hao5781286@gmail.com>
References: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, dan.j.williams@intel.com, vinod.koul@intel.com, mark.rutland@arm.com, robh+dt@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hao5781286@gmail.com
List-Id: devicetree@vger.kernel.org

This add the property of Allwinner sun50i A64 dma.

Signed-off-by: Hao Zhang <hao5781286@gmail.com>
---
 Documentation/devicetree/bindings/dma/sun6i-dma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
index 6b26704..4398b99 100644
--- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
@@ -9,6 +9,7 @@ Required properties:
 		  "allwinner,sun8i-a23-dma"
 		  "allwinner,sun8i-a83t-dma"
 		  "allwinner,sun8i-h3-dma"
+		  "allwinner,sun50i-a64-dma"
 - reg:		Should contain the registers base address and length
 - interrupts:	Should contain a reference to the interrupt used by this device
 - clocks:	Should contain a reference to the parent AHB clock
-- 
2.7.4
