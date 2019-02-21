Return-Path: <SRS0=5lt5=Q4=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V7 04/10] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver
Date: Thu, 21 Feb 2019 21:07:30 +0000
Message-Id: <20190221210736.640-5-kernel@martin.sperl.org>
In-Reply-To: <20190221210736.640-1-kernel@martin.sperl.org>
References: <20190221210736.640-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add un-optimized Can2.0 and CanFD support.

CAN-Transmission and Optimizations and are separate patches

On a Rasperry pi 3 it is already able to process Can2.0 Frames
with DLC=0 on a CAN bus with 1MHz. without losing any packets
on the SPI side. Packets still get lost inside the network stack.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

---

Changelog:
  V1 -> V2: new more generic name based on feedback from microchip
            cleanup of code (checkpatch)
            address all feedback on code
            prepare code for GPIO handling (separate patches)
            handle systemerrors in a much better/reliable way
  V2 -> V3: added vendor-prefix for gpio-opendrain
  V3 -> V4: resend
  V4 -> V5: split can driver into a separate patch
            code cleanup/rewrite
  V5 -> V6: update copyright year
            add rational documentation for basic rx-prefetch length
            fix CAN_OBJ_FLAGS_BRS and CAN_OBJ_FLAGS_ESI bug
            fixed TDC configuration - at this moment configurable
              via module parameters but with (hopefully) sensible
              defaults
            use length instead of dlc as parameter in call of
              mcp25xxfd_can_submit_rx_fd_frame
            moved use of mcp25xxfd_can_int_handle_tefif_oportunistic
              to separate patch
            reorganized code based on feedback by Wolfgang Grandegger
            fixed transmission problem reported by Hubert Denkmair
            added extra custom error flags
            added voluntary scheduling in interrupt thread
  V6 -> V7: added include linux/irqreturn.h (feedback by Eric Scholz)
            move can transmission into a separate patch to reduce
              the size of the individual patches to make the linux-can
              mailing-list happy...

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 drivers/net/can/spi/mcp25xxfd/Makefile             |   4 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c     |  12 +-
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c      | 473 +++++++++++++-
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h      |  36 ++
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c  | 152 +++++
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h  |  44 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c | 241 +++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h |  16 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h   |  69 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c  | 689 +++++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h  |  17 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h | 165 +++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 390 ++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h   |  18 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c      |  11 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h     |   2 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h     |   5 +
 17 files changed, 2328 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h

diff --git a/drivers/net/can/spi/mcp25xxfd/Makefile b/drivers/net/can/spi/mcp25xxfd/Makefile
index 162ded8054d4..8461652b8770 100644
--- a/drivers/net/can/spi/mcp25xxfd/Makefile
+++ b/drivers/net/can/spi/mcp25xxfd/Makefile
@@ -4,6 +4,10 @@
 obj-$(CONFIG_CAN_MCP25XXFD)	+= mcp25xxfd.o
 mcp25xxfd-objs                  := mcp25xxfd_base.o
 mcp25xxfd-objs                  += mcp25xxfd_can.o
+mcp25xxfd-objs                  += mcp25xxfd_can_debugfs.o
+mcp25xxfd-objs                  += mcp25xxfd_can_fifo.o
+mcp25xxfd-objs                  += mcp25xxfd_can_int.o
+mcp25xxfd-objs                  += mcp25xxfd_can_rx.o
 mcp25xxfd-objs                  += mcp25xxfd_clock.o
 mcp25xxfd-objs                  += mcp25xxfd_cmd.o
 mcp25xxfd-objs                  += mcp25xxfd_crc.o
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
index e9cc2a90080f..5db4a5812952 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
@@ -153,15 +153,22 @@ static int mcp25xxfd_base_probe(struct spi_device *spi)
 	if (ret)
 		goto out_debugfs;

+	/* setting up CAN */
+	ret = mcp25xxfd_can_setup(priv);
+	if (ret)
+		goto out_gpio;
+
 	/* and put controller to sleep by stopping the can clock */
 	ret = mcp25xxfd_clock_stop(priv, MCP25XXFD_CLK_USER_CAN);
 	if (ret)
-		goto out_gpio;
+		goto out_can;

 	dev_info(&spi->dev,
 		 "MCP%x successfully initialized.\n", priv->model);
 	return 0;

+out_can:
+	mcp25xxfd_can_remove(priv);
 out_gpio:
 	mcp25xxfd_gpio_remove(priv);
 out_debugfs:
@@ -181,6 +188,9 @@ static int mcp25xxfd_base_remove(struct spi_device *spi)
 {
 	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);

+	/* remove can */
+	mcp25xxfd_can_remove(priv);
+
 	/* remove gpio */
 	mcp25xxfd_gpio_remove(priv);

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
index f98b02ff057b..eabd7ca50645 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
@@ -38,23 +38,162 @@
  * for timestamping of RX frames as well as for TEF entries.
  */

-/* Implementation notes:
- *
- * Right now we only use the CAN controller block to put us into deep sleep
- * this means that the oscillator clock is turned off.
- * So this is the only thing that we implement here right now
- */
-
+#include <linux/can/core.h>
+#include <linux/can/dev.h>
 #include <linux/device.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>

+#include "mcp25xxfd_base.h"
+#include "mcp25xxfd_can_debugfs.h"
+#include "mcp25xxfd_can_fifo.h"
+#include "mcp25xxfd_can_int.h"
+#include "mcp25xxfd_can_priv.h"
 #include "mcp25xxfd_clock.h"
 #include "mcp25xxfd_cmd.h"
+#include "mcp25xxfd_int.h"
 #include "mcp25xxfd_priv.h"
 #include "mcp25xxfd_regs.h"

-static int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *reg)
+#include <uapi/linux/can/netlink.h>
+
+/* module parameters */
+unsigned int bw_sharing_log2bits;
+module_param(bw_sharing_log2bits, uint, 0664);
+MODULE_PARM_DESC(bw_sharing_log2bits,
+		 "Delay between 2 transmissions in number of arbitration bit times\n");
+bool enable_edge_filter;
+module_param(enable_edge_filter, bool, 0664);
+MODULE_PARM_DESC(enable_edge_filter,
+		 "Enable ISO11898-1:2015 edge_filtering");
+unsigned int tdc_mode = 2;
+module_param(tdc_mode, uint, 0664);
+MODULE_PARM_DESC(tdc_mode,
+		 "Transmitter Delay Mode - 0 = disabled, 1 = fixed, 2 = auto\n");
+unsigned int tdc_value;
+module_param(tdc_value, uint, 0664);
+MODULE_PARM_DESC(tdc_value,
+		 "Transmission Delay Value - range: [0:63] SCLK");
+int tdc_offset = 64; /* outside of range to use computed values */
+module_param(tdc_offset, int, 0664);
+MODULE_PARM_DESC(tdc_offset,
+		 "Transmission Delay offset - range: [-64:63] SCLK");
+
+/* everything related to bit timing */
+static
+const struct can_bittiming_const mcp25xxfd_can_nominal_bittiming_const = {
+	.name           = DEVICE_NAME,
+	.tseg1_min      = 2,
+	.tseg1_max      = BIT(MCP25XXFD_CAN_NBTCFG_TSEG1_BITS),
+	.tseg2_min      = 1,
+	.tseg2_max      = BIT(MCP25XXFD_CAN_NBTCFG_TSEG2_BITS),
+	.sjw_max        = BIT(MCP25XXFD_CAN_NBTCFG_SJW_BITS),
+	.brp_min        = 1,
+	.brp_max        = BIT(MCP25XXFD_CAN_NBTCFG_BRP_BITS),
+	.brp_inc        = 1,
+};
+
+static
+const struct can_bittiming_const mcp25xxfd_can_data_bittiming_const = {
+	.name           = DEVICE_NAME,
+	.tseg1_min      = 1,
+	.tseg1_max      = BIT(MCP25XXFD_CAN_DBTCFG_TSEG1_BITS),
+	.tseg2_min      = 1,
+	.tseg2_max      = BIT(MCP25XXFD_CAN_DBTCFG_TSEG2_BITS),
+	.sjw_max        = BIT(MCP25XXFD_CAN_DBTCFG_SJW_BITS),
+	.brp_min        = 1,
+	.brp_max        = BIT(MCP25XXFD_CAN_DBTCFG_BRP_BITS),
+	.brp_inc        = 1,
+};
+
+static int mcp25xxfd_can_do_set_nominal_bittiming(struct net_device *net)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+	struct can_bittiming *bt = &cpriv->can.bittiming;
+
+	int sjw = bt->sjw;
+	int pseg2 = bt->phase_seg2;
+	int pseg1 = bt->phase_seg1;
+	int propseg = bt->prop_seg;
+	int brp = bt->brp;
+
+	int tseg1 = propseg + pseg1;
+	int tseg2 = pseg2;
+
+	/* calculate nominal bit timing */
+	cpriv->regs.nbtcfg = ((sjw - 1) << MCP25XXFD_CAN_NBTCFG_SJW_SHIFT) |
+		((tseg2 - 1) << MCP25XXFD_CAN_NBTCFG_TSEG2_SHIFT) |
+		((tseg1 - 1) << MCP25XXFD_CAN_NBTCFG_TSEG1_SHIFT) |
+		((brp - 1) << MCP25XXFD_CAN_NBTCFG_BRP_SHIFT);
+
+	return mcp25xxfd_cmd_write(cpriv->priv->spi, MCP25XXFD_CAN_NBTCFG,
+				   cpriv->regs.nbtcfg);
+}
+
+static int mcp25xxfd_can_do_set_data_bittiming(struct net_device *net)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+	struct mcp25xxfd_priv *priv = cpriv->priv;
+	struct can_bittiming *bt = &cpriv->can.data_bittiming;
+	struct spi_device *spi = priv->spi;
+
+	int sjw = bt->sjw;
+	int pseg2 = bt->phase_seg2;
+	int pseg1 = bt->phase_seg1;
+	int propseg = bt->prop_seg;
+	int brp = bt->brp;
+
+	int tseg1 = propseg + pseg1;
+	int tseg2 = pseg2;
+
+	int tdco;
+	int ret;
+
+	/* set up Transmitter delay compensation */
+	cpriv->regs.tdc = 0;
+	/* configure TDC mode */
+	if (tdc_mode < 4)
+		cpriv->regs.tdc = tdc_mode << MCP25XXFD_CAN_TDC_TDCMOD_SHIFT;
+	else
+		cpriv->regs.tdc = MCP25XXFD_CAN_TDC_TDCMOD_AUTO <<
+			MCP25XXFD_CAN_TDC_TDCMOD_SHIFT;
+
+	/* configure TDC offsets */
+	if ((tdc_offset >= -64) && tdc_offset < 64)
+		tdco = tdc_offset;
+	else
+		tdco = clamp_t(int, bt->brp * tseg1, -64, 63);
+	cpriv->regs.tdc |= (tdco << MCP25XXFD_CAN_TDC_TDCO_SHIFT) &
+		MCP25XXFD_CAN_TDC_TDCO_MASK;
+
+	/* configure TDC value */
+	if (tdc_value < 64)
+		cpriv->regs.tdc |= tdc_value << MCP25XXFD_CAN_TDC_TDCV_SHIFT;
+
+	/* enable edge filtering */
+	if (enable_edge_filter)
+		cpriv->regs.tdc |= MCP25XXFD_CAN_TDC_EDGFLTEN;
+
+	/* set TDC */
+	ret = mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_TDC, cpriv->regs.tdc);
+	if (ret)
+		return ret;
+
+	/* calculate data bit timing */
+	cpriv->regs.dbtcfg = ((sjw - 1) << MCP25XXFD_CAN_DBTCFG_SJW_SHIFT) |
+		((tseg2 - 1) << MCP25XXFD_CAN_DBTCFG_TSEG2_SHIFT) |
+		((tseg1 - 1) << MCP25XXFD_CAN_DBTCFG_TSEG1_SHIFT) |
+		((brp - 1) << MCP25XXFD_CAN_DBTCFG_BRP_SHIFT);
+
+	return mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_DBTCFG,
+				   cpriv->regs.dbtcfg);
+}
+
+int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *reg)
 {
 	int ret;

@@ -66,11 +205,11 @@ static int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *reg)
 		MCP25XXFD_CAN_CON_OPMOD_SHIFT;
 }

-static int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv,
-				     u32 *reg, int mode)
+int mcp25xxfd_can_switch_mode_no_wait(struct mcp25xxfd_priv *priv,
+				      u32 *reg, int mode)
 {
 	u32 dummy;
-	int ret, i;
+	int ret;

 	/* get the current mode/register - if reg is NULL
 	 * when the can controller is not setup yet
@@ -78,9 +217,11 @@ static int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv,
 	 * (this only happens during initialization phase)
 	 */
 	if (reg) {
-		ret = mcp25xxfd_can_get_mode(priv, reg);
-		if (ret < 0)
-			return ret;
+		if (!reg) {
+			ret = mcp25xxfd_can_get_mode(priv, reg);
+			if (ret < 0)
+				return ret;
+		}
 	} else {
 		/* alternatively use dummy */
 		dummy = 0;
@@ -100,7 +241,15 @@ static int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv,
 		mcp25xxfd_clock_fake_sleep(priv);

 	/* request the mode switch */
-	ret = mcp25xxfd_cmd_write(priv->spi, MCP25XXFD_CAN_CON, *reg);
+	return mcp25xxfd_cmd_write(priv->spi, MCP25XXFD_CAN_CON, *reg);
+}
+
+int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv, u32 *reg, int mode)
+{
+	int ret, i;
+
+	/* trigger the mode switch itself */
+	ret = mcp25xxfd_can_switch_mode_no_wait(priv, reg, mode);
 	if (ret)
 		return ret;

@@ -229,3 +378,297 @@ int mcp25xxfd_can_probe(struct mcp25xxfd_priv *priv)
 	/* check that modeswitch is really working */
 	return mcp25xxfd_can_probe_modeswitch(priv);
 }
+
+static int mcp25xxfd_can_config(struct net_device *net)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+	struct mcp25xxfd_priv *priv = cpriv->priv;
+	struct spi_device *spi = priv->spi;
+	int ret;
+
+	/* setup value of con_register */
+	cpriv->regs.con = MCP25XXFD_CAN_CON_STEF; /* enable TEF, disable TXQ */
+
+	/* transmission bandwidth sharing bits */
+	if (bw_sharing_log2bits > 12)
+		bw_sharing_log2bits = 12;
+	cpriv->regs.con |= bw_sharing_log2bits <<
+		MCP25XXFD_CAN_CON_TXBWS_SHIFT;
+
+	/* non iso FD mode */
+	if (!(cpriv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO))
+		cpriv->regs.con |= MCP25XXFD_CAN_CON_ISOCRCEN;
+
+	/* one shot */
+	if (cpriv->can.ctrlmode & CAN_CTRLMODE_ONE_SHOT)
+		cpriv->regs.con |= MCP25XXFD_CAN_CON_RTXAT;
+
+	/* apply it now together with a mode switch */
+	ret = mcp25xxfd_can_switch_mode(cpriv->priv, &cpriv->regs.con,
+					MCP25XXFD_CAN_CON_MODE_CONFIG);
+	if (ret)
+		return 0;
+
+	/* time stamp control register - 1ns resolution */
+	cpriv->regs.tscon = 0;
+	ret = mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_TBC, 0);
+	if (ret)
+		return ret;
+
+	cpriv->regs.tscon = MCP25XXFD_CAN_TSCON_TBCEN |
+		((cpriv->can.clock.freq / 1000000)
+		 << MCP25XXFD_CAN_TSCON_TBCPRE_SHIFT);
+	ret = mcp25xxfd_cmd_write(spi, MCP25XXFD_CAN_TSCON, cpriv->regs.tscon);
+	if (ret)
+		return ret;
+
+	/* setup fifos */
+	ret = mcp25xxfd_can_fifo_setup(cpriv);
+	if (ret)
+		return ret;
+
+	/* setup can bittiming now - the do_set_bittiming methods
+	 * are not used as they get callled before open
+	 */
+	ret = mcp25xxfd_can_do_set_nominal_bittiming(net);
+	if (ret)
+		return ret;
+	ret = mcp25xxfd_can_do_set_data_bittiming(net);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+/* mode setting */
+static int mcp25xxfd_can_do_set_mode(struct net_device *net,
+				     enum can_mode mode)
+{
+	switch (mode) {
+	case CAN_MODE_START:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/* binary error counters */
+static int mcp25xxfd_can_get_berr_counter(const struct net_device *net,
+					  struct can_berr_counter *bec)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+
+	bec->txerr = (cpriv->status.trec & MCP25XXFD_CAN_TREC_TEC_MASK) >>
+		MCP25XXFD_CAN_TREC_TEC_SHIFT;
+	bec->rxerr = (cpriv->status.trec & MCP25XXFD_CAN_TREC_REC_MASK) >>
+		MCP25XXFD_CAN_TREC_REC_SHIFT;
+
+	return 0;
+}
+
+static int mcp25xxfd_can_open(struct net_device *net)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+	struct spi_device *spi = cpriv->priv->spi;
+	int ret;
+
+	ret = open_candev(net);
+	if (ret) {
+		netdev_err(net, "unable to set initial baudrate!\n");
+		return ret;
+	}
+
+	/* clear those statistics */
+	memset(&cpriv->stats, 0, sizeof(cpriv->stats));
+
+	/* request an IRQ but keep disabled for now */
+	ret = request_threaded_irq(spi->irq, NULL,
+				   mcp25xxfd_can_int,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+				   cpriv->priv->device_name, cpriv);
+	if (ret) {
+		dev_err(&spi->dev, "failed to acquire irq %d - %i\n",
+			spi->irq, ret);
+		goto out_candev;
+	}
+	disable_irq(spi->irq);
+	cpriv->irq.allocated = true;
+	cpriv->irq.enabled = false;
+
+	/* enable power to the transceiver */
+	ret = mcp25xxfd_base_power_enable(cpriv->transceiver, 1);
+	if (ret)
+		goto out_irq;
+
+	/* enable clock (so that spi works) */
+	ret = mcp25xxfd_clock_start(cpriv->priv, MCP25XXFD_CLK_USER_CAN);
+	if (ret)
+		goto out_transceiver;
+
+	/* configure controller for reception */
+	ret = mcp25xxfd_can_config(net);
+	if (ret)
+		goto out_canclock;
+
+	/* setting up state */
+	cpriv->can.state = CAN_STATE_ERROR_ACTIVE;
+
+	/* enable interrupts */
+	ret = mcp25xxfd_int_enable(cpriv->priv, true);
+	if (ret)
+		goto out_canconfig;
+
+	/* switch to active mode */
+	ret = mcp25xxfd_can_switch_mode(cpriv->priv, &cpriv->regs.con,
+					(net->mtu == CAN_MTU) ?
+					MCP25XXFD_CAN_CON_MODE_CAN2_0 :
+					MCP25XXFD_CAN_CON_MODE_MIXED);
+	if (ret)
+		goto out_int;
+
+	return 0;
+
+out_int:
+	mcp25xxfd_int_enable(cpriv->priv, false);
+out_canconfig:
+	mcp25xxfd_can_fifo_release(cpriv);
+out_canclock:
+	mcp25xxfd_clock_stop(cpriv->priv, MCP25XXFD_CLK_USER_CAN);
+out_transceiver:
+	mcp25xxfd_base_power_enable(cpriv->transceiver, 0);
+out_irq:
+	free_irq(spi->irq, cpriv);
+	cpriv->irq.allocated = false;
+	cpriv->irq.enabled = false;
+out_candev:
+	close_candev(net);
+	return ret;
+}
+
+static void mcp25xxfd_can_shutdown(struct mcp25xxfd_can_priv *cpriv)
+{
+	/* switch us to CONFIG mode - this disables the controller */
+	mcp25xxfd_can_switch_mode(cpriv->priv, &cpriv->regs.con,
+				  MCP25XXFD_CAN_CON_MODE_CONFIG);
+}
+
+static int mcp25xxfd_can_stop(struct net_device *net)
+{
+	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
+	struct mcp25xxfd_priv *priv = cpriv->priv;
+	struct spi_device *spi = priv->spi;
+
+	/* release fifos and debugfs */
+	mcp25xxfd_can_fifo_release(cpriv);
+
+	/* shutdown the can controller */
+	mcp25xxfd_can_shutdown(cpriv);
+
+	/* disable inerrupts on controller */
+	mcp25xxfd_int_enable(cpriv->priv, false);
+
+	/* stop the clock */
+	mcp25xxfd_clock_stop(cpriv->priv, MCP25XXFD_CLK_USER_CAN);
+
+	/* and disable the transceiver */
+	mcp25xxfd_base_power_enable(cpriv->transceiver, 0);
+
+	/* disable interrupt on host */
+	free_irq(spi->irq, cpriv);
+	cpriv->irq.allocated = false;
+	cpriv->irq.enabled = false;
+
+	/* close the can_decice */
+	close_candev(net);
+
+	return 0;
+}
+
+static const struct net_device_ops mcp25xxfd_netdev_ops = {
+	.ndo_open = mcp25xxfd_can_open,
+	.ndo_stop = mcp25xxfd_can_stop,
+	.ndo_change_mtu = can_change_mtu,
+};
+
+/* probe and remove */
+int mcp25xxfd_can_setup(struct mcp25xxfd_priv *priv)
+{
+	struct spi_device *spi = priv->spi;
+	struct mcp25xxfd_can_priv *cpriv;
+	struct net_device *net;
+	struct regulator *transceiver;
+	int ret;
+
+	/* get transceiver power regulator*/
+	transceiver = devm_regulator_get_optional(&spi->dev,
+						  "xceiver");
+	if (PTR_ERR(transceiver) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	/* allocate can device */
+	net = alloc_candev(sizeof(*cpriv), TX_ECHO_SKB_MAX);
+	if (!net)
+		return -ENOMEM;
+
+	/* and do some cross-asignments */
+	cpriv = netdev_priv(net);
+	cpriv->priv = priv;
+	priv->cpriv = cpriv;
+
+	/* setup network */
+	SET_NETDEV_DEV(net, &spi->dev);
+	net->netdev_ops = &mcp25xxfd_netdev_ops;
+	net->flags |= IFF_ECHO;
+
+	/* assign transceiver */
+	cpriv->transceiver = transceiver;
+
+	/* setup can */
+	cpriv->can.clock.freq = priv->clock_freq;
+	cpriv->can.bittiming_const =
+		&mcp25xxfd_can_nominal_bittiming_const;
+	cpriv->can.data_bittiming_const =
+		&mcp25xxfd_can_data_bittiming_const;
+	/* we are not setting bit-timing methods here as they get
+	 * called by the framework before open so the controller is
+	 * still in sleep mode, which does not help
+	 * things are configured in open instead
+	 */
+	cpriv->can.do_set_mode =
+		mcp25xxfd_can_do_set_mode;
+	cpriv->can.do_get_berr_counter =
+		mcp25xxfd_can_get_berr_counter;
+	cpriv->can.ctrlmode_supported =
+		CAN_CTRLMODE_FD |
+		CAN_CTRLMODE_FD_NON_ISO |
+		CAN_CTRLMODE_LOOPBACK |
+		CAN_CTRLMODE_LISTENONLY |
+		CAN_CTRLMODE_BERR_REPORTING |
+		CAN_CTRLMODE_ONE_SHOT;
+
+	ret = register_candev(net);
+	if (ret) {
+		dev_err(&spi->dev, "Failed to register can device\n");
+		goto out;
+	}
+
+	mcp25xxfd_can_debugfs_setup(cpriv);
+
+	return 0;
+out:
+	free_candev(net);
+	priv->cpriv = NULL;
+
+	return ret;
+}
+
+void mcp25xxfd_can_remove(struct mcp25xxfd_priv *priv)
+{
+	if (priv->cpriv) {
+		unregister_candev(priv->cpriv->can.dev);
+		free_candev(priv->cpriv->can.dev);
+		priv->cpriv = NULL;
+	}
+}
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
index 7a657f7946f7..0e3a72397c95 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
@@ -8,12 +8,48 @@
 #ifndef __MCP25XXFD_CAN_H
 #define __MCP25XXFD_CAN_H

+#include "mcp25xxfd_can_debugfs.h"
+#include "mcp25xxfd_can_priv.h"
 #include "mcp25xxfd_priv.h"
+#include "mcp25xxfd_regs.h"
+
+/* get the optimal controller target mode */
+static inline
+int mcp25xxfd_can_targetmode(struct mcp25xxfd_can_priv *cpriv)
+{
+	return (cpriv->can.dev->mtu == CAN_MTU) ?
+		MCP25XXFD_CAN_CON_MODE_CAN2_0 : MCP25XXFD_CAN_CON_MODE_MIXED;
+}
+
+static inline
+void mcp25xxfd_can_queue_frame(struct mcp25xxfd_can_priv *cpriv,
+			       s32 fifo, u16 ts)
+{
+	int idx = cpriv->fifos.submit_queue_count;
+
+	cpriv->fifos.submit_queue[idx].fifo = fifo;
+	cpriv->fifos.submit_queue[idx].ts = ts;
+
+	MCP25XXFD_DEBUGFS_INCR(cpriv->fifos.submit_queue_count);
+}
+
+/* get the current controller mode */
+int mcp25xxfd_can_get_mode(struct mcp25xxfd_priv *priv, u32 *reg);

 /* to put us to sleep fully we need the CAN controller to enter sleep mode */
 int mcp25xxfd_can_sleep_mode(struct mcp25xxfd_priv *priv);

+/* switch controller mode */
+int mcp25xxfd_can_switch_mode_no_wait(struct mcp25xxfd_priv *priv,
+				      u32 *reg, int mode);
+int mcp25xxfd_can_switch_mode(struct mcp25xxfd_priv *priv,
+			      u32 *reg, int mode);
+
 /* probe the can controller */
 int mcp25xxfd_can_probe(struct mcp25xxfd_priv *priv);

+/* setup and the can controller net interface */
+int mcp25xxfd_can_setup(struct mcp25xxfd_priv *priv);
+void mcp25xxfd_can_remove(struct mcp25xxfd_priv *priv);
+
 #endif /* __MCP25XXFD_CAN_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
new file mode 100644
index 000000000000..8632ec6124d4
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include "mcp25xxfd_can_priv.h"
+
+static void mcp25xxfd_can_debugfs_regs(struct mcp25xxfd_can_priv *cpriv,
+				       struct dentry *root)
+{
+	struct dentry *dir = debugfs_create_dir("regs", root);
+
+	debugfs_create_x32("con",    0444, dir, &cpriv->regs.con);
+	debugfs_create_x32("tdc",    0444, dir, &cpriv->regs.tdc);
+	debugfs_create_x32("tscon",  0444, dir, &cpriv->regs.tscon);
+	debugfs_create_x32("tefcon", 0444, dir, &cpriv->regs.tscon);
+	debugfs_create_x32("nbtcfg", 0444, dir, &cpriv->regs.nbtcfg);
+	debugfs_create_x32("dbtcfg", 0444, dir, &cpriv->regs.dbtcfg);
+}
+
+static void mcp25xxfd_can_debugfs_status(struct mcp25xxfd_can_priv *cpriv,
+					 struct dentry *root)
+{
+	struct dentry *dir = debugfs_create_dir("status", root);
+
+	debugfs_create_x32("intf",    0444, dir, &cpriv->status.intf);
+	debugfs_create_x32("rx_if",   0444, dir, &cpriv->status.rxif);
+	debugfs_create_x32("tx_if",   0444, dir, &cpriv->status.txif);
+	debugfs_create_x32("rx_ovif", 0444, dir, &cpriv->status.rxovif);
+	debugfs_create_x32("tx_atif", 0444, dir, &cpriv->status.txatif);
+	debugfs_create_x32("tx_req",  0444, dir, &cpriv->status.txreq);
+	debugfs_create_x32("trec",    0444, dir, &cpriv->status.trec);
+}
+
+static void mcp25xxfd_can_debugfs_stats(struct mcp25xxfd_can_priv *cpriv,
+					struct dentry *root)
+{
+	struct dentry *dir = debugfs_create_dir("stats", root);
+
+# define DEBUGFS_CREATE(name, var) debugfs_create_u64(name, 0444, dir, \
+						      &cpriv->stats.var)
+	DEBUGFS_CREATE("irq_calls",		 irq_calls);
+	DEBUGFS_CREATE("irq_loops",		 irq_loops);
+	DEBUGFS_CREATE("irq_thread_rescheduled", irq_thread_rescheduled);
+
+	DEBUGFS_CREATE("int_system_error",	 int_serr_count);
+	DEBUGFS_CREATE("int_system_error_tx",	 int_serr_tx_count);
+	DEBUGFS_CREATE("int_system_error_rx",	 int_serr_rx_count);
+	DEBUGFS_CREATE("int_mode_switch",	 int_mod_count);
+	DEBUGFS_CREATE("int_rx",		 int_rx_count);
+	DEBUGFS_CREATE("int_rx_overflow",	 int_rxov_count);
+	DEBUGFS_CREATE("int_ecc_error",		 int_ecc_count);
+	DEBUGFS_CREATE("int_rx_invalid_message", int_ivm_count);
+	DEBUGFS_CREATE("int_crcerror",		 int_cerr_count);
+
+	DEBUGFS_CREATE("rx_reads",		 rx_reads);
+	DEBUGFS_CREATE("rx_reads_prefetched_too_few",
+		       rx_reads_prefetched_too_few);
+	DEBUGFS_CREATE("rx_reads_prefetched_too_few_bytes",
+		       rx_reads_prefetched_too_few_bytes);
+	DEBUGFS_CREATE("rx_reads_prefetched_too_many",
+		       rx_reads_prefetched_too_many);
+	DEBUGFS_CREATE("rx_reads_prefetched_too_many_bytes",
+		       rx_reads_prefetched_too_many_bytes);
+#undef DEBUGFS_CREATE
+}
+
+static void mcp25xxfd_can_debugfs_fifo_info(struct mcp25xxfd_fifo_info *info,
+					    int index, struct dentry *root)
+{
+	struct dentry *dir;
+	char name[4];
+
+	snprintf(name, sizeof(name), "%02i", index);
+	dir = debugfs_create_dir(name, root);
+
+	debugfs_create_x32("offset",    0444, dir, &info->offset);
+	debugfs_create_u32("priority",  0444, dir, &info->priority);
+
+	debugfs_create_u64("use_count", 0444, dir, &info->use_count);
+}
+
+static void mcp25xxfd_can_debugfs_fifos(struct mcp25xxfd_can_priv *cpriv,
+					struct dentry *root)
+{
+	struct dentry *dir = debugfs_create_dir("fifos", root);
+	int i;
+
+	/* now present all fifos - there is no fifo 0 */
+	for (i = 1; i < 32; i++)
+		mcp25xxfd_can_debugfs_fifo_info(&cpriv->fifos.info[i], i, dir);
+}
+
+static void mcp25xxfd_can_debugfs_rxtx_fifos(struct mcp25xxfd_fifo *d,
+					     struct dentry *root)
+{
+	int i, f;
+	char name[4];
+	char link[32];
+
+	debugfs_create_u32("count", 0444, root, &d->count);
+	debugfs_create_u32("size",  0444, root, &d->size);
+	debugfs_create_u32("start", 0444, root, &d->start);
+
+	for (f = d->start, i = 0; i < d->count; f++, i++) {
+		snprintf(name, sizeof(name), "%02i", i);
+		snprintf(link, sizeof(link), "../fifos/%02i", f);
+
+		debugfs_create_symlink(name, root, link);
+	}
+}
+
+static void mcp25xxfd_can_debugfs_rx_fifos(struct mcp25xxfd_can_priv *cpriv,
+					   struct dentry *root)
+{
+	struct dentry *dir = debugfs_create_dir("rx_fifos", root);
+
+	mcp25xxfd_can_debugfs_rxtx_fifos(&cpriv->fifos.rx, dir);
+}
+
+void mcp25xxfd_can_debugfs_remove(struct mcp25xxfd_can_priv *cpriv)
+{
+	debugfs_remove_recursive(cpriv->debugfs_dir);
+	cpriv->debugfs_dir = NULL;
+}
+
+void mcp25xxfd_can_debugfs_setup(struct mcp25xxfd_can_priv *cpriv)
+{
+	struct dentry *root;
+
+	/* remove first as we get called during probe and also
+	 * when the can_device is configured/removed
+	 */
+	mcp25xxfd_can_debugfs_remove(cpriv);
+
+	root = debugfs_create_dir("can", cpriv->priv->debugfs_dir);
+	cpriv->debugfs_dir = root;
+
+	mcp25xxfd_can_debugfs_regs(cpriv, root);
+	mcp25xxfd_can_debugfs_stats(cpriv, root);
+	mcp25xxfd_can_debugfs_status(cpriv, root);
+	mcp25xxfd_can_debugfs_fifos(cpriv, root);
+	mcp25xxfd_can_debugfs_rx_fifos(cpriv, root);
+}
+
+#endif
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h
new file mode 100644
index 000000000000..7c6a255c9400
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifndef __MCP25XXFD_CAN_DEBUGFS_H
+#define __MCP25XXFD_CAN_DEBUGFS_H
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+#include "mcp25xxfd_can_priv.h"
+
+#define MCP25XXFD_DEBUGFS_INCR(counter) ((counter)++)
+#define MCP25XXFD_DEBUGFS_ADD(counter, val) ((counter) += (val))
+#define MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, counter)		\
+	(((cpriv)->stats.counter)++)
+#define MCP25XXFD_DEBUGFS_STATS_ADD(cpriv, counter, val)	\
+	(((cpriv)->stats.counter) += (val))
+
+void mcp25xxfd_can_debugfs_setup(struct mcp25xxfd_can_priv *cpriv);
+void mcp25xxfd_can_debugfs_remove(struct mcp25xxfd_can_priv *cpriv);
+
+#else /* CONFIG_DEBUG_FS */
+
+#define MCP25XXFD_DEBUGFS_INCR(counter)
+#define MCP25XXFD_DEBUGFS_ADD(counter, val)
+#define MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, counter)
+#define MCP25XXFD_DEBUGFS_STATS_ADD(cpriv, counter, val)
+
+static inline
+void mcp25xxfd_can_debugfs_setup(struct mcp25xxfd_can_priv *cpriv)
+{
+}
+
+static inline
+void mcp25xxfd_can_debugfs_remove(struct mcp25xxfd_can_priv *cpriv)
+{
+}
+
+#endif /* CONFIG_DEBUG_FS */
+#endif /* __MCP25XXFD_CAN_DEBUGFS_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
new file mode 100644
index 000000000000..401993fe5154
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+/* here we define and configure the fifo layout */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+#include "mcp25xxfd_can.h"
+#include "mcp25xxfd_can_priv.h"
+#include "mcp25xxfd_cmd.h"
+
+static int mcp25xxfd_can_fifo_get_address(struct mcp25xxfd_can_priv *cpriv)
+{
+	int fifo, ret;
+
+	/* we need to move out of config mode to force address computation */
+	ret = mcp25xxfd_can_switch_mode(cpriv->priv, &cpriv->regs.con,
+					MCP25XXFD_CAN_CON_MODE_INT_LOOPBACK);
+	if (ret)
+		return ret;
+
+	/* and get back into config mode */
+	ret = mcp25xxfd_can_switch_mode(cpriv->priv, &cpriv->regs.con,
+					MCP25XXFD_CAN_CON_MODE_CONFIG);
+	if (ret)
+		return ret;
+
+	/* read address and config back in */
+	for (fifo = 1; fifo < 32; fifo++) {
+		ret = mcp25xxfd_cmd_read(cpriv->priv->spi,
+					 MCP25XXFD_CAN_FIFOUA(fifo),
+					 &cpriv->fifos.info[fifo].offset);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mcp25xxfd_can_fifo_setup_config(struct mcp25xxfd_can_priv *cpriv,
+					   struct mcp25xxfd_fifo *desc,
+					   u32 flags, u32 flags_last)
+{
+	u32 val;
+	int i, p, f, c, ret;
+
+	/* now setup the fifos themselves */
+	for (i = 0, f = desc->start, c = desc->count, p = 31;
+	     c > 0; i++, f++, p--, c--) {
+		/* select the effective value */
+		val = (c > 1) ? flags : flags_last;
+
+		/* write the config to the controller in one go */
+		ret = mcp25xxfd_cmd_write(cpriv->priv->spi,
+					  MCP25XXFD_CAN_FIFOCON(f), val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mcp25xxfd_can_fifo_setup_rx(struct mcp25xxfd_can_priv *cpriv)
+{
+	u32 rx_flags = MCP25XXFD_CAN_FIFOCON_FRESET |     /* reset FIFO */
+		MCP25XXFD_CAN_FIFOCON_RXTSEN |            /* RX timestamps */
+		MCP25XXFD_CAN_FIFOCON_TFERFFIE |          /* FIFO Full */
+		MCP25XXFD_CAN_FIFOCON_TFHRFHIE |          /* FIFO Half Full*/
+		MCP25XXFD_CAN_FIFOCON_TFNRFNIE |          /* FIFO not empty */
+		(cpriv->fifos.payload_mode <<
+		 MCP25XXFD_CAN_FIFOCON_PLSIZE_SHIFT) |
+		(0 << MCP25XXFD_CAN_FIFOCON_FSIZE_SHIFT); /* 1 FIFO deep */
+	/* enable overflow int on last fifo */
+	u32 rx_flags_last = rx_flags | MCP25XXFD_CAN_FIFOCON_RXOVIE;
+
+	return mcp25xxfd_can_fifo_setup_config(cpriv, &cpriv->fifos.rx,
+					       rx_flags, rx_flags_last);
+}
+
+static int mcp25xxfd_can_fifo_setup_rxfilter(struct mcp25xxfd_can_priv *cpriv)
+{
+	u8 filter_con[32];
+	int c, f;
+
+	/* clear the filters and filter mappings for all filters */
+	memset(filter_con, 0, sizeof(filter_con));
+
+	/* and now set up the rx filters */
+	for (c = 0, f = cpriv->fifos.rx.start; c < cpriv->fifos.rx.count;
+	     c++, f++) {
+		/* set up filter config - we can use the mask of filter 0 */
+		filter_con[c] = MCP25XXFD_CAN_FIFOCON_FLTEN(0) |
+			(f << MCP25XXFD_CAN_FILCON_SHIFT(0));
+	}
+
+	/* and set up filter control */
+	return mcp25xxfd_cmd_write_regs(cpriv->priv->spi,
+					MCP25XXFD_CAN_FLTCON(0),
+					(u32 *)filter_con, sizeof(filter_con));
+}
+
+static int mcp25xxfd_can_fifo_compute(struct mcp25xxfd_can_priv *cpriv)
+{
+	int rx_memory_available;
+
+	/* default settings as per MTU/CANFD */
+	switch (cpriv->can.dev->mtu) {
+	case CAN_MTU:
+		/* mtu is 8 */
+		cpriv->fifos.payload_size = 8;
+		cpriv->fifos.payload_mode = MCP25XXFD_CAN_TXQCON_PLSIZE_8;
+
+		break;
+	case CANFD_MTU:
+		/* wish there was a way to have hw filters
+		 * that can separate based on length ...
+		 */
+		/* MTU is 64 */
+		cpriv->fifos.payload_size = 64;
+		cpriv->fifos.payload_mode = MCP25XXFD_CAN_TXQCON_PLSIZE_64;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* compute effective sizes */
+	cpriv->fifos.rx.size = sizeof(struct mcp25xxfd_can_obj_rx) +
+		cpriv->fifos.payload_size;
+
+	/* calculate evailable memory for RX_fifos */
+	rx_memory_available = MCP25XXFD_SRAM_SIZE;
+
+	/* calculate possible amount of RX fifos */
+	cpriv->fifos.rx.count = rx_memory_available / cpriv->fifos.rx.size;
+
+	/* so now calculate effective number of rx-fifos
+	 * there are only 31 fifos available in total,
+	 * so we need to limit ourselves
+	 */
+	if (cpriv->fifos.rx.count > 31)
+		cpriv->fifos.rx.count = 31;
+
+	/* define the layout now that we have gotten everything */
+	cpriv->fifos.rx.start = 1;
+
+	return 0;
+}
+
+static int mcp25xxfd_can_fifo_clear_regs(struct mcp25xxfd_can_priv *cpriv,
+					 u32 start, u32 end)
+{
+	size_t len = end - start;
+	u8 *data = kzalloc(len, GFP_KERNEL);
+	int ret;
+
+	if (!data)
+		return -ENOMEM;
+
+	ret = mcp25xxfd_cmd_write_regs(cpriv->priv->spi,
+				       start, (u32 *)data, len);
+
+	kfree(data);
+
+	return ret;
+}
+
+static int mcp25xxfd_can_fifo_clear(struct mcp25xxfd_can_priv *cpriv)
+{
+	int ret;
+
+	memset(&cpriv->fifos.info, 0, sizeof(cpriv->fifos.info));
+	memset(&cpriv->fifos.rx, 0, sizeof(cpriv->fifos.rx));
+
+	/* clear FIFO config */
+	ret = mcp25xxfd_can_fifo_clear_regs(cpriv, MCP25XXFD_CAN_FIFOCON(1),
+					    MCP25XXFD_CAN_FIFOCON(32));
+	if (ret)
+		return ret;
+
+	/* clear the filter mask - match any frame with every filter */
+	return mcp25xxfd_can_fifo_clear_regs(cpriv, MCP25XXFD_CAN_FLTCON(0),
+					     MCP25XXFD_CAN_FLTCON(32));
+}
+
+int mcp25xxfd_can_fifo_setup(struct mcp25xxfd_can_priv *cpriv)
+{
+	int ret;
+
+	/* clear fifo config */
+	ret = mcp25xxfd_can_fifo_clear(cpriv);
+	if (ret)
+		return ret;
+
+	/* compute fifos counts */
+	ret = mcp25xxfd_can_fifo_compute(cpriv);
+	if (ret)
+		return ret;
+
+	/* configure TEF */
+	cpriv->regs.tefcon = 0;
+	ret = mcp25xxfd_cmd_write(cpriv->priv->spi, MCP25XXFD_CAN_TEFCON,
+				  cpriv->regs.tefcon);
+	if (ret)
+		return ret;
+
+	/* TXQueue disabled */
+	ret = mcp25xxfd_cmd_write(cpriv->priv->spi, MCP25XXFD_CAN_TXQCON, 0);
+	if (ret)
+		return ret;
+
+	/* configure FIFOS themselves */
+	ret = mcp25xxfd_can_fifo_setup_rx(cpriv);
+	if (ret)
+		return ret;
+	ret = mcp25xxfd_can_fifo_setup_rxfilter(cpriv);
+	if (ret)
+		return ret;
+
+	/* get fifo addresses */
+	ret = mcp25xxfd_can_fifo_get_address(cpriv);
+	if (ret)
+		return ret;
+
+	/* add the can info to debugfs */
+	mcp25xxfd_can_debugfs_setup(cpriv);
+
+	return 0;
+}
+
+void mcp25xxfd_can_fifo_release(struct mcp25xxfd_can_priv *cpriv)
+{
+	mcp25xxfd_can_fifo_clear(cpriv);
+	mcp25xxfd_can_debugfs_remove(cpriv);
+}
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h
new file mode 100644
index 000000000000..ed2daa05220a
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifndef __MCP25XXFD_CAN_FIFO_H
+#define __MCP25XXFD_CAN_FIFO_H
+
+#include "mcp25xxfd_can_priv.h"
+
+int mcp25xxfd_can_fifo_setup(struct mcp25xxfd_can_priv *cpriv);
+void mcp25xxfd_can_fifo_release(struct mcp25xxfd_can_priv *cpriv);
+
+#endif /* __MCP25XXFD_CAN_FIFO_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h
new file mode 100644
index 000000000000..00a6c6639bd5
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifndef __MCP25XXFD_CAN_IF_H
+#define __MCP25XXFD_CAN_IF_H
+
+#include <uapi/linux/can.h>
+
+#include "mcp25xxfd_can_id.h"
+#include "mcp25xxfd_regs.h"
+
+/* ideally these would be defined in uapi/linux/can.h */
+#define MCP25XXFD_CAN_EFF_SID_SHIFT	(CAN_EFF_ID_BITS - CAN_SFF_ID_BITS)
+#define MCP25XXFD_CAN_EFF_SID_BITS	CAN_SFF_ID_BITS
+#define MCP25XXFD_CAN_EFF_SID_MASK					\
+	GENMASK(MCP25XXFD_CAN_EFF_SID_SHIFT + MCP25XXFD_CAN_EFF_SID_BITS - 1, \
+		MCP25XXFD_CAN_EFF_SID_SHIFT)
+#define MCP25XXFD_CAN_EFF_EID_SHIFT	0
+#define MCP25XXFD_CAN_EFF_EID_BITS	MCP25XXFD_CAN_EFF_SID_SHIFT
+#define MCP25XXFD_CAN_EFF_EID_MASK					\
+	GENMASK(MCP25XXFD_CAN_EFF_EID_SHIFT + MCP25XXFD_CAN_EFF_EID_BITS - 1, \
+		MCP25XXFD_CAN_EFF_EID_SHIFT)
+
+static inline
+void mcp25xxfd_can_id_from_mcp25xxfd(u32 mcp_id, u32 mcp_flags, u32 *can_id)
+{
+	u32 sid = (mcp_id & MCP25XXFD_CAN_OBJ_ID_SID_MASK) >>
+		MCP25XXFD_CAN_OBJ_ID_SID_SHIFT;
+	u32 eid = (mcp_id & MCP25XXFD_CAN_OBJ_ID_EID_MASK) >>
+		MCP25XXFD_CAN_OBJ_ID_EID_SHIFT;
+
+	/* select normal or extended ids */
+	if (mcp_flags & MCP25XXFD_CAN_OBJ_FLAGS_IDE) {
+		*can_id = (eid << MCP25XXFD_CAN_EFF_EID_SHIFT) |
+			(sid << MCP25XXFD_CAN_EFF_SID_SHIFT) |
+			CAN_EFF_FLAG;
+	} else {
+		*can_id = sid << MCP25XXFD_CAN_EFF_EID_SHIFT;
+	}
+	/* handle rtr */
+	*can_id |= (mcp_flags & MCP25XXFD_CAN_OBJ_FLAGS_RTR) ? CAN_RTR_FLAG : 0;
+}
+
+static inline
+void mcp25xxfd_can_id_to_mcp25xxfd(u32 can_id, u32 *id, u32 *flags)
+{
+	/* depending on can_id flag compute extended or standard ids */
+	if (can_id & CAN_EFF_FLAG) {
+		int sid = (can_id & MCP25XXFD_CAN_EFF_SID_MASK) >>
+			MCP25XXFD_CAN_EFF_SID_SHIFT;
+		int eid = (can_id & MCP25XXFD_CAN_EFF_EID_MASK) >>
+			MCP25XXFD_CAN_EFF_EID_SHIFT;
+		*id = (eid << MCP25XXFD_CAN_OBJ_ID_EID_SHIFT) |
+			(sid << MCP25XXFD_CAN_OBJ_ID_SID_SHIFT);
+		*flags = MCP25XXFD_CAN_OBJ_FLAGS_IDE;
+	} else {
+		*id = can_id & CAN_SFF_MASK;
+		*flags = 0;
+	}
+
+	/* Handle RTR */
+	*flags |= (can_id & CAN_RTR_FLAG) ? MCP25XXFD_CAN_OBJ_FLAGS_RTR : 0;
+}
+
+#endif /* __MCP25XXFD_CAN_IF_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
new file mode 100644
index 000000000000..badde661c16f
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
@@ -0,0 +1,689 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#include <linux/can/core.h>
+#include <linux/can/dev.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/net.h>
+#include <linux/netdevice.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+#include "mcp25xxfd_regs.h"
+#include "mcp25xxfd_can.h"
+#include "mcp25xxfd_can_debugfs.h"
+#include "mcp25xxfd_can_priv.h"
+#include "mcp25xxfd_can_rx.h"
+#include "mcp25xxfd_cmd.h"
+#include "mcp25xxfd_ecc.h"
+
+unsigned int reschedule_int_thread_after = 4;
+module_param(reschedule_int_thread_after, uint, 0664);
+MODULE_PARM_DESC(reschedule_int_thread_after,
+		 "Reschedule the interrupt thread after this many loops\n");
+
+static void mcp25xxfd_can_int_send_error_skb(struct mcp25xxfd_can_priv *cpriv)
+{
+	struct net_device *net = cpriv->can.dev;
+	struct sk_buff *skb;
+	struct can_frame *frame;
+
+	/* allocate error frame */
+	skb = alloc_can_err_skb(net, &frame);
+	if (!skb) {
+		netdev_err(net, "cannot allocate error skb\n");
+		return;
+	}
+
+	/* setup can error frame data */
+	frame->can_id |= cpriv->error_frame.id;
+	memcpy(frame->data, cpriv->error_frame.data, sizeof(frame->data));
+
+	/* and submit it */
+	netif_receive_skb(skb);
+}
+
+static int mcp25xxfd_can_int_compare_obj_ts(const void *a, const void *b)
+{
+	s32 ats = ((struct mcp25xxfd_obj_ts *)a)->ts;
+	s32 bts = ((struct mcp25xxfd_obj_ts *)b)->ts;
+
+	if (ats < bts)
+		return -1;
+	if (ats > bts)
+		return 1;
+	return 0;
+}
+
+static int mcp25xxfd_can_int_submit_frames(struct mcp25xxfd_can_priv *cpriv)
+{
+	struct mcp25xxfd_obj_ts *queue = cpriv->fifos.submit_queue;
+	int count = cpriv->fifos.submit_queue_count;
+	int i, fifo;
+	int ret;
+
+	/* skip processing if the queue count is 0 */
+	if (count == 0)
+		goto out;
+
+	/* sort the fifos (rx and tx - actually TEF) by receive timestamp */
+	sort(queue, count, sizeof(*queue),
+	     mcp25xxfd_can_int_compare_obj_ts, NULL);
+
+	/* now submit the fifos  */
+	for (i = 0; i < count; i++) {
+		fifo = queue[i].fifo;
+		ret = mcp25xxfd_can_rx_submit_frame(cpriv, fifo);
+		if (ret)
+			return ret;
+	}
+
+	/* if we have received or transmitted something
+	 * and the IVMIE is disabled, then enable it
+	 * this is mostly to avoid unnecessary interrupts during a
+	 * disconnected CAN BUS
+	 */
+	if (!(cpriv->status.intf | MCP25XXFD_CAN_INT_IVMIE)) {
+		cpriv->status.intf |= MCP25XXFD_CAN_INT_IVMIE;
+		ret = mcp25xxfd_cmd_write_mask(cpriv->priv->spi,
+					       MCP25XXFD_CAN_INT,
+					       cpriv->status.intf,
+					       MCP25XXFD_CAN_INT_IVMIE);
+		if (ret)
+			return ret;
+	}
+
+out:
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_clear_int_flags(struct mcp25xxfd_can_priv *cpriv)
+{
+	u32 clearable_irq_active = cpriv->status.intf &
+		MCP25XXFD_CAN_INT_IF_CLEAR_MASK;
+	u32 clear_irq = cpriv->status.intf & (~MCP25XXFD_CAN_INT_IF_CLEAR_MASK);
+
+	/* if no clearable flags are set then skip the whole transfer */
+	if (!clearable_irq_active)
+		return 0;
+
+	return mcp25xxfd_cmd_write_mask(cpriv->priv->spi, MCP25XXFD_CAN_INT,
+					clear_irq, clearable_irq_active);
+}
+
+static
+int mcp25xxfd_can_int_handle_serrif_txmab(struct mcp25xxfd_can_priv *cpriv)
+{
+	int mode = mcp25xxfd_can_targetmode(cpriv);
+
+	cpriv->can.dev->stats.tx_fifo_errors++;
+	cpriv->can.dev->stats.tx_errors++;
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_serr_tx_count);
+
+	/* data7 contains custom mcp25xxfd error flags */
+	cpriv->error_frame.data[7] |= MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_SERR_TX;
+
+	/* and switch back into the correct mode */
+	return mcp25xxfd_can_switch_mode_no_wait(cpriv->priv,
+						 &cpriv->regs.con, mode);
+}
+
+static
+int mcp25xxfd_can_int_handle_serrif_rxmab(struct mcp25xxfd_can_priv *cpriv)
+{
+	cpriv->can.dev->stats.rx_dropped++;
+	cpriv->can.dev->stats.rx_errors++;
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_serr_rx_count);
+
+	/* data7 contains custom mcp25xxfd error flags */
+	cpriv->error_frame.data[7] |= MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_SERR_RX;
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_handle_serrif(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (!(cpriv->status.intf & MCP25XXFD_CAN_INT_SERRIF))
+		return 0;
+
+	/* increment statistics counter now */
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_serr_count);
+
+	/* interrupt flags have been cleared already */
+
+	/* Errors here are:
+	 * * Bus Bandwidth Error: when a RX Message Assembly Buffer
+	 *   is still full when the next message has already arrived
+	 *   the recived message shall be ignored
+	 * * TX MAB Underflow: when a TX Message is invalid
+	 *   due to ECC errors or TXMAB underflow
+	 *   in this situatioon the system will transition to
+	 *   Restricted or Listen Only mode
+	 */
+
+	cpriv->error_frame.id |= CAN_ERR_CRTL;
+	cpriv->error_frame.data[1] |= CAN_ERR_CRTL_UNSPEC;
+
+	/* a mode change + invalid message would indicate
+	 * TX MAB Underflow
+	 */
+	if ((cpriv->status.intf & MCP25XXFD_CAN_INT_MODIF) &&
+	    (cpriv->status.intf & MCP25XXFD_CAN_INT_IVMIF)) {
+		return mcp25xxfd_can_int_handle_serrif_txmab(cpriv);
+	}
+
+	/* for RX there is only the RXIF an indicator
+	 * - surprizingly RX-MAB does not change mode or anything
+	 */
+	if (cpriv->status.intf & MCP25XXFD_CAN_INT_RXIF)
+		return mcp25xxfd_can_int_handle_serrif_rxmab(cpriv);
+
+	/* the final case */
+	dev_warn_ratelimited(&cpriv->priv->spi->dev,
+			     "unidentified system interrupt - intf =  %08x\n",
+			     cpriv->status.intf);
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_handle_modif(struct mcp25xxfd_can_priv *cpriv)
+{
+	struct spi_device *spi = cpriv->priv->spi;
+	int mode;
+	int ret;
+
+	/* Note that this irq does not get triggered in all situations
+	 * for example SERRIF will move to RESTICTED or LISTENONLY
+	 * but MODIF will not be raised!
+	 */
+
+	if (!(cpriv->status.intf & MCP25XXFD_CAN_INT_MODIF))
+		return 0;
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_mod_count);
+
+	/* get the current mode */
+	ret = mcp25xxfd_can_get_mode(cpriv->priv, &mode);
+	if (ret)
+		return ret;
+	mode = ret;
+
+	/* switches to the same mode as before are ignored
+	 * - this typically happens if the driver is shortly
+	 *   switching to a different mode and then returning to the
+	 *   original mode
+	 */
+	if (mode == cpriv->mode)
+		return 0;
+
+	/* if we are restricted, then return to "normal" mode */
+	if (mode == MCP25XXFD_CAN_CON_MODE_RESTRICTED) {
+		cpriv->mode = mode;
+		mode = mcp25xxfd_can_targetmode(cpriv);
+		return mcp25xxfd_can_switch_mode_no_wait(cpriv->priv,
+							 &cpriv->regs.con,
+							 mode);
+	}
+
+	/* the controller itself will transition to sleep, so we ignore it */
+	if (mode == MCP25XXFD_CAN_CON_MODE_SLEEP) {
+		cpriv->mode = mode;
+		return 0;
+	}
+
+	/* these we need to handle correctly, so warn and give context */
+	dev_warn(&spi->dev,
+		 "Controller unexpectedly switched from mode %u to %u\n",
+		 cpriv->mode, mode);
+
+	/* assign the mode as current */
+	cpriv->mode = mode;
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_handle_eccif(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (!(cpriv->status.intf & MCP25XXFD_CAN_INT_ECCIF))
+		return 0;
+
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_ecc_count);
+
+	/* and prepare ERROR FRAME */
+	cpriv->error_frame.id |= CAN_ERR_CRTL;
+	cpriv->error_frame.data[1] |= CAN_ERR_CRTL_UNSPEC;
+	/* data7 contains custom mcp25xxfd error flags */
+	cpriv->error_frame.data[7] |= MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_ECC;
+
+	/* delegate to interrupt cleaning */
+	return mcp25xxfd_ecc_clear_int(cpriv->priv);
+}
+
+static void mcp25xxfd_can_int_handle_ivmif_tx(struct mcp25xxfd_can_priv *cpriv,
+					      u32 *mask)
+{
+	/* check if it is really a known tx error */
+	if ((cpriv->bus.bdiag[1] &
+	     (MCP25XXFD_CAN_BDIAG1_DBIT1ERR |
+	      MCP25XXFD_CAN_BDIAG1_DBIT0ERR |
+	      MCP25XXFD_CAN_BDIAG1_NACKERR |
+	      MCP25XXFD_CAN_BDIAG1_NBIT1ERR |
+	      MCP25XXFD_CAN_BDIAG1_NBIT0ERR
+		     )) == 0)
+		return;
+
+	/* mark it as a protocol error */
+	cpriv->error_frame.id |= CAN_ERR_PROT;
+
+	/* and update statistics */
+	cpriv->can.dev->stats.tx_errors++;
+
+	/* and handle all the known cases */
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NACKERR) {
+		/* TX-Frame not acknowledged - connected to CAN-bus? */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NACKERR;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_TX;
+		cpriv->can.dev->stats.tx_aborted_errors++;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NBIT1ERR) {
+		/* TX-Frame CAN-BUS Level is unexpectedly dominant */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NBIT1ERR;
+		cpriv->can.dev->stats.tx_carrier_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT1;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NBIT0ERR) {
+		/* TX-Frame CAN-BUS Level is unexpectedly recessive */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NBIT0ERR;
+		cpriv->can.dev->stats.tx_carrier_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT0;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_DBIT1ERR) {
+		/* TX-Frame CAN-BUS Level is unexpectedly dominant
+		 * during data phase
+		 */
+		*mask |= MCP25XXFD_CAN_BDIAG1_DBIT1ERR;
+		cpriv->can.dev->stats.tx_carrier_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT1;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_DBIT0ERR) {
+		/* TX-Frame CAN-BUS Level is unexpectedly recessive
+		 * during data phase
+		 */
+		*mask |= MCP25XXFD_CAN_BDIAG1_DBIT0ERR;
+		cpriv->can.dev->stats.tx_carrier_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT0;
+	}
+}
+
+static void mcp25xxfd_can_int_handle_ivmif_rx(struct mcp25xxfd_can_priv *cpriv,
+					      u32 *mask)
+{
+	/* check if it is really a known tx error */
+	if ((cpriv->bus.bdiag[1] &
+	     (MCP25XXFD_CAN_BDIAG1_DCRCERR |
+	      MCP25XXFD_CAN_BDIAG1_DSTUFERR |
+	      MCP25XXFD_CAN_BDIAG1_DFORMERR |
+	      MCP25XXFD_CAN_BDIAG1_NCRCERR |
+	      MCP25XXFD_CAN_BDIAG1_NSTUFERR |
+	      MCP25XXFD_CAN_BDIAG1_NFORMERR
+		     )) == 0)
+		return;
+
+	/* mark it as a protocol error */
+	cpriv->error_frame.id |= CAN_ERR_PROT;
+
+	/* and update statistics */
+	cpriv->can.dev->stats.rx_errors++;
+
+	/* handle the cases */
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_DCRCERR) {
+		/* RX-Frame with bad CRC during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_DCRCERR;
+		cpriv->can.dev->stats.rx_crc_errors++;
+		cpriv->error_frame.data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_DSTUFERR) {
+		/* RX-Frame with bad stuffing during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_DSTUFERR;
+		cpriv->can.dev->stats.rx_frame_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_STUFF;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_DFORMERR) {
+		/* RX-Frame with bad format during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_DFORMERR;
+		cpriv->can.dev->stats.rx_frame_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_FORM;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NCRCERR) {
+		/* RX-Frame with bad CRC during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NCRCERR;
+		cpriv->can.dev->stats.rx_crc_errors++;
+		cpriv->error_frame.data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NSTUFERR) {
+		/* RX-Frame with bad stuffing during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NSTUFERR;
+		cpriv->can.dev->stats.rx_frame_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_STUFF;
+	}
+	if (cpriv->bus.bdiag[1] & MCP25XXFD_CAN_BDIAG1_NFORMERR) {
+		/* RX-Frame with bad format during data phase */
+		*mask |= MCP25XXFD_CAN_BDIAG1_NFORMERR;
+		cpriv->can.dev->stats.rx_frame_errors++;
+		cpriv->error_frame.data[2] |= CAN_ERR_PROT_FORM;
+	}
+}
+
+static int mcp25xxfd_can_int_handle_ivmif(struct mcp25xxfd_can_priv *cpriv)
+{
+	struct spi_device *spi = cpriv->priv->spi;
+	u32 mask, bdiag1;
+	int ret;
+
+	if (!(cpriv->status.intf & MCP25XXFD_CAN_INT_IVMIF))
+		return 0;
+
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_ivm_count);
+
+	/* if we have a systemerror as well,
+	 * then ignore it as they correlate
+	 */
+	if (cpriv->status.intf & MCP25XXFD_CAN_INT_SERRIF)
+		return 0;
+
+	/* read bus diagnostics */
+	ret = mcp25xxfd_cmd_read_regs(spi, MCP25XXFD_CAN_BDIAG0,
+				      cpriv->bus.bdiag,
+				      sizeof(cpriv->bus.bdiag));
+	if (ret)
+		return ret;
+
+	/* clear the masks of bits to clear */
+	mask = 0;
+
+	/* check rx and tx errors */
+	mcp25xxfd_can_int_handle_ivmif_tx(cpriv, &mask);
+	mcp25xxfd_can_int_handle_ivmif_rx(cpriv, &mask);
+
+	/* clear flags if we have bits masked */
+	if (!mask) {
+		/* the unsupported case, where we are not
+		 * clearing any registers
+		 */
+		dev_warn_once(&spi->dev,
+			      "found IVMIF situation not supported by driver - bdiag = [0x%08x, 0x%08x]",
+			      cpriv->bus.bdiag[0], cpriv->bus.bdiag[1]);
+		return -EINVAL;
+	}
+
+	/* clear the bits in bdiag1 */
+	bdiag1 = cpriv->bus.bdiag[1] & (~mask);
+	/* and write it */
+	ret = mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_CAN_BDIAG1, bdiag1, mask);
+	if (ret)
+		return ret;
+
+	/* and clear the interrupt flag until we have received or transmited */
+	cpriv->status.intf &= ~(MCP25XXFD_CAN_INT_IVMIE);
+	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_CAN_INT,
+					cpriv->status.intf,
+					MCP25XXFD_CAN_INT_IVMIE);
+}
+
+static int mcp25xxfd_can_int_handle_cerrif(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (!(cpriv->status.intf & MCP25XXFD_CAN_INT_CERRIF))
+		return 0;
+
+	/* this interrupt exists primarilly to counter possible
+	 * bus off situations more detailed information
+	 * can be found and controlled in the TREC register
+	 */
+
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_cerr_count);
+
+	netdev_warn(cpriv->can.dev, "CAN Bus error experienced");
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_error_counters(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (cpriv->status.trec & MCP25XXFD_CAN_TREC_TXWARN) {
+		cpriv->bus.new_state = CAN_STATE_ERROR_WARNING;
+		cpriv->error_frame.id |= CAN_ERR_CRTL;
+		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_TX_WARNING;
+	}
+	if (cpriv->status.trec & MCP25XXFD_CAN_TREC_RXWARN) {
+		cpriv->bus.new_state = CAN_STATE_ERROR_WARNING;
+		cpriv->error_frame.id |= CAN_ERR_CRTL;
+		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_RX_WARNING;
+	}
+	if (cpriv->status.trec & MCP25XXFD_CAN_TREC_TXBP) {
+		cpriv->bus.new_state = CAN_STATE_ERROR_PASSIVE;
+		cpriv->error_frame.id |= CAN_ERR_CRTL;
+		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_TX_PASSIVE;
+	}
+	if (cpriv->status.trec & MCP25XXFD_CAN_TREC_RXBP) {
+		cpriv->bus.new_state = CAN_STATE_ERROR_PASSIVE;
+		cpriv->error_frame.id |= CAN_ERR_CRTL;
+		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_RX_PASSIVE;
+	}
+	if (cpriv->status.trec & MCP25XXFD_CAN_TREC_TXBO) {
+		cpriv->bus.new_state = CAN_STATE_BUS_OFF;
+		cpriv->error_frame.id |= CAN_ERR_BUSOFF;
+	}
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_error_handling(struct mcp25xxfd_can_priv *cpriv)
+{
+	/* based on the last state state check the new state */
+	switch (cpriv->can.state) {
+	case CAN_STATE_ERROR_ACTIVE:
+		if (cpriv->bus.new_state >= CAN_STATE_ERROR_WARNING &&
+		    cpriv->bus.new_state <= CAN_STATE_BUS_OFF)
+			cpriv->can.can_stats.error_warning++;
+		/* fallthrough */
+	case CAN_STATE_ERROR_WARNING:
+		if (cpriv->bus.new_state >= CAN_STATE_ERROR_PASSIVE &&
+		    cpriv->bus.new_state <= CAN_STATE_BUS_OFF)
+			cpriv->can.can_stats.error_passive++;
+		break;
+	default:
+		break;
+	}
+	cpriv->can.state = cpriv->bus.new_state;
+
+	/* and send error packet */
+	if (cpriv->error_frame.id)
+		mcp25xxfd_can_int_send_error_skb(cpriv);
+
+	/* handle BUS OFF */
+	if (cpriv->can.state == CAN_STATE_BUS_OFF) {
+		if (cpriv->can.restart_ms == 0) {
+			cpriv->can.can_stats.bus_off++;
+			can_bus_off(cpriv->can.dev);
+		}
+	}
+
+	return 0;
+}
+
+static int mcp25xxfd_can_int_handle_status(struct mcp25xxfd_can_priv *cpriv)
+{
+	int ret;
+
+	/* clear all the interrupts asap - we have them on file allready */
+	ret = mcp25xxfd_can_int_clear_int_flags(cpriv);
+	if (ret)
+		return ret;
+
+	/* set up new state and error frame for this loop */
+	cpriv->bus.new_state = cpriv->bus.state;
+	memset(&cpriv->error_frame, 0, sizeof(cpriv->error_frame));
+
+	/* setup the process queue by clearing the counter */
+	cpriv->fifos.submit_queue_count = 0;
+
+	/* handle interrupts */
+
+	/* system error interrupt needs to get handled first
+	 * to get us out of restricted mode
+	 */
+	ret = mcp25xxfd_can_int_handle_serrif(cpriv);
+	if (ret)
+		return ret;
+
+	/* mode change interrupt */
+	ret = mcp25xxfd_can_int_handle_modif(cpriv);
+	if (ret)
+		return ret;
+
+	/* handle the rx */
+	ret = mcp25xxfd_can_rx_handle_int_rxif(cpriv);
+	if (ret)
+		return ret;
+
+	/* handle error interrupt flags */
+	ret = mcp25xxfd_can_rx_handle_int_rxovif(cpriv);
+	if (ret)
+		return ret;
+
+	/* sram ECC error interrupt */
+	ret = mcp25xxfd_can_int_handle_eccif(cpriv);
+	if (ret)
+		return ret;
+
+	/* message format interrupt */
+	ret = mcp25xxfd_can_int_handle_ivmif(cpriv);
+	if (ret)
+		return ret;
+
+	/* handle bus errors in more detail */
+	ret = mcp25xxfd_can_int_handle_cerrif(cpriv);
+	if (ret)
+		return ret;
+
+	/* error counter handling */
+	ret = mcp25xxfd_can_int_error_counters(cpriv);
+	if (ret)
+		return ret;
+
+	/* error counter handling */
+	ret = mcp25xxfd_can_int_error_handling(cpriv);
+	if (ret)
+		return ret;
+
+	/* and submit can frames to network stack */
+	ret = mcp25xxfd_can_int_submit_frames(cpriv);
+
+	return ret;
+}
+
+irqreturn_t mcp25xxfd_can_int(int irq, void *dev_id)
+{
+	struct mcp25xxfd_can_priv *cpriv = dev_id;
+	int loops, ret;
+
+	/* count interrupt calls */
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, irq_calls);
+
+	/* loop forever unless we need to exit */
+	for (loops = 0; true; loops++) {
+		/* count irq loops */
+		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, irq_loops);
+
+		/* read interrupt status flags in bulk */
+		ret = mcp25xxfd_cmd_read_regs(cpriv->priv->spi,
+					      MCP25XXFD_CAN_INT,
+					      &cpriv->status.intf,
+					      sizeof(cpriv->status));
+		if (ret)
+			return ret;
+
+		/* only act if the IE mask configured has active IF bits
+		 * otherwise the Interrupt line should be deasserted already
+		 * so we can exit the loop
+		 */
+		if (((cpriv->status.intf >> MCP25XXFD_CAN_INT_IE_SHIFT) &
+		       cpriv->status.intf) == 0)
+			break;
+
+		/* handle the status */
+		ret = mcp25xxfd_can_int_handle_status(cpriv);
+		if (ret)
+			return ret;
+
+		/* allow voluntarily rescheduling every so often to avoid
+		 * long CS lows at the end of a transfer on low power CPUs
+		 * avoiding SERR happening
+		 */
+		if (loops % reschedule_int_thread_after == 0) {
+			MCP25XXFD_DEBUGFS_STATS_INCR(cpriv,
+						     irq_thread_rescheduled);
+			cond_resched();
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+int mcp25xxfd_can_int_clear(struct mcp25xxfd_priv *priv)
+{
+	return mcp25xxfd_cmd_write_mask(priv->spi, MCP25XXFD_CAN_INT, 0,
+					MCP25XXFD_CAN_INT_IF_MASK);
+}
+
+int mcp25xxfd_can_int_enable(struct mcp25xxfd_priv *priv, bool enable)
+{
+	struct mcp25xxfd_can_priv *cpriv = priv->cpriv;
+	const u32 mask = MCP25XXFD_CAN_INT_TEFIE |
+		MCP25XXFD_CAN_INT_RXIE |
+		MCP25XXFD_CAN_INT_MODIE |
+		MCP25XXFD_CAN_INT_SERRIE |
+		MCP25XXFD_CAN_INT_IVMIE |
+		MCP25XXFD_CAN_INT_CERRIE |
+		MCP25XXFD_CAN_INT_RXOVIE |
+		MCP25XXFD_CAN_INT_ECCIE;
+	u32 value = cpriv ? cpriv->status.intf : 0;
+	int ret;
+
+	/* apply mask and */
+	value &= ~(MCP25XXFD_CAN_INT_IE_MASK);
+	if (enable)
+		value |= mask;
+
+	/* and write to int register */
+	ret = mcp25xxfd_cmd_write_mask(priv->spi, MCP25XXFD_CAN_INT,
+				       value, mask);
+	if (ret)
+		return ret;
+	if (!cpriv)
+		return 0;
+
+	cpriv->status.intf = value;
+
+	/* enable/disable interrupt handler */
+	if (cpriv->irq.allocated) {
+		if (enable && !cpriv->irq.enabled)
+			enable_irq(cpriv->priv->spi->irq);
+		if (!enable && cpriv->irq.enabled)
+			disable_irq(cpriv->priv->spi->irq);
+		cpriv->irq.enabled = enable;
+	} else {
+		cpriv->irq.enabled = false;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h
new file mode 100644
index 000000000000..cc2ad992c307
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+#ifndef __MCP25XXFD_CAN_INT_H
+#define __MCP25XXFD_CAN_INT_H
+
+#include "mcp25xxfd_priv.h"
+
+int mcp25xxfd_can_int_clear(struct mcp25xxfd_priv *priv);
+int mcp25xxfd_can_int_enable(struct mcp25xxfd_priv *priv, bool enable);
+
+irqreturn_t mcp25xxfd_can_int(int irq, void *dev_id);
+
+#endif /* __MCP25XXFD_CAN_INT_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
new file mode 100644
index 000000000000..99e5d6640ccf
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifndef __MCP25XXFD_CAN_PRIV_H
+#define __MCP25XXFD_CAN_PRIV_H
+
+#include <linux/can/dev.h>
+#include <linux/dcache.h>
+
+#include "mcp25xxfd_priv.h"
+
+#define TX_ECHO_SKB_MAX	32
+
+/* information on each fifo type */
+struct mcp25xxfd_fifo {
+	u32 count;
+	u32 start;
+	u32 size;
+#ifdef CONFIG_DEBUG_FS
+	u64 dlc_usage[16];
+	u64 fd_count;
+#endif /* CONFIG_DEBUG_FS */
+};
+
+/* used for sorting incoming messages */
+struct mcp25xxfd_obj_ts {
+	s32 ts; /* using signed to handle rollover correctly when sorting */
+	u16 fifo;
+};
+
+/* general info on each fifo */
+struct mcp25xxfd_fifo_info {
+	u32 offset;
+	u32 priority;
+#ifdef CONFIG_DEBUG_FS
+	u64 use_count;
+#endif /* CONFIG_DEBUG_FS */
+};
+
+struct mcp25xxfd_can_priv {
+	/* can_priv has to be the first one to be usable with alloc_candev
+	 * which expects struct can_priv to be right at the start of the
+	 * priv structure
+	 */
+	struct can_priv can;
+	struct mcp25xxfd_priv *priv;
+	struct regulator *transceiver;
+
+	/* the can mode currently active */
+	int mode;
+
+	/* interrupt state */
+	struct {
+		int enabled;
+		int allocated;
+	} irq;
+
+	/* can config registers */
+	struct {
+		u32 con;
+		u32 tdc;
+		u32 tscon;
+		u32 tefcon;
+		u32 nbtcfg;
+		u32 dbtcfg;
+	} regs;
+
+	/* can status registers (mostly) - read in one go
+	 * bdiag0 and bdiag1 are optional, but when
+	 * berr counters are requested on a regular basis
+	 * during high CAN-bus load this would trigger the fact
+	 * that spi_sync would get queued for execution in the
+	 * spi thread and the spi handler would not get
+	 * called inline in the interrupt thread without any
+	 * context switches or wakeups...
+	 */
+	struct {
+		u32 intf;
+		/* ASSERT(CAN_INT + 4 == CAN_RXIF) */
+		u32 rxif;
+		/* ASSERT(CAN_RXIF + 4 == CAN_TXIF) */
+		u32 txif;
+		/* ASSERT(CAN_TXIF + 4 == CAN_RXOVIF) */
+		u32 rxovif;
+		/* ASSERT(CAN_RXOVIF + 4 == CAN_TXATIF) */
+		u32 txatif;
+		/* ASSERT(CAN_TXATIF + 4 == CAN_TXREQ) */
+		u32 txreq;
+		/* ASSERT(CAN_TXREQ + 4 == CAN_TREC) */
+		u32 trec;
+	} status;
+
+	/* information of fifo setup */
+	struct {
+		/* define payload size and mode */
+		u32 payload_size;
+		u32 payload_mode;
+
+		/* infos on fifo layout */
+
+		/* info on each fifo */
+		struct mcp25xxfd_fifo_info info[32];
+
+		/* extra info on rx fifo groups */
+		struct mcp25xxfd_fifo rx;
+
+		/* queue of can frames that need to get submitted
+		 * to the network stack during an interrupt loop in one go
+		 * (this gets sorted by timestamp before submission
+		 * and contains both rx frames as well tx frames that have
+		 * gone over the CAN bus successfully
+		 */
+		struct mcp25xxfd_obj_ts submit_queue[32];
+		int  submit_queue_count;
+	} fifos;
+
+	/* statistics exposed via debugfs */
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dir;
+
+	struct {
+		u64 irq_calls;
+		u64 irq_loops;
+		u64 irq_thread_rescheduled;
+
+		u64 int_serr_count;
+		u64 int_serr_rx_count;
+		u64 int_serr_tx_count;
+		u64 int_mod_count;
+		u64 int_rx_count;
+		u64 int_rxov_count;
+		u64 int_ecc_count;
+		u64 int_ivm_count;
+		u64 int_cerr_count;
+
+		u64 rx_reads;
+		u64 rx_reads_prefetched_too_few;
+		u64 rx_reads_prefetched_too_few_bytes;
+		u64 rx_reads_prefetched_too_many;
+		u64 rx_reads_prefetched_too_many_bytes;
+	} stats;
+#endif /* CONFIG_DEBUG_FS */
+
+	/* bus state */
+	struct {
+		u32 state;
+		u32 new_state;
+		u32 bdiag[2];
+	} bus;
+
+	/* can error messages */
+	struct {
+		u32 id;
+		u8  data[8];
+	} error_frame;
+
+	/* a copy of mcp25xxfd-sram in ram */
+	u8 sram[MCP25XXFD_SRAM_SIZE];
+};
+
+#endif /* __MCP25XXFD_CAN_PRIV_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
new file mode 100644
index 000000000000..6b644b02e4e6
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ *
+ * Based on Microchip MCP251x CAN controller driver written by
+ * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
+ */
+
+#include <linux/can/core.h>
+#include <linux/can/dev.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+
+#include "mcp25xxfd_cmd.h"
+#include "mcp25xxfd_can.h"
+#include "mcp25xxfd_can_debugfs.h"
+#include "mcp25xxfd_can_id.h"
+#include "mcp25xxfd_can_priv.h"
+#include "mcp25xxfd_can_rx.h"
+
+/* module parameters */
+unsigned int rx_prefetch_bytes = -1;
+module_param(rx_prefetch_bytes, uint, 0664);
+MODULE_PARM_DESC(rx_prefetch_bytes,
+		 "number of bytes to blindly prefetch when reading a rx-fifo");
+
+static struct sk_buff *
+mcp25xxfd_can_rx_submit_normal_frame(struct mcp25xxfd_can_priv *cpriv,
+				     u32 id, u32 dlc, u8 **data)
+{
+	struct can_frame *frame;
+	struct sk_buff *skb;
+
+	/* allocate frame */
+	skb = alloc_can_skb(cpriv->can.dev, &frame);
+	if (!skb)
+		return NULL;
+
+	/* set id, dlc and flags */
+	frame->can_id = id;
+	frame->can_dlc = dlc;
+
+	/* and set the pointer to data */
+	*data = frame->data;
+
+	return skb;
+}
+
+/* it is almost identical except for the type of the frame... */
+static struct sk_buff *
+mcp25xxfd_can_rx_submit_fd_frame(struct mcp25xxfd_can_priv *cpriv,
+				 u32 id, u32 flags, u32 len, u8 **data)
+{
+	struct canfd_frame *frame;
+	struct sk_buff *skb;
+
+	/* allocate frame */
+	skb = alloc_canfd_skb(cpriv->can.dev, &frame);
+	if (!skb)
+		return NULL;
+
+	/* set id, dlc and flags */
+	frame->can_id = id;
+	frame->len = len;
+	frame->flags |= flags;
+
+	/* and set the pointer to data */
+	*data = frame->data;
+
+	return skb;
+}
+
+int mcp25xxfd_can_rx_submit_frame(struct mcp25xxfd_can_priv *cpriv, int fifo)
+{
+	struct net_device *net = cpriv->can.dev;
+	int addr = cpriv->fifos.info[fifo].offset;
+	struct mcp25xxfd_can_obj_rx *rx =
+		(struct mcp25xxfd_can_obj_rx *)(cpriv->sram + addr);
+	u8 *data = NULL;
+	struct sk_buff *skb;
+	u32 id, dlc, len, flags;
+
+	/* compute the can_id */
+	mcp25xxfd_can_id_from_mcp25xxfd(rx->id, rx->flags, &id);
+
+	/* and dlc */
+	dlc = (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_DLC_MASK) >>
+		MCP25XXFD_CAN_OBJ_FLAGS_DLC_SHIFT;
+	len = can_dlc2len(dlc);
+
+	/* update stats */
+	net->stats.rx_packets++;
+	net->stats.rx_bytes += len;
+	cpriv->fifos.rx.dlc_usage[dlc]++;
+	if (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_FDF)
+		MCP25XXFD_DEBUGFS_INCR(cpriv->fifos.rx.fd_count);
+
+	/* allocate the skb buffer */
+	if (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_FDF) {
+		flags = 0;
+		flags |= (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_BRS) ?
+			CANFD_BRS : 0;
+		flags |= (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_ESI) ?
+			CANFD_ESI : 0;
+		skb = mcp25xxfd_can_rx_submit_fd_frame(cpriv, id, flags,
+						       len, &data);
+	} else {
+		skb = mcp25xxfd_can_rx_submit_normal_frame(cpriv, id,
+							   len, &data);
+	}
+	if (!skb) {
+		netdev_err(net, "cannot allocate RX skb\n");
+		net->stats.rx_dropped++;
+		return -ENOMEM;
+	}
+
+	/* copy the payload data */
+	memcpy(data, rx->data, len);
+
+	/* and submit the frame */
+	netif_rx_ni(skb);
+
+	return 0;
+}
+
+static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
+				       int fifo, int prefetch_bytes)
+{
+	struct spi_device *spi = cpriv->priv->spi;
+	struct net_device *net = cpriv->can.dev;
+	int addr = cpriv->fifos.info[fifo].offset;
+	struct mcp25xxfd_can_obj_rx *rx =
+		(struct mcp25xxfd_can_obj_rx *)(cpriv->sram + addr);
+	int dlc;
+	int len, ret;
+
+	/* we read the header plus prefetch_bytes */
+	ret = mcp25xxfd_cmd_readn(spi, MCP25XXFD_SRAM_ADDR(addr),
+				  rx, sizeof(*rx) + prefetch_bytes);
+	if (ret)
+		return ret;
+
+	/* transpose the headers to CPU format*/
+	rx->id = le32_to_cpu(rx->id);
+	rx->flags = le32_to_cpu(rx->flags);
+	rx->ts = le32_to_cpu(rx->ts);
+
+	/* compute len */
+	dlc = (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_DLC_MASK) >>
+		MCP25XXFD_CAN_OBJ_FLAGS_DLC_SHIFT;
+	len = can_dlc2len(min_t(int, dlc, (net->mtu == CANFD_MTU) ? 15 : 8));
+
+	/* read the remaining data for canfd frames */
+	if (len > prefetch_bytes) {
+		/* update stats */
+		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv,
+					     rx_reads_prefetched_too_few);
+		MCP25XXFD_DEBUGFS_STATS_ADD(cpriv,
+					    rx_reads_prefetched_too_few_bytes,
+					    len - prefetch_bytes);
+		/* here the extra portion reading data after prefetch */
+		ret = mcp25xxfd_cmd_readn(spi,
+					  MCP25XXFD_SRAM_ADDR(addr) +
+					  sizeof(*rx) + prefetch_bytes,
+					  &rx->data[prefetch_bytes],
+					  len - prefetch_bytes);
+		if (ret)
+			return ret;
+	}
+
+	/* update stats */
+	cpriv->stats.rx_reads++;
+	if (len < prefetch_bytes) {
+		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv,
+					     rx_reads_prefetched_too_many);
+		MCP25XXFD_DEBUGFS_STATS_ADD(cpriv,
+					    rx_reads_prefetched_too_many,
+					    prefetch_bytes - len);
+	}
+
+	/* clear the rest of the buffer - just to be safe */
+	memset(rx->data + len, 0, ((net->mtu == CANFD_MTU) ? 64 : 8) - len);
+
+	/* increment the statistics counter */
+	MCP25XXFD_DEBUGFS_INCR(cpriv->fifos.info[fifo].use_count);
+
+	/* add the fifo to the process queues */
+	mcp25xxfd_can_queue_frame(cpriv, fifo, rx->ts);
+
+	/* and clear the interrupt flag for that fifo */
+	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_CAN_FIFOCON(fifo),
+					MCP25XXFD_CAN_FIFOCON_FRESET,
+					MCP25XXFD_CAN_FIFOCON_FRESET);
+}
+
+/* at least in can2.0 mode we can read multiple RX-fifos in one go
+ * in case they are ajactent to each other and thus we can reduce
+ * the number of spi messages produced and this improves spi-bus
+ * usage efficiency.
+ * In canFD mode this may also be possible, but would need some
+ * statistics to decide if it is worth reading a full 64 bytes
+ * in one go.
+ * But those statistics can get used to predict how many bytes
+ * to read together with the can header (which is fixed to 8 at
+ * this very moment.
+ *
+ * notes on the rational here:
+ * * Reading just the CAN header info takes:
+ *   * bytes read
+ *     *  2 bytes command+address
+ *     * 12 bytes data (id, flags, timestamp)
+ *   * so that is at the very least 112 SCK (= 14 byte * 8 SCK/1 byte)
+ *     - on a Raspberry pi 3 for such short requests actually
+ *       126 SCK (=14 byte * 9 SCK/1 byte)
+ *   * some SPI framework overhead which is observed to be 5-10 us
+ *     on a raspberry pi 3 (time between SCK and stop SCK start)
+ *   * with an effective 17.85 MHz SPI clock on a RPI it takes in total:
+ *     it takes 12us = 6us + 6us
+ * * now reading 8 bytes of CAN data (can2.0) takes:
+ *   * bytes read
+ *     *  2 bytes command+address
+ *     *  8 bytes data
+ *   * so that is at the very least 80 SCK (= 10 byte * 8 SCK/1 byte)
+ *     - on a Raspberry pi 3 for such short requests actually
+ *       90 SCK (= 10 byte * 9 SCK/1 byte)
+ *   * some SPI framework overhead which is observed to be 5-10 us
+ *     on a raspberry pi 3 (time between SCK and stop SCK start)
+ *   * with an effective 17.85 MHz SPI clock on a RPI it takes in total:
+ *     it takes 11us = 5.0us + 6us
+ * * now reading CAN header plus 8 bytes of CAN data (can2.0) takes:
+ *   * bytes read
+ *     *  2 bytes command+address
+ *     * 20 bytes data
+ *   * so that is at the very least 176 SCK (= 22 byte * 8 SCK/1 byte)
+ *     - on a Raspberry pi 3 for such short requests actually
+ *       198 SCK (= 22 byte * 9 SCK/1 byte)
+ *   * some SPI framework overhead which is observed to be 5-10 us
+ *     on a raspberry pi 3 (time between SCK and stop SCK start)
+ *   * with an effective 17.85 MHz SPI clock on a RPI it takes in total:
+ *     it takes 17.1us = 11.1us + 6us
+ *   * this is faster than the 2 individual SPI transfers for header
+ *     and data which is in total 23us
+ *     * this is even true for the case where we only have a single
+ *       data byte (DLC=1) - the time here is 19.5us on a RPI3
+ *     * the only time where we are less efficient is for the DLC=0 case.
+ *       but the assumption here is that this is a rare case
+ * To put it into perspective here the full table for a RPI3:
+ * LE 2m  pr0 pr1 pr2 pr3 pr4 pr5  pr6  pr7  pr8 pr12 pr16 pr20 pr24 pr32 pr48
+ *                                                                         pr64
+ *  0  7.1 7.1
+ *  1 14.6    7.6 8.1 8.6 9.1 9.6 10.1 10.6 11.1 13.1
+ *  2 15.1        8.1 8.6 9.1 9.6 10.1 10.6 11.1 13.1
+ *  3 15.6            8.6 9.1 9.6 10.1 10.6 11.1 13.1 15.1
+ *  4 16.1                9.1 9.6 10.1 10.6 11.1 13.1 15.1
+ *  5 16.6                    9.6 10.1 10.6 11.1 13.1 15.1
+ *  6 17.1                        10.1 10.6 11.1 13.1 15.1
+ *  7 17.6                             10.6 11.1 13.1 15.1 17.1
+ *  8 18.1                                  11.1 13.1 15.1 17.1
+ * 12 20.1                                       13.1 15.1 17.1 19.2
+ * 16 22.1                                            15.1 17.1 19.2
+ * 20 24.1                                                 17.1 19.2 23.2
+ * 24 26.2                                                      19.2 23.2
+ * 32 30.2                                                           23.2
+ * 48 38.3                                                                31.3
+ * 64 46.3                                                                 39.3
+ * (Parameters: SPI Clock=17.8MHz, SCK/byte=9, overhead=6us)
+ * Legend:
+ *   LE = length,
+ *   2m    = 2 SPI messages (header+data - except for LEN=0, only header)
+ *  prX/pX = prefecth length times (only shown when < 2m and Len >= Prefetch)
+ *
+ * The diagonal schows the "optimal" time when the size of the Can frame would
+ * be known ahead of time - i.e if it would be possible to define RX reception
+ * filters based on can DLC values
+ *
+ * So for any Can frame except for LEN=0 the prefetch data solution is
+ * better for prefetch of data=12 for CanFD.
+ *
+ * Here another table showing the optimal prefetch limits for SPI speeds
+ * vs overhead_us at 8 or 9 SCLK/byte
+ *
+ * MHZ  2us@8   2us@9   4us@8   4us@9   6us@8   6us@9   8us@8   8us@9
+ * 10.0 8b***   8b***   8b      8b*     12b**   8b*     12b     12b*
+ * 12.5 8b**    8b***   12b***  8b      12b     12b*    16b*    16b**
+ * 15.0 8b**    8b**    12b**   12b***  16b**   12b     20b**   16b
+ * 17.5 8b*     8b*     12b*    12b**   16b     16b**   20b     20b**
+ * 20.0 8b      8b*     16b***  12b*    20b**   16b     24b*    20b
+ * (a * signifies not a full match, but for any length > count(*))
+ *
+ * So 8 bytes prefetch seems to be a very good tradeoff for can frame
+ * except for DLC/LEN=0 frames.
+ * The question here is mainly: how many frames do we have with DLC=0
+ * vs all others.
+ *
+ * With some statistics of recent CAN frames this may be set dynamically
+ * in the future.
+ *
+ * For this to work efficiently we would also need an estimate on
+ * the SPI framework overhead, which is a function of the spi-bus-driver
+ * implementation details, CPU type and speed as well as system load.
+ * Also the effective SPI-clock speed is needed as well as the
+ * number of spi clock cycles it takes for a single byte to get transferred
+ * The bcm283x SOC for example pauses the SPI clock one cycle after
+ * every byte it sends unless the data is fed to the controller by DMA.
+ * (but for short transfers DMA mapping is very expensive and not worth
+ * the effort. PIO and - in some situations - polling is used instead to
+ * reduce the number of interrupts and the need for thread scheduling as
+ * much as possible)
+ *
+ * This also means that for can2.0 only configured interfaces
+ * reading multiple rx fifos is a realistic option of optimization
+ */
+
+int mcp25xxfd_can_rx_read_frames(struct mcp25xxfd_can_priv *cpriv)
+{
+	int i, f, prefetch;
+	int ret;
+
+	/* calculate optimal prefetch to use */
+	if (rx_prefetch_bytes != -1)
+		prefetch = min_t(int, rx_prefetch_bytes,
+				 (cpriv->can.dev->mtu == CANFD_MTU) ? 64 : 8);
+	else
+		prefetch = 8;
+
+	/* we can optimize here */
+	for (i = 0, f = cpriv->fifos.rx.start; i < cpriv->fifos.rx.count;
+	     i++, f++) {
+		if (cpriv->status.rxif & BIT(f)) {
+			/* read the frame */
+			ret = mcp25xxfd_can_rx_read_frame(cpriv, f, prefetch);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+int mcp25xxfd_can_rx_handle_int_rxif(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (!cpriv->status.rxif)
+		return 0;
+
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_rx_count);
+
+	/* read all the fifos */
+	return mcp25xxfd_can_rx_read_frames(cpriv);
+}
+
+int mcp25xxfd_can_rx_handle_int_rxovif(struct mcp25xxfd_can_priv *cpriv)
+{
+	u32 mask = MCP25XXFD_CAN_FIFOSTA_RXOVIF;
+	int ret, i, reg;
+
+	if (!cpriv->status.rxovif)
+		return 0;
+
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, int_rxov_count);
+
+	/* clear all fifos that have an overflow bit set */
+	for (i = 0; i < 32; i++) {
+		if (cpriv->status.rxovif & BIT(i)) {
+			/* clear fifo status */
+			reg = MCP25XXFD_CAN_FIFOSTA(i);
+			ret = mcp25xxfd_cmd_write_mask(cpriv->priv->spi,
+						       reg, 0, mask);
+			if (ret)
+				return ret;
+
+			/* update statistics */
+			cpriv->can.dev->stats.rx_over_errors++;
+			cpriv->can.dev->stats.rx_errors++;
+
+			/* and prepare ERROR FRAME */
+			cpriv->error_frame.id |= CAN_ERR_CRTL;
+			cpriv->error_frame.data[1] |=
+				CAN_ERR_CRTL_RX_OVERFLOW;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h
new file mode 100644
index 000000000000..71953e2f3615
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+
+#ifndef __MCP25XXFD_CAN_RX_H
+#define __MCP25XXFD_CAN_RX_H
+
+#include "mcp25xxfd_priv.h"
+
+int mcp25xxfd_can_rx_submit_frame(struct mcp25xxfd_can_priv *cpriv, int fifo);
+
+int mcp25xxfd_can_rx_handle_int_rxif(struct mcp25xxfd_can_priv *cpriv);
+int mcp25xxfd_can_rx_handle_int_rxovif(struct mcp25xxfd_can_priv *cpriv);
+
+#endif /* __MCP25XXFD_CAN_RX_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c
index 724cc5c45dba..cca9c996b542 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/spi/spi.h>

+#include "mcp25xxfd_can_int.h"
 #include "mcp25xxfd_crc.h"
 #include "mcp25xxfd_ecc.h"
 #include "mcp25xxfd_int.h"
@@ -21,6 +22,9 @@ int mcp25xxfd_int_clear(struct mcp25xxfd_priv *priv)
 	if (ret)
 		return ret;
 	ret = mcp25xxfd_crc_clear_int(priv);
+	if (ret)
+		return ret;
+	ret = mcp25xxfd_can_int_clear(priv);

 	return ret;
 }
@@ -49,12 +53,19 @@ int mcp25xxfd_int_enable(struct mcp25xxfd_priv *priv, bool enable)
 	if (ret)
 		goto out_crc;

+	ret = mcp25xxfd_can_int_enable(priv, enable);
+	if (ret)
+		goto out_ecc;
+
 	/* if we disable interrupts clear interrupt flags last */
 	if (!enable)
 		mcp25xxfd_int_clear(priv);

 	return 0;

+out_ecc:
+	mcp25xxfd_ecc_enable_int(priv, false);
+
 out_crc:
 	mcp25xxfd_crc_enable_int(priv, false);
 out:
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
index 02f7ea2be4e2..e95a8eef70d8 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
@@ -23,10 +23,12 @@ enum mcp25xxfd_model {
 	CAN_MCP2517FD	= 0x2517,
 };

+struct mcp25xxfd_can_priv;
 struct mcp25xxfd_priv {
 	struct spi_device *spi;
 	struct clk *clk;
 	struct gpio_chip gpio;
+	struct mcp25xxfd_can_priv *cpriv;

 	/* the actual model of the mcp25xxfd */
 	enum mcp25xxfd_model model;
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h
index b500cb46b9a4..222527439c70 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h
@@ -653,4 +653,9 @@ struct mcp25xxfd_can_obj_tef {
 		MCP25XXFD_CAN_FLAGS_FILHIT_BITS - 1,			\
 		MCP25XXFD_CAN_FLAGS_FILHIT_SHIFT)

+/* custom status error */
+#define MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_SERR_RX BIT(0)
+#define MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_SERR_TX BIT(1)
+#define MCP25XXFD_CAN_ERR_DATA7_MCP25XXFD_ECC	  BIT(2)
+
 #endif /* __MCP25XXFD_REGS_H */
--
2.11.0
