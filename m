From: <shh.xie@gmail.com>
Subject: [PATCH 4/7] [v2] Documentation: DT: Add entry for QorIQ LS1046A-RDB
 board
Date: Mon, 5 Sep 2016 18:01:32 +0800
Message-ID: <1473069695-33092-5-git-send-email-shh.xie@gmail.com>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org
Cc: Shaohui Xie <Shaohui.Xie@nxp.com>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie@nxp.com>

Signed-off-by: Shaohui Xie <Shaohui.Xie@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
changes in V2:
no change.

 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 6f92d0b..6ec3c0c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -145,6 +145,10 @@ LS1043A ARMv8 based QDS Board
 Required root node properties:
     - compatible = "fsl,ls1043a-qds", "fsl,ls1043a";
 
+LS1046A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
+
 LS2080A ARMv8 based Simulator model
 Required root node properties:
     - compatible = "fsl,ls2080a-simu", "fsl,ls2080a";
-- 
2.1.0.27.g96db324
