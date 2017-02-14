From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH 2/5] Documentation: sprd: Add bindings for SP9860G
Date: Tue, 14 Feb 2017 17:19:09 +0800
Message-ID: <1487063952-7113-3-git-send-email-chunyan.zhang@spreadtrum.com>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Added support for Spreadtrum SP9860G board and SC9860 SoC.
This patch also revised bindings of SC9836 to make the format
more clear.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
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
