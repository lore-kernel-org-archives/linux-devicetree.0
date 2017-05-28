From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/7] dmaengine: use proper name for the R-Car SoC
Date: Sun, 28 May 2017 11:30:44 +0200
Message-ID: <20170528093051.11816-2-wsa+renesas@sang-engineering.com>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It is 'R-Car', not 'r-car'. No code or binding changes, only descriptive text.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I suggest this trivial patch should be picked individually per susbsystem.

 Documentation/devicetree/bindings/dma/shdma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/shdma.txt b/Documentation/devicetree/bindings/dma/shdma.txt
index 2a3f3b8946b998..a91920a49433c2 100644
--- a/Documentation/devicetree/bindings/dma/shdma.txt
+++ b/Documentation/devicetree/bindings/dma/shdma.txt
@@ -1,6 +1,6 @@
 * SHDMA Device Tree bindings
 
-Sh-/r-mobile and r-car systems often have multiple identical DMA controller
+Sh-/r-mobile and R-Car systems often have multiple identical DMA controller
 instances, capable of serving any of a common set of DMA slave devices, using
 the same configuration. To describe this topology we require all compatible
 SHDMA DT nodes to be placed under a DMA multiplexer node. All such compatible
-- 
2.11.0
