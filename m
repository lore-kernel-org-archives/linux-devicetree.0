From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Mon,  5 Mar 2018 11:25:20 +0100
Message-ID: <20180305102524.5905-4-o.rempel@pengutronix.de>
References: <20180305102524.5905-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180305102524.5905-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Export pm_power_off_prepare. It is needed to implement power off on
Freescale/NXP iMX6 based boards with external power management
integrated circuit (PMIC).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 kernel/reboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e4ced883d8de..350be6baa60d 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -49,6 +49,7 @@ int reboot_force;
  */
 
 void (*pm_power_off_prepare)(void);
+EXPORT_SYMBOL(pm_power_off_prepare);
 
 /**
  *	emergency_restart - reboot the system
-- 
2.16.1
