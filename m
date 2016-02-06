From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] imx6q-wandboard-revb1.dts: use unique machine name
Date: Sat,  6 Feb 2016 12:30:26 +0100
Message-ID: <1454758226-4561-1-git-send-email-xypron.glpk@gmx.de>
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
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, George Joseph <george.joseph@fairview5.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-install use
/proc/device-tree/model
to determine which dtb file to install.

Hence each dts in the Linux kernel should provide a unique model identifier.

https://lkml.org/lkml/2014/7/8/579 created the new file
imx6q-wandboard-revb1.dts but used the same model identifier
as in imx6q-wandboard.dts.

This patch provides a unique model identifier for revision B1 of
the Wandboard Quad.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/arm/boot/dts/imx6q-wandboard-revb1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
index 20bf3c2..9207d80 100644
--- a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
+++ b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
@@ -13,7 +13,7 @@
 #include "imx6qdl-wandboard-revb1.dtsi"
 
 / {
-	model = "Wandboard i.MX6 Quad Board";
+	model = "Wandboard i.MX6 Quad Board rev B1";
 	compatible = "wand,imx6q-wandboard", "fsl,imx6q";
 
 	memory {
-- 
2.1.4
