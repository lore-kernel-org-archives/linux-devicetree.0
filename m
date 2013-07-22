From: Gerhard Sittig <gsi@denx.de>
Subject: [PATCH v3 21/31] serial: mpc512x: remove now obsolete clock lookup
 name
Date: Mon, 22 Jul 2013 14:14:48 +0200
Message-ID: <1374495298-22019-22-git-send-email-gsi@denx.de>
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

after device tree based clock lookup became available, the peripheral
driver need no longer construct clock names which include the PSC index,
remove the "psc%d_mclk" template and unconditionally use "mclk"

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/tty/serial/mpc52xx_uart.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
index 8f16ed9..04dc564 100644
--- a/drivers/tty/serial/mpc52xx_uart.c
+++ b/drivers/tty/serial/mpc52xx_uart.c
@@ -623,14 +623,11 @@ static struct clk *psc_mclk_clk[MPC52xx_PSC_MAXNUM];
 /* called from within the .request_port() callback (allocation) */
 static int mpc512x_psc_alloc_clock(struct uart_port *port)
 {
-	int psc_num;
-	char clk_name[16];
 	struct clk *clk;
 	int err;
+	int psc_num;
 
-	psc_num = (port->mapbase & 0xf00) >> 8;
-	snprintf(clk_name, sizeof(clk_name), "psc%d_mclk", psc_num);
-	clk = devm_clk_get(port->dev, clk_name);
+	clk = devm_clk_get(port->dev, "mclk");
 	if (IS_ERR(clk)) {
 		dev_err(port->dev, "Failed to get MCLK!\n");
 		return PTR_ERR(clk);
@@ -641,6 +638,7 @@ static int mpc512x_psc_alloc_clock(struct uart_port *port)
 		devm_clk_put(port->dev, clk);
 		return err;
 	}
+	psc_num = (port->mapbase & 0xf00) >> 8;
 	psc_mclk_clk[psc_num] = clk;
 	return 0;
 }
-- 
1.7.10.4
