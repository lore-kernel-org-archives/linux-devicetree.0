From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 1/4] dma: mmp_pdma: Add the #requestors DT property documentation
Date: Thu, 11 Feb 2016 22:23:15 +0100
Message-ID: <1455225798-9510-2-git-send-email-robert.jarzmik@free.fr>
References: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For pxa based platforms, the number of requestor lines should be
specified, so that the driver can check if the flow control should be
activated (when a requestor line is asked for) or not.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 Documentation/devicetree/bindings/dma/mmp-dma.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/mmp-dma.txt b/Documentation/devicetree/bindings/dma/mmp-dma.txt
index 7a802f64e5bd..716b70338a15 100644
--- a/Documentation/devicetree/bindings/dma/mmp-dma.txt
+++ b/Documentation/devicetree/bindings/dma/mmp-dma.txt
@@ -12,6 +12,8 @@ Required properties:
 Optional properties:
 - #dma-channels: Number of DMA channels supported by the controller (defaults
   to 32 when not specified)
+- #requestors: Number of DMA requestor lines supported by the controller
+  (defaults to 0 when not specified)
 
 "marvell,pdma-1.0"
 Used platforms: pxa25x, pxa27x, pxa3xx, pxa93x, pxa168, pxa910, pxa688.
-- 
2.1.4
