From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 4/5] misc: sram: document new compatible
Date: Wed, 31 Aug 2016 18:11:07 +0200
Message-ID: <20160831161108.8780-5-alexandre.belloni@free-electrons.com>
References: <20160831161108.8780-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160831161108.8780-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add atmel,sama5d2-securam to the compatible list.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
 Documentation/devicetree/bindings/sram/sram.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
index add48f09015e..068c2c03c38f 100644
--- a/Documentation/devicetree/bindings/sram/sram.txt
+++ b/Documentation/devicetree/bindings/sram/sram.txt
@@ -4,7 +4,7 @@ Simple IO memory regions to be managed by the genalloc API.
 
 Required properties:
 
-- compatible : mmio-sram
+- compatible : mmio-sram or atmel,sama5d2-securam
 
 - reg : SRAM iomem address range
 
-- 
2.9.3
