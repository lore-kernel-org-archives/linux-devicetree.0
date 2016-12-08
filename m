From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 2/5] Documentation: fsl: dspi: Add fsl,
 ls1012a-dspi compatible string
Date: Thu, 8 Dec 2016 17:23:01 +0800
Message-ID: <1481188984-43683-3-git-send-email-yao.yuan@freescale.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org
Cc: devicetree@vger.kernel.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

new compatible string: "fsl,ls1012a-dspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
index ff5893d..800c483 100644
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
2.1.0.27.g96db324
