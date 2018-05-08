From: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
Subject: [PATCH 2/2] dt-bindings: Add compatible string for FRWY-LS1012A
Date: Tue, 8 May 2018 11:59:59 +0530
Message-ID: <1525760999-6187-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
References: <1525760999-6187-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525760999-6187-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, shawnguo@kernel.org
Cc: oss@buserror.net, Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index cdb9dd7..0517440 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -147,6 +147,10 @@ LS1012A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1012a-rdb", "fsl,ls1012a";
 
+LS1012A ARMv8 based FRWY Board
+Required root node properties:
+    - compatible = "fsl,frwy-ls1012a", "fsl,ls1012a";
+
 LS1012A ARMv8 based FRDM Board
 Required root node properties:
     - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
-- 
1.9.1
