From: Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH v2 1/4] ARM: davinci: da8xx-dt: Add ti-aemif lookup for clock
 matching
Date: Wed, 10 Aug 2016 11:00:29 +0000
Message-ID: <20160810110032.29295-2-kbeldan@baylibre.com>
References: <20160810110032.29295-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160810110032.29295-1-kbeldan@baylibre.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

Many davinci boards (da830 and da850 families) don't have their clocks
in DT yet and won't be successful in getting an unnamed aemif clock
without explicitly registering them via clk_lookups, failing the
ti-aemif memory driver probe.

The current aemif lookup entry resolving to the same clock:
    'CLK(NULL,               "aemif",        &aemif_clk)'
remains, as it is currently used (davinci_nand is getting a named clock
"aemif").

This change will allow to switch from the mach-davinci aemif code to
the ti-aemif memory driver.

Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
---
 arch/arm/mach-davinci/da850.c    | 1 +
 arch/arm/mach-davinci/da8xx-dt.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index 2398862..3477d30 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -485,6 +485,7 @@ static struct clk_lookup da850_clks[] = {
 	CLK("da8xx_lcdc.0",	"fck",		&lcdc_clk),
 	CLK("da830-mmc.0",	NULL,		&mmcsd0_clk),
 	CLK("da830-mmc.1",	NULL,		&mmcsd1_clk),
+	CLK("ti-aemif",		NULL,		&aemif_clk),
 	CLK(NULL,		"aemif",	&aemif_clk),
 	CLK(NULL,		"usb11",	&usb11_clk),
 	CLK(NULL,		"usb20",	&usb20_clk),
diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
index ca99711..c9f7e92 100644
--- a/arch/arm/mach-davinci/da8xx-dt.c
+++ b/arch/arm/mach-davinci/da8xx-dt.c
@@ -37,6 +37,7 @@ static struct of_dev_auxdata da850_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("ti,davinci-dm6467-emac", 0x01e20000, "davinci_emac.1",
 		       NULL),
 	OF_DEV_AUXDATA("ti,da830-mcasp-audio", 0x01d00000, "davinci-mcasp.0", NULL),
+	OF_DEV_AUXDATA("ti,da850-aemif", 0x68000000, "ti-aemif", NULL),
 	{}
 };
 
-- 
2.9.2
