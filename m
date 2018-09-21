From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCh v3 4/4] MAINTAINERS: add i.MX8 DT path to i.MX architecture
Date: Fri, 21 Sep 2018 14:56:26 +0200
Message-ID: <20180921125626.21971-4-l.stach@pengutronix.de>
References: <20180921125626.21971-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180921125626.21971-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Shawn agreed to take patches for the i.MX8 parts through his tree.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5b256b25905..f080df859941 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1461,6 +1461,7 @@ F:	arch/arm/mach-imx/
 F:	arch/arm/mach-mxs/
 F:	arch/arm/boot/dts/imx*
 F:	arch/arm/configs/imx*_defconfig
+F:	arch/arm64/boot/dts/freescale/imx*
 F:	drivers/clk/imx/
 F:	drivers/soc/imx/
 F:	include/soc/imx/
-- 
2.19.0
