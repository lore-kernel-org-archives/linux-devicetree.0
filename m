From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v6 1/2] Documentation: fsl: dspi: Add fsl,
 ls2080a-dspi compatible string
Date: Wed, 9 Mar 2016 18:22:05 +0800
Message-ID: <1457518926-18518-2-git-send-email-yao.yuan@freescale.com>
References: <1457518926-18518-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457518926-18518-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, han.xu@nxp.com, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yuan Yao <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

new compatible string: "fsl,ls2080a-dspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changed in v6:
No changes.

Changed in v5:
Fix the subject and commit message.

Changed in v4:
No changes.

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
