From: Gerhard Sittig <gsi@denx.de>
Subject: [PATCH v1 02/24] serial: mpc512x: prepare clocks before enabling them
Date: Mon, 15 Jul 2013 20:47:31 +0200
Message-ID: <1373914074-20889-3-git-send-email-gsi@denx.de>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1373914074-20889-1-git-send-email-gsi@denx.de>
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

clocks need to get prepared before they can get enabled, and after
disabling them they can get unprepared

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/tty/serial/mpc52xx_uart.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
index e1280a2..53c1093 100644
--- a/drivers/tty/serial/mpc52xx_uart.c
+++ b/drivers/tty/serial/mpc52xx_uart.c
@@ -636,9 +636,9 @@ static int mpc512x_psc_clock(struct uart_port *port, int enable)
 	dev_dbg(port->dev, "%s %sable\n", clk_name, enable ? "en" : "dis");
 
 	if (enable)
-		clk_enable(psc_clk);
+		clk_prepare_enable(psc_clk);
 	else
-		clk_disable(psc_clk);
+		clk_disable_unprepare(psc_clk);
 
 	return 0;
 }
-- 
1.7.10.4
