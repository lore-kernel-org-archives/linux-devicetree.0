From: Gerhard Sittig <gsi@denx.de>
Subject: [PATCH v3 19/31] clk: mpc512x: don't pre-enable FEC and I2C clocks
Date: Mon, 22 Jul 2013 14:14:46 +0200
Message-ID: <1374495298-22019-20-git-send-email-gsi@denx.de>
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

after the device tree nodes provide clock specs for client side lookups,
peripheral drivers can attach to their clocks and the clock driver need
no longer pre-enable those clock items

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 arch/powerpc/platforms/512x/clock-commonclk.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index 762ee85..8b71ceb 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -713,9 +713,7 @@ static void mpc512x_clk_setup_clock_tree(int busfreq)
 	clk_prepare_enable(clks[MPC512x_CLK_PSC_FIFO]);
 	/* some are not yet acquired by their respective drivers */
 	clk_prepare_enable(clks[MPC512x_CLK_PSC3_MCLK]);/* serial console */
-	clk_prepare_enable(clks[MPC512x_CLK_FEC]);	/* network, NFS */
 	clk_prepare_enable(clks[MPC512x_CLK_DIU]);	/* display */
-	clk_prepare_enable(clks[MPC512x_CLK_I2C]);
 	/*
 	 * some have their individual clock subtree with separate clock
 	 * items and their individual enable counters, yet share a
-- 
1.7.10.4
