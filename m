From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 1/2 v2] arm64: dts: updates serial aliases for ls1043a rdb and
 qds boards
Date: Mon, 29 Aug 2016 13:31:12 -0500
Message-ID: <1472495473-27387-2-git-send-email-stuart.yoder@nxp.com>
References: <1472495473-27387-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472495473-27387-1-git-send-email-stuart.yoder@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: shawnguo@kernel.org, Stuart Yoder <stuart.yoder@nxp.com>
List-Id: devicetree@vger.kernel.org

-add missing serial aliases to ls1043a-rdb
-update ls1043a-qds boards serial aliases to use the standard duarts
 instead of low power uarts

Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
---
-v2
  -fix typo in commit message

 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 10 ++++------
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts |  4 ++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index 9d3e9fe..f813d67 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -56,12 +56,10 @@
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
 		gpio3 = &gpio4;
-		serial0 = &lpuart0;
-		serial1 = &lpuart1;
-		serial2 = &lpuart2;
-		serial3 = &lpuart3;
-		serial4 = &lpuart4;
-		serial5 = &lpuart5;
+		serial0 = &duart0;
+		serial1 = &duart1;
+		serial2 = &duart2;
+		serial3 = &duart3;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 4084631..8031cde 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -52,6 +52,10 @@
 
 	aliases {
 		crypto = &crypto;
+		serial0 = &duart0;
+		serial1 = &duart1;
+		serial2 = &duart2;
+		serial3 = &duart3;
 	};
 };
 
-- 
1.9.0
