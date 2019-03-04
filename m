From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 2/6] dt-bindings: fsl: add compatible for i.MX7S generic board
Date: Mon,  4 Mar 2019 17:56:26 +0100
Message-ID: <20190304165630.18225-3-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

This patch adds missing compatible for i.MX7Solo boards.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 7fbc42484001..c90058b621bc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -127,6 +127,10 @@ i.MX6q generic board
 Required root node properties:
     - compatible = "fsl,imx6q";
 
+i.MX7S generic board
+Required root node properties:
+    - compatible = "fsl,imx7s";
+
 i.MX7ULP generic board
 Required root node properties:
     - compatible = "fsl,imx7ulp";
-- 
2.20.1
