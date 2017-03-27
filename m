From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V5 2/4] dt-bindings: arm: Add bindings for SP9860G
Date: Mon, 27 Mar 2017 14:06:40 +0800
Message-ID: <1490594802-27073-3-git-send-email-chunyan.zhang@spreadtrum.com>
References: <1490594802-27073-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490594802-27073-1-git-send-email-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: mathieu.poirier@linaro.org, orson.zhai@spreadtrum.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhang.lyra@gmail.com, chunyan.zhang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

Added bindings for Spreadtrum SP9860G board and SC9860 SoC.
This patch also revised bindings of SC9836 to make the format
more clear.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sprd.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sprd.txt b/Documentation/devicetree/bindings/arm/sprd.txt
index 31a629d..3df034b 100644
--- a/Documentation/devicetree/bindings/arm/sprd.txt
+++ b/Documentation/devicetree/bindings/arm/sprd.txt
@@ -1,11 +1,14 @@
 Spreadtrum SoC Platforms Device Tree Bindings
 ----------------------------------------------------
 
-Sharkl64 is a Spreadtrum's SoC Platform which is based
-on ARM 64-bit processor.
+SC9836 openphone Board
+Required root node properties:
+	- compatible = "sprd,sc9836-openphone", "sprd,sc9836";
 
-SC9836 openphone board with SC9836 SoC based on the
-Sharkl64 Platform shall have the following properties.
+SC9860 SoC
+Required root node properties:
+	- compatible = "sprd,sc9860"
 
+SP9860G 3GFHD Board
 Required root node properties:
-        - compatible = "sprd,sc9836-openphone", "sprd,sc9836";
+	- compatible = "sprd,sp9860g-1h10", "sprd,sc9860";
-- 
2.7.4
