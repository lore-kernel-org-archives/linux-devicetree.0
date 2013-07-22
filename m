From: Gerhard Sittig <gsi@denx.de>
Subject: [PATCH v3 22/31] clk: mpc512x: remove clkdev registration (uart, spi)
Date: Mon, 22 Jul 2013 14:14:49 +0200
Message-ID: <1374495298-22019-23-git-send-email-gsi@denx.de>
References: <1374166855-7280-1-git-send-email-gsi@denx.de>
 <1374495298-22019-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1374495298-22019-1-git-send-email-gsi@denx.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org, Anatolij Gustschin <agust@denx.de>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Detlev Zundel <dzu@denx.de>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gerhard Sittig <gsi@denx.de>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Wolfgang Grandegger <wg@grandegger.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org

after the UART and SPI peripheral drivers have switched to device tree
based clock lookup and no longer construct clock names from their PSC
component index, the "psc%d_mclk" alias names have become obsolete --
remove the corresponding clk_register_clkdev() calls

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 arch/powerpc/platforms/512x/clock-commonclk.c |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index 8b71ceb..a860ded 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -529,17 +529,6 @@ static void mpc512x_clk_setup_mclk(struct mclk_setup_data *entry)
 				entry->name_mclk,
 				entry->name_mux1, 1, 1);
 	}
-
-	/*
-	 * without this "clock device" registration, "simple" lookups in
-	 * the SPI master initialization and serial port setup will fail
-	 *
-	 * those drivers need to get adjusted to lookup their required
-	 * clocks from device tree specs, and device tree nodes need to
-	 * provide the clock specs, before this clkdev registration
-	 * becomes obsolete
-	 */
-	clk_register_clkdev(clks[clks_idx_pub], entry->name_mclk, NULL);
 }
 
 static void mpc512x_clk_setup_mclks(struct mclk_setup_data *table, size_t count)
-- 
1.7.10.4
