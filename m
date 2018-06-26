From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/3] ARM: dts: imx6qdl-colibri: mux SD/MMC card detect
 explicitly
Date: Tue, 26 Jun 2018 16:52:41 +0200
Message-ID: <20180626145243.24880-1-stefan@agner.ch>
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
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, Stefan Agner <stefan@agner.ch>, maitysanchayan@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Do not rely on reset/boot defaults and use a default GPIO setting
with pull-up enabled.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 76035db96f67..83d7c7d48c3f 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -567,7 +567,7 @@
 
 	pinctrl_mmc_cd: gpiommccd {
 		fsl,pins = <
-			MX6QDL_PAD_NANDF_D5__GPIO2_IO05	0x80000000
+			MX6QDL_PAD_NANDF_D5__GPIO2_IO05	0x1b0b1
 		>;
 	};
 
-- 
2.18.0
