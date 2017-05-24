From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: imx6: use #include "..." to include local DT
Date: Wed, 24 May 2017 14:02:42 +0900
Message-ID: <1495602162-14672-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Most of DT files in ARM use #include "..." to make pre-processor
include DT in the same directory, but we have some exceptional files
that use #include <...> for that.

Fix them to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
dtc_cpp_flags.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/imx6q-zii-rdu2.dts  | 4 ++--
 arch/arm/boot/dts/imx6qp-zii-rdu2.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-zii-rdu2.dts b/arch/arm/boot/dts/imx6q-zii-rdu2.dts
index b2d346640fd7..6be8a1eea895 100644
--- a/arch/arm/boot/dts/imx6q-zii-rdu2.dts
+++ b/arch/arm/boot/dts/imx6q-zii-rdu2.dts
@@ -41,8 +41,8 @@
 
 /dts-v1/;
 
-#include <imx6q.dtsi>
-#include <imx6qdl-zii-rdu2.dtsi>
+#include "imx6q.dtsi"
+#include "imx6qdl-zii-rdu2.dtsi"
 
 / {
 	model = "ZII RDU2 Board";
diff --git a/arch/arm/boot/dts/imx6qp-zii-rdu2.dts b/arch/arm/boot/dts/imx6qp-zii-rdu2.dts
index 882b3bd97e07..547a76677ab3 100644
--- a/arch/arm/boot/dts/imx6qp-zii-rdu2.dts
+++ b/arch/arm/boot/dts/imx6qp-zii-rdu2.dts
@@ -41,8 +41,8 @@
 
 /dts-v1/;
 
-#include <imx6qp.dtsi>
-#include <imx6qdl-zii-rdu2.dtsi>
+#include "imx6qp.dtsi"
+#include "imx6qdl-zii-rdu2.dtsi"
 
 / {
 	model = "ZII RDU2+ Board";
-- 
2.7.4
