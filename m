From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 4/6] ARM: vf610: enable NAND Flash Controller
Date: Mon,  9 Mar 2015 17:38:50 +0100
Message-ID: <1425919132-13827-5-git-send-email-stefan@agner.ch>
References: <1425919132-13827-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425919132-13827-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dwmw2@infradead.org, computersforpeace@gmail.com
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: devicetree@vger.kernel.org

Enable the NAND Flash Controller driver which is part of the Vybrid
SoC by default.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index c8dffce..182e30e 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -635,6 +635,7 @@ config SOC_VF610
 	select ARM_GIC
 	select PINCTRL_VF610
 	select PL310_ERRATA_769419 if CACHE_L2X0
+	select HAVE_NAND_VF610_NFC
 
 	help
 	  This enable support for Freescale Vybrid VF610 processor.
-- 
2.3.1
