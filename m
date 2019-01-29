From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 12/13] ARM: lpc32xx: remove platform data of ARM PL180 SD/MMC
 controller
Date: Tue, 29 Jan 2019 21:20:48 +0200
Message-ID: <20190129192049.11223-13-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The auxilary platform data added for the SD/MMC controller is redundant,
because it is obtained properly from its description in board dts files.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/mach-lpc32xx/phy3250.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index e48cc06c2aec..568589e918c2 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -148,11 +148,6 @@ static struct pl08x_platform_data pl08x_pd = {
 	.mem_buses = PL08X_AHB1,
 };
 
-static struct mmci_platform_data lpc32xx_mmci_data = {
-	.ocr_mask	= MMC_VDD_30_31 | MMC_VDD_31_32 |
-			  MMC_VDD_32_33 | MMC_VDD_33_34,
-};
-
 static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
 	.dma_filter = pl08x_filter_id,
 };
@@ -166,8 +161,6 @@ static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl022", 0x2008C000, "dev:ssp1", NULL),
 	OF_DEV_AUXDATA("arm,pl110", 0x31040000, "dev:clcd", &lpc32xx_clcd_data),
 	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("arm,pl18x", 0x20098000, "20098000.sd",
-		       &lpc32xx_mmci_data),
 	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
 		       &lpc32xx_slc_data),
 	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-- 
2.20.1
