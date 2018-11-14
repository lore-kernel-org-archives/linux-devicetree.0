From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v4 4/6] MAINTAINERS: add i.MX8 DT path to i.MX architecture
Date: Wed, 14 Nov 2018 18:52:40 +0100
Message-ID: <20181114175242.12468-4-l.stach@pengutronix.de>
References: <20181114175242.12468-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181114175242.12468-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Shawn agreed to take patches for the i.MX8 parts through his tree.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4855974f325..c491b90392b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1521,6 +1521,7 @@ F:	arch/arm/mach-imx/
 F:	arch/arm/mach-mxs/
 F:	arch/arm/boot/dts/imx*
 F:	arch/arm/configs/imx*_defconfig
+F:	arch/arm64/boot/dts/freescale/imx*
 F:	drivers/clk/imx/
 F:	drivers/firmware/imx/
 F:	drivers/soc/imx/
-- 
2.19.1
