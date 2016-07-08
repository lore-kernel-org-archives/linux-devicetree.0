From: <shh.xie@gmail.com>
Subject: [PATCH 4/5] Documentation: DT: Add entry for QorIQ LS1046A-QDS board
Date: Fri, 8 Jul 2016 18:15:43 +0800
Message-ID: <1467972944-12293-5-git-send-email-shh.xie@gmail.com>
References: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie@nxp.com>

Signed-off-by: Shaohui Xie <Shaohui.Xie@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index cabd575..b6a9637 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -139,6 +139,10 @@ LS1043A ARMv8 based QDS Board
 Required root node properties:
     - compatible = "fsl,ls1043a-qds", "fsl,ls1043a";
 
+LS1046A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1046a-qds", "fsl,ls1046a";
+
 LS1046A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
-- 
2.1.0.27.g96db324
