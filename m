From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv2 2/3] Documentation: fsl: dspi: Add fsl,ls1012a-dspi compatible string
Date: Wed, 30 Aug 2017 18:12:37 +0800
Message-ID: <20170830101238.28378-3-Zhiqiang.Hou@nxp.com>
References: <20170830101238.28378-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170830101238.28378-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, dwmw2@infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com
Cc: Yuan Yao <yao.yuan@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

new compatible string: "fsl,ls1012a-dspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V2:
 - No change

 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
index ff5893d275a2..800c483b0076 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
@@ -5,6 +5,7 @@ Required properties:
 		"fsl,ls2085a-dspi"
 		or
 		"fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
+		"fsl,ls1012a-dspi" followed by "fsl,ls1021a-v1.0-dspi"
 - reg : Offset and length of the register set for the device
 - interrupts : Should contain SPI controller interrupt
 - clocks: from common clock binding: handle to dspi clock.
-- 
2.14.1
