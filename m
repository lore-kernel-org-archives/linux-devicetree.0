From: Harninder Rai <harninder.rai@nxp.com>
Subject: [PATCH 3/3] dt-bindings: clockgen: Add compatible string for LS1012A
Date: Wed, 9 Nov 2016 23:40:53 +0530
Message-ID: <1478715053-12790-1-git-send-email-harninder.rai@nxp.com>
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
 Documentation/devicetree/bindings/clock/qoriq-clock.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index df9cb5a..aa3526f 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -31,6 +31,7 @@ Required properties:
 	* "fsl,t4240-clockgen"
 	* "fsl,b4420-clockgen"
 	* "fsl,b4860-clockgen"
+	* "fsl,ls1012a-clockgen"
 	* "fsl,ls1021a-clockgen"
 	* "fsl,ls1043a-clockgen"
 	* "fsl,ls1046a-clockgen"
-- 
2.7.4
