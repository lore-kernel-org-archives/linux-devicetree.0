From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 5/5] ptp_qoriq: add fiper pulse loopback support
Date: Thu, 17 Jan 2019 09:49:36 +0800
Message-ID: <20190117014936.48117-6-yangbo.lu@nxp.com>
References: <20190117014936.48117-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190117014936.48117-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add Kconfig options to support fiper
pulse loopback mode. This is very useful for validating
hardware and driver without external hardware.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
---
 drivers/ptp/Kconfig     |   18 ++++++++++++++++++
 drivers/ptp/ptp_qoriq.c |    7 ++++++-
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index d137c48..561d797 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -55,6 +55,24 @@ config PTP_1588_CLOCK_QORIQ
 	  To compile this driver as a module, choose M here: the module
 	  will be called ptp_qoriq.
 
+config PTP_1588_CLOCK_QORIQ_FIPER1_LOOPBACK
+	bool "Fiper1 pulse loopback"
+	depends on PTP_1588_CLOCK_QORIQ
+	default n
+	help
+	  Enable fiper1 pulse loopback mode. If choose y, fiper1 pulse is
+	  looped back into trigger1 input. In default, trigger1 input is
+	  based upon normal external trigger input.
+
+config PTP_1588_CLOCK_QORIQ_FIPER2_LOOPBACK
+	bool "Fiper2 pulse loopback"
+	depends on PTP_1588_CLOCK_QORIQ
+	default n
+	help
+	  Enable fiper2 pulse loopback mode. If choose y, fiper2 pulse is
+	  looped back into trigger2 input. In default, trigger2 input is
+	  based upon normal external trigger input.
+
 config PTP_1588_CLOCK_IXP46X
 	tristate "Intel IXP46x as PTP clock"
 	depends on IXP4XX_ETH
diff --git a/drivers/ptp/ptp_qoriq.c b/drivers/ptp/ptp_qoriq.c
index a2e7702..5294475 100644
--- a/drivers/ptp/ptp_qoriq.c
+++ b/drivers/ptp/ptp_qoriq.c
@@ -551,7 +551,12 @@ static int qoriq_ptp_probe(struct platform_device *dev)
 	tmr_ctrl =
 	  (qoriq_ptp->tclk_period & TCLK_PERIOD_MASK) << TCLK_PERIOD_SHIFT |
 	  (qoriq_ptp->cksel & CKSEL_MASK) << CKSEL_SHIFT;
-
+#ifdef CONFIG_PTP_1588_CLOCK_QORIQ_FIPER1_LOOPBACK
+	tmr_ctrl |= PP1L;
+#endif
+#ifdef CONFIG_PTP_1588_CLOCK_QORIQ_FIPER2_LOOPBACK
+	tmr_ctrl |= PP2L;
+#endif
 	spin_lock_irqsave(&qoriq_ptp->lock, flags);
 
 	regs = &qoriq_ptp->regs;
-- 
1.7.1
