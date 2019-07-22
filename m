From: fugang.duan@nxp.com
Subject: [PATCH arm64/dts 2/2] arm64: dts: imx8qxp: add serial alias
Date: Mon, 22 Jul 2019 16:28:24 +0800
Message-ID: <20190722082824.15022-3-fugang.duan@nxp.com>
References: <20190722082824.15022-1-fugang.duan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722082824.15022-1-fugang.duan@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: festevam@gmail.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, daniel.baluta@gmail.com, fugang.duan@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Add i.MX8QXP serial alias for lpuart ports.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 21bdd4d..4402b2e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -30,6 +30,9 @@
 		mmc2 = &usdhc3;
 		mu1 = &lsio_mu1;
 		serial0 = &adma_lpuart0;
+		serial1 = &adma_lpuart1;
+		serial2 = &adma_lpuart2;
+		serial3 = &adma_lpuart3;
 	};
 
 	cpus {
-- 
2.7.4
