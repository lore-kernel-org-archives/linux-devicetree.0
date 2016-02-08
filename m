From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1 v3] ARM: dts: imx6dlq-wandboard-revb1.dts: use unique
 model id
Date: Mon,  8 Feb 2016 01:55:08 +0100
Message-ID: <1454892908-26975-1-git-send-email-xypron.glpk@gmx.de>
References: <56B7E06B.2060701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56B7E06B.2060701@gmx.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, George Joseph <george.joseph@fairview5.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.co>, Kumar Gala <galak@codeaurora.org>, Robert Nelson <robertcnelson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-kernel use
/proc/device-tree/model
to determine which dtb file to install.

Hence each dts in the Linux kernel should provide a unique model
identifier.

Commit 8536239e371f ("ARM: dts: Restructure imx6qdl-wandboard.dtsi for new
rev C1 board.")' created new files imx6dl-wandboard-revb1.dts and
imx6q-wandboard-revb1.dts but used the same model identifier as in
imx6dl-wandboard.dts and imx6q-wandboard.dts.

This patch provides unique model identifiers for revision B1 of
the Wandboard Dual and Wandbaord Quad.

The patch leaves imx6dl-wandboard.dts and imx6q-wandboard.dts unchanged
because it is not foreseeable if the same dts will valid for future
board revisions or not. Furthermore we should avoid unnecessary
changes.

v3:
	update imx6dl-wandboard-revb1.dts

v2:
	correct name of referenced Debian package

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/arm/boot/dts/imx6dl-wandboard-revb1.dts | 2 +-
 arch/arm/boot/dts/imx6q-wandboard-revb1.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
index f607d4f..8c314ee 100644
--- a/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
+++ b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
@@ -13,7 +13,7 @@
 #include "imx6qdl-wandboard-revb1.dtsi"
 
 / {
-	model = "Wandboard i.MX6 Dual Lite Board";
+	model = "Wandboard i.MX6 Dual Lite Board rev B1";
 	compatible = "wand,imx6dl-wandboard", "fsl,imx6dl";
 
 	memory {
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
2.7.0
