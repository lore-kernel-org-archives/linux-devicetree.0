Return-Path: <SRS0=wFgJ=P5=grandegger.com=wg@kernel.org>
Subject: Re: [PATCH V5 4/4] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD
 driver
References: <20181221092950.14192-1-kernel@martin.sperl.org>
 <20181221092950.14192-5-kernel@martin.sperl.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <b5b4ad96-cb34-ea40-381f-ed621abe84ee@grandegger.com>
Date: Mon, 21 Jan 2019 19:32:15 +0100
MIME-Version: 1.0
In-Reply-To: <20181221092950.14192-5-kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: kernel@martin.sperl.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
List-ID: <devicetree@vger.kernel.org>


Am 21.12.18 um 10:29 schrieb kernel@martin.sperl.org:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> Add un-optimized Can2.0 and CanFD support.
> 
> Optimizations and HW-bug-workarounds are separate patches
> 
> On a Rasperry pi 3 it is already able to process Can2.0 Frames
> with DLC=0 on a CAN bus with 1MHz. without losing any packets
> on the SPI side. Packets still get lost inside the network stack.
> 
> As for transmission on a Rpi3 we can saturate the CAN bus at 1MHz
> with Can2.0 frames with DLC=0 for the number of configured tx-fifos.
> Afterwards we need some time to recover the state before we can
> fill in the fifos again.
> 
> With 7 tx fifos we can: send those 7 frames in 0.33ms and then we
> wait for 0.26ms so that is a 56% duty cycle.
> 
> With 24 tx fifos this changes to: 1.19ms for 24 frames and then we
> wait for 0.52ms so that is a 70% duty cycle.
> 
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> 
> ---
> 
> Changelog:
>   V1 -> V2: new more generic name based on feedback from microchip
>             cleanup of code (checkpatch)
>             address all feedback on code
>             prepare code for GPIO handling (separate patches)
>             handle systemerrors in a much better/reliable way
>   V2 -> V3: added vendor-prefix for gpio-opendrain
>   V3 -> V4: resend
>   V4 -> V5: split can driver into a separate patch
>             code cleanup/rewrite
> 
> ---
>  drivers/net/can/spi/mcp25xxfd/Makefile             |   4 +
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h          |  36 +
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c     |  52 +-
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c      | 593 ++++++++++++++-
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h      | 275 ++++++-
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c | 479 ++++++++++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c  | 723 ++++++++++++++++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 208 ++++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c   | 824 +++++++++++++++++++++

As already mentioned, please provide header files for
mcp25xxfd_can_[fifo|int|rx|tx].c.

>  9 files changed, 3160 insertions(+), 34 deletions(-)
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
> 
> diff --git a/drivers/net/can/spi/mcp25xxfd/Makefile b/drivers/net/can/spi/mcp25xxfd/Makefile
> index 5dd7f13674ec..6a27cec424de 100644
> --- a/drivers/net/can/spi/mcp25xxfd/Makefile
> +++ b/drivers/net/can/spi/mcp25xxfd/Makefile
> @@ -4,4 +4,8 @@
>  obj-$(CONFIG_CAN_MCP25XXFD)	+= mcp25xxfd.o
>  mcp25xxfd-objs                  := mcp25xxfd_base.o
>  mcp25xxfd-objs                  += mcp25xxfd_can.o
> +mcp25xxfd-objs                  += mcp25xxfd_can_fifo.o
> +mcp25xxfd-objs                  += mcp25xxfd_can_int.o
> +mcp25xxfd-objs                  += mcp25xxfd_can_rx.o
> +mcp25xxfd-objs                  += mcp25xxfd_can_tx.o
>  mcp25xxfd-objs                  += mcp25xxfd_gpio.o

Fits on less lines!

> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
> index 73817a567219..624602ca898f 100644
> --- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
> @@ -107,6 +107,7 @@ enum mcp25xxfd_model {
> 
>  struct mcp25xxfd_priv {
>  	struct spi_device *spi;
> +	struct net_device *net;
>  	struct gpio_chip *gpio;
>  	struct clk *clk;
> 
> @@ -154,6 +155,11 @@ struct mcp25xxfd_priv {
>  		u32 ecccon;
>  	} regs;
> 
> +	/* flag to see if the irq is enabled */
> +	struct {
> +		int enabled;
> +	} irq;
> +
>  	/* debugfs related */
>  #if defined(CONFIG_DEBUG_FS)
>  	struct dentry *debugfs_dir;
> @@ -188,6 +194,28 @@ static inline void mcp25xxfd_convert_from_cpu(u32 *data, int n)
>  		data[i] = cpu_to_le32(data[i]);
>  }
> 
> +static inline void mcp25xxfd_calc_cmd_addr(u16 cmd, u16 addr, u8 *data)
> +{
> +	cmd = cmd | (addr & ADDRESS_MASK);
> +
> +	data[0] = (cmd >> 8) & 0xff;
> +	data[1] = (cmd >> 0) & 0xff;
> +}
> +
> +static inline int mcp25xxfd_first_byte(u32 mask)
> +{
> +	return (mask & 0x0000ffff) ?
> +		((mask & 0x000000ff) ? 0 : 1) :
> +		((mask & 0x00ff0000) ? 2 : 3);
> +}
> +
> +static inline int mcp25xxfd_last_byte(u32 mask)
> +{
> +	return (mask & 0xffff0000) ?
> +		((mask & 0xff000000) ? 3 : 2) :
> +		((mask & 0x0000ff00) ? 1 : 0);
> +}
> +
>  int mcp25xxfd_cmd_readn(struct spi_device *spi, u32 reg,
>  			void *data, int n);
>  int mcp25xxfd_cmd_read_mask(struct spi_device *spi, u32 reg,
> @@ -233,11 +261,19 @@ int mcp25xxfd_can_hw_probe(struct spi_device *spi);
>  /* clearing interrupt flags */
>  int mcp25xxfd_clear_crc_interrupts(struct spi_device *spi);
>  int mcp25xxfd_clear_ecc_interrupts(struct spi_device *spi);
> +int mcp25xxfd_clear_can_interrupts(struct spi_device *spi);
>  int mcp25xxfd_clear_interrupts(struct spi_device *spi);
> 
>  /* enabling interrupts */
>  int mcp25xxfd_enable_interrupts(struct spi_device *spi, bool enable);
> +int mcp25xxfd_enable_can_interrupts(struct spi_device *spi, bool enable);
> 
>  /* gpiolib support */
>  int mcp25xxfd_gpio_setup(struct spi_device *spi);
>  void mcp25xxfd_gpio_remove(struct spi_device *spi);
> +
> +/* can support */
> +int mcp25xxfd_can_setup(struct spi_device *spi);
> +void mcp25xxfd_can_remove(struct spi_device *spi);
> +int mcp25xxfd_can_suspend(struct spi_device *spi);
> +int mcp25xxfd_can_resume(struct spi_device *spi);
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
> index b0851d97bcbb..63c69139cfdf 100644
> --- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
> @@ -226,28 +226,6 @@ static int mcp25xxfd_write_then_write(struct spi_device *spi,
> 
>  /* mcp25xxfd spi command/protocol helper */
> 
> -static void mcp25xxfd_calc_cmd_addr(u16 cmd, u16 addr, u8 *data)
> -{
> -	cmd = cmd | (addr & ADDRESS_MASK);
> -
> -	data[0] = (cmd >> 8) & 0xff;
> -	data[1] = (cmd >> 0) & 0xff;
> -}
> -
> -static int mcp25xxfd_first_byte(u32 mask)
> -{
> -	return (mask & 0x0000ffff) ?
> -		((mask & 0x000000ff) ? 0 : 1) :
> -		((mask & 0x00ff0000) ? 2 : 3);
> -}
> -
> -static int mcp25xxfd_last_byte(u32 mask)
> -{
> -	return (mask & 0xffff0000) ?
> -		((mask & 0xff000000) ? 3 : 2) :
> -		((mask & 0x0000ff00) ? 1 : 0);
> -}
> -
>  /* read multiple bytes, transform some registers */
>  int mcp25xxfd_cmd_readn(struct spi_device *spi, u32 reg,
>  			void *data, int n)
> @@ -508,6 +486,7 @@ int mcp25xxfd_clear_interrupts(struct spi_device *spi)
>  {
>  	mcp25xxfd_clear_ecc_interrupts(spi);
>  	mcp25xxfd_clear_crc_interrupts(spi);
> +	mcp25xxfd_clear_can_interrupts(spi);
> 
>  	return 0;
>  }
> @@ -542,7 +521,7 @@ static int mcp25xxfd_enable_crc_interrupts(struct spi_device *spi,
>  int mcp25xxfd_enable_interrupts(struct spi_device *spi,
>  				bool enable)

I have some problems with your modularisation/abstraction! Why do the
functions of the interface "mcp25xxfd_base" use "spi" as main argument
and not "priv"? "priv" has already "priv->spi". There are even functions
which do not use "spi" at all! This could also save a lot of ...

>  {
> -	/* error handling only on enable for this function */
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);

... the line above.

>  	int ret = 0;
> 
>  	/* if we enable clear interrupt flags first */
> @@ -559,6 +538,21 @@ int mcp25xxfd_enable_interrupts(struct spi_device *spi,
>  	if (enable && ret)
>  		goto out_ecc;
> 
> +	ret = mcp25xxfd_enable_can_interrupts(spi, enable);
> +	if (enable && ret)
> +		goto out_ecc;
> +
> +	/* enable/disable interrupt as required */
> +	if (enable) {
> +		if (!priv->irq.enabled)
> +			enable_irq(spi->irq);
> +	} else {
> +		if (priv->irq.enabled)
> +			disable_irq(spi->irq);
> +	}
> +	/* mark enabled/disabled */
> +	priv->irq.enabled = enable;
> +
>  	/* if we disable interrupts clear interrupt flags last */
>  	if (!enable) 
>  		mcp25xxfd_clear_interrupts(spi);
> @@ -1110,15 +1104,22 @@ static int mcp25xxfd_probe(struct spi_device *spi)
>  	if (ret)
>  		goto out_debugfs;
> 
> +	/* add can (depends on debugfs) */
> +	ret = mcp25xxfd_can_setup(spi);
> +	if (ret)
> +		goto out_gpio;
> +
>  	/* and put controller to sleep by stopping the can clock */
>  	ret = mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
>  	if (ret)
> -		goto out_gpio;
> +		goto out_can;
> 
>  	dev_info(&spi->dev,
>  		 "MCP%x successfully initialized.\n", priv->model);
>  	return 0;
> 
> +out_can:
> +	mcp25xxfd_can_remove(spi);
>  out_gpio:
>  	mcp25xxfd_gpio_remove(spi);
>  out_debugfs:
> @@ -1139,6 +1140,9 @@ static int mcp25xxfd_remove(struct spi_device *spi)
>  {
>  	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> 
> +	/* remove can */
> +	mcp25xxfd_can_remove(spi);
> +
>  	/* remove gpio */
>  	mcp25xxfd_gpio_remove(spi);
> 
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> index e5c7098a09c2..e827edb37da8 100644
> --- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> @@ -43,18 +43,160 @@
> 
>  /* Implementation notes:
>   *
> - * Right now we only use the CAN controller block to put us into deep sleep
> - * this means that the oscillator clock is turned off.
> - * So this is the only thing that we implement here right now
> + * * the can related portion of the driver is split out into
> + *   * basic configuration (mcp25xxfd_can.c)
> + *   * can fifo configuration (mcp25xxfd_can_fifo.c)
> + *   * can interrupt handling (mcp25xxfd_can_int.c)
> + *   * can reception including interrupt handling (mcp25xxfd_can_rx.c)
> + *   * can transmission including interrupt handling (mcp25xxfd_can_tx.c)
> + * * the interrupt handler trys to issue the smallest amount of
> + *   spi messages to avoid spi stack overhead. for that it is more agressive
> + *   when reading registers that are close to each other - e.g:
> + *   * if there is one register that is not really needed then it will
> + *     still read it to avoid the startup and teardown costs of the
> + *     spi stack which results in latencies.
> + *   * when in can2.0 mode it will read all 8 data bytes even if DLC = 0
> + *     the header on its own is 12 bytes and then there are 2 bytes for
> + *     the spi overhead so the effecitve worsted case overhead introduced

Typo

> + *     is +57%
> + * * due to the reordering inside the controller the Transmission queue
> + *   feature is not used (it also makes the "next" frame freed less
> + *   predictable which would complicate the code as well.
> + *   the only advantage seen is that one could have more transmission
> + *   slots in the case of CAN2.0 only.
> + * * transmissions are instead handled by fixed priority fifos that can
> + *   get filled and triggered asyncronously.

Typo

> + *   The biggest drawback is that we are unable to sustain 100% CAN bus
> + *   usage for more than the <number of can fifos allocated> frames.
> + *   This means that we can have a duty cycle of about 7/8th of the CAN bus
> + *   (unless more fifos are reserved for transmission)
> + *   The only situation where this would be observable in real live
> + *   would be big transfers (for firmware updates or similar)
> + *   * this could have been better supported with a better
> + *     layout of FIFOCON, so that TXREQ and TXPRIO can be written
> + *     in a single transfer without a race condition
> + * * can transmissions are handled by using spi_async for submission and
> + *   scheduling. This somewhat impacts interrupt handling as some spi_sync
> + *   calls will defer to the spi kthread resulting in some context switches.
> + *   which introduces some latencies.
> + * * some special features of the can controller can only get configured
> + *   by the use of module parameters (some of which are changeable at
> + *   runtime via sysfs) due to the fact that netlink does not support:
> + *   * 3-shot submission
> + *   * selection of number of fifos
> + *   * configuarble delay between transmission of two can frames so that

Typo

> + *     the can bus is not monopolized by this device.
> + *   also some debug settings are controlable via modules.

Typo.

>   */
> 
>  #include "mcp25xxfd_can.h"

Specifying that first is unusal. What is your motivation to do so?

> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>

A few of them are already in "mcp25xxfd_can.h".

> 
> -static int mcp25xxfd_can_get_mode(struct spi_device *spi,
> -				  u32 *mode_data)
> +/* module parameters */
> +unsigned int bw_sharing_log2bits;
> +module_param(bw_sharing_log2bits, uint, 0664);
> +MODULE_PARM_DESC(bw_sharing_log2bits,
> +		 "Delay between 2 transmissions in number of arbitration bit times\n");
> +/* everything related to bit timing */
> +static
> +const struct can_bittiming_const mcp25xxfd_can_nominal_bittiming_const = {
> +	.name           = DEVICE_NAME,
> +	.tseg1_min      = 2,
> +	.tseg1_max      = BIT(CAN_NBTCFG_TSEG1_BITS),
> +	.tseg2_min      = 1,
> +	.tseg2_max      = BIT(CAN_NBTCFG_TSEG2_BITS),
> +	.sjw_max        = BIT(CAN_NBTCFG_SJW_BITS),
> +	.brp_min        = 1,
> +	.brp_max        = BIT(CAN_NBTCFG_BRP_BITS),
> +	.brp_inc        = 1,
> +};
> +
> +static
> +const struct can_bittiming_const mcp25xxfd_can_data_bittiming_const = {
> +	.name           = DEVICE_NAME,
> +	.tseg1_min      = 1,
> +	.tseg1_max      = BIT(CAN_DBTCFG_TSEG1_BITS),
> +	.tseg2_min      = 1,
> +	.tseg2_max      = BIT(CAN_DBTCFG_TSEG2_BITS),
> +	.sjw_max        = BIT(CAN_DBTCFG_SJW_BITS),
> +	.brp_min        = 1,
> +	.brp_max        = BIT(CAN_DBTCFG_BRP_BITS),
> +	.brp_inc        = 1,

Just one space before and after "=".

> +};
> +
> +static int mcp25xxfd_can_do_set_nominal_bittiming(struct net_device *net)
> +{

The same question here, why are the functions of the module
"mcp25xxfd_can" use "struct net_device" as main argument and not "struct
mcp25xxfd_can_priv"?

> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct can_bittiming *bt = &cpriv->can.bittiming;
> +	struct spi_device *spi = priv->spi;
> +
> +	int sjw = bt->sjw;
> +	int pseg2 = bt->phase_seg2;
> +	int pseg1 = bt->phase_seg1;
> +	int propseg = bt->prop_seg;
> +	int brp = bt->brp;
> +
> +	int tseg1 = propseg + pseg1;
> +	int tseg2 = pseg2;
> +
> +	/* calculate nominal bit timing */
> +	cpriv->regs.nbtcfg = ((sjw - 1) << CAN_NBTCFG_SJW_SHIFT) |
> +		((tseg2 - 1) << CAN_NBTCFG_TSEG2_SHIFT) |
> +		((tseg1 - 1) << CAN_NBTCFG_TSEG1_SHIFT) |
> +		((brp - 1) << CAN_NBTCFG_BRP_SHIFT);
> +
> +	return mcp25xxfd_cmd_write(spi, CAN_NBTCFG,
> +				   cpriv->regs.nbtcfg);

This function does not even use "net".

> +}
> +
> +static int mcp25xxfd_can_do_set_data_bittiming(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct can_bittiming *bt = &cpriv->can.data_bittiming;
> +	struct spi_device *spi = priv->spi;
> +
> +	int sjw = bt->sjw;
> +	int pseg2 = bt->phase_seg2;
> +	int pseg1 = bt->phase_seg1;
> +	int propseg = bt->prop_seg;
> +	int brp = bt->brp;
> +
> +	int tseg1 = propseg + pseg1;
> +	int tseg2 = pseg2;
> +
> +	int ret;
> +
> +	/* set up Transmitter delay compensation */
> +	if (!cpriv->regs.tdc)
> +		cpriv->regs.tdc = CAN_TDC_EDGFLTEN |
> +			(CAN_TDC_TDCMOD_AUTO << CAN_TDC_TDCMOD_SHIFT);
> +	ret = mcp25xxfd_cmd_write(spi, CAN_TDC, cpriv->regs.tdc);
> +	if (ret)
> +		return ret;
> +
> +	/* calculate nominal bit timing */
> +	cpriv->regs.dbtcfg = ((sjw - 1) << CAN_DBTCFG_SJW_SHIFT) |
> +		((tseg2 - 1) << CAN_DBTCFG_TSEG2_SHIFT) |
> +		((tseg1 - 1) << CAN_DBTCFG_TSEG1_SHIFT) |
> +		((brp - 1) << CAN_DBTCFG_BRP_SHIFT);
> +
> +	return mcp25xxfd_cmd_write(spi, CAN_DBTCFG,
> +				   cpriv->regs.dbtcfg);
> +}
> +
> +/* configuration functions that are used by the base during initialization */
> +int mcp25xxfd_can_get_mode(struct spi_device *spi, u32 *mode_data)
>  {
>  	int ret;
> 
> @@ -65,11 +207,11 @@ static int mcp25xxfd_can_get_mode(struct spi_device *spi,
>  	return (*mode_data & CAN_CON_OPMOD_MASK) >> CAN_CON_OPMOD_SHIFT;
>  }
> 
> -int mcp25xxfd_can_switch_mode(struct spi_device *spi,
> -			      u32 *mode_data, int mode)
> +int mcp25xxfd_can_switch_mode_nowait(struct spi_device *spi,
> +				     u32 *mode_data, int mode)
>  {
>  	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> -	int ret, i;
> +	int ret;
> 
>  	/* get the current mode/register - if mode_data is -1
>  	 * this only happens during initialization phase
> @@ -98,7 +240,16 @@ int mcp25xxfd_can_switch_mode(struct spi_device *spi,
>  	}
> 
>  	/* request the mode switch */
> -	ret = mcp25xxfd_cmd_write(spi, CAN_CON, *mode_data);
> +	return mcp25xxfd_cmd_write(spi, CAN_CON, *mode_data);
> +}
> +
> +int mcp25xxfd_can_switch_mode(struct spi_device *spi,
> +			      u32 *mode_data, int mode)
> +{
> +	int ret, i;
> +
> +	/* trigger the mode switch itself */
> +	ret = mcp25xxfd_can_switch_mode_nowait(spi, mode_data, mode);
>  	if (ret)
>  		return ret;
> 
> @@ -226,3 +377,427 @@ int mcp25xxfd_can_hw_probe(struct spi_device *spi)
>  	/* check that modeswitch is really working */
>  	return mcp25xxfd_can_hw_probe_modeswitch(spi);
>  }
> +
> +/* debugfs related */
> +#if defined(CONFIG_DEBUG_FS)

As already mentioned, could you please move the DEBUG_FS part to
mcp25xxfd_debugfs.[ch].

> +
> +static int mcp25xxfd_can_dump_all_regs(struct seq_file *file, void *offset)
> +{
> +	return mcp25xxfd_dump_regs_range(file, CAN_CON, CAN_FLTMASK(31));
> +}
> +
> +static int mcp25xxfd_can_dump_regs(struct seq_file *file, void *offset)
> +{
> +	return mcp25xxfd_dump_regs_range(file, CAN_CON, CAN_TXQUA);
> +}
> +
> +static void mcp25xxfd_can_debugfs_add(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(priv->net);
> +	struct dentry *root = priv->debugfs_dir;
> +	struct dentry *cregs, *cstatus, *cfifotef, *cstats;
> +
> +	/* export config registers */
> +	cregs = debugfs_create_dir("can_regs", root);
> +	debugfs_create_x32("con",    0444, cregs, &cpriv->regs.con);
> +	debugfs_create_x32("tdc",    0774, cregs, &cpriv->regs.tdc);
> +	debugfs_create_x32("tscon",  0444, cregs, &cpriv->regs.tscon);
> +	debugfs_create_x32("tefcon", 0444, cregs, &cpriv->regs.tscon);
> +	debugfs_create_x32("nbtcfg", 0444, cregs, &cpriv->regs.nbtcfg);
> +	debugfs_create_x32("dbtcfg", 0444, cregs, &cpriv->regs.dbtcfg);
> +
> +	/* export status registers */
> +	cstatus = debugfs_create_dir("can_status", root);
> +	debugfs_create_x32("intf",    0444, cstatus,
> +			   &cpriv->status.intf);
> +	debugfs_create_x32("rx_if",   0444, cstatus,
> +			   &cpriv->status.rxif);
> +	debugfs_create_x32("tx_if",   0444, cstatus,
> +			   &cpriv->status.txif);
> +	debugfs_create_x32("rx_ovif", 0444, cstatus,
> +			   &cpriv->status.rxovif);
> +	debugfs_create_x32("tx_atif", 0444, cstatus,
> +			   &cpriv->status.txatif);
> +	debugfs_create_x32("tx_req",  0444, cstatus,
> +			   &cpriv->status.txreq);
> +	debugfs_create_x32("trec",    0444, cstatus,
> +			   &cpriv->status.trec);
> +
> +	cfifotef = debugfs_create_dir("can_tef", root);
> +	debugfs_create_u32("count",  0444, cfifotef,
> +			   &cpriv->fifos.tef.count);
> +	debugfs_create_u32("size",  0444, cfifotef,
> +			   &cpriv->fifos.tef.size);
> +
> +	/* dump the controller registers themselves */
> +	debugfs_create_devm_seqfile(&priv->spi->dev, "can_regs_live_dump",
> +				    root, mcp25xxfd_can_dump_regs);
> +	debugfs_create_devm_seqfile(&priv->spi->dev, "can_regs_full_live_dump",
> +				    root, mcp25xxfd_can_dump_all_regs);
> +
> +	/* and stats */
> +	cstats = debugfs_create_dir("can_stats", root);
> +# define DEBUGFS_CREATE(name, var) \
> +	debugfs_create_u64(name,  0444, cstats, &cpriv->stats.var)
> +	DEBUGFS_CREATE("int_calls",		 irq_calls);
> +	DEBUGFS_CREATE("int_loops",		 irq_loops);
> +	DEBUGFS_CREATE("int_system_error",	 int_serr_count);
> +	DEBUGFS_CREATE("int_system_error_tx",	 int_serr_tx_count);
> +	DEBUGFS_CREATE("int_system_error_rx",	 int_serr_rx_count);
> +	DEBUGFS_CREATE("int_mode_switch",	 int_mod_count);
> +	DEBUGFS_CREATE("int_rx",		 int_rx_count);
> +	DEBUGFS_CREATE("int_tx_attempt",	 int_txat_count);
> +	DEBUGFS_CREATE("int_tef",		 int_tef_count);
> +	DEBUGFS_CREATE("int_rx_overflow",	 int_rxov_count);
> +	DEBUGFS_CREATE("int_ecc_error",		 int_ecc_count);
> +	DEBUGFS_CREATE("int_rx_invalid_message", int_ivm_count);
> +	DEBUGFS_CREATE("int_crcerror",		 int_cerr_count);
> +
> +	DEBUGFS_CREATE("tx_frames_fd",		 tx_fd_count);
> +	DEBUGFS_CREATE("tx_frames_brs",		 tx_brs_count);

This function does not use "spi"! The argument is really misleading.

> +#undef DEBUGFS_CREATE
> +}
> +#else
> +static void mcp25xxfd_can_debugfs_add(struct spi_device *spi)
> +{
> +}
> +#endif
> +
> +int mcp25xxfd_clear_can_interrupts(struct spi_device *spi)
> +{
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_INT, 0, CAN_INT_IF_MASK);
> +}
> +
> +int mcp25xxfd_enable_can_interrupts(struct spi_device *spi, bool enable)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct mcp25xxfd_can_priv *cpriv = priv->net ?
> +		netdev_priv(priv->net) : NULL;
> +	const u32 mask = CAN_INT_TEFIE |
> +		CAN_INT_RXIE |
> +		CAN_INT_MODIE |
> +		CAN_INT_SERRIE |
> +		CAN_INT_IVMIE |
> +		CAN_INT_CERRIE |
> +		CAN_INT_RXOVIE |
> +		CAN_INT_ECCIE;

Fits on less lines.

> +	u32 value = cpriv ? cpriv->status.intf : 0;
> +
> +	/* apply mask and */
> +	value &= ~(CAN_INT_IE_MASK);
> +	if (enable)
> +		value |= mask;
> +	/* write back if net is set up */
> +	if (cpriv)
> +		cpriv->status.intf = value;
> +
> +	/* and write to int register */
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_INT, value, mask);
> +}
> +
> +static int mcp25xxfd_can_config(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	int ret;
> +
> +	/* setup value of con_register */
> +	cpriv->regs.con = CAN_CON_STEF; /* enable TEF, disable TXQUEUE */
> +
> +	/* transmission bandwidth sharing bits */
> +	if (bw_sharing_log2bits > 12)
> +		bw_sharing_log2bits = 12;
> +	cpriv->regs.con |= bw_sharing_log2bits << CAN_CON_TXBWS_SHIFT;
> +
> +	/* non iso FD mode */
> +	if (!(cpriv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO))
> +		cpriv->regs.con |= CAN_CON_ISOCRCEN;
> +
> +	/* one shot */
> +	if (cpriv->can.ctrlmode & CAN_CTRLMODE_ONE_SHOT)
> +		cpriv->regs.con |= CAN_CON_RTXAT;
> +
> +	/* apply it now together with a mode switch */
> +	ret = mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +					CAN_CON_MODE_CONFIG);
> +	if (ret)
> +		return 0;
> +
> +	/* time stamp control register - 1ns resolution */
> +	cpriv->regs.tscon = 0;
> +	ret = mcp25xxfd_cmd_write(spi, CAN_TBC, 0);
> +	if (ret)
> +		return ret;
> +
> +	cpriv->regs.tscon = CAN_TSCON_TBCEN |
> +		((cpriv->can.clock.freq / 1000000)
> +		 << CAN_TSCON_TBCPRE_SHIFT);
> +	ret = mcp25xxfd_cmd_write(spi, CAN_TSCON, cpriv->regs.tscon);
> +	if (ret)
> +		return ret;
> +
> +	/* setup fifos */
> +	ret = mcp25xxfd_can_setup_fifos(net);
> +	if (ret)
> +		return ret;
> +
> +	/* setup can bittiming now - the do_set_bittiming methods
> +	 * are not used as they get callled before open

Typo.

> +	 */
> +	ret = mcp25xxfd_can_do_set_nominal_bittiming(net);
> +	if (ret)
> +		return ret;
> +	ret = mcp25xxfd_can_do_set_data_bittiming(net);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static void mcp25xxfd_can_shutdown(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +
> +	/* switch us to CONFIG mode - this disables the controller */
> +	mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +				  CAN_CON_MODE_CONFIG);
> +}
> +
> +/* all ops */
> +
> +/* open and stop */
> +static int mcp25xxfd_can_open(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	int ret;
> +
> +	netdev_err(net, "OPEN\n");

What's that good for? Please remove debugging code.

> +
> +	ret = open_candev(net);
> +	if (ret) {
> +		netdev_err(net, "unable to set initial baudrate!\n");
> +		return ret;
> +	}
> +
> +	/* clear those statistics */
> +	memset(&cpriv->stats, 0, sizeof(cpriv->stats));
> +
> +	/* request an IRQ but keep disabled for now */
> +	ret = request_threaded_irq(spi->irq, NULL,
> +				   mcp25xxfd_can_int,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +				   DEVICE_NAME, priv);

Why "priv", the mcp25xxfd_can_int() needs "cpriv" in the first place.

> +	if (ret) {
> +		dev_err(&spi->dev, "failed to acquire irq %d - %i\n",
> +			spi->irq, ret);
> +		goto out_candev;
> +	}
> +	disable_irq(spi->irq);
> +	priv->irq.enabled = false;
> +
> +	/* enable power to the transceiver */
> +	ret = mcp25xxfd_power_enable(cpriv->transceiver, 1);
> +	if (ret)
> +		goto out_irq;
> +
> +	/* enable clock (so that spi works) */
> +	ret = mcp25xxfd_start_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +	if (ret)
> +		goto out_transceiver;
> +
> +	/* configure controller for reception */
> +	ret = mcp25xxfd_can_config(net);
> +	if (ret)
> +		goto out_canclock;
> +
> +	/* setting up state */
> +	cpriv->can.state = CAN_STATE_ERROR_ACTIVE;
> +
> +	/* enable interrupts */
> +	ret = mcp25xxfd_enable_interrupts(spi, true);
> +	if (ret)
> +		goto out_canconfig;
> +
> +	/* switch to active mode */
> +	ret = mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +					(net->mtu == CAN_MTU) ?
> +					CAN_CON_MODE_CAN2_0 :
> +					CAN_CON_MODE_MIXED);
> +	if (ret)
> +		goto out_int;
> +
> +	/* start the tx_queue */
> +	mcp25xxfd_can_tx_queue_manage(net, TX_QUEUE_STATE_STARTED);
> +
> +	return 0;
> +
> +out_int:
> +	mcp25xxfd_enable_interrupts(spi, false);
> +out_canconfig:
> +	mcp25xxfd_can_release_fifos(net);
> +out_canclock:
> +	mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +out_transceiver:
> +	mcp25xxfd_power_enable(cpriv->transceiver, 0);
> +out_irq:
> +	free_irq(spi->irq, priv);
> +out_candev:
> +	close_candev(net);
> +	return ret;
> +}
> +
> +static int mcp25xxfd_can_stop(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +
> +	netdev_err(net, "STOP\n");
> +
> +	/* stop transmit queue */
> +	mcp25xxfd_can_tx_queue_manage(net, TX_QUEUE_STATE_STOPPED);
> +
> +	/* release debugfs */
> +	mcp25xxfd_can_release_fifos(net);
> +
> +	/* shutdown the can controller */
> +	mcp25xxfd_can_shutdown(net);
> +
> +	/* disable inerrupts on controller */
> +	mcp25xxfd_enable_interrupts(spi, false);
> +
> +	/* stop the clock */
> +	mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +
> +	/* and disable the transceiver */
> +	mcp25xxfd_power_enable(cpriv->transceiver, 0);
> +
> +	/* disable interrupt on host */
> +	free_irq(spi->irq, priv);
> +	priv->irq.enabled = false;
> +
> +	/* close the can_decice */
> +	close_candev(net);
> +
> +	return 0;
> +}
> +
> +/* mode setting */
> +static int mcp25xxfd_can_do_set_mode(struct net_device *net,
> +				     enum can_mode mode)
> +{
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +/* binary error counters */
> +static int mcp25xxfd_can_get_berr_counter(const struct net_device *net,
> +					  struct can_berr_counter *bec)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	bec->txerr = (cpriv->status.trec & CAN_TREC_TEC_MASK) >>
> +		CAN_TREC_TEC_SHIFT;
> +	bec->rxerr = (cpriv->status.trec & CAN_TREC_REC_MASK) >>
> +		CAN_TREC_REC_SHIFT;
> +
> +	return 0;
> +}
> +
> +static const struct net_device_ops mcp25xxfd_netdev_ops = {
> +	.ndo_open = mcp25xxfd_can_open,
> +	.ndo_stop = mcp25xxfd_can_stop,
> +	.ndo_start_xmit = mcp25xxfd_can_start_xmit,
> +	.ndo_change_mtu = can_change_mtu,
> +};
> +
> +/* probe and remove */
> +int mcp25xxfd_can_setup(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct mcp25xxfd_can_priv *cpriv;
> +	struct net_device *net;
> +	struct regulator *transceiver;
> +	int ret;
> +
> +	/* get transceiver power regulator*/
> +	transceiver = devm_regulator_get_optional(&spi->dev,
> +						  "xceiver");
> +	if (PTR_ERR(transceiver) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	/* allocate can device */
> +	net = alloc_candev(sizeof(*cpriv), TX_ECHO_SKB_MAX);
> +	if (!net)
> +		return -ENOMEM;
> +
> +	/* and do some cross-asignments */
> +	cpriv = netdev_priv(net);
> +	cpriv->priv = priv;
> +	priv->net = net;

Why is "net" attached to "priv". I think we have

> +	SET_NETDEV_DEV(net, &spi->dev);
> +
> +	net->netdev_ops = &mcp25xxfd_netdev_ops;
> +	net->flags |= IFF_ECHO;
> +
> +	cpriv->transceiver = transceiver;
> +
> +	cpriv->can.clock.freq = priv->clock_freq;
> +
> +	cpriv->can.bittiming_const =
> +		&mcp25xxfd_can_nominal_bittiming_const;
> +	cpriv->can.data_bittiming_const =
> +		&mcp25xxfd_can_data_bittiming_const;
> +	/* we are not setting bit-timing methods here as they get
> +	 * called by the framework before open so the controller is
> +	 * still in sleep mode, which does not help
> +	 */
> +	cpriv->can.do_set_mode =
> +		mcp25xxfd_can_do_set_mode;
> +	cpriv->can.do_get_berr_counter =
> +		mcp25xxfd_can_get_berr_counter;
> +	cpriv->can.ctrlmode_supported =
> +		CAN_CTRLMODE_FD |
> +		CAN_CTRLMODE_FD_NON_ISO |
> +		CAN_CTRLMODE_LOOPBACK |
> +		CAN_CTRLMODE_LISTENONLY |
> +		CAN_CTRLMODE_BERR_REPORTING |
> +		CAN_CTRLMODE_ONE_SHOT;
> +
> +	ret = register_candev(net);
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to register can device\n");
> +		goto out;
> +	}
> +
> +	mcp25xxfd_can_debugfs_add(spi);
> +
> +	return 0;
> +out:
> +	free_candev(net);
> +
> +	return ret;
> +}
> +
> +void mcp25xxfd_can_remove(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +
> +	if (priv->net) {
> +		unregister_candev(priv->net);
> +		free_candev(priv->net);
> +		priv->net = NULL;
> +	}
> +}
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> index fe0e93e28b62..ce35518fdb28 100644
> --- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> @@ -2,7 +2,7 @@
> 
>  /* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
>   *
> - * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + * Copyright 2018 Martin Sperl <kernel@martin.sperl.org>
>   *
>   * Based on Microchip MCP251x CAN controller driver written by
>   * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> @@ -10,6 +10,12 @@
> 
>  #include "mcp25xxfd.h"
>  #include <linux/bitops.h>
> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
> +#include <linux/interrupt.h>
> +#include <linux/netdevice.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> 
>  #define CAN_SFR_BASE(x)			(0x000 + (x))
>  #define CAN_CON				CAN_SFR_BASE(0x00)
> @@ -205,6 +211,13 @@
>  	 CAN_INT_SERRIF |		\
>  	 CAN_INT_WAKIF |		\
>  	 CAN_INT_IVMIF)
> +#  define CAN_INT_IF_CLEAR_MASK		\
> +	(CAN_INT_TBCIF	|		\
> +	 CAN_INT_MODIF	|		\
> +	 CAN_INT_CERRIF |		\
> +	 CAN_INT_SERRIF |		\
> +	 CAN_INT_WAKIF |		\
> +	 CAN_INT_IVMIF)
>  #  define CAN_INT_IE_SHIFT		16
>  #  define CAN_INT_TXIE			(CAN_INT_TXIF << CAN_INT_IE_SHIFT)
>  #  define CAN_INT_RXIE			(CAN_INT_RXIF << CAN_INT_IE_SHIFT)
> @@ -485,3 +498,263 @@
>  #define CAN_OBJ_FLAGS_FILHIT_MASK				      \
>  	GENMASK(CAN_FLAGS_FILHIT_SHIFT + CAN_FLAGS_FILHIT_BITS - 1,   \
>  		CAN_FLAGS_FILHIT_SHIFT)
> +
> +#define TX_ECHO_SKB_MAX	32
> +
> +struct mcp25xxfd_fifo {
> +	u32 count;
> +	u32 start;
> +	u32 increment;
> +	u32 size;
> +	u32 priority_start;
> +	u32 priority_increment;
> +	u64 dlc_usage[16];
> +	u64 fd_count;
> +
> +	struct dentry *debugfs_dir;
> +};
> +
> +struct mcp25xxfd_obj_ts {
> +	/* using signed here to handle rollover correctly */
> +	s32 ts;
> +	/* positive fifos are rx, negative tx, 0 is not a valid fifo */
> +	s32 fifo;
> +};
> +
> +struct mcp25xxfd_can_priv {
> +	/* can_priv has to be the first one to be usable with alloc_candev
> +	 * which expects struct can_priv to be right at the start of the
> +	 * priv structure
> +	 */
> +	struct can_priv can;
> +	struct mcp25xxfd_priv *priv;
> +	struct regulator *transceiver;
> +
> +	/* the can mode currently active */
> +	int mode;
> +
> +	/* can config registers */
> +	struct {
> +		u32 con;
> +		u32 tdc;
> +		u32 tscon;
> +		u32 tefcon;
> +		u32 nbtcfg;
> +		u32 dbtcfg;
> +	} regs;
> +
> +	/* can status registers (mostly) - read in one go
> +	 * bdiag0 and bdiag1 are optional, but when
> +	 * berr counters are requested on a regular basis
> +	 * during high CAN-bus load this would trigger the fact
> +	 * that spi_sync would get queued for execution in the
> +	 * spi thread and the spi handler would not get
> +	 * called inline in the interrupt thread without any
> +	 * context switches or wakeups...
> +	 */
> +	struct {
> +		u32 intf;
> +		/* ASSERT(CAN_INT + 4 == CAN_RXIF) */
> +		u32 rxif;
> +		/* ASSERT(CAN_RXIF + 4 == CAN_TXIF) */
> +		u32 txif;
> +		/* ASSERT(CAN_TXIF + 4 == CAN_RXOVIF) */
> +		u32 rxovif;
> +		/* ASSERT(CAN_RXOVIF + 4 == CAN_TXATIF) */
> +		u32 txatif;
> +		/* ASSERT(CAN_TXATIF + 4 == CAN_TXREQ) */
> +		u32 txreq;
> +		/* ASSERT(CAN_TXREQ + 4 == CAN_TREC) */
> +		u32 trec;
> +	} status;
> +
> +	/* information of fifo setup */
> +	struct {
> +		/* define payload size and mode */
> +		u32 payload_size;
> +		u32 payload_mode;
> +
> +		/* infos on fifo layout */
> +		struct {
> +			u32 count;
> +			u32 size;
> +			u32 index;
> +		} tef;
> +		struct mcp25xxfd_fifo tx;
> +		struct mcp25xxfd_fifo rx;
> +
> +		/* the address and priority of all fifos */
> +		struct {
> +			u32 control;
> +			u32 status;
> +			u32 offset;
> +		} fifo_reg[32];
> +		struct {
> +			u32 is_tx;
> +			u32 priority;
> +			u64 use_count;
> +		} fifo_info[32];
> +
> +		/* queue of can frames that need to get submitted
> +		 * to the network stack during an interrupt loop in one go
> +		 * (this gets sorted by timestamp before submission
> +		 * and contains both rx frames as well tx frames that have
> +		 * gone over the CAN bus successfully
> +		 */
> +		struct mcp25xxfd_obj_ts submit_queue[32];
> +		int  submit_queue_count;
> +
> +		/* the tx queue of spi messages */
> +		struct mcp2517fd_tx_spi_message_queue *tx_queue;
> +
> +		/* the directory entry of the can_fifo debugfs directory */
> +		struct dentry *debugfs_dir;
> +	} fifos;
> +
> +	/* statistics */
> +	struct {
> +		u64 irq_calls;
> +		u64 irq_loops;
> +
> +		u64 int_serr_count;
> +		u64 int_serr_rx_count;
> +		u64 int_serr_tx_count;
> +		u64 int_mod_count;
> +		u64 int_rx_count;
> +		u64 int_txat_count;
> +		u64 int_tef_count;
> +		u64 int_rxov_count;
> +		u64 int_ecc_count;
> +		u64 int_ivm_count;
> +		u64 int_cerr_count;
> +
> +		u64 tx_fd_count;
> +		u64 tx_brs_count;
> +	} stats;
> +
> +	/* bus state */
> +	struct {
> +		u32 state;
> +		u32 new_state;
> +
> +		u32 bdiag[2];
> +	} bus;
> +
> +	/* can merror messages */
> +	struct {
> +		u32 id;
> +		u8  data[8];
> +	} error_frame;
> +
> +	/* a sram equivalent */
> +	u8 sram[MCP25XXFD_SRAM_SIZE];
> +};
> +
> +struct mcp25xxfd_obj_tef {
> +	u32 id;
> +	u32 flags;
> +	u32 ts;
> +};
> +
> +struct mcp25xxfd_obj_tx {
> +	u32 id;
> +	u32 flags;
> +	u8 data[];
> +};
> +
> +struct mcp25xxfd_obj_rx {
> +	u32 id;
> +	u32 flags;
> +	u32 ts;
> +	u8 data[];
> +};
> +
> +int mcp25xxfd_can_get_mode(struct spi_device *spi, u32 *mode_data);
> +int mcp25xxfd_can_switch_mode(struct spi_device *spi, u32 *mode_data,
> +			      int mode);
> +irqreturn_t mcp25xxfd_can_int(int irq, void *dev_id);
> +netdev_tx_t mcp25xxfd_can_start_xmit(struct sk_buff *skb,
> +				     struct net_device *net);
> +int mcp25xxfd_can_setup_fifos(struct net_device *net);
> +void mcp25xxfd_can_release_fifos(struct net_device *net);
> +
> +/* ideally these would be defined in uapi/linux/can.h */
> +#define CAN_EFF_SID_SHIFT		(CAN_EFF_ID_BITS - CAN_SFF_ID_BITS)



> +#define CAN_EFF_SID_BITS		CAN_SFF_ID_BITS
> +#define CAN_EFF_SID_MASK				      \
> +	GENMASK(CAN_EFF_SID_SHIFT + CAN_EFF_SID_BITS - 1,     \
> +		CAN_EFF_SID_SHIFT)
> +#define CAN_EFF_EID_SHIFT		0
> +#define CAN_EFF_EID_BITS		CAN_EFF_SID_SHIFT
> +#define CAN_EFF_EID_MASK				      \
> +	GENMASK(CAN_EFF_EID_SHIFT + CAN_EFF_EID_BITS - 1,     \
> +		CAN_EFF_EID_SHIFT)
> +
> +static inline
> +void mcp25xxfd_mcpid_to_canid(u32 mcp_id, u32 mcp_flags, u32 *can_id)
> +{
> +	u32 sid = (mcp_id & CAN_OBJ_ID_SID_MASK) >> CAN_OBJ_ID_SID_SHIFT;
> +	u32 eid = (mcp_id & CAN_OBJ_ID_EID_MASK) >> CAN_OBJ_ID_EID_SHIFT;
> +
> +	/* select normal or extended ids */
> +	if (mcp_flags & CAN_OBJ_FLAGS_IDE) {
> +		*can_id = (eid << CAN_EFF_EID_SHIFT) |
> +			(sid << CAN_EFF_SID_SHIFT) |
> +			CAN_EFF_FLAG;
> +	} else {
> +		*can_id = sid;
> +	}
> +	/* handle rtr */
> +	*can_id |= (mcp_flags & CAN_OBJ_FLAGS_RTR) ? CAN_RTR_FLAG : 0;
> +}
> +
> +static inline
> +void mcp25xxfd_canid_to_mcpid(u32 can_id, u32 *id, u32 *flags)
> +{
> +	/* depending on can_id flag compute extended or standard ids */
> +	if (can_id & CAN_EFF_FLAG) {
> +		int sid = (can_id & CAN_EFF_SID_MASK) >> CAN_EFF_SID_SHIFT;
> +		int eid = (can_id & CAN_EFF_EID_MASK) >> CAN_EFF_EID_SHIFT;
> +		*id = (eid << CAN_OBJ_ID_EID_SHIFT) |
> +			(sid << CAN_OBJ_ID_SID_SHIFT);
> +		*flags = CAN_OBJ_FLAGS_IDE;
> +	} else {
> +		*id = can_id & CAN_SFF_MASK;
> +		*flags = 0;
> +	}
> +
> +	/* Handle RTR */
> +	*flags |= (can_id & CAN_RTR_FLAG) ? CAN_OBJ_FLAGS_RTR : 0;
> +}
> +
> +static inline
> +void mcp25xxfd_can_queue_frame(struct mcp25xxfd_can_priv *cpriv,
> +			       s32 fifo, s32 ts)
> +{
> +	int idx = cpriv->fifos.submit_queue_count;
> +
> +	cpriv->fifos.submit_queue[idx].fifo = fifo;
> +	cpriv->fifos.submit_queue[idx].ts = ts;
> +
> +	cpriv->fifos.submit_queue_count++;
> +}
> +
> +int mcp25xxfd_can_read_rx_frames(struct spi_device *spi);
> +int mcp25xxfd_can_submit_rx_frame(struct spi_device *spi, int fifo);
> +int mcp25xxfd_can_submit_tx_frame(struct spi_device *spi, int fifo);
> +
> +int mcp25xxfd_can_int_handle_txatif(struct spi_device *spi);
> +int mcp25xxfd_can_int_handle_tefif(struct spi_device *spi);
> +
> +int mcp25xxfd_can_tx_queue_alloc(struct net_device *net);
> +void mcp25xxfd_can_tx_queue_free(struct net_device *net);
> +void mcp25xxfd_can_tx_queue_restart(struct net_device *net);
> +void mcp25xxfd_can_tx_queue_manage(struct net_device *net, int state);
> +void mcp25xxfd_can_tx_queue_manage_nolock(struct net_device *net, int state);
> +# define TX_QUEUE_STATE_STOPPED  0
> +# define TX_QUEUE_STATE_STARTED  1
> +# define TX_QUEUE_STATE_RUNABLE 2
> +# define TX_QUEUE_STATE_RESTART  3
> +
> +int mcp25xxfd_can_switch_mode_nowait(struct spi_device *spi,
> +				     u32 *mode_data, int mode);
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
> new file mode 100644
> index 000000000000..1a85fc57a955
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +/* here we define and configure the fifo layout */
> +
> +#include "mcp25xxfd_can.h"
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/spi/spi.h>
> +
> +/* some module parameters that are currently not configurable via netlink */
> +unsigned int tx_fifos;
> +module_param(tx_fifos, uint, 0664);
> +MODULE_PARM_DESC(tx_fifos, "Number of tx-fifos to configure\n");
> +
> +bool three_shot;
> +module_param(three_shot, bool, 0664);
> +MODULE_PARM_DESC(three_shot, "Use 3 shots when one-shot is requested");
> +
> +#if defined(CONFIG_DEBUG_FS)
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_rxtx(struct net_device *net,
> +					   const char *name,
> +					   struct mcp25xxfd_fifo *desc)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +
> +	/* remove old debug directory */
> +	debugfs_remove_recursive(desc->debugfs_dir);
> +
> +	/* create new one */
> +	desc->debugfs_dir = debugfs_create_dir(name, priv->debugfs_dir);
> +
> +	/* and fill it */
> +	debugfs_create_u32("count",  0444, desc->debugfs_dir,
> +			   &desc->count);
> +	debugfs_create_u32("size",  0444, desc->debugfs_dir,
> +			   &desc->size);
> +	debugfs_create_u32("start",  0444, desc->debugfs_dir,
> +			   &desc->start);
> +	debugfs_create_u32("increment",  0444, desc->debugfs_dir,
> +			   &desc->increment);
> +	debugfs_create_u32("priority_start",  0444, desc->debugfs_dir,
> +			   &desc->priority_start);
> +	debugfs_create_u32("priority_increment",  0444, desc->debugfs_dir,
> +			   &desc->priority_increment);
> +}
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_link_rxtx(struct mcp25xxfd_fifo *desc,
> +						int index, int fifo)
> +{
> +	char name[4];
> +	char link[32];
> +
> +	snprintf(name, sizeof(name), "%02i", index);
> +	snprintf(link, sizeof(link), "../can_fifos/%02i", fifo);
> +
> +	debugfs_create_symlink(name, desc->debugfs_dir, link);
> +}
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_present_fifo(struct net_device *net,
> +						   int index)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct dentry *debugfs_dir;
> +	char name[4];
> +
> +	snprintf(name, sizeof(name), "%02i", index);
> +	debugfs_dir = debugfs_create_dir(name, cpriv->fifos.debugfs_dir);
> +
> +	/* and the entries */
> +	debugfs_create_u32("is_tx", 0444, debugfs_dir,
> +			   &cpriv->fifos.fifo_info[index].is_tx);
> +	debugfs_create_x32("offset", 0444, debugfs_dir,
> +			   &cpriv->fifos.fifo_reg[index].offset);
> +	debugfs_create_u32("priority", 0444, debugfs_dir,
> +			   &cpriv->fifos.fifo_info[index].priority);
> +	debugfs_create_u64("use_count", 0444, debugfs_dir,
> +			   &cpriv->fifos.fifo_info[index].use_count);
> +}
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_present_fifos(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	int i;
> +
> +	/* create the directory if necessary */
> +	if (!cpriv->fifos.debugfs_dir)
> +		cpriv->fifos.debugfs_dir =
> +			debugfs_create_dir("can_fifos", priv->debugfs_dir);
> +
> +	/* now present all fifos
> +	 * - note that there is no fifo 0 - that is the TX-queue!
> +	 */
> +	for (i = 1; i < 32; i++)
> +		mcp25xxfd_can_setup_fifo_debugfs_present_fifo(net, i);
> +}
> +
> +static void mcp25xxfd_can_remove_fifo_debugfs(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	debugfs_remove_recursive(cpriv->fifos.debugfs_dir);
> +	cpriv->fifos.debugfs_dir = NULL;
> +	debugfs_remove_recursive(cpriv->fifos.rx.debugfs_dir);
> +	cpriv->fifos.rx.debugfs_dir = NULL;
> +	debugfs_remove_recursive(cpriv->fifos.tx.debugfs_dir);
> +	cpriv->fifos.tx.debugfs_dir = NULL;
> +}
> +
> +#else
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_rxtx(struct net_device *net,
> +					   const char *name,
> +					   struct mcp25xxfd_fifo *desc)
> +{
> +}
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_link_rxtx(struct mcp25xxfd_fifo *desc,
> +						int index, int fifo)
> +{
> +}
> +
> +static
> +void mcp25xxfd_can_setup_fifo_debugfs_present_fifos(struct net_device *net)
> +{
> +}
> +
> +static void mcp25xxfd_can_remove_fifo_debugfs(struct net_device *net)
> +{
> +}
> +#endif
> +
> +static int mcp25xxfd_can_get_fifo_address(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	int ret;
> +
> +	/* write the config to the controller in one go */
> +	ret = mcp25xxfd_cmd_write_regs(spi, CAN_FIFOCON(0),
> +				       &cpriv->fifos.fifo_reg[0].control,
> +				       sizeof(cpriv->fifos.fifo_reg));
> +	if (ret)
> +		return ret;
> +
> +	/* we need to move out of config mode to force address computation */
> +	ret = mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +					CAN_CON_MODE_INTERNAL_LOOPBACK);
> +	if (ret)
> +		return ret;
> +
> +	/* and get back into config mode */
> +	ret = mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +					CAN_CON_MODE_CONFIG);
> +	if (ret)
> +		return ret;
> +
> +	/* read address and config back in */
> +	return mcp25xxfd_cmd_read_regs(spi, CAN_FIFOCON(0),
> +				       &cpriv->fifos.fifo_reg[0].control,
> +				       sizeof(cpriv->fifos.fifo_reg));
> +}
> +
> +static int mcp25xxfd_can_setup_fifo_config(struct net_device *net,
> +					   const char *name,
> +					   struct mcp25xxfd_fifo *desc,
> +					   u32 flags,
> +					   u32 flags_last)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	bool is_tx;
> +	u32 val;
> +	int index, prio, fifo, count;
> +
> +	/* present fifo type info */
> +	mcp25xxfd_can_setup_fifo_debugfs_rxtx(net, name, desc);
> +
> +	/* now setup the fifos themselves */
> +	for (index = 0,
> +	     fifo = desc->start,
> +	     count = desc->count,
> +	     prio = desc->priority_start;
> +	     count > 0;
> +	     index++,
> +	     fifo += desc->increment,
> +	     prio += desc->priority_increment,
> +	     count--) {
> +		/* select the effective value */
> +		val = (count > 1) ? flags : flags_last;
> +
> +		/* are we in tx mode */
> +		is_tx = flags & CAN_FIFOCON_TXEN;
> +		cpriv->fifos.fifo_info[fifo].is_tx = is_tx;
> +
> +		/* set priority if we are tx */
> +		if (is_tx) {
> +			cpriv->fifos.fifo_info[fifo].priority = prio;
> +			val |= (prio << CAN_FIFOCON_TXPRI_SHIFT);
> +		}
> +
> +		/* setup interface */
> +		cpriv->fifos.fifo_reg[fifo].control = val;
> +
> +		/* and link debugfs fifo */
> +		mcp25xxfd_can_setup_fifo_debugfs_link_rxtx(desc, index,
> +							   fifo);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_setup_tx_fifo_config(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	u32 tx_flags;
> +
> +	/* TX Fifo configuration */
> +	tx_flags = CAN_FIFOCON_FRESET | /* reset FIFO */
> +		CAN_FIFOCON_TXEN | /* this is a TX_FIFO */
> +		CAN_FIFOCON_TXATIE | /* show up txatie flags in txatif reg */
> +		(cpriv->fifos.payload_mode << CAN_FIFOCON_PLSIZE_SHIFT) |
> +		(0 << CAN_FIFOCON_FSIZE_SHIFT); /* 1 FIFO only */
> +	if (cpriv->can.ctrlmode & CAN_CTRLMODE_ONE_SHOT)
> +		if (three_shot)
> +			tx_flags |= CAN_FIFOCON_TXAT_THREE_SHOT <<
> +				CAN_FIFOCON_TXAT_SHIFT;
> +		else
> +			tx_flags |= CAN_FIFOCON_TXAT_ONE_SHOT <<
> +				CAN_FIFOCON_TXAT_SHIFT;
> +	else
> +		tx_flags |= CAN_FIFOCON_TXAT_UNLIMITED <<
> +			CAN_FIFOCON_TXAT_SHIFT;
> +
> +	return mcp25xxfd_can_setup_fifo_config(net, "can_fifo_tx",
> +					       &cpriv->fifos.tx,
> +					       tx_flags, tx_flags);
> +}
> +
> +static int mcp25xxfd_can_setup_rx_fifo_config(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	u32 rx_flags, rx_flags_last;
> +
> +	/* RX Fifo configuration */
> +	rx_flags = CAN_FIFOCON_FRESET | /* reset FIFO */
> +		CAN_FIFOCON_RXTSEN | /* RX timestamps */
> +		CAN_FIFOCON_TFERFFIE | /* FIFO Full */
> +		CAN_FIFOCON_TFHRFHIE | /* FIFO Half Full*/
> +		CAN_FIFOCON_TFNRFNIE | /* FIFO not empty */
> +		(cpriv->fifos.payload_mode << CAN_FIFOCON_PLSIZE_SHIFT) |
> +		(0 << CAN_FIFOCON_FSIZE_SHIFT); /* 1 FIFO only */
> +	rx_flags_last = rx_flags | CAN_FIFOCON_RXOVIE;
> +
> +	/* configure the fifos */
> +	return mcp25xxfd_can_setup_fifo_config(net, "can_fifo_rx",
> +					       &cpriv->fifos.rx,
> +					       rx_flags, rx_flags_last);
> +}
> +
> +static int mcp25xxfd_can_clear_rx_filter_masks(struct spi_device *spi)
> +{
> +	u32 data[2 * 32]; /* 2 registers (match and mask) per filter */
> +
> +	memset(data, 0, sizeof(data));
> +
> +	return mcp25xxfd_cmd_write_regs(spi, CAN_FLTOBJ(0),
> +					data, sizeof(data));
> +}
> +
> +static int mcp25xxfd_can_setup_rx_filter_config(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	struct mcp25xxfd_fifo *desc = &cpriv->fifos.rx;
> +	u8 filter_con[32];
> +	int filter, fifo, ret;
> +
> +	/* present all fifos */
> +	mcp25xxfd_can_setup_fifo_debugfs_present_fifos(net);
> +
> +	/* clear the filter mask - match any frame with every filter */
> +	ret = mcp25xxfd_can_clear_rx_filter_masks(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* clear the filters and filter mappings for all filters */
> +	memset(filter_con, 0, sizeof(filter_con));
> +
> +	/* and now set up the rx filters */
> +	for (filter = 0, fifo = desc->start;
> +	     filter < desc->count;
> +	     filter++, fifo += desc->increment) {
> +		/* set up filter config - we can use the mask of filter 0 */
> +		filter_con[filter] = CAN_FIFOCON_FLTEN(0) |
> +			(fifo << CAN_FILCON_SHIFT(0));
> +	}
> +
> +	/* and set up filter control */
> +	return mcp25xxfd_cmd_write_regs(spi, CAN_FLTCON(0),
> +					(u32 *)filter_con,
> +					sizeof(filter_con));
> +}
> +
> +static int mcp25xxfd_can_compute_fifos(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int tef_memory_used, tx_memory_used, rx_memory_available;
> +
> +	/* default settings as per MTU/CANFD */
> +	switch (net->mtu) {
> +	case CAN_MTU:
> +		/* mtu is 8 */
> +		cpriv->fifos.payload_size = 8;
> +		cpriv->fifos.payload_mode = CAN_TXQCON_PLSIZE_8;
> +
> +		/* 7 tx fifos */
> +		cpriv->fifos.tx.count = 7;
> +
> +		break;
> +	case CANFD_MTU:
> +		/* wish there was a way to have hw filters
> +		 * that can separate based on length ...
> +		 */
> +		/* MTU is 64 */
> +		cpriv->fifos.payload_size = 64;
> +		cpriv->fifos.payload_mode = CAN_TXQCON_PLSIZE_64;
> +
> +		/* 7 tx fifos */
> +		cpriv->fifos.tx.count = 7;
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* compute effective sizes */
> +	cpriv->fifos.tef.size = sizeof(struct mcp25xxfd_obj_tef);
> +	cpriv->fifos.tx.size = sizeof(struct mcp25xxfd_obj_tx) +
> +		cpriv->fifos.payload_size;
> +	cpriv->fifos.rx.size = sizeof(struct mcp25xxfd_obj_rx) +
> +		cpriv->fifos.payload_size;
> +
> +	/* if defined as a module parameter modify the number of tx_fifos */
> +	if (tx_fifos) {
> +		netdev_info(net,
> +			    "Using %i tx-fifos as per module parameter\n",
> +			    tx_fifos);
> +		cpriv->fifos.tx.count = tx_fifos;
> +	}
> +
> +	/* there can be at the most 30 tx fifos (TEF and at least 1 RX fifo */
> +	if (cpriv->fifos.tx.count > 30) {
> +		netdev_err(net,
> +			   "There is an absolute maximum of 30 tx-fifos\n");
> +		return -EINVAL;
> +	}
> +
> +	/* set tef fifos to the number of tx fifos */
> +	cpriv->fifos.tef.count = cpriv->fifos.tx.count;
> +
> +	/* compute size of the tx fifos and TEF */
> +	tx_memory_used = cpriv->fifos.tx.count * cpriv->fifos.tx.size;
> +	tef_memory_used = cpriv->fifos.tef.count * cpriv->fifos.tef.size;
> +
> +	/* calculate evailable memory for RX_fifos */
> +	rx_memory_available = MCP25XXFD_BUFFER_TXRX_SIZE -
> +		tx_memory_used -
> +		tef_memory_used;
> +
> +	/* we need at least one RX Frame */
> +	if (rx_memory_available < cpriv->fifos.rx.size) {
> +		netdev_err(net,
> +			   "Configured %i tx-fifos exceeds available memory already\n",
> +			   cpriv->fifos.tx.count);
> +		return -EINVAL;
> +	}
> +
> +	/* calculate possible amount of RX fifos */
> +	cpriv->fifos.rx.count = rx_memory_available / cpriv->fifos.rx.size;
> +
> +	/* so now calculate effective number of rx-fifos
> +	 * there are only 31 fifos available in total,
> +	 * so we need to limit ourselves
> +	 */
> +	if (cpriv->fifos.rx.count + cpriv->fifos.tx.count > 31)
> +		cpriv->fifos.rx.count = 31 - cpriv->fifos.tx.count;
> +
> +	/* define the layout now that we have gotten everything */
> +	cpriv->fifos.tx.start = 1;
> +	cpriv->fifos.tx.increment = 1;
> +	/* highest priority is 31 */
> +	cpriv->fifos.tx.priority_start = 31;
> +	cpriv->fifos.tx.priority_increment = -1;
> +
> +	cpriv->fifos.rx.start = 1 + cpriv->fifos.tx.count;
> +	cpriv->fifos.rx.increment = 1;
> +	/* rx fifos do not have a priority */
> +	cpriv->fifos.rx.priority_start = 0;
> +	cpriv->fifos.rx.priority_increment = 0;
> +
> +	return 0;
> +}
> +
> +int mcp25xxfd_can_setup_fifos(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	int ret;
> +
> +	/* compute fifos counts */
> +	ret = mcp25xxfd_can_compute_fifos(net);
> +	if (ret)
> +		return ret;
> +
> +	/* configure TEF */
> +	if (cpriv->fifos.tef.count)
> +		cpriv->regs.tefcon =
> +			CAN_TEFCON_FRESET |
> +			CAN_TEFCON_TEFNEIE |
> +			CAN_TEFCON_TEFTSEN |
> +			((cpriv->fifos.tef.count - 1) <<
> +			 CAN_TEFCON_FSIZE_SHIFT);
> +	else
> +		cpriv->regs.tefcon = 0;
> +	ret = mcp25xxfd_cmd_write(spi, CAN_TEFCON, cpriv->regs.tefcon);
> +	if (ret)
> +		return ret;
> +
> +	/* clear fifo_reg and fifo_info */
> +	memset(cpriv->fifos.fifo_reg, 0, sizeof(cpriv->fifos.fifo_reg));
> +	memset(cpriv->fifos.fifo_info, 0, sizeof(cpriv->fifos.fifo_info));
> +
> +	/* configure FIFOS themselves */
> +	ret = mcp25xxfd_can_setup_tx_fifo_config(net);
> +	if (ret)
> +		return ret;
> +	ret = mcp25xxfd_can_setup_rx_fifo_config(net);
> +	if (ret)
> +		return ret;
> +
> +	/* get fifo addresses */
> +	ret = mcp25xxfd_can_get_fifo_address(net);
> +	if (ret)
> +		return ret;
> +
> +	/* finally configure RX filters */
> +	ret = mcp25xxfd_can_setup_rx_filter_config(net);
> +	if (ret)
> +		return ret;
> +
> +	/* setup tx_fifo_queue */
> +	return mcp25xxfd_can_tx_queue_alloc(net);
> +}
> +
> +void mcp25xxfd_can_release_fifos(struct net_device *net)
> +{
> +	mcp25xxfd_can_tx_queue_free(net);
> +	mcp25xxfd_can_remove_fifo_debugfs(net);
> +}
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
> new file mode 100644
> index 000000000000..842c714fbbfe
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
> @@ -0,0 +1,723 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + * implementation of can interrupt handling
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include "mcp25xxfd_can.h"
> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/net.h>
> +#include <linux/netdevice.h>
> +#include <linux/slab.h>
> +#include <linux/sort.h>
> +
> +static void mcp25xxfd_can_error_skb(struct spi_device *spi)

Why do the functions in this file use "spi" as main main argument? It
belongs to the "mcp25xxfd_can" interface and should therefore use
"struct mcp25xxfd_can_priv".

> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);

Then we can drop the lines above...

> +	struct sk_buff *skb;
> +	struct can_frame *frame;
> +
> +	/* allocate error frame */
> +	skb = alloc_can_err_skb(net, &frame);

And use "cpriv->net" here. It's almost the same in most of the functions
in this and the other "mcp25xxfd_can_" files.

> +	if (!skb) {
> +		netdev_err(net, "cannot allocate error skb\n");
> +		return;
> +	}
> +
> +	/* setup can error frame data */
> +	frame->can_id |= cpriv->error_frame.id;
> +	memcpy(frame->data, cpriv->error_frame.data, sizeof(frame->data));
> +
> +	/* and submit it */
> +	netif_receive_skb(skb);
> +}
> +
> +static int mcp25xxfd_can_int_clear_int_flags(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	u32 clearable_irq_active = cpriv->status.intf & CAN_INT_IF_CLEAR_MASK;
> +	u32 clear_irq = cpriv->status.intf & (~CAN_INT_IF_CLEAR_MASK);
> +
> +	/* if no clearable flags are set then skip the whole transfer */
> +	if (!clearable_irq_active)
> +		return 0;
> +
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_INT,
> +					clear_irq, clearable_irq_active);
> +}
> +
> +static int mcp25xxfd_can_ist_handle_serrif_txmab(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	net->stats.tx_fifo_errors++;
> +	net->stats.tx_errors++;
> +	cpriv->stats.int_serr_tx_count++;
> +
> +	/* and switch back into the correct mode */
> +	return mcp25xxfd_can_switch_mode_nowait(spi, &cpriv->regs.con,
> +						(net->mtu == CAN_MTU) ?
> +						CAN_CON_MODE_CAN2_0 :
> +						CAN_CON_MODE_MIXED);
> +}
> +
> +static int mcp25xxfd_can_ist_handle_serrif_rxmab(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	net->stats.rx_dropped++;
> +	net->stats.rx_errors++;
> +	cpriv->stats.int_serr_rx_count++;
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_serrif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	if (!(cpriv->status.intf & CAN_INT_SERRIF))
> +		return 0;
> +
> +	/* increment statistics counter now */
> +	cpriv->stats.int_serr_count++;
> +
> +	/* interrupt flags have been cleared already */
> +
> +	/* Errors here are:
> +	 * * Bus Bandwidth Error: when a RX Message Assembly Buffer
> +	 *   is still full when the next message has already arrived
> +	 *   the recived message shall be ignored
> +	 * * TX MAB Underflow: when a TX Message is invalid
> +	 *   due to ECC errors or TXMAB underflow
> +	 *   in this situatioon the system will transition to
> +	 *   Restricted or Listen Only mode
> +	 */
> +
> +	cpriv->error_frame.id |= CAN_ERR_CRTL;
> +	cpriv->error_frame.data[1] |= CAN_ERR_CRTL_UNSPEC;
> +
> +	/* a mode change + invalid message would indicate
> +	 * TX MAB Underflow
> +	 */
> +	if ((cpriv->status.intf & CAN_INT_MODIF) &&
> +	    (cpriv->status.intf & CAN_INT_IVMIF)) {
> +		return mcp25xxfd_can_ist_handle_serrif_txmab(spi);
> +	}
> +
> +	/* for RX there is only the RXIF an indicator
> +	 * - surprizingly RX-MAB does not change mode or anything
> +	 */
> +	if (cpriv->status.intf & CAN_INT_RXIF)
> +		return mcp25xxfd_can_ist_handle_serrif_rxmab(spi);
> +
> +	/* the final case */
> +	dev_warn_ratelimited(&spi->dev,
> +			     "unidentified system error - intf =  %08x\n",
> +			     cpriv->status.intf);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_modif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int mode;
> +	int ret;
> +
> +	/* Note that this irq does not get triggered in all situations
> +	 * for example SERRIF will move to RESTICTED or LISTENONLY
> +	 * but MODIF will not be raised!
> +	 */
> +
> +	if (!(cpriv->status.intf & CAN_INT_MODIF))
> +		return 0;
> +	cpriv->stats.int_mod_count++;
> +
> +	/* get the current mode */
> +	ret = mcp25xxfd_can_get_mode(spi, &mode);
> +	if (ret)
> +		return ret;
> +	mode = ret;
> +
> +	/* switches to the same mode as before are ignored
> +	 * - this typically happens if the driver is shortly
> +	 *   switching to a different mode and then returning to the
> +	 *   original mode
> +	 */
> +	if (mode == cpriv->mode)
> +		return 0;
> +
> +	/* if we are restricted, then return to "normal" mode */
> +	if (mode == CAN_CON_MODE_RESTRICTED) {
> +		cpriv->mode = mode;
> +		return mcp25xxfd_can_switch_mode(spi, &cpriv->regs.con,
> +						 (net->mtu == CAN_MTU) ?
> +						 CAN_CON_MODE_CAN2_0 :
> +						 CAN_CON_MODE_MIXED);
> +	}
> +
> +	/* the controller itself will transition to sleep, so we ignore it */
> +	if (mode == CAN_CON_MODE_SLEEP) {
> +		cpriv->mode = mode;
> +		return 0;
> +	}
> +
> +	/* these we need to handle correctly, so warn and give context */
> +	dev_warn(&spi->dev,
> +		 "Controller unexpectedly switched from mode %u to %u\n",
> +		 cpriv->mode, mode);
> +
> +	/* assign the mode as current */
> +	cpriv->mode = mode;
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_compare_obj_ts(const void *a, const void *b)
> +{
> +	s32 ats = ((struct mcp25xxfd_obj_ts *)a)->ts;
> +	s32 bts = ((struct mcp25xxfd_obj_ts *)b)->ts;
> +
> +	if (ats < bts)
> +		return -1;
> +	if (ats > bts)
> +		return 1;
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_submit_frames(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_obj_ts *queue = cpriv->fifos.submit_queue;
> +	int count = cpriv->fifos.submit_queue_count;
> +	int i, fifo;
> +	int ret;
> +
> +	/* skip processing if the queue count is 0 */
> +	if (count == 0)
> +		goto out;
> +
> +	/* sort the fifos (rx and TEF) by receive timestamp */
> +	sort(queue, count, sizeof(*queue), mcp25xxfd_compare_obj_ts, NULL);
> +
> +	/* now submit the fifos  */
> +	for (i = 0; i < count; i++) {
> +		fifo = queue[i].fifo;
> +		if (fifo > 0)
> +			ret = mcp25xxfd_can_submit_rx_frame(spi, fifo);
> +		else
> +			ret = mcp25xxfd_can_submit_tx_frame(spi, -fifo);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* if we have received or transmitted something
> +	 * and the IVMIE is disabled, then enable it
> +	 * this is mostly to avoid unnecessary interrupts during a
> +	 * disconnected CAN BUS
> +	 */
> +	if (!(cpriv->status.intf | CAN_INT_IVMIE)) {
> +		cpriv->status.intf |= CAN_INT_IVMIE;
> +		ret = mcp25xxfd_cmd_write_mask(spi, CAN_INT,
> +					       cpriv->status.intf,
> +					       CAN_INT_IVMIE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +out:
> +	/* enable tx_queue if necessary */
> +	mcp25xxfd_can_tx_queue_restart(net);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_rxif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	if (!cpriv->status.rxif)
> +		return 0;
> +
> +	cpriv->stats.int_rx_count++;
> +
> +	/* read all the fifos */
> +	return mcp25xxfd_can_read_rx_frames(spi);
> +}
> +
> +static int mcp25xxfd_can_int_handle_rxovif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int ret, i;
> +
> +	if (!cpriv->status.rxovif)
> +		return 0;
> +	cpriv->stats.int_rxov_count++;
> +
> +	/* clear all fifos that have an overflow bit set */
> +	for (i = 0; i < 32; i++) {
> +		if (cpriv->status.rxovif & BIT(i)) {
> +			/* clear fifo status */
> +			ret = mcp25xxfd_cmd_write_mask(spi,
> +						       CAN_FIFOSTA(i),
> +						       0,
> +						       CAN_FIFOSTA_RXOVIF);
> +			if (ret)
> +				return ret;
> +
> +			/* update statistics */
> +			net->stats.rx_over_errors++;
> +			net->stats.rx_errors++;
> +
> +			/* and prepare ERROR FRAME */
> +			cpriv->error_frame.id |= CAN_ERR_CRTL;
> +			cpriv->error_frame.data[1] |= CAN_ERR_CRTL_RX_OVERFLOW;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_eccif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	if (!(cpriv->status.intf & CAN_INT_ECCIF))
> +		return 0;
> +
> +	cpriv->stats.int_ecc_count++;
> +
> +	/* and prepare ERROR FRAME */
> +	cpriv->error_frame.id |= CAN_ERR_CRTL;
> +	cpriv->error_frame.data[1] |= CAN_ERR_CRTL_UNSPEC;
> +
> +	/* delegate to interrupt cleaning */
> +	return mcp25xxfd_clear_ecc_interrupts(spi);
> +}
> +
> +static void mcp25xxfd_can_int_handle_ivmif_tx(struct spi_device *spi,
> +					      u32 *mask)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	/* check if it is really a known tx error */
> +	if ((cpriv->bus.bdiag[1] &
> +	     (CAN_BDIAG1_DBIT1ERR |
> +	      CAN_BDIAG1_DBIT0ERR |
> +	      CAN_BDIAG1_NACKERR |
> +	      CAN_BDIAG1_NBIT1ERR |
> +	      CAN_BDIAG1_NBIT0ERR
> +		     )) == 0)
> +		return;
> +
> +	/* mark it as a protocol error */
> +	cpriv->error_frame.id |= CAN_ERR_PROT;
> +
> +	/* and update statistics */
> +	net->stats.tx_errors++;
> +
> +	/* and handle all the known cases */
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NACKERR) {
> +		/* TX-Frame not acknowledged - connected to CAN-bus? */
> +		*mask |= CAN_BDIAG1_NACKERR;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_TX;
> +		net->stats.tx_aborted_errors++;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NBIT1ERR) {
> +		/* TX-Frame CAN-BUS Level is unexpectedly dominant */
> +		*mask |= CAN_BDIAG1_NBIT1ERR;
> +		net->stats.tx_carrier_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT1;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NBIT0ERR) {
> +		/* TX-Frame CAN-BUS Level is unexpectedly recessive */
> +		*mask |= CAN_BDIAG1_NBIT0ERR;
> +		net->stats.tx_carrier_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT0;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_DBIT1ERR) {
> +		/* TX-Frame CAN-BUS Level is unexpectedly dominant
> +		 * during data phase
> +		 */
> +		*mask |= CAN_BDIAG1_DBIT1ERR;
> +		net->stats.tx_carrier_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT1;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_DBIT0ERR) {
> +		/* TX-Frame CAN-BUS Level is unexpectedly recessive
> +		 * during data phase
> +		 */
> +		*mask |= CAN_BDIAG1_DBIT0ERR;
> +		net->stats.tx_carrier_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_BIT0;
> +	}
> +}
> +
> +static void mcp25xxfd_can_int_handle_ivmif_rx(struct spi_device *spi,
> +					      u32 *mask)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	/* check if it is really a known tx error */
> +	if ((cpriv->bus.bdiag[1] &
> +	     (CAN_BDIAG1_DCRCERR |
> +	      CAN_BDIAG1_DSTUFERR |
> +	      CAN_BDIAG1_DFORMERR |
> +	      CAN_BDIAG1_NCRCERR |
> +	      CAN_BDIAG1_NSTUFERR |
> +	      CAN_BDIAG1_NFORMERR
> +		     )) == 0)
> +		return;
> +
> +	/* mark it as a protocol error */
> +	cpriv->error_frame.id |= CAN_ERR_PROT;
> +
> +	/* and update statistics */
> +	net->stats.rx_errors++;
> +
> +	/* handle the cases */
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_DCRCERR) {
> +		/* RX-Frame with bad CRC during data phase */
> +		*mask |= CAN_BDIAG1_DCRCERR;
> +		net->stats.rx_crc_errors++;
> +		cpriv->error_frame.data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_DSTUFERR) {
> +		/* RX-Frame with bad stuffing during data phase */
> +		*mask |= CAN_BDIAG1_DSTUFERR;
> +		net->stats.rx_frame_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_STUFF;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_DFORMERR) {
> +		/* RX-Frame with bad format during data phase */
> +		*mask |= CAN_BDIAG1_DFORMERR;
> +		net->stats.rx_frame_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_FORM;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NCRCERR) {
> +		/* RX-Frame with bad CRC during data phase */
> +		*mask |= CAN_BDIAG1_NCRCERR;
> +		net->stats.rx_crc_errors++;
> +		cpriv->error_frame.data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NSTUFERR) {
> +		/* RX-Frame with bad stuffing during data phase */
> +		*mask |= CAN_BDIAG1_NSTUFERR;
> +		net->stats.rx_frame_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_STUFF;
> +	}
> +	if (cpriv->bus.bdiag[1] & CAN_BDIAG1_NFORMERR) {
> +		/* RX-Frame with bad format during data phase */
> +		*mask |= CAN_BDIAG1_NFORMERR;
> +		net->stats.rx_frame_errors++;
> +		cpriv->error_frame.data[2] |= CAN_ERR_PROT_FORM;
> +	}
> +}
> +
> +static int mcp25xxfd_can_int_handle_ivmif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	u32 mask, bdiag1;
> +	int ret;
> +
> +	if (!(cpriv->status.intf & CAN_INT_IVMIF))
> +		return 0;
> +
> +	cpriv->stats.int_ivm_count++;
> +
> +	/* if we have a systemerror as well,
> +	 * then ignore it as they correlate
> +	 */
> +	if (cpriv->status.intf & CAN_INT_SERRIF)
> +		return 0;
> +
> +	/* read bus diagnostics */
> +	ret = mcp25xxfd_cmd_read_regs(spi, CAN_BDIAG0,
> +				      cpriv->bus.bdiag,
> +				      sizeof(cpriv->bus.bdiag));
> +	if (ret)
> +		return ret;
> +
> +	/* clear the masks of bits to clear */
> +	mask = 0;
> +
> +	/* check rx and tx errors */
> +	mcp25xxfd_can_int_handle_ivmif_tx(spi, &mask);
> +	mcp25xxfd_can_int_handle_ivmif_rx(spi, &mask);
> +
> +	/* clear flags if we have bits masked */
> +	if (!mask) {
> +		/* the unsupported case, where we are not
> +		 * clearing any registers
> +		 */
> +		dev_warn_once(&spi->dev,
> +			      "found IVMIF situation not supported by driver - bdiag = [0x%08x, 0x%08x]",
> +			      cpriv->bus.bdiag[0], cpriv->bus.bdiag[1]);
> +		return -EINVAL;
> +	}
> +
> +	/* clear the bits in bdiag1 */
> +	bdiag1 = cpriv->bus.bdiag[1] & (~mask);
> +	/* and write it */
> +	ret = mcp25xxfd_cmd_write_mask(spi, CAN_BDIAG1, bdiag1, mask);
> +	if (ret)
> +		return ret;
> +
> +	/* and clear the interrupt flag until we have received or transmited */
> +	cpriv->status.intf &= ~(CAN_INT_IVMIE);
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_INT, cpriv->status.intf,
> +					CAN_INT_IVMIE);
> +}
> +
> +static int mcp25xxfd_can_int_handle_cerrif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	if (!(cpriv->status.intf & CAN_INT_CERRIF))
> +		return 0;
> +
> +	/* this interrupt exists primarilly to counter possible
> +	 * bus off situations more detailed information
> +	 * can be found and controlled in the TREC register
> +	 */
> +
> +	cpriv->stats.int_cerr_count++;
> +
> +	netdev_warn(net, "CAN Bus error experienced");
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_error_counters(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);

This functionm, like many others just needs "cpriv".

> +
> +	if (cpriv->status.trec & CAN_TREC_TXWARN) {
> +		cpriv->bus.new_state = CAN_STATE_ERROR_WARNING;
> +		cpriv->error_frame.id |= CAN_ERR_CRTL;
> +		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_TX_WARNING;
> +	}
> +	if (cpriv->status.trec & CAN_TREC_RXWARN) {
> +		cpriv->bus.new_state = CAN_STATE_ERROR_WARNING;
> +		cpriv->error_frame.id |= CAN_ERR_CRTL;
> +		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_RX_WARNING;
> +	}
> +	if (cpriv->status.trec & CAN_TREC_TXBP) {
> +		cpriv->bus.new_state = CAN_STATE_ERROR_PASSIVE;
> +		cpriv->error_frame.id |= CAN_ERR_CRTL;
> +		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_TX_PASSIVE;
> +	}
> +	if (cpriv->status.trec & CAN_TREC_RXBP) {
> +		cpriv->bus.new_state = CAN_STATE_ERROR_PASSIVE;
> +		cpriv->error_frame.id |= CAN_ERR_CRTL;
> +		cpriv->error_frame.data[1] |= CAN_ERR_CRTL_RX_PASSIVE;
> +	}
> +	if (cpriv->status.trec & CAN_TREC_TXBO) {
> +		cpriv->bus.new_state = CAN_STATE_BUS_OFF;
> +		cpriv->error_frame.id |= CAN_ERR_BUSOFF;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_error_handling(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	/* based on the last state state check the new state */
> +	switch (cpriv->can.state) {
> +	case CAN_STATE_ERROR_ACTIVE:
> +		if (cpriv->bus.new_state >= CAN_STATE_ERROR_WARNING &&
> +		    cpriv->bus.new_state <= CAN_STATE_BUS_OFF)
> +			cpriv->can.can_stats.error_warning++;
> +		/* fallthrough */
> +	case CAN_STATE_ERROR_WARNING:
> +		if (cpriv->bus.new_state >= CAN_STATE_ERROR_PASSIVE &&
> +		    cpriv->bus.new_state <= CAN_STATE_BUS_OFF)
> +			cpriv->can.can_stats.error_passive++;
> +		break;
> +	default:
> +		break;
> +	}
> +	cpriv->can.state = cpriv->bus.new_state;
> +
> +	/* and send error packet */
> +	if (cpriv->error_frame.id)
> +		mcp25xxfd_can_error_skb(spi);
> +
> +	/* handle BUS OFF */
> +	if (cpriv->can.state == CAN_STATE_BUS_OFF) {
> +		if (cpriv->can.restart_ms == 0) {
> +			cpriv->can.can_stats.bus_off++;
> +			can_bus_off(net);
> +		}
> +	} else {
> +		/* restart the tx queue if needed */
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_status(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int ret;
> +
> +	/* clear all the interrupts asap - we have them on file allready */
> +	ret = mcp25xxfd_can_int_clear_int_flags(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* set up new state and error frame for this loop */
> +	cpriv->bus.new_state = cpriv->bus.state;
> +	memset(&cpriv->error_frame, 0, sizeof(cpriv->error_frame));
> +
> +	/* setup the process queue by clearing the counter */
> +	cpriv->fifos.submit_queue_count = 0;
> +
> +	/* handle interrupts */
> +
> +	/* system error interrupt needs to get handled first
> +	 * to get us out of restricted mode
> +	 */
> +	ret = mcp25xxfd_can_int_handle_serrif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* mode change interrupt */
> +	ret = mcp25xxfd_can_int_handle_modif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* handle the rx */
> +	ret = mcp25xxfd_can_int_handle_rxif(spi);
> +	if (ret)
> +		return ret;
> +	/* handle aborted TX FIFOs */
> +	ret = mcp25xxfd_can_int_handle_txatif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* handle the TEF */
> +	ret = mcp25xxfd_can_int_handle_tefif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* handle error interrupt flags */
> +	ret = mcp25xxfd_can_int_handle_rxovif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* sram ECC error interrupt */
> +	ret = mcp25xxfd_can_int_handle_eccif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* message format interrupt */
> +	ret = mcp25xxfd_can_int_handle_ivmif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* handle bus errors in more detail */
> +	ret = mcp25xxfd_can_int_handle_cerrif(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* error counter handling */
> +	ret = mcp25xxfd_can_int_error_counters(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* error counter handling */
> +	ret = mcp25xxfd_can_int_error_handling(spi);
> +	if (ret)
> +		return ret;
> +
> +	/* and submit can frames to network stack */
> +	ret = mcp25xxfd_can_submit_frames(spi);
> +
> +	return ret;
> +}
> +
> +irqreturn_t mcp25xxfd_can_int(int irq, void *dev_id)
> +{
> +	struct mcp25xxfd_priv *priv = dev_id;
> +	struct spi_device *spi = priv->spi;
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int ret;
> +
> +	/* count interrupt calls */
> +	cpriv->stats.irq_calls++;
> +
> +	/* as long as we should be running */
> +	while (1) {
> +		/* count irq loops */
> +		cpriv->stats.irq_loops++;
> +
> +		/* read interrupt status flags in bulk */
> +		ret = mcp25xxfd_cmd_read_regs(spi, CAN_INT,
> +					      &cpriv->status.intf,
> +					      sizeof(cpriv->status));
> +		if (ret)
> +			return ret;

Does this return a legal return code?

> +
> +		/* only act if the IE mask configured has active IF bits
> +		 * otherwise the Interrupt line should be deasserted already
> +		 * so we can exit the loop
> +		 */
> +		if (((cpriv->status.intf >> CAN_INT_IE_SHIFT) &
> +		       cpriv->status.intf) == 0)
> +			break;
> +
> +		/* handle the status */
> +		ret = mcp25xxfd_can_int_handle_status(spi);
> +		if (ret)
> +			return ret;

Ditto

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
> new file mode 100644
> index 000000000000..d5e4e2a18bb7
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + * implementation of can transmission
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include "mcp25xxfd_can.h"
> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/skbuff.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +
> +/* module parameters */
> +bool do_not_submit_rx;
> +module_param(do_not_submit_rx, bool, 0664);
> +MODULE_PARM_DESC(do_not_submit_rx,
> +		 "do not submit rx frames to can stack - used to test performance of the spi layer");
> +
> +static
> +struct sk_buff *mcp25xxfd_can_submit_rx_normal_frame(struct net_device *net,
> +						     u32 id,
> +						     u32 dlc, u8 **data)

The prefix of the functions in this interface should be "mcp25xxfd_can_rx"!

> +{
> +	struct can_frame *frame;
> +	struct sk_buff *skb;
> +
> +	/* allocate frame */
> +	skb = alloc_can_skb(net, &frame);
> +	if (!skb)
> +		return NULL;
> +
> +	/* set id, dlc and flags */
> +	frame->can_id = id;
> +	frame->can_dlc = dlc;
> +
> +	/* and set the pointer to data */
> +	*data = frame->data;
> +
> +	return skb;
> +}
> +
> +/* it is almost identical except for the type of the frame... */
> +static
> +struct sk_buff *mcp25xxfd_can_submit_rx_fd_frame(struct net_device *net,
> +						 u32 id, u32 flags,
> +						 u32 len, u8 **data)
> +{
> +	struct canfd_frame *frame;
> +	struct sk_buff *skb;
> +
> +	/* allocate frame */
> +	skb = alloc_canfd_skb(net, &frame);
> +	if (!skb)
> +		return NULL;
> +
> +	/* set id, dlc and flags */
> +	frame->can_id = id;
> +	frame->len = len;
> +	frame->flags |= flags;
> +
> +	/* and set the pointer to data */
> +	*data = frame->data;
> +
> +	return skb;
> +}
> +
> +int mcp25xxfd_can_submit_rx_frame(struct spi_device *spi, int fifo)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int addr = cpriv->fifos.fifo_reg[fifo].offset;
> +	struct mcp25xxfd_obj_rx *rx =
> +		(struct mcp25xxfd_obj_rx *)(cpriv->sram + addr);
> +	u8 *data = NULL;
> +	struct sk_buff *skb;
> +	u32 id, dlc, len, flags;
> +
> +	/* compute the can_id */
> +	mcp25xxfd_mcpid_to_canid(rx->id, rx->flags, &id);
> +
> +	/* and dlc */
> +	dlc = (rx->flags & CAN_OBJ_FLAGS_DLC_MASK) >>
> +		CAN_OBJ_FLAGS_DLC_SHIFT;
> +	len = can_dlc2len(dlc);
> +
> +	/* update stats */
> +	priv->net->stats.rx_packets++;
> +	priv->net->stats.rx_bytes += len;
> +	cpriv->fifos.rx.dlc_usage[dlc]++;
> +	if (rx->flags & CAN_OBJ_FLAGS_FDF)
> +		cpriv->fifos.rx.fd_count++;
> +
> +	/* allocate the skb buffer */
> +	if (rx->flags & CAN_OBJ_FLAGS_FDF) {
> +		flags = 0;
> +
> +		flags |= (flags & CAN_OBJ_FLAGS_BRS) ? CANFD_BRS : 0;
> +		flags |= (flags & CAN_OBJ_FLAGS_ESI) ? CANFD_ESI : 0;
> +		skb = mcp25xxfd_can_submit_rx_fd_frame(net, id, flags,
> +						       dlc, &data);
> +	} else {
> +		skb = mcp25xxfd_can_submit_rx_normal_frame(net, id,
> +							   len, &data);
> +	}
> +	if (!skb) {
> +		dev_err(&spi->dev, "cannot allocate RX skb\n");
> +		priv->net->stats.rx_dropped++;
> +		return -ENOMEM;
> +	}
> +
> +	/* copy the payload data */
> +	memcpy(data, rx->data, len);
> +
> +	/* and submit the frame */
> +	if (do_not_submit_rx)
> +		consume_skb(skb);
> +	else
> +		netif_rx_ni(skb);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_read_rx_frame(struct spi_device *spi,
> +				       int fifo)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int addr = cpriv->fifos.fifo_reg[fifo].offset;
> +	struct mcp25xxfd_obj_rx *rx =
> +		(struct mcp25xxfd_obj_rx *)(cpriv->sram + addr);
> +	int len, ret;
> +
> +	/* we read the header plus 8 data bytes for "standard frames" */
> +	ret = mcp25xxfd_cmd_readn(spi, MCP25XXFD_SRAM_ADDR(addr),
> +				  rx, sizeof(*rx) + 8);
> +	if (ret)
> +		return ret;
> +
> +	/* transpose the headers to CPU format*/
> +	rx->id = le32_to_cpu(rx->id);
> +	rx->flags = le32_to_cpu(rx->flags);
> +	rx->ts = le32_to_cpu(rx->ts);
> +
> +	/* compute len */
> +	len = can_dlc2len((rx->flags & CAN_OBJ_FLAGS_DLC_MASK) >>
> +			  CAN_OBJ_FLAGS_DLC_SHIFT);
> +
> +	/* read the remaining data for canfd frames */
> +	if (net->mtu == CANFD_MTU && len > 8) {
> +		/* here the extra portion reading CanFD frames */
> +		ret = mcp25xxfd_cmd_readn(spi,
> +					  MCP25XXFD_SRAM_ADDR(addr) +
> +					  sizeof(*rx) + 8,
> +					  &rx->data[8], len - 8);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* clear the rest of the buffer - just to be safe */
> +	memset(rx->data + len, 0,
> +	       ((net->mtu == CANFD_MTU) ? 64 : 8) - len);
> +
> +	/* increment the statistics counter */
> +	cpriv->fifos.fifo_info[fifo].use_count++;
> +
> +	/* add the fifo to the process queues */
> +	mcp25xxfd_can_queue_frame(cpriv, fifo, rx->ts);
> +
> +	/* and clear the interrupt flag for that fifo */
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_FIFOCON(fifo),
> +					CAN_FIFOCON_FRESET,
> +					CAN_FIFOCON_FRESET);
> +}
> +
> +int mcp25xxfd_can_read_rx_frames(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int i, fifo;
> +	int ret;
> +
> +	/* we can optimize here */
> +	for (i = 0, fifo = cpriv->fifos.rx.start;
> +	     i < cpriv->fifos.rx.count;
> +	     i++, fifo += cpriv->fifos.rx.increment) {
> +		if (cpriv->status.rxif & BIT(fifo)) {
> +			/* read the frame */
> +			ret = mcp25xxfd_can_read_rx_frame(spi, fifo);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
> new file mode 100644
> index 000000000000..9d53ac04ae10
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
> @@ -0,0 +1,824 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + * implementation of can transmission
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include "mcp25xxfd_can.h"
> +#include <linux/can/core.h>
> +#include <linux/can/dev.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/netdevice.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +
> +/* structure of a spi message that is prepared and can get deployed quickly */
> +struct mcp2517fd_tx_spi_message {
> +	/* the network device this is related to */
> +	struct net_device *net;
> +	/* the fifo this fills */
> +	u32 fifo;
> +	/* the xfer to fill in the fifo data */
> +	struct {
> +		struct spi_message msg;
> +		struct spi_transfer xfer;
> +		struct {
> +			u8 cmd[2];
> +			u8 header[sizeof(struct mcp25xxfd_obj_tx)];
> +			u8 data[64];
> +		} data;
> +	} fill_fifo;
> +	/* the xfer to enable transmission on the can bus */
> +	struct {
> +		struct spi_message msg;
> +		struct spi_transfer xfer;
> +		struct {
> +			u8 cmd[2];
> +			u8 data;
> +		} data;
> +	} trigger_fifo;
> +};
> +
> +struct mcp2517fd_tx_spi_message_queue {
> +	/* spinlock protecting the bitmaps
> +	 * as well as state and the skb_echo_* functions
> +	 */
> +	spinlock_t lock;
> +	/* bitmap of which fifo is in which stage */
> +	u32 idle;
> +	u32 in_fill_fifo_transfer;
> +	u32 in_trigger_fifo_transfer;
> +	u32 in_can_transfer;
> +	u32 transferred;
> +
> +	/* the queue state as seen per controller */
> +	int state;
> +
> +	/* spinlock protecting spi submission order */
> +	spinlock_t spi_lock;
> +
> +	/* map each fifo to a mcp2517fd_tx_spi_message */
> +	struct mcp2517fd_tx_spi_message *fifo2message[32];
> +
> +	/* the individual messages */
> +	struct mcp2517fd_tx_spi_message message[];
> +};
> +
> +/* mostly bit manipulations to move between stages */
> +static
> +struct mcp2517fd_tx_spi_message *mcp25xxfd_can_tx_queue_first_spi_message(
> +	struct mcp2517fd_tx_spi_message_queue *queue, u32 *bitmap)
> +{
> +	u32 first = ffs(*bitmap);
> +
> +	if (!first)
> +		return NULL;
> +
> +	return queue->fifo2message[first - 1];
> +}
> +
> +static
> +struct mcp2517fd_tx_spi_message *mcp25xxfd_can_tx_queue_last_spi_message(
> +	struct mcp2517fd_tx_spi_message_queue *queue, u32 *bitmap)
> +{
> +	u32 last = ffs(*bitmap);
> +
> +	if (!last)
> +		return NULL;
> +
> +	return queue->fifo2message[last - 1];
> +}
> +
> +static void mcp25xxfd_can_tx_queue_remove_spi_message(u32 *bitmap, int fifo)
> +{
> +	*bitmap &= ~BIT(fifo);
> +}
> +
> +static void mcp25xxfd_can_tx_queue_add_spi_message(u32 *bitmap, int fifo)
> +{
> +	*bitmap |= BIT(fifo);
> +}
> +
> +static void mcp25xxfd_can_tx_queue_move_spi_message(u32 *src, u32 *dest,
> +						    int fifo)
> +{
> +	mcp25xxfd_can_tx_queue_remove_spi_message(src, fifo);
> +	mcp25xxfd_can_tx_queue_add_spi_message(dest, fifo);
> +}
> +
> +static void mcp25xxfd_can_tx_spi_message_fill_fifo_complete(void *context)
> +{
> +	struct mcp2517fd_tx_spi_message *msg = context;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(msg->net);
> +	unsigned long flags;
> +
> +	/* reset transfer length to without data (DLC = 0) */
> +	msg->fill_fifo.xfer.len = sizeof(msg->fill_fifo.data.cmd) +
> +		sizeof(msg->fill_fifo.data.header);
> +
> +	/* we need to hold this lock to protect us from
> +	 * concurrent access by start_xmit
> +	 */
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* move to in_trigger_fifo_transfer */
> +	mcp25xxfd_can_tx_queue_move_spi_message(
> +		&cpriv->fifos.tx_queue->in_fill_fifo_transfer,
> +		&cpriv->fifos.tx_queue->in_trigger_fifo_transfer,
> +		msg->fifo);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +}
> +
> +static void mcp25xxfd_can_tx_spi_message_trigger_fifo_complete(void *context)
> +{
> +	struct mcp2517fd_tx_spi_message *msg = context;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(msg->net);
> +	unsigned long flags;
> +
> +	/* we need to hold this lock to protect us from
> +	 * concurrent access by the interrupt thread
> +	 */
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* move to can_transfer */
> +	mcp25xxfd_can_tx_queue_move_spi_message(
> +		&cpriv->fifos.tx_queue->in_trigger_fifo_transfer,
> +		&cpriv->fifos.tx_queue->in_can_transfer,
> +		msg->fifo);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +}
> +
> +#if defined(CONFIG_DEBUG_FS)
> +static void mcp25xxfd_can_tx_queue_debugfs(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct dentry *dir = cpriv->fifos.tx.debugfs_dir;
> +	struct mcp2517fd_tx_spi_message_queue *queue = cpriv->fifos.tx_queue;
> +
> +	debugfs_create_u32("netif_queue_state",  0444, dir,
> +			   &cpriv->fifos.tx_queue->state);
> +
> +	/* and for each queue stage the states */
> +	debugfs_create_x32("fifos_idle", 0444, dir,
> +			   &queue->idle);
> +	debugfs_create_x32("fifos_in_fill_fifo_transfer", 0444, dir,
> +			   &queue->in_fill_fifo_transfer);
> +	debugfs_create_x32("fifos_in_trigger_fifo_transfer", 0444, dir,
> +			   &queue->in_trigger_fifo_transfer);
> +	debugfs_create_x32("fifos_in_can_transfer", 0444, dir,
> +			   &queue->in_can_transfer);
> +	debugfs_create_x32("fifos_transferred", 0444, dir,
> +			   &queue->transferred);
> +}
> +#else
> +static void mcp25xxfd_can_tx_queue_debugfs(struct net_device *net)
> +{
> +}
> +#endif
> +
> +static
> +void mcp25xxfd_can_tx_message_init(struct net_device *net,
> +				   struct mcp2517fd_tx_spi_message *msg,
> +				   int fifo)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	const u32 trigger = CAN_FIFOCON_TXREQ | CAN_FIFOCON_UINC;
> +	const int first_byte = mcp25xxfd_first_byte(trigger);
> +	u32 addr;
> +
> +	/* and initialize the structure */
> +	msg->net = net;
> +	msg->fifo = fifo;
> +
> +	/* init fill_fifo */
> +	spi_message_init(&msg->fill_fifo.msg);
> +	msg->fill_fifo.msg.complete =
> +		mcp25xxfd_can_tx_spi_message_fill_fifo_complete;
> +	msg->fill_fifo.msg.context = msg;
> +
> +	msg->fill_fifo.xfer.speed_hz = priv->spi_use_speed_hz;
> +	msg->fill_fifo.xfer.tx_buf = msg->fill_fifo.data.cmd;
> +	msg->fill_fifo.xfer.len = sizeof(msg->fill_fifo.data.cmd) +
> +		sizeof(msg->fill_fifo.data.header);
> +	spi_message_add_tail(&msg->fill_fifo.xfer, &msg->fill_fifo.msg);
> +
> +	addr = MCP25XXFD_SRAM_ADDR(cpriv->fifos.fifo_reg[fifo].offset);
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_WRITE,
> +				addr, msg->fill_fifo.data.cmd);
> +
> +	/* init trigger_fifo */
> +	spi_message_init(&msg->trigger_fifo.msg);
> +	msg->trigger_fifo.msg.complete =
> +		mcp25xxfd_can_tx_spi_message_trigger_fifo_complete;
> +	msg->trigger_fifo.msg.context = msg;
> +
> +	msg->trigger_fifo.xfer.speed_hz = priv->spi_use_speed_hz;
> +	msg->trigger_fifo.xfer.tx_buf = msg->trigger_fifo.data.cmd;
> +	msg->trigger_fifo.xfer.len = sizeof(msg->trigger_fifo.data.cmd) +
> +		sizeof(msg->trigger_fifo.data.data);
> +	spi_message_add_tail(&msg->trigger_fifo.xfer, &msg->trigger_fifo.msg);
> +
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_WRITE,
> +				CAN_FIFOCON(fifo) + first_byte,
> +				msg->trigger_fifo.data.cmd);
> +	msg->trigger_fifo.data.data = trigger >> (8 * first_byte);
> +
> +	/* and add to idle tx transfers */
> +	mcp25xxfd_can_tx_queue_add_spi_message(&cpriv->fifos.tx_queue->idle,
> +					       fifo);
> +}
> +
> +int mcp25xxfd_can_tx_queue_alloc(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	size_t size = sizeof(struct mcp2517fd_tx_spi_message_queue) +
> +		cpriv->fifos.tx.count *
> +		sizeof(struct mcp2517fd_tx_spi_message);
> +	struct mcp2517fd_tx_spi_message *msg;
> +	int i, fifo;
> +
> +	/* allocate the fifos as an array */
> +	cpriv->fifos.tx_queue = kzalloc(size, GFP_KERNEL);
> +	if (!cpriv->fifos.tx_queue)
> +		return -ENOMEM;
> +
> +	/* initialize the tx_queue structure */
> +	spin_lock_init(&cpriv->fifos.tx_queue->lock);
> +	spin_lock_init(&cpriv->fifos.tx_queue->spi_lock);
> +
> +	/* initialize the individual spi_message structures */
> +	for (i = 0, fifo = cpriv->fifos.tx.start;
> +	     i < cpriv->fifos.tx.count;
> +	     i++, fifo += cpriv->fifos.tx.increment) {
> +		msg = &cpriv->fifos.tx_queue->message[i];
> +		cpriv->fifos.tx_queue->fifo2message[fifo] = msg;
> +		mcp25xxfd_can_tx_message_init(net, msg, fifo);
> +	}
> +
> +	mcp25xxfd_can_tx_queue_debugfs(net);
> +
> +	return 0;
> +}
> +
> +void mcp25xxfd_can_tx_queue_free(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	/* eventually we may need to wait here
> +	 * for all transfers to have finished
> +	 */
> +
> +	kfree(cpriv->fifos.tx_queue);
> +	cpriv->fifos.tx_queue = NULL;
> +}
> +
> +void mcp25xxfd_can_tx_queue_manage_nolock(struct net_device *net, int state)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +
> +	/* skip early */
> +	if (state == cpriv->fifos.tx_queue->state)
> +		return;
> +
> +	/* start/stop netif_queue if necessary */
> +	switch (cpriv->fifos.tx_queue->state) {
> +	case TX_QUEUE_STATE_RUNABLE:
> +		switch (state) {
> +		case TX_QUEUE_STATE_RESTART:
> +		case TX_QUEUE_STATE_STARTED:
> +			netif_wake_queue(net);
> +			cpriv->fifos.tx_queue->state =
> +				TX_QUEUE_STATE_STARTED;
> +			break;
> +		}
> +		break;
> +	case TX_QUEUE_STATE_STOPPED:
> +		switch (state) {
> +		case TX_QUEUE_STATE_STARTED:
> +			netif_wake_queue(net);
> +			cpriv->fifos.tx_queue->state = state;
> +			break;
> +		}
> +		break;
> +	case TX_QUEUE_STATE_STARTED:
> +		switch (state) {
> +		case TX_QUEUE_STATE_RUNABLE:
> +		case TX_QUEUE_STATE_STOPPED:
> +			netif_stop_queue(net);
> +			cpriv->fifos.tx_queue->state = state;
> +			break;
> +		}
> +		break;
> +	default:
> +		WARN(true, "Unsupported tx_queue state: %i\n",
> +		     cpriv->fifos.tx_queue->state);
> +		break;
> +	}
> +}
> +
> +void mcp25xxfd_can_tx_queue_manage(struct net_device *net, int state)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	mcp25xxfd_can_tx_queue_manage_nolock(net, state);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +}
> +
> +void mcp25xxfd_can_tx_queue_restart(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	unsigned long flags;
> +	u32 mask;
> +
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* only move if there is nothing pending or idle */
> +	mask = cpriv->fifos.tx_queue->idle |
> +		cpriv->fifos.tx_queue->in_fill_fifo_transfer |
> +		cpriv->fifos.tx_queue->in_trigger_fifo_transfer |
> +		cpriv->fifos.tx_queue->in_can_transfer;
> +	if (mask)
> +		goto out;
> +
> +	/* move all items from transferred to idle */
> +	cpriv->fifos.tx_queue->idle |= cpriv->fifos.tx_queue->transferred;
> +	cpriv->fifos.tx_queue->transferred = 0;
> +
> +	/* and enable queue */
> +	mcp25xxfd_can_tx_queue_manage_nolock(net, TX_QUEUE_STATE_RESTART);
> +out:
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +}
> +
> +static int mcp25xxfd_can_int_handle_txatif_fifo(struct spi_device *spi,
> +						int fifo)

The prefix here should be "mcp25xxfd_can_tx". Otherwise I would expect
that function in "mcp25xxfd_can_int.c".


> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	u32 val;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* read fifo status */
> +	ret = mcp25xxfd_cmd_read(spi, CAN_FIFOSTA(fifo), &val);
> +	if (ret)
> +		return ret;
> +
> +	/* clear the relevant interrupt flags */
> +	ret = mcp25xxfd_cmd_write_mask(spi,
> +				       CAN_FIFOSTA(fifo),
> +				       0,
> +				       CAN_FIFOSTA_TXABT |
> +				       CAN_FIFOSTA_TXLARB |
> +				       CAN_FIFOSTA_TXERR |
> +				       CAN_FIFOSTA_TXATIF);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +	/* for specific cases we probably could trigger a retransmit
> +	 * instead of an abort.
> +	 */
> +
> +	/* and we release it from the echo_skb buffer
> +	 * NOTE: this is one place where packet delivery will not
> +	 * be ordered, as we do not have any timing information
> +	 * when this occurred
> +	 */
> +	can_get_echo_skb(net, fifo);
> +
> +	mcp25xxfd_can_tx_queue_move_spi_message(
> +		&cpriv->fifos.tx_queue->in_can_transfer,
> +		&cpriv->fifos.tx_queue->transferred,
> +		fifo);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* but we need to run a bit of cleanup */
> +	cpriv->status.txif &= ~BIT(fifo);
> +	net->stats.tx_aborted_errors++;
> +
> +	/* handle all the known cases accordingly - ignoring FIFO full */
> +	val &= CAN_FIFOSTA_TXABT |
> +		CAN_FIFOSTA_TXLARB |
> +		CAN_FIFOSTA_TXERR;
> +	switch (val) {
> +	case CAN_FIFOSTA_TXERR:
> +		/* this indicates a possible bus error */
> +		break;
> +	default:
> +		dev_warn_ratelimited(&spi->dev,
> +				     "Unknown TX-Fifo abort condition: %08x - stopping tx-queue\n",
> +				     val);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +int mcp25xxfd_can_int_handle_txatif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int i, fifo;
> +	int ret;
> +
> +	/* if txatif is unset, then there are no
> +	 * can frames that have been transmitted
> +	 * and need to get reingested into the network stack
> +	 */
> +	if (!cpriv->status.txatif)
> +		return 0;
> +	cpriv->stats.int_txat_count++;
> +
> +	/* process all the fifos with that flag set */
> +	for (i = 0, fifo = cpriv->fifos.tx.start;
> +	     i < cpriv->fifos.tx.count;
> +	     i++, fifo += cpriv->fifos.tx.increment) {
> +		if (cpriv->status.txatif & BIT(fifo)) {
> +			ret = mcp25xxfd_can_int_handle_txatif_fifo(spi,
> +								   fifo);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* submit the fifo back to the network stack */
> +int mcp25xxfd_can_submit_tx_frame(struct spi_device *spi, int fifo)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_obj_tx *tx = (struct mcp25xxfd_obj_tx *)
> +		(cpriv->sram + cpriv->fifos.fifo_reg[fifo].offset);
> +	int dlc = (tx->flags & CAN_OBJ_FLAGS_DLC_MASK) >>
> +		CAN_OBJ_FLAGS_DLC_SHIFT;
> +	unsigned long flags;
> +
> +	/* update counters */
> +	net->stats.tx_packets++;
> +	cpriv->fifos.tx.dlc_usage[dlc]++;
> +	priv->net->stats.tx_bytes += can_dlc2len(dlc);
> +	if (tx->flags & CAN_OBJ_FLAGS_FDF)
> +		cpriv->stats.tx_fd_count++;
> +	if (tx->flags & CAN_OBJ_FLAGS_BRS)
> +		cpriv->stats.tx_brs_count++;
> +
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* release the echo buffer */
> +	can_get_echo_skb(priv->net, fifo);
> +
> +	/* move from in_can_transfer to transferred */
> +	mcp25xxfd_can_tx_queue_move_spi_message(
> +		&cpriv->fifos.tx_queue->in_can_transfer,
> +		&cpriv->fifos.tx_queue->transferred,
> +		fifo);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_can_int_handle_tefif_fifo(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_obj_tef *tef;
> +	u32 tef_offset = cpriv->fifos.tef.index * cpriv->fifos.tef.size;
> +	int fifo, ret;
> +
> +	/* read the next TEF entry to get the transmit timestamp and fifo */
> +	tef = (struct mcp25xxfd_obj_tef *)(cpriv->sram + tef_offset);
> +	ret = mcp25xxfd_cmd_read_regs(spi, MCP25XXFD_SRAM_ADDR(tef_offset),
> +				      &tef->id, sizeof(*tef));
> +	if (ret)
> +		return ret;
> +
> +	/* now we can schedule the fifo for echo submission */
> +	fifo = (tef->flags & CAN_OBJ_FLAGS_SEQ_MASK) >>
> +		CAN_OBJ_FLAGS_SEQ_SHIFT;
> +	mcp25xxfd_can_queue_frame(cpriv, -fifo, tef->ts);
> +
> +	/* increment the tef index with wraparround */
> +	cpriv->fifos.tef.index++;
> +	if (cpriv->fifos.tef.index >= cpriv->fifos.tef.count)
> +		cpriv->fifos.tef.index = 0;
> +
> +	/* finally just increment the TEF pointer */
> +	return mcp25xxfd_cmd_write_mask(spi, CAN_TEFCON,
> +				 CAN_TEFCON_UINC,
> +				 CAN_TEFCON_UINC);
> +}
> +
> +static
> +int mcp25xxfd_can_int_handle_tefif_conservative(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	u32 tefsta;
> +	int ret;
> +
> +	netdev_warn(net,
> +		    "Something is wrong - we got a TEF interrupt but we were not able to detect a finished fifo\n");
> +
> +	/* we can assume that there is at least one,
> +	 * so fake the first read of TEFSTA
> +	 */
> +	tefsta = CAN_TEFSTA_TEFNEIF;
> +
> +	/* read the tef in an inefficient loop */
> +	while (tefsta & CAN_TEFSTA_TEFNEIF) {
> +		/* read one tef */
> +		ret = mcp25xxfd_can_int_handle_tefif_fifo(spi);
> +		if (ret)
> +			return ret;
> +
> +		/* read the TEF status again*/
> +		ret = mcp25xxfd_cmd_read_mask(spi, CAN_TEFSTA,
> +					      &tefsta, CAN_TEFSTA_TEFNEIF);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static
> +int mcp25xxfd_can_int_handle_tefif_oportunistic(struct spi_device *spi,
> +						u32 finished)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int i, fifo, ret;
> +
> +	/* now iterate those */
> +	for (i = 0, fifo = cpriv->fifos.tx.start;
> +	     i < cpriv->fifos.tx.count;
> +	     i++, fifo += cpriv->fifos.tx.increment) {
> +		if (finished & BIT(fifo)) {
> +			ret = mcp25xxfd_can_int_handle_tefif_fifo(spi);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int mcp25xxfd_can_int_handle_tefif(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct net_device *net = priv->net;
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	unsigned long flags;
> +	u32 finished;
> +
> +	if (!(cpriv->status.intf & CAN_INT_TEFIF))
> +		return 0;
> +	cpriv->stats.int_tef_count++;
> +
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* compute finished fifos and clear them immediately */
> +	finished = (cpriv->fifos.tx_queue->in_can_transfer ^
> +		    cpriv->status.txreq) &
> +		cpriv->fifos.tx_queue->in_can_transfer;
> +
> +	cpriv->fifos.tx_queue->in_can_transfer &= ~finished;
> +	cpriv->fifos.tx_queue->transferred |= finished;
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* in case of a strange situation run in safe mode */
> +	if (!finished)
> +		return mcp25xxfd_can_int_handle_tefif_conservative(spi);
> +
> +	/* otherwise run in oportunistic mode */
> +	return mcp25xxfd_can_int_handle_tefif_oportunistic(spi, finished);
> +}
> +
> +static
> +void mcp25xxfd_can_tx_fill_fifo_common(struct net_device *net,
> +				       struct mcp2517fd_tx_spi_message *smsg,
> +				       struct mcp25xxfd_obj_tx *tx,
> +				       int dlc, u8 *data)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int len = can_dlc2len(dlc);
> +
> +	/* update statistics */
> +	cpriv->fifos.tx.dlc_usage[dlc]++;
> +	cpriv->fifos.fifo_info[smsg->fifo].use_count++;
> +
> +	/* add fifo number as seq */
> +	tx->flags |= smsg->fifo << CAN_OBJ_FLAGS_SEQ_SHIFT;
> +
> +	/* copy data to tx->data for future reference */
> +	memcpy(tx->data, data, len);
> +
> +	/* transform header to controller format */
> +	mcp25xxfd_convert_from_cpu(&tx->id, sizeof(*tx) / sizeof(u32));
> +
> +	/* copy header + data to final location - we are not aligned */
> +	memcpy(smsg->fill_fifo.data.header, &tx->id, sizeof(*tx) + len);
> +
> +	/* convert it back to CPU format */
> +	mcp25xxfd_convert_to_cpu(&tx->id, sizeof(*tx) / sizeof(u32));
> +
> +	/* set up size of transfer */
> +	smsg->fill_fifo.xfer.len = sizeof(smsg->fill_fifo.data.cmd) +
> +		sizeof(smsg->fill_fifo.data.header) + len;
> +}
> +
> +static
> +void mcp25xxfd_can_tx_fill_fifo_fd(struct net_device *net,
> +				   struct canfd_frame *frame,
> +				   struct mcp2517fd_tx_spi_message *smsg,
> +				   struct mcp25xxfd_obj_tx *tx)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	int dlc = can_len2dlc(frame->len);
> +
> +	/* update some statistics */
> +	cpriv->stats.tx_fd_count++;
> +
> +	/* compute can id */
> +	mcp25xxfd_canid_to_mcpid(frame->can_id, &tx->id, &tx->flags);
> +
> +	/* setup flags */
> +	tx->flags |= dlc << CAN_OBJ_FLAGS_DLC_SHIFT;
> +	tx->flags |= (frame->can_id & CAN_EFF_FLAG) ? CAN_OBJ_FLAGS_IDE : 0;
> +	tx->flags |= (frame->can_id & CAN_RTR_FLAG) ? CAN_OBJ_FLAGS_RTR : 0;
> +	if (frame->flags & CANFD_BRS) {
> +		tx->flags |= CAN_OBJ_FLAGS_BRS;
> +		cpriv->stats.tx_brs_count++;
> +	}
> +	tx->flags |= (frame->flags & CANFD_ESI) ? CAN_OBJ_FLAGS_ESI : 0;
> +	tx->flags |= CAN_OBJ_FLAGS_FDF;
> +
> +	/* and do common processing */
> +	mcp25xxfd_can_tx_fill_fifo_common(net, smsg, tx,
> +					  dlc, frame->data);
> +}
> +
> +static
> +void mcp25xxfd_can_tx_fill_fifo(struct net_device *net,
> +				struct can_frame *frame,
> +				struct mcp2517fd_tx_spi_message *smsg,
> +				struct mcp25xxfd_obj_tx *tx)
> +{
> +	/* set frame to valid dlc */
> +	if (frame->can_dlc > 8)
> +		frame->can_dlc = 8;
> +
> +	/* compute can id */
> +	mcp25xxfd_canid_to_mcpid(frame->can_id, &tx->id, &tx->flags);
> +
> +	/* setup flags */
> +	tx->flags |= frame->can_dlc << CAN_OBJ_FLAGS_DLC_SHIFT;
> +	tx->flags |= (frame->can_id & CAN_EFF_FLAG) ? CAN_OBJ_FLAGS_IDE : 0;
> +	tx->flags |= (frame->can_id & CAN_RTR_FLAG) ? CAN_OBJ_FLAGS_RTR : 0;
> +
> +	/* and do common processing */
> +	mcp25xxfd_can_tx_fill_fifo_common(net, smsg, tx,
> +					  frame->can_dlc, frame->data);
> +}
> +
> +static struct mcp2517fd_tx_spi_message
> +*mcp25xxfd_can_tx_queue_get_next_fifo(struct net_device *net)
> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp2517fd_tx_spi_message *smsg;
> +	unsigned long flags;
> +
> +	/* we need to hold this lock to protect us against
> +	 * concurrent modifications of cpriv->fifos.tx_queue->idle
> +	 * in the interrupt thread
> +	 */
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	/* get the first entry from idle */
> +	if (cpriv->fifos.tx.increment > 0)
> +		smsg = mcp25xxfd_can_tx_queue_first_spi_message(
> +			cpriv->fifos.tx_queue, &cpriv->fifos.tx_queue->idle);
> +	else
> +		smsg = mcp25xxfd_can_tx_queue_last_spi_message(
> +			cpriv->fifos.tx_queue, &cpriv->fifos.tx_queue->idle);
> +	if (!smsg)
> +		goto out_busy;
> +
> +	/* and move the fifo to next stage */
> +	mcp25xxfd_can_tx_queue_move_spi_message(
> +		&cpriv->fifos.tx_queue->idle,
> +		&cpriv->fifos.tx_queue->in_fill_fifo_transfer,
> +		smsg->fifo);
> +
> +	/* if queue is empty then stop the network queue immediately */
> +	if (!cpriv->fifos.tx_queue->idle)
> +		mcp25xxfd_can_tx_queue_manage_nolock(net,
> +						     TX_QUEUE_STATE_RUNABLE);
> +out_busy:
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);
> +
> +	return smsg;
> +}
> +
> +/* submit the can message to the can-bus */
> +netdev_tx_t mcp25xxfd_can_start_xmit(struct sk_buff *skb,
> +				     struct net_device *net)

A better place for that function is probably "mcp25xxfd_can.c", together
with all other net ops.

> +{
> +	struct mcp25xxfd_can_priv *cpriv = netdev_priv(net);
> +	struct mcp25xxfd_priv *priv = cpriv->priv;
> +	struct spi_device *spi = priv->spi;
> +	struct mcp2517fd_tx_spi_message *smsg;
> +	struct mcp25xxfd_obj_tx *tx;
> +	int addr;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* invalid skb we can ignore */
> +	if (can_dropped_invalid_skb(net, skb))
> +		return NETDEV_TX_OK;
> +
> +	/* acquire lock on spi so that we are are not risking
> +	 * some reordering of spi messages when we are running
> +	 * start_xmit in multiple threads (on multiple cores)
> +	 */
> +	spin_lock_irqsave(&cpriv->fifos.tx_queue->spi_lock, flags);
> +
> +	/* get the fifo message structure to process now */
> +	smsg = mcp25xxfd_can_tx_queue_get_next_fifo(net);
> +	if (!smsg)
> +		goto out_busy;
> +
> +	/* compute the fifo in sram */
> +	addr = cpriv->fifos.fifo_reg[smsg->fifo].offset;
> +	tx = (struct mcp25xxfd_obj_tx *)(cpriv->sram + addr);
> +
> +	/* fill in message from skb->data depending on can2.0 or canfd */
> +	if (can_is_canfd_skb(skb))
> +		mcp25xxfd_can_tx_fill_fifo_fd(net,
> +					      (struct canfd_frame *)skb->data,
> +					      smsg, tx);
> +	else
> +		mcp25xxfd_can_tx_fill_fifo(net,
> +					   (struct can_frame *)skb->data,
> +					   smsg, tx);
> +
> +	/* submit the two messages asyncronously
> +	 * the reason why we separate transfers into two spi_messages is:
> +	 *  * because the spi framework (currently) does add a 10us delay
> +	 *    between 2 spi_transfers in a single spi_message when
> +	 *    change_cs is set - 2 consecutive spi messages show a shorter
> +	 *     cs disable phase increasing bus utilization
> +	 *  * this allows the interrupt handler to start spi messages earlier
> +	 *    so reducing latencies a bit and to allow for better concurrency
> +	 */
> +	ret = spi_async(spi, &smsg->fill_fifo.msg);
> +	if (ret)
> +		goto out_async_failed;
> +	ret = spi_async(spi, &smsg->trigger_fifo.msg);
> +	if (ret)
> +		goto out_async_failed;
> +
> +	/* unlock the spi bus */
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->spi_lock, flags);
> +
> +	/* keep it for reference until the message really got transmitted */
> +	can_put_echo_skb(skb, net, smsg->fifo);
> +
> +	return NETDEV_TX_OK;
> +out_async_failed:
> +	netdev_err(net, "spi_async submission of fifo %i failed - %i\n",
> +		   smsg->fifo, ret);
> +
> +out_busy:
> +	/* stop the queue */
> +	mcp25xxfd_can_tx_queue_manage_nolock(net, TX_QUEUE_STATE_STOPPED);
> +
> +	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->spi_lock, flags);
> +
> +	return NETDEV_TX_BUSY;
> +}
> --
> 2.11.0
> 

I did not review all of the code yet. I think you should fix your
modularization first, especially the structures used for the interface
functions.

Furthermore I find that the name "priv" and "cpriv" are not really
meaningful and sometimes even confusing. Maybe "base/core" and "can"
would make the code more readable. What do you think?

Wolfgang.
