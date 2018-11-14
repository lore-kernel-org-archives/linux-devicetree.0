From: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: Add compatible string for LS1028A-QDS
Date: Wed, 14 Nov 2018 05:30:50 +0000
Message-ID: <1542156591-3224-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Harninder Rai <harninder.rai@nxp.com>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sudhanshu Gupta <sudhanshu.gupta@nxp.com>
Signed-off-by: Rai Harninder <harninder.rai@nxp.com>
Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 changes in v3:
  no change

 Documentation/devicetree/bindings/arm/fsl.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index a6e0471..b2f20ede 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -168,6 +168,18 @@ LS1012A ARMv8 based QDS Board
 Required root node properties:
     - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
 
+LS1028A SoC
+Required root node properties:
+    - compatible = "fsl,ls1028a";
+
+LS1028A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1028a-rdb", "fsl,ls1028a"
+
+LS1028A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1028a-qds", "fsl,ls1028a";
+
 LS1043A SoC
 Required root node properties:
     - compatible = "fsl,ls1043a";
-- 
1.9.1
