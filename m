From: Harninder Rai <harninder.rai@nxp.com>
Subject: [PATCH 2/3] Documentation: DT: add LS1012A compatible for SCFG and
 DCFG
Date: Wed, 9 Nov 2016 23:34:39 +0530
Message-ID: <1478714679-12724-1-git-send-email-harninder.rai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: oss@buserror.net, Harninder Rai <harninder.rai@nxp.com>, Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Harninder Rai <harninder.rai@nxp.com>
Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 3b01338..c9c567a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -108,7 +108,7 @@ status.
   - compatible: Should contain a chip-specific compatible string,
 	Chip-specific strings are of the form "fsl,<chip>-scfg",
 	The following <chip>s are known to be supported:
-	ls1021a, ls1043a, ls1046a, ls2080a.
+	ls1012a, ls1021a, ls1043a, ls1046a, ls2080a.
 
   - reg: should contain base address and length of SCFG memory-mapped registers
 
@@ -126,7 +126,7 @@ core start address and release the secondary core from holdoff and startup.
   - compatible: Should contain a chip-specific compatible string,
 	Chip-specific strings are of the form "fsl,<chip>-dcfg",
 	The following <chip>s are known to be supported:
-	ls1021a, ls1043a, ls1046a, ls2080a.
+	ls1012a, ls1021a, ls1043a, ls1046a, ls2080a.
 
   - reg : should contain base address and length of DCFG memory-mapped registers
 
-- 
2.7.4
