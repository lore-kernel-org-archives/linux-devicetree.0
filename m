Return-Path: <SRS0=wFgJ=P5=grandegger.com=wg@kernel.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH V5 2/4] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD
 driver basics
References: <20181221092950.14192-1-kernel@martin.sperl.org>
 <20181221092950.14192-3-kernel@martin.sperl.org>
Message-ID: <89f96653-f850-8ae8-a390-bce93334c326@grandegger.com>
Date: Mon, 21 Jan 2019 13:31:24 +0100
MIME-Version: 1.0
In-Reply-To: <20181221092950.14192-3-kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: kernel@martin.sperl.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
List-ID: <devicetree@vger.kernel.org>

Hello Martin,

this is the first part of my review...

I'm still not happy about the big amount of code lines, but I also do
not see a way to reduce it significantly/easily.

Am 21.12.18 um 10:29 schrieb kernel@martin.sperl.org:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> This patch adds basic driver support for the Microchip mcp2517fd
> CAN-FD controller.
> 
> The mcp2517fd is capable of transmitting and receiving standard data
> frames, extended data frames, remote frames and Can-FD frames.
> The mcp2517fd interfaces with the host over SPI.
> 
> This patch iprovides basic driver functionality:

Typo!

> setting up clocks and the infrastructure for the can and gpio portions
> of the driver.
> 
> Datasheet:
> * http://ww1.microchip.com/downloads/en/DeviceDoc/20005688A.pdf
> Reference manual:
> * http://ww1.microchip.com/downloads/en/DeviceDoc/20005678A.pdf
> Errata:
> * http://ww1.microchip.com/downloads/en/DeviceDoc/MCP2517FD-Silicon-Errata-and-Data-Sheet-Clarification-DS80000792A.pdf
> 
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> 
> ---
> Changelog:
>   V1 -> V2: implemented support as per feedback
>   V2 -> V3: moved dt-binding changes to patch 1
>   V3 -> V4: resend
>   V4 -> V5: reorganized driver into separate files
>             added more HW detection test
> 
> ---
>  drivers/net/can/spi/Kconfig                    |    2 +
>  drivers/net/can/spi/Makefile                   |    2 +
>  drivers/net/can/spi/mcp25xxfd/Kconfig          |    5 +
>  drivers/net/can/spi/mcp25xxfd/Makefile         |    6 +
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h      |  238 +++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c | 1190 ++++++++++++++++++++++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c  |  228 +++++
>  drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h  |  487 ++++++++++

About file names and modularization: A "mcp25xxfd_xxx.c" should also have
a header file "mcp25xxfd_xxx.h" defining the interface and use the
prefix "mcp25xxfd_xxx". Therefore, "s/mcp25xxfd_base/mcp25xxfd" would
make more sense.

Also, could you please put just the register definitions in
"mcp25xxfd_reg.h".

>  8 files changed, 2158 insertions(+)
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/Kconfig
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/Makefile
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
>  create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> 
> diff --git a/drivers/net/can/spi/Kconfig b/drivers/net/can/spi/Kconfig
> index 8f2e0dd7b756..7a5b1436492e 100644
> --- a/drivers/net/can/spi/Kconfig
> +++ b/drivers/net/can/spi/Kconfig
> @@ -13,4 +13,6 @@ config CAN_MCP251X
>  	---help---
>  	  Driver for the Microchip MCP251x SPI CAN controllers.
> 
> +source "drivers/net/can/spi/mcp25xxfd/Kconfig"
> +
>  endmenu
> diff --git a/drivers/net/can/spi/Makefile b/drivers/net/can/spi/Makefile
> index f59fa3731073..67d3ad21730b 100644
> --- a/drivers/net/can/spi/Makefile
> +++ b/drivers/net/can/spi/Makefile
> @@ -5,3 +5,5 @@
> 
>  obj-$(CONFIG_CAN_HI311X)	+= hi311x.o
>  obj-$(CONFIG_CAN_MCP251X)	+= mcp251x.o
> +
> +obj-y                           += mcp25xxfd/
> diff --git a/drivers/net/can/spi/mcp25xxfd/Kconfig b/drivers/net/can/spi/mcp25xxfd/Kconfig
> new file mode 100644
> index 000000000000..f720f1377612
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/Kconfig
> @@ -0,0 +1,5 @@
> +config CAN_MCP25XXFD
> +	tristate "Microchip MCP25xxFD SPI CAN controllers"
> +	depends on HAS_DMA
> +	help
> +	  Driver for the Microchip MCP25XXFD SPI FD-CAN controller family.
> diff --git a/drivers/net/can/spi/mcp25xxfd/Makefile b/drivers/net/can/spi/mcp25xxfd/Makefile
> new file mode 100644
> index 000000000000..83de2d40cf9a
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/Makefile
> @@ -0,0 +1,6 @@
> +#
> +#  Makefile for the Linux Controller Area Network SPI drivers.
> +#
> +obj-$(CONFIG_CAN_MCP25XXFD)	+= mcp25xxfd.o
> +mcp25xxfd-objs                  := mcp25xxfd_base.o
> +mcp25xxfd-objs                  += mcp25xxfd_can.o
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
> new file mode 100644
> index 000000000000..0f02c78a9a56
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
> @@ -0,0 +1,238 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +/* some constants derived from the datasheets */
> +#define MCP25XXFD_OST_DELAY_MS		3
> +#define MCP25XXFD_MIN_CLOCK_FREQUENCY	1000000
> +#define MCP25XXFD_MAX_CLOCK_FREQUENCY	40000000
> +#define MCP25XXFD_PLL_MULTIPLIER	10
> +#define MCP25XXFD_AUTO_PLL_MAX_CLOCK_FREQUENCY				\
> +	(MCP25XXFD_MAX_CLOCK_FREQUENCY / MCP25XXFD_PLL_MULTIPLIER)
> +#define MCP25XXFD_SCLK_DIVIDER		2
> +
> +/* address defines for SRAM */
> +#define MCP25XXFD_SRAM_SIZE 2048
> +#define MCP25XXFD_SRAM_ADDR(x) (0x400 + (x))
> +
> +/* some defines for the driver */
> +#define MCP25XXFD_BUFFER_TXRX_SIZE (MCP25XXFD_SRAM_SIZE)
> +#define MCP25XXFD_OSC_POLLING_JIFFIES	(HZ / 2)
> +
> +/* SPI commands */
> +#define INSTRUCTION_RESET		0x0000
> +#define INSTRUCTION_READ		0x3000
> +#define INSTRUCTION_WRITE		0x2000
> +#define INSTRUCTION_READ_CRC		0xB000
> +#define INSTRUCTION_WRITE_CRC		0xA000
> +#define INSTRUCTION_WRITE_SAVE		0xC000
> +
> +#define ADDRESS_MASK			0x0fff

These definitions are not specific enough. Please add a prefix "MCP25XXFD_".

> +/* Register definitions */
> +#define MCP25XXFD_SFR_BASE(x)		(0xE00 + (x))
> +#define MCP25XXFD_OSC			MCP25XXFD_SFR_BASE(0x00)
> +#  define MCP25XXFD_OSC_PLLEN		BIT(0)
> +#  define MCP25XXFD_OSC_OSCDIS		BIT(2)
> +#  define MCP25XXFD_OSC_SCLKDIV		BIT(4)
> +#  define MCP25XXFD_OSC_CLKODIV_BITS	2
> +#  define MCP25XXFD_OSC_CLKODIV_SHIFT	5
> +#  define MCP25XXFD_OSC_CLKODIV_MASK			\
> +	GENMASK(MCP25XXFD_OSC_CLKODIV_SHIFT		\
> +		+ MCP25XXFD_OSC_CLKODIV_BITS - 1,	\
> +		MCP25XXFD_OSC_CLKODIV_SHIFT)
> +#  define MCP25XXFD_OSC_CLKODIV_10	3
> +#  define MCP25XXFD_OSC_CLKODIV_4	2
> +#  define MCP25XXFD_OSC_CLKODIV_2	1
> +#  define MCP25XXFD_OSC_CLKODIV_1	0
> +#  define MCP25XXFD_OSC_PLLRDY		BIT(8)
> +#  define MCP25XXFD_OSC_OSCRDY		BIT(10)
> +#  define MCP25XXFD_OSC_SCLKRDY		BIT(12)
> +#define MCP25XXFD_IOCON			MCP25XXFD_SFR_BASE(0x04)
> +#  define MCP25XXFD_IOCON_TRIS0		BIT(0)
> +#  define MCP25XXFD_IOCON_TRIS1		BIT(1)
> +#  define MCP25XXFD_IOCON_XSTBYEN	BIT(6)
> +#  define MCP25XXFD_IOCON_LAT0		BIT(8)
> +#  define MCP25XXFD_IOCON_LAT1		BIT(9)
> +#  define MCP25XXFD_IOCON_GPIO0		BIT(16)
> +#  define MCP25XXFD_IOCON_GPIO1		BIT(17)
> +#  define MCP25XXFD_IOCON_PM0		BIT(24)
> +#  define MCP25XXFD_IOCON_PM1		BIT(25)
> +#  define MCP25XXFD_IOCON_TXCANOD	BIT(28)
> +#  define MCP25XXFD_IOCON_SOF		BIT(29)
> +#  define MCP25XXFD_IOCON_INTOD		BIT(30)
> +#define MCP25XXFD_CRC			MCP25XXFD_SFR_BASE(0x08)
> +#  define MCP25XXFD_CRC_MASK		GENMASK(15, 0)
> +#  define MCP25XXFD_CRC_CRCERRIE	BIT(16)
> +#  define MCP25XXFD_CRC_FERRIE		BIT(17)
> +#  define MCP25XXFD_CRC_CRCERRIF	BIT(24)
> +#  define MCP25XXFD_CRC_FERRIF		BIT(25)
> +#define MCP25XXFD_ECCCON		MCP25XXFD_SFR_BASE(0x0C)
> +#  define MCP25XXFD_ECCCON_ECCEN	BIT(0)
> +#  define MCP25XXFD_ECCCON_SECIE	BIT(1)
> +#  define MCP25XXFD_ECCCON_DEDIE	BIT(2)
> +#  define MCP25XXFD_ECCCON_PARITY_BITS 6
> +#  define MCP25XXFD_ECCCON_PARITY_SHIFT 8
> +#  define MCP25XXFD_ECCCON_PARITY_MASK			\
> +	GENMASK(MCP25XXFD_ECCCON_PARITY_SHIFT		\
> +		+ MCP25XXFD_ECCCON_PARITY_BITS - 1,	\
> +		MCP25XXFD_ECCCON_PARITY_SHIFT)
> +#define MCP25XXFD_ECCSTAT		MCP25XXFD_SFR_BASE(0x10)
> +#  define MCP25XXFD_ECCSTAT_SECIF	BIT(1)
> +#  define MCP25XXFD_ECCSTAT_DEDIF	BIT(2)
> +#  define MCP25XXFD_ECCSTAT_ERRADDR_SHIFT 8
> +#  define MCP25XXFD_ECCSTAT_ERRADDR_MASK	      \
> +	GENMASK(MCP25XXFD_ECCSTAT_ERRADDR_SHIFT + 11, \
> +		MCP25XXFD_ECCSTAT_ERRADDR_SHIFT)
> +
> +#define DEVICE_NAME "mcp25xxfd"
> +
> +enum mcp25xxfd_model {
> +	CAN_MCP2517FD	= 0x2517,
> +};
> +
> +struct mcp25xxfd_priv {
> +	struct spi_device *spi;
> +	struct clk *clk;
> +
> +	/* the actual model of the mcp25xxfd */
> +	enum mcp25xxfd_model model;
> +
> +	/* everything clock related */
> +	int clock_freq;
> +	struct {
> +		/* clock configuration */
> +		int clock_pll;
> +		int clock_div2;
> +		int  clock_odiv;

Just one space please!

> +	} config;
> +
> +	/* lock for enabling/disabling the clock */
> +	struct mutex clk_user_lock;
> +	u32 clk_user_mask;
> +	u32 clk_sleep_mask;
> +#define MCP25XXFD_CLK_USER_CAN BIT(0)
> +#define MCP25XXFD_CLK_USER_GPIO0 BIT(1)
> +#define MCP25XXFD_CLK_USER_GPIO1 BIT(2)
> +#define MCP25XXFD_CLK_USER_CLKOUT BIT(3)
> +
> +	/* power related */
> +	struct regulator *power;
> +
> +	/* the distinct spi_speeds to use for spi communication */
> +	u32 spi_setup_speed_hz;
> +	u32 spi_normal_speed_hz;
> +	u32 spi_use_speed_hz;
> +
> +	/* spi-tx/rx buffers for efficient transfers
> +	 * used during setup and irq
> +	 */
> +	struct mutex spi_rxtx_lock;
> +	u8 spi_tx[MCP25XXFD_BUFFER_TXRX_SIZE];
> +	u8 spi_rx[MCP25XXFD_BUFFER_TXRX_SIZE];
> +
> +	/* configuration registers */
> +	struct {
> +		u32 osc;
> +		u32 iocon;
> +		u32 crc;
> +		u32 ecccon;
> +	} regs;
> +
> +	/* debugfs related */
> +#if defined(CONFIG_DEBUG_FS)
> +	struct dentry *debugfs_dir;
> +	struct dentry *debugfs_regs_dir;
> +#endif
> +};
> +
> +static inline int mcp25xxfd_power_enable(struct regulator *reg, int enable)
> +{
> +	if (IS_ERR_OR_NULL(reg))
> +		return 0;
> +
> +	if (enable)
> +		return regulator_enable(reg);
> +	else
> +		return regulator_disable(reg);
> +}
> +
> +static inline void mcp25xxfd_convert_to_cpu(u32 *data, int n)
> +{
> +	int i;
> +
> +	for (i = 0; i < n; i++)
> +		data[i] = le32_to_cpu(data[i]);

Is this optimized away if the endianess is the same?

> +}
> +
> +static inline void mcp25xxfd_convert_from_cpu(u32 *data, int n)
> +{
> +	int i;
> +
> +	for (i = 0; i < n; i++)
> +		data[i] = cpu_to_le32(data[i]);
> +}
> +
> +int mcp25xxfd_cmd_readn(struct spi_device *spi, u32 reg,
> +			void *data, int n);
> +int mcp25xxfd_cmd_read_mask(struct spi_device *spi, u32 reg,
> +			    u32 *data, u32 mask);
> +static inline int mcp25xxfd_cmd_read(struct spi_device *spi, u32 reg,
> +				     u32 *data)
> +{
> +	return mcp25xxfd_cmd_read_mask(spi, reg, data, -1);
> +}
> +
> +int mcp25xxfd_cmd_read_regs(struct spi_device *spi, u32 reg,
> +			    u32 *data, u32 bytes);
> +
> +int mcp25xxfd_cmd_writen(struct spi_device *spi, u32 reg,
> +			 void *data, int n);
> +int mcp25xxfd_cmd_write_mask(struct spi_device *spi, u32 reg,
> +			     u32 data, u32 mask);
> +static inline int mcp25xxfd_cmd_write(struct spi_device *spi, u32 reg,
> +				      u32 data)
> +{
> +	return mcp25xxfd_cmd_write_mask(spi, reg, data, -1);
> +}
> +
> +int mcp25xxfd_cmd_write_regs(struct spi_device *spi, u32 reg,
> +			     u32 *data, u32 bytes);
> +
> +int mcp25xxfd_dump_regs_range(struct seq_file *file, u32 start, u32 end);
> +
> +int mcp25xxfd_cmd_write_regs(struct spi_device *spi, u32 reg,
> +			     u32 *data, u32 bytes);
> +
> +int mcp25xxfd_dump_regs_range(struct seq_file *file, u32 start, u32 end);
> +
> +/* shared (internal) clock control */
> +int mcp25xxfd_stop_clock(struct spi_device *spi, int requestor_mask);
> +int mcp25xxfd_start_clock(struct spi_device *spi, int requestor_mask);
> +
> +/* to put us to sleep fully we need the CAN controller to enter sleep mode */
> +int mcp25xxfd_can_sleep_mode(struct spi_device *spi);
> +/* probe the can controller */
> +int mcp25xxfd_can_hw_probe(struct spi_device *spi);
> +
> +/* clearing interrupt flags */
> +int mcp25xxfd_clear_crc_interrupts(struct spi_device *spi);
> +int mcp25xxfd_clear_ecc_interrupts(struct spi_device *spi);
> +int mcp25xxfd_clear_interrupts(struct spi_device *spi);
> +
> +/* enabling interrupts */
> +int mcp25xxfd_enable_interrupts(struct spi_device *spi, bool enable);
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
> new file mode 100644
> index 000000000000..9c34893243d1
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
> @@ -0,0 +1,1190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "mcp25xxfd.h"
> +
> +/* device description and rational:
> + *
> + * the mcp25xxfd is a CanFD controller that also supports can2.0 only
> + * modes.
> + * It is connected via spi to the host and requires at minimum a single
> + * irq line in addition to the SPI lines - it is not mentioned explicitly
> + * in the documentation but in principle SPI 3-wire should be possible.
> + *
> + * The clock connected is typically 4MHz, 20MHz or 40MHz.
> + * When using a 4MHz clock the controller can use an integrated PLL to
> + * get 40MHz.
> + *
> + * The controller itself has 2KB of SRAM for CAN-data.
> + * ECC can get enabled for SRAM.
> + * CRC-16 checksumming of SPI transfers can get implemented
> + *   - some optimization options may not be efficient in such a situation.
> + *   - more SPI bus bandwidth is used for transfer of CRCs and
> + *     transfer length information
> + *
> + * It also contains 2 GPIO pins that can get used either as interrupt lines
> + * or GPIO IN or Out or STANDBY flags.
> + * In addition there is a PIN that allows output of a (divided) clock out
> + * or as a SOF (Start of Can FRAME) interrupt line - e.g for wakeup.
> + */
> +
> +/* known hardware issues and workarrounds in this driver:

"Known" and "workarounds"

> + *
> + * * There is one situation where the controller will require a full POR
> + *   (total power off) to recover from a bad Clock configuration.
> + *   This happens when the wrong clock is configured in the device tree
> + *   (say 4MHz are configured, while 40MHz is the actual clock frequency
> + *   of the HW).
> + *   In such a situation the driver tries to enable the PLL, which will
> + *   never synchronize and the controller becomes unresponsive to further
> + *   spi requests until a full POR.
> + *
> + *   Mitigation:
> + *     none as of now
> + *
> + *   Possible implementation of a mitigation/sanity check:
> + *     during initialization:
> + *       * try to identify the HW at 1MHz:
> + *         on success:
> + *           * controller is identified
> + *         on failure:
> + *           * controller is absent - fail
> + *       * force controller clock to run with disabled PLL
> + *       * try to identify the HW at 2MHz:
> + *         on success:
> + *           * controller clock is >= 4 MHz
> + *           * this may be 4MHz
> + *         on failure:
> + *           * controller clock is < 4 MHz
> + *       * try to identify the HW at 2.5MHz:
> + *         on success:
> + *           * controller clock is >= 5 MHz
> + *           * this may not be 4MHz
> + *         on failure:
> + *           * controller clock is 4 MHz
> + *           * enable PLL
> + *           * exit successfully (or run last test for verification purposes)
> + *       * try to identify the HW at <dt-clock/2> MHz:
> + *         on success:
> + *           * controller clock is >= <dt-clock/2> MHz
> + *              (it could be higher though)
> + *         on failure:
> + *           * the controller is not running at the
> + *             clock rate configured in the DT
> + *           * if PLL is enabled warn about requirements of POR
> + *           * fail
> + *
> + *   Side-effects:
> + *     * longer initialization time
> + *
> + *   Possible issues with mitigation:
> + *     * possibly miss-identification because the SPI block may work
> + *       "somewhat" at frequencies > < clock / 2 + delta f>
> + *       this may be especially true for the situation where we test if
> + *       2.5MHz SPI-Clock works.
> + *     * also SPI HW-clock dividers may do a round down to fixed frequencies
> + *       which is not propperly reported and may result in false positives
Typo

> + *       because a frequency lower than expected is used.
> + *
> + *   This is the reason why only simple testing is enabled at the risk of
> + *   the need for a POR.
> + */
> +
> +/* SPI helper */
> +
> +/* wrapper arround spi_sync, that sets speed_hz */
> +static int mcp25xxfd_sync_transfer(struct spi_device *spi,
> +				   struct spi_transfer *xfer,
> +				   unsigned int xfers)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int i;
> +
> +	for (i = 0; i < xfers; i++)
> +		xfer[i].speed_hz = priv->spi_use_speed_hz;
> +
> +	return spi_sync_transfer(spi, xfer, xfers);
> +}
> +
> +/* simple spi_write wrapper with speed_hz */
> +static int mcp25xxfd_write(struct spi_device *spi,
> +			   const void *tx_buf,
> +			   unsigned int tx_len)
> +{
> +	struct spi_transfer xfer;
> +
> +	memset(&xfer, 0, sizeof(xfer));
> +	xfer.tx_buf = tx_buf;
> +	xfer.len = tx_len;
> +
> +	return mcp25xxfd_sync_transfer(spi, &xfer, 1);
> +}
> +
> +/* an optimization of spi_write_then_read that merges the transfers */
> +static int mcp25xxfd_write_then_read(struct spi_device *spi,
> +				     const void *tx_buf,
> +				     unsigned int tx_len,
> +				     void *rx_buf,
> +				     unsigned int rx_len)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct spi_transfer xfer[2];
> +	u8 single_reg_data_tx[6];
> +	u8 single_reg_data_rx[6];
> +	int ret;
> +
> +	memset(xfer, 0, sizeof(xfer));
> +
> +	/* when using a halfduplex controller or to big for buffer */
> +	if ((spi->master->flags & SPI_MASTER_HALF_DUPLEX) ||
> +	    (tx_len + rx_len > sizeof(priv->spi_tx))) {
> +		xfer[0].tx_buf = tx_buf;
> +		xfer[0].len = tx_len;
> +
> +		xfer[1].rx_buf = rx_buf;
> +		xfer[1].len = rx_len;
> +
> +		return mcp25xxfd_sync_transfer(spi, xfer, 2);
> +	}
> +
> +	/* full duplex optimization */
> +	xfer[0].len = tx_len + rx_len;
> +	if (xfer[0].len > sizeof(single_reg_data_tx)) {
> +		mutex_lock(&priv->spi_rxtx_lock);
> +		xfer[0].tx_buf = priv->spi_tx;
> +		xfer[0].rx_buf = priv->spi_rx;
> +	} else {
> +		xfer[0].tx_buf = single_reg_data_tx;
> +		xfer[0].rx_buf = single_reg_data_rx;
> +	}
> +
> +	/* copy and clean */
> +	memcpy((u8 *)xfer[0].tx_buf, tx_buf, tx_len);
> +	memset((u8 *)xfer[0].tx_buf + tx_len, 0, rx_len);

Casts needed?

> +
> +	ret = mcp25xxfd_sync_transfer(spi, xfer, 1);
> +	if (!ret)
> +		memcpy(rx_buf, xfer[0].rx_buf + tx_len, rx_len);
> +
> +	if (xfer[0].len > sizeof(single_reg_data_tx))
> +		mutex_unlock(&priv->spi_rxtx_lock);
> +
> +	return ret;
> +}
> +
> +static int mcp25xxfd_write_then_write(struct spi_device *spi,
> +				      const void *tx_buf,
> +				      unsigned int tx_len,
> +				      const void *tx2_buf,
> +				      unsigned int tx2_len)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct spi_transfer xfer;
> +	u8 single_reg_data[6];
> +	int ret;
> +
> +	if (tx_len + tx2_len > MCP25XXFD_BUFFER_TXRX_SIZE)
> +		return -EINVAL;
> +
> +	memset(&xfer, 0, sizeof(xfer));
> +
> +	xfer.len = tx_len + tx2_len;
> +	if (xfer.len > sizeof(single_reg_data)) {
> +		mutex_lock(&priv->spi_rxtx_lock);
> +		xfer.tx_buf = priv->spi_tx;
> +	} else {
> +		xfer.tx_buf = single_reg_data;
> +	}
> +
> +	memcpy((u8 *)xfer.tx_buf, tx_buf, tx_len);
> +	memcpy((u8 *)xfer.tx_buf + tx_len, tx2_buf, tx2_len);

Casts?

> +
> +	ret = mcp25xxfd_sync_transfer(spi, &xfer, 1);
> +
> +	if (xfer.len > sizeof(single_reg_data))
> +		mutex_unlock(&priv->spi_rxtx_lock);
> +
> +	return ret;
> +}
> +
> +/* mcp25xxfd spi command/protocol helper */
> +
> +static void mcp25xxfd_calc_cmd_addr(u16 cmd, u16 addr, u8 *data)
> +{
> +	cmd = cmd | (addr & ADDRESS_MASK);
> +
> +	data[0] = (cmd >> 8) & 0xff;
> +	data[1] = (cmd >> 0) & 0xff;
> +}
> +
> +static int mcp25xxfd_first_byte(u32 mask)
> +{
> +	return (mask & 0x0000ffff) ?
> +		((mask & 0x000000ff) ? 0 : 1) :
> +		((mask & 0x00ff0000) ? 2 : 3);
> +}

inline?

> +static int mcp25xxfd_last_byte(u32 mask)
> +{
> +	return (mask & 0xffff0000) ?
> +		((mask & 0xff000000) ? 3 : 2) :
> +		((mask & 0x0000ff00) ? 1 : 0);
> +}

Ditto.

> +/* read multiple bytes, transform some registers */
> +int mcp25xxfd_cmd_readn(struct spi_device *spi, u32 reg,
> +			void *data, int n)
> +{
> +	u8 cmd[2];
> +	int ret;
> +
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_READ, reg, cmd);
> +
> +	ret = mcp25xxfd_write_then_read(spi, &cmd, 2, data, n);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/* read a register, but we are only interrested in a few bytes */
> +int mcp25xxfd_cmd_read_mask(struct spi_device *spi, u32 reg,
> +			    u32 *data, u32 mask)
> +{
> +	int first_byte, last_byte, len_byte;
> +	int ret;
> +
> +	/* check that at least one bit is set */
> +	if (!mask)
> +		return -EINVAL;
> +
> +	/* calculate first and last byte used */
> +	first_byte = mcp25xxfd_first_byte(mask);
> +	last_byte = mcp25xxfd_last_byte(mask);
> +	len_byte = last_byte - first_byte + 1;
> +
> +	/* do a partial read */
> +	*data = 0;
> +	ret = mcp25xxfd_cmd_readn(spi, reg + first_byte,
> +				  ((void *)data + first_byte), len_byte);
> +	if (ret)
> +		return ret;
> +
> +	mcp25xxfd_convert_to_cpu(data, 1);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_cmd_reset(struct spi_device *spi)
> +{
> +	u8 cmd[2];
> +
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_RESET, 0, cmd);
> +
> +	/* write the reset command */
> +	return mcp25xxfd_write(spi, cmd, 2);
> +}
> +
> +int mcp25xxfd_cmd_writen(struct spi_device *spi, u32 reg,
> +			 void *data, int n)
> +{
> +	u8 cmd[2];
> +	int ret;
> +
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_WRITE, reg, cmd);
> +
> +	ret = mcp25xxfd_write_then_write(spi, &cmd, 2, data, n);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/* read a register, but we are only interrested in a few bytes */
> +int mcp25xxfd_cmd_write_mask(struct spi_device *spi, u32 reg,
> +			     u32 data, u32 mask)
> +{
> +	int first_byte, last_byte, len_byte;
> +	u8 cmd[2];
> +
> +	/* check that at least one bit is set */
> +	if (!mask)
> +		return -EINVAL;
> +
> +	/* calculate first and last byte used */
> +	first_byte = mcp25xxfd_first_byte(mask);
> +	last_byte = mcp25xxfd_last_byte(mask);
> +	len_byte = last_byte - first_byte + 1;
> +
> +	/* prepare buffer */
> +	mcp25xxfd_calc_cmd_addr(INSTRUCTION_WRITE, reg + first_byte, cmd);
> +	data = cpu_to_le32(data);
> +
> +	return mcp25xxfd_write_then_write(spi,
> +					  cmd, sizeof(cmd),
> +					  ((void *)&data + first_byte),
> +					  len_byte);
> +}
> +
> +int mcp25xxfd_cmd_write_regs(struct spi_device *spi, u32 reg,
> +			     u32 *data, u32 bytes)
> +{
> +	int ret;
> +
> +	/* first transpose to controller format */
> +	mcp25xxfd_convert_from_cpu(data, bytes / sizeof(u32));
> +
> +	/* now write it */
> +	ret = mcp25xxfd_cmd_writen(spi, reg, data, bytes);
> +
> +	/* and convert it back to cpu format even if it fails */
> +	mcp25xxfd_convert_to_cpu(data, bytes / sizeof(u32));

sizeof(bytes) please, here and in other locations.

> +
> +	return ret;
> +}
> +
> +int mcp25xxfd_cmd_read_regs(struct spi_device *spi, u32 reg,
> +			    u32 *data, u32 bytes)
> +{
> +	int ret;
> +
> +	/* read it */
> +	ret = mcp25xxfd_cmd_readn(spi, reg, data, bytes);
> +
> +	/* and convert it to cpu format */
> +	mcp25xxfd_convert_to_cpu((u32 *)data, bytes / sizeof(u32));

Cast?

> +
> +	return ret;
> +}
> +
> +/* debugfs related */
> +#if defined(CONFIG_DEBUG_FS)
> +
> +int mcp25xxfd_dump_regs_range(struct seq_file *file, u32 start, u32 end)
> +{
> +	struct spi_device *spi = file->private;
> +	u32 data[32];
> +	int bytes = end - start + sizeof(u32);
> +	int i, l, count, ret;
> +
> +	for (count =  bytes / sizeof(u32); count > 0; count -= 32) {
> +		/* read up to 32 registers in one go */
> +		l = min(count, 32);
> +		ret = mcp25xxfd_cmd_read_regs(spi, start,
> +					      data, l * sizeof(u32));
> +		if (ret)
> +			return ret;
> +		/* dump those read registers */
> +		for (i = 0; i < l; i++, start += sizeof(u32))
> +			seq_printf(file, "Reg 0x%03x = 0x%08x\n",
> +				   start, data[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_dump_regs(struct seq_file *file, void *offset)
> +{
> +	return mcp25xxfd_dump_regs_range(file,
> +					 MCP25XXFD_OSC,
> +					 MCP25XXFD_ECCSTAT);
> +}
> +
> +static int mcp25xxfd_debugfs_setup(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	struct dentry *root, *regs;
> +	char name[64];
> +
> +	/* the base directory */
> +	snprintf(name, sizeof(name),
> +		 DEVICE_NAME "-%s",
> +		 dev_name(&priv->spi->dev));
> +	priv->debugfs_dir = debugfs_create_dir(name, NULL);
> +	root = priv->debugfs_dir;
> +
> +	/* expose some parameters related to clocks */
> +	debugfs_create_u32("spi_setup_speed_hz", 0444, root,
> +			   &priv->spi_setup_speed_hz);
> +	debugfs_create_u32("spi_normal_speed_hz", 0444, root,
> +			   &priv->spi_normal_speed_hz);
> +	debugfs_create_u32("spi_use_speed_hz", 0444, root,
> +			   &priv->spi_use_speed_hz);
> +	debugfs_create_u32("clk_user_mask", 0444, root, &priv->clk_user_mask);
> +
> +	/* expose the system registers */
> +	priv->debugfs_regs_dir = debugfs_create_dir("regs", root);
> +	regs = priv->debugfs_regs_dir;
> +	debugfs_create_x32("osc", 0444, regs, &priv->regs.osc);
> +	debugfs_create_x32("iocon", 0444, regs, &priv->regs.iocon);
> +	debugfs_create_x32("crc", 0444, regs, &priv->regs.crc);
> +	debugfs_create_x32("ecccon", 0444, regs, &priv->regs.ecccon);
> +
> +	/* dump the controller registers themselves */
> +	debugfs_create_devm_seqfile(&priv->spi->dev, "regs_live_dump",
> +				    root, mcp25xxfd_dump_regs);
> +
> +	return 0;
> +}
> +
> +static void mcp25xxfd_debugfs_remove(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +
> +	debugfs_remove_recursive(priv->debugfs_dir);
> +	priv->debugfs_dir = NULL;
> +}
> +#else
> +int mcp25xxfd_dump_regs_range(struct seq_file *file, u32 start, u32 end)
> +{
> +	return 0;
> +}
> +
> +static int mcp25xxfd_debugfs_setup(struct mcp25xxfd_priv *priv)
> +{
> +	return 0;
> +}
> +
> +static void mcp25xxfd_debugfs_remove(struct mcp25xxfd_priv *priv)
> +{
> +}
> +#endif

And could you please put all debugfs stuff into "mcp25xxfd_debugfs.[ch]"
and define macros to increment the statistics if CONFIG_DEBUG_FS is defined.

> +
> +/* HW Related */
> +int mcp25xxfd_clear_ecc_interrupts(struct spi_device *spi)
> +{
> +	u32 val, addr;
> +	int ret;
> +
> +	/* first report the error address */
> +	ret = mcp25xxfd_cmd_read(spi, MCP25XXFD_ECCSTAT, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* if no flags are set then nothing to do */
> +	if (!(val & (MCP25XXFD_ECCSTAT_SECIF | MCP25XXFD_ECCSTAT_DEDIF)))
> +		return 0;
> +
> +	addr = (val & MCP25XXFD_ECCSTAT_ERRADDR_MASK) >>
> +		MCP25XXFD_ECCSTAT_ERRADDR_SHIFT;
> +
> +	dev_err_ratelimited(&spi->dev,
> +			    "ECC %s bit error at %03x\n",
> +			    (val & MCP25XXFD_ECCSTAT_DEDIF) ?
> +			    "double" : "single",
> +			    addr);
> +
> +	/* and clear the error */
> +	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_ECCSTAT, 0,
> +					MCP25XXFD_ECCSTAT_SECIF |
> +					MCP25XXFD_ECCSTAT_DEDIF);
> +}
> +
> +int mcp25xxfd_clear_crc_interrupts(struct spi_device *spi)
> +{
> +	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_CRC, 0,
> +					MCP25XXFD_CRC_CRCERRIF |
> +					MCP25XXFD_CRC_FERRIF);
> +}
> +
> +int mcp25xxfd_clear_interrupts(struct spi_device *spi)
> +{
> +	mcp25xxfd_clear_ecc_interrupts(spi);
> +	mcp25xxfd_clear_crc_interrupts(spi);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_enable_ecc_interrupts(struct spi_device *spi,
> +					   bool enable)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	u32 mask = MCP25XXFD_ECCCON_SECIE | MCP25XXFD_ECCCON_DEDIE;
> +
> +	priv->regs.ecccon &= ~mask;
> +	priv->regs.ecccon |= MCP25XXFD_ECCCON_ECCEN | (enable ? mask : 0);
> +
> +	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_ECCCON,
> +					priv->regs.ecccon,
> +					MCP25XXFD_ECCCON_ECCEN | mask);
> +}
> +
> +static int mcp25xxfd_enable_crc_interrupts(struct spi_device *spi,
> +					   bool enable)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	u32 mask = MCP25XXFD_CRC_CRCERRIE | MCP25XXFD_CRC_FERRIE;
> +
> +	priv->regs.crc &= ~mask;
> +	priv->regs.crc |= enable ? mask : 0;
> +
> +	return mcp25xxfd_cmd_write_mask(spi, MCP25XXFD_CRC,
> +					priv->regs.crc, mask);
> +}
> +
> +int mcp25xxfd_enable_interrupts(struct spi_device *spi,
> +				bool enable)
> +{
> +	/* error handling only on enable for this function */
> +	int ret = 0;
> +
> +	/* if we enable clear interrupt flags first */
> +	if (enable)
> +		ret = mcp25xxfd_clear_interrupts(spi);
> +	if (enable && ret)
> +		goto out;

Why not just:

	if (enable) {
		ret = mcp25xxfd_clear_interrupts(spi);
		if (ret)
			goto out;
	}

> +
> +	ret = mcp25xxfd_enable_ecc_interrupts(spi, enable);
> +	if (enable && ret)
> +		goto out;

Ditto and below.

> +
> +	ret = mcp25xxfd_enable_crc_interrupts(spi, enable);
> +	if (enable && ret)
> +		goto out_ecc;
> +
> +	/* if we disable interrupts clear interrupt flags last */
> +	if (!enable)
> +		mcp25xxfd_clear_interrupts(spi);
> +
> +	return 0;
> +
> +out_ecc:
> +	mcp25xxfd_enable_ecc_interrupts(spi, false);
> +out:
> +	return ret;
> +}
> +
> +static int _mcp25xxfd_waitfor_osc(struct spi_device *spi,
> +				  u32 waitfor,
> +				  u32 mask)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	unsigned long timeout;
> +	int ret;
> +
> +	/* wait for synced pll/osc/sclk */
> +	timeout = jiffies + MCP25XXFD_OSC_POLLING_JIFFIES;
> +	while (time_before_eq(jiffies, timeout)) {
> +		ret = mcp25xxfd_cmd_read(spi, MCP25XXFD_OSC,
> +					 &priv->regs.osc);

Fits on one line! Quite often, you break the line early

> +		if (ret)
> +			return ret;
> +		/* check for expected bits to be set/unset */
> +		if ((priv->regs.osc & mask) == waitfor)
> +			return 0;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int mcp25xxfd_configure_osc(struct spi_device *spi,
> +				   u32 value,
> +				   u32 waitfor,
> +				   u32 mask)

Why not putting the three arguments on one line... like you do
with many other functions. I thinkk it improves readability.

> +{
> +	int ret;
> +
> +	/* write the osc value to the controller - waking it if necessary */
> +	ret = mcp25xxfd_cmd_write(spi, MCP25XXFD_OSC, value);
> +	if (ret)
> +		return ret;
> +
> +	/* wait for the clock to stabelize */
> +	ret = _mcp25xxfd_waitfor_osc(spi, waitfor, mask);
> +
> +	/* on timeout try again setting the register */
> +	if (ret == -ETIMEDOUT) {
> +		/* write the clock to the controller */
> +		ret = mcp25xxfd_cmd_write(spi, MCP25XXFD_OSC, value);
> +		if (ret)
> +			return ret;
> +
> +		/* wait for the clock to stabelize */
> +		ret = _mcp25xxfd_waitfor_osc(spi, waitfor, mask);
> +	}
> +
> +	/* handle timeout special - report the fact */
> +	if (ret == -ETIMEDOUT)
> +		dev_err(&spi->dev,
> +			"Clock did not switch within the timeout period\n");
> +
> +	return ret;
> +}
> +
> +static u32 _mcp25xxfd_clkout_mask(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	u32 value = 0;
> +
> +	if (priv->config.clock_div2)
> +		value |= MCP25XXFD_OSC_SCLKDIV;
> +
> +	switch (priv->config.clock_odiv) {
> +	case 0:
> +		break;
> +	case 1:
> +		value |= MCP25XXFD_OSC_CLKODIV_1 <<
> +			MCP25XXFD_OSC_CLKODIV_SHIFT;

Ditto

> +		break;
> +	case 2:
> +		value |= MCP25XXFD_OSC_CLKODIV_2 <<
> +			MCP25XXFD_OSC_CLKODIV_SHIFT;
> +		break;
> +	case 4:
> +		value |= MCP25XXFD_OSC_CLKODIV_4 <<
> +			MCP25XXFD_OSC_CLKODIV_SHIFT;
> +		break;
> +	case 10:
> +		value |= MCP25XXFD_OSC_CLKODIV_10 <<
> +			MCP25XXFD_OSC_CLKODIV_SHIFT;
> +		break;
> +	default:
> +		/* this should never happen but is error-handled
> +		 * by the dt-parsing
> +		 */
> +		break;
> +	}
> +
> +	return value;
> +}
> +
> +static int _mcp25xxfd_start_clock(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	u32 value   = _mcp25xxfd_clkout_mask(spi);

Just one space before and after "=", please! Here and in other places.

> +	u32 waitfor = MCP25XXFD_OSC_OSCRDY;
> +	u32 mask    = waitfor |
> +		MCP25XXFD_OSC_OSCDIS |
> +		MCP25XXFD_OSC_PLLRDY |
> +		MCP25XXFD_OSC_PLLEN;

Less lines? I stop here. I think you know what I mean.

> +	/* enable PLL as well - set expectations */
> +	if (priv->config.clock_pll) {
> +		value   |= MCP25XXFD_OSC_PLLEN;
> +		waitfor |= MCP25XXFD_OSC_PLLRDY | MCP25XXFD_OSC_PLLEN;
> +	}
> +
> +	/* set the oscilator now */
> +	return mcp25xxfd_configure_osc(spi, value, waitfor, mask);
> +}
> +
> +static int _mcp25xxfd_stop_clock(struct spi_device *spi)
> +{
> +	u32 value   = _mcp25xxfd_clkout_mask(spi);
> +	u32 waitfor = 0;
> +	u32 mask    = MCP25XXFD_OSC_OSCDIS |
> +		MCP25XXFD_OSC_PLLRDY |
> +		MCP25XXFD_OSC_PLLEN;
> +	int ret;
> +
> +	ret = mcp25xxfd_configure_osc(spi, value, waitfor, mask);
> +	if (ret)
> +		return ret;
> +
> +	/* finally switch the controller mode to sleep
> +	 * by this time the controller should be in config mode already
> +	 * this way we wake to config mode again
> +	 */
> +	return mcp25xxfd_can_sleep_mode(spi);
> +}
> +
> +int mcp25xxfd_start_clock(struct spi_device *spi, int requestor_mask)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int ret = 0;
> +
> +	/* without a clock there is nothing we can do... */
> +	if (IS_ERR(priv->clk))
> +		return IS_ERR(priv->clk);

	return PTR_ERR(priv->clk) ?

> +
> +	mutex_lock(&priv->clk_user_lock);
> +
> +	/* if clock is already started, then skip */
> +	if (priv->clk_user_mask & requestor_mask)
> +		goto out;
> +
> +	/* enable the clock on the host side*/
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		goto out;
> +
> +	/* enable the clock on the controller side */
> +	ret = _mcp25xxfd_start_clock(spi);
> +	if (ret)
> +		goto out;
> +
> +	/* mark the clock for the specific component as started */
> +	priv->clk_user_mask |= requestor_mask;
> +
> +	/* and now we use the normal spi speed */
> +	priv->spi_use_speed_hz = priv->spi_normal_speed_hz;
> +
> +out:
> +	mutex_unlock(&priv->clk_user_lock);
> +
> +	return ret;
> +}
> +
> +int mcp25xxfd_stop_clock(struct spi_device *spi, int requestor_mask)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int ret;
> +
> +	/* without a clock there is nothing we can do... */
> +	if (IS_ERR(priv->clk))
> +		return IS_ERR(priv->clk);
> +
> +	mutex_lock(&priv->clk_user_lock);
> +
> +	/* if the mask is empty then skip, as the clock is stopped */
> +	if (!priv->clk_user_mask)
> +		goto out;
> +
> +	/* clear the clock mask */
> +	priv->clk_user_mask &= ~requestor_mask;
> +
> +	/* if the mask is not empty then skip, as the clock is needed */
> +	if (priv->clk_user_mask)
> +		goto out;
> +
> +	/* and now we use the setup spi speed */
> +	priv->spi_use_speed_hz = priv->spi_setup_speed_hz;
> +
> +	/* stop the clock on the controller */
> +	ret = _mcp25xxfd_stop_clock(spi);
> +
> +	/* and we stop the clock on the host*/
> +	if (!IS_ERR(priv->clk))
> +		clk_disable_unprepare(priv->clk);
> +out:
> +	mutex_unlock(&priv->clk_user_lock);
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_enable_ecc(struct spi_device *spi)
> +{
> +	u8 buffer[256];
> +	int i;
> +	int ret;

	int i, ret;

Like you do in many other function headers.

> +
> +	/* set up RAM ECC - enable interrupts sets it as well */
> +	ret = mcp25xxfd_enable_ecc_interrupts(spi, false);
> +	if (ret)
> +		return ret;
> +
> +	/* and clear SRAM so that no read fails from now on */
> +	memset(buffer, 0, sizeof(buffer));
> +	for (i = 0; i < MCP25XXFD_SRAM_SIZE; i += sizeof(buffer)) {
> +		ret = mcp25xxfd_cmd_writen(spi,
> +					   MCP25XXFD_SRAM_ADDR(i),
> +					   buffer, sizeof(buffer));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp25xxfd_hw_wake(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int ret = 0;
> +
> +	/* enable power to controller */
> +	mcp25xxfd_power_enable(priv->power, 1);
> +
> +	/* if there is no sleep mask, then there is nothing to wake */
> +	if (!priv->clk_sleep_mask)
> +		return 0;
> +
> +	/* start the clocks */
> +	ret = mcp25xxfd_start_clock(spi, priv->clk_sleep_mask);
> +	if (ret)
> +		return 0;
> +
> +	/* clear the sleep mask */
> +	mutex_lock(&priv->clk_user_lock);
> +	priv->clk_sleep_mask = 0;
> +	mutex_unlock(&priv->clk_user_lock);
> +
> +	/* enable the interrupts again */
> +	return mcp25xxfd_enable_interrupts(spi, true);
> +}
> +
> +static int mcp25xxfd_hw_sleep(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +
> +	mutex_lock(&priv->clk_user_lock);
> +	priv->clk_sleep_mask = priv->clk_user_mask;
> +	mutex_unlock(&priv->clk_user_lock);
> +
> +	/* disable interrupts */
> +	mcp25xxfd_enable_interrupts(spi, false);
> +
> +	/* stop the clocks */
> +	mcp25xxfd_stop_clock(spi, priv->clk_sleep_mask);
> +
> +	/* disable power to controller */
> +	return mcp25xxfd_power_enable(priv->power, 0);
> +}
> +
> +static int mcp25xxfd_hw_probe(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int ret;
> +
> +	/* Wait for oscillator startup timer after power up */
> +	mdelay(MCP25XXFD_OST_DELAY_MS);
> +
> +	/* send a "blind" reset, hoping we are in Config mode */
> +	mcp25xxfd_cmd_reset(spi);
> +
> +	/* Wait for oscillator startup again */
> +	mdelay(MCP25XXFD_OST_DELAY_MS);
> +
> +	/* check clock register that the clock is ready or disabled */
> +	ret = mcp25xxfd_cmd_read(spi, MCP25XXFD_OSC,
> +				 &priv->regs.osc);
> +	if (ret)
> +		return ret;
> +
> +	/* there can only be one... */
> +	switch (priv->regs.osc &
> +		(MCP25XXFD_OSC_OSCRDY | MCP25XXFD_OSC_OSCDIS)) {
> +	case MCP25XXFD_OSC_OSCRDY: /* either the clock is ready */
> +		break;
> +	case MCP25XXFD_OSC_OSCDIS: /* or the clock is disabled */
> +		break;
> +	default:
> +		/* otherwise there is no valid device (or in strange state)
> +		 *
> +		 * if PLL is enabled but not ready, then there may be
> +		 * something "fishy"
> +		 * this happened during driver development
> +		 * (enabling pll, when when on wrong clock), so best warn
> +		 * about such a possibility
> +		 */
> +		if ((priv->regs.osc &
> +		     (MCP25XXFD_OSC_PLLEN | MCP25XXFD_OSC_PLLRDY))
> +		    == MCP25XXFD_OSC_PLLEN)
> +			dev_err(&spi->dev,
> +				"mcp25xxfd may be in a strange state - a power disconnect may be required\n");
> +
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF_DYNAMIC
> +int mcp25xxfd_of_parse(struct mcp25xxfd_priv *priv)
> +{
> +	struct spi_device *spi = priv->spi;
> +	const struct device_node *np = spi->dev.of_node;
> +	u32 val;
> +	int ret;
> +
> +	priv->config.clock_div2 =
> +		of_property_read_bool(np, "microchip,clock-div2");
> +
> +	ret = of_property_read_u32_index(np, "microchip,clock-out-div",
> +					 0, &val);
> +	if (!ret) {
> +		switch (val) {
> +		case 0:
> +		case 1:
> +		case 2:
> +		case 4:
> +		case 10:
> +			priv->config.clock_odiv = val;
> +			break;
> +		default:
> +			dev_err(&spi->dev,
> +				"Invalid value in device tree for microchip,clock_out_div: %u - valid values: 0, 1, 2, 4, 10\n",
> +				val);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +#else
> +int mcp25xxfd_of_parse(struct mcp25xxfd_priv *priv)
> +{
> +	return 0;
> +}
> +#endif
> +
> +static const struct of_device_id mcp25xxfd_of_match[] = {
> +	{
> +		.compatible	= "microchip,mcp2517fd",
> +		.data		= (void *)CAN_MCP2517FD,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mcp25xxfd_of_match);
> +
> +static int mcp25xxfd_probe(struct spi_device *spi)
> +{
> +	const struct of_device_id *of_id =
> +		of_match_device(mcp25xxfd_of_match, &spi->dev);
> +	struct mcp25xxfd_priv *priv;
> +	struct clk *clk;
> +	int ret, freq;
> +
> +	/* as irq_create_fwspec_mapping() can return 0, check for it */
> +	if (spi->irq <= 0) {
> +		dev_err(&spi->dev, "no valid irq line defined: irq = %i\n",
> +			spi->irq);
> +		return -EINVAL;
> +	}
> +
> +	clk = devm_clk_get(&spi->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	freq = clk_get_rate(clk);
> +	if (freq < MCP25XXFD_MIN_CLOCK_FREQUENCY ||
> +	    freq > MCP25XXFD_MAX_CLOCK_FREQUENCY) {
> +		dev_err(&spi->dev,
> +			"Clock frequency %i is not in range [%i:%i]\n",
> +			freq,
> +			MCP25XXFD_MIN_CLOCK_FREQUENCY,
> +			MCP25XXFD_MAX_CLOCK_FREQUENCY);
> +		return -ERANGE;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* assign some data */
> +	if (of_id)
> +		priv->model = (enum mcp25xxfd_model)of_id->data;
> +	else
> +		priv->model = spi_get_device_id(spi)->driver_data;
> +
> +	spi_set_drvdata(spi, priv);
> +	priv->spi = spi;
> +
> +	mutex_init(&priv->clk_user_lock);
> +
> +	/* enable the clock and mark as enabled */
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		goto out_free;
> +
> +	/* do not use the SCK clock divider of 2 */
> +	priv->config.clock_div2 = false;
> +
> +	/* clock output is divided by 10 */
> +	priv->config.clock_odiv = 10;
> +
> +	/* if we have a clock that is <= 4MHz, enable the pll */
> +	priv->config.clock_pll =
> +		(freq <= MCP25XXFD_AUTO_PLL_MAX_CLOCK_FREQUENCY);
> +
> +	/* check in device tree for overrrides */
> +	ret = mcp25xxfd_of_parse(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* decide on the effective clock rate */
> +	priv->clock_freq = freq;
> +	if (priv->config.clock_pll)
> +		priv->clock_freq *= MCP25XXFD_PLL_MULTIPLIER;
> +	if (priv->config.clock_div2)
> +		priv->clock_freq /= MCP25XXFD_SCLK_DIVIDER;
> +
> +	/* calculate the clock frequencies to use
> +	 *
> +	 * setup clock speed is at most 1/4 the input clock speed
> +	 * the reason for the factor of 4 is that there is
> +	 * a clock divider in the controller that MAY be enabled in some
> +	 * circumstances so we may find a controller with that enabled
> +	 * during probe phase
> +	 */
> +	priv->spi_setup_speed_hz = freq / 4;
> +
> +	/* normal operation clock speeds */
> +	priv->spi_normal_speed_hz = priv->clock_freq / 2;
> +	if (priv->config.clock_div2) {
> +		priv->spi_setup_speed_hz /= MCP25XXFD_SCLK_DIVIDER;
> +		priv->spi_normal_speed_hz /= MCP25XXFD_SCLK_DIVIDER;
> +	}
> +	/* set limit on speed */
> +	if (spi->max_speed_hz) {
> +		priv->spi_setup_speed_hz = min_t(int,
> +						 priv->spi_setup_speed_hz,
> +						 spi->max_speed_hz);
> +		priv->spi_normal_speed_hz = min_t(int,
> +						  priv->spi_normal_speed_hz,
> +						  spi->max_speed_hz);
> +	}
> +
> +	/* use setup speed by default
> +	 * - this is switched when clock is enabled/disabled
> +	 */
> +	priv->spi_use_speed_hz = priv->spi_setup_speed_hz;
> +
> +	/* Configure the SPI bus */
> +	spi->bits_per_word = 8;
> +	ret = spi_setup(spi);
> +	if (ret)
> +		goto out_clk;
> +
> +	priv->power = devm_regulator_get_optional(&spi->dev, "vdd");
> +	if (PTR_ERR(priv->power) == -EPROBE_DEFER) {
> +		ret = -EPROBE_DEFER;
> +		goto out_clk;
> +	}
> +
> +	ret = mcp25xxfd_power_enable(priv->power, 1);
> +	if (ret)
> +		goto out_clk;
> +
> +	/* this will also enable the MCP25XXFD_CLK_USER_CAN clock */
> +	ret = mcp25xxfd_hw_probe(spi);
> +
> +	/* on error retry a second time */
> +	if (ret == -ENODEV) {
> +		ret = mcp25xxfd_hw_probe(spi);
> +		if (!ret)
> +			dev_info(&spi->dev,
> +				 "found device only during retry\n");
> +	}
> +	if (ret) {
> +		if (ret == -ENODEV)
> +			dev_err(&spi->dev,
> +				"Cannot initialize MCP%x. Wrong wiring? (oscilator register reads as %08x)\n",
> +				priv->model, priv->regs.osc);
> +		goto out_probe;
> +	}
> +
> +	/* enable the can controller clock */
> +	ret = mcp25xxfd_start_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +	if (ret)
> +		goto out_probe;
> +
> +	/* try to identify the can-controller - we need the clock here */
> +	ret = mcp25xxfd_can_hw_probe(spi);
> +	if (ret)
> +		goto out_ctlclk;
> +
> +	/* add debugfs */
> +	ret = mcp25xxfd_debugfs_setup(spi);
> +	if (ret)
> +		goto out_ctlclk;
> +
> +	/* disable interrupts */
> +	ret = mcp25xxfd_enable_interrupts(spi, false);
> +	if (ret)
> +		goto out_debugfs;
> +
> +	/* setup ECC for SRAM */
> +	ret = mcp25xxfd_enable_ecc(spi);
> +	if (ret)
> +		goto out_debugfs;
> +
> +	/* and put controller to sleep by stopping the can clock */
> +	ret = mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +	if (ret)
> +		goto out_debugfs;
> +
> +	dev_info(&spi->dev,
> +		 "MCP%x successfully initialized.\n", priv->model);
> +	return 0;
> +
> +out_debugfs:
> +	mcp25xxfd_debugfs_remove(spi);
> +out_ctlclk:
> +	mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +out_probe:
> +	mcp25xxfd_power_enable(priv->power, 0);
> +out_clk:
> +	mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
> +out_free:
> +	mcp25xxfd_debugfs_remove(spi);
> +	dev_err(&spi->dev, "Probe failed, err=%d\n", -ret);
> +	return ret;
> +}
> +
> +static int mcp25xxfd_remove(struct spi_device *spi)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +
> +	/* clear all running clocks */
> +	mcp25xxfd_stop_clock(spi, priv->clk_user_mask);
> +
> +	mcp25xxfd_debugfs_remove(spi);
> +
> +	mcp25xxfd_power_enable(priv->power, 0);
> +
> +	if (!IS_ERR(priv->clk))
> +		clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mcp25xxfd_suspend(struct device *dev)
> +{
> +	struct spi_device *spi = to_spi_device(dev);
> +
> +	return mcp25xxfd_hw_sleep(spi);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mcp25xxfd_resume(struct device *dev)
> +{
> +	struct spi_device *spi = to_spi_device(dev);
> +
> +	return mcp25xxfd_hw_wake(spi);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mcp25xxfd_pm_ops, mcp25xxfd_suspend,
> +	mcp25xxfd_resume);
> +
> +static const struct spi_device_id mcp25xxfd_id_table[] = {
> +	{
> +		.name		= "mcp2517fd",
> +		.driver_data	= (kernel_ulong_t)CAN_MCP2517FD,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, mcp25xxfd_id_table);
> +
> +static struct spi_driver mcp25xxfd_can_driver = {
> +	.driver = {
> +		.name = DEVICE_NAME,
> +		.of_match_table = mcp25xxfd_of_match,
> +		.pm = &mcp25xxfd_pm_ops,
> +	},
> +	.id_table = mcp25xxfd_id_table,
> +	.probe = mcp25xxfd_probe,
> +	.remove = mcp25xxfd_remove,
> +};
> +module_spi_driver(mcp25xxfd_can_driver);
> +
> +MODULE_AUTHOR("Martin Sperl <kernel@martin.sperl.org>");
> +MODULE_DESCRIPTION("Microchip 25XXFD CAN driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> new file mode 100644
> index 000000000000..e5c7098a09c2
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
> @@ -0,0 +1,228 @@
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
> +/* controller details
> + *
> + *  It has 32 FIFOs (of up to 32 CAN-frames).
> + *
> + * There are 4 Fifo types which can get configured:
> + * * TEF - Transmission Event Fifo - which consumes FIFO 0
> + *   even if it is not configured
> + * * Tansmission Queue - for up to 32 Frames.
> + *   this queue reorders CAN frames to get transmitted following the
> + *   typical CAN dominant/recessive rules on the can bus itself.
> + *   This FIFO is optional.
> + * * TX FIFO: generic TX fifos that can contain arbitrary data
> + *   and which come with a configurable priority for transmission
> + *   It is also possible to have the Controller automatically trigger
> + *   a transfer when a Filter Rule for a RTR frame matches.
> + *   Each of these fifos in principle can get configured for distinct
> + *   dlc sizes (8 thru 64 bytes)
> + * * RX FIFO: generic RX fifo which is filled via filter-rules.
> + *   Each of these fifos in principle can get configured for distinct
> + *   dlc sizes (8 thru 64 bytes)
> + *   Unfortunately there is no filter rule that would allow triggering
> + *   on different frame sizes, so for all practical purposes the
> + *   RX fifos have to be of the same size (unless one wants to experience
> + *   lost data).
> + * When a Can Frame is transmitted from the TX Queue or an individual
> + * TX FIFO then a small TEF Frame can get added to the TEF FIFO queue
> + * to log the Transmission of the frame - this includes ID, Flags
> + * (including a custom identifier/index) and the timestamp (see below).
> + *
> + * The controller provides an optional free running counter with a divider
> + * for timestamping of RX frames as well as for TEF entries.
> + */
> +
> +/* Implementation notes:
> + *
> + * Right now we only use the CAN controller block to put us into deep sleep
> + * this means that the oscillator clock is turned off.
> + * So this is the only thing that we implement here right now
> + */
> +
> +#include "mcp25xxfd_can.h"
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/spi/spi.h>
> +
> +static int mcp25xxfd_can_get_mode(struct spi_device *spi,
> +				  u32 *mode_data)
> +{
> +	int ret;
> +
> +	ret = mcp25xxfd_cmd_read(spi, CAN_CON, mode_data);
> +	if (ret)
> +		return ret;
> +
> +	return (*mode_data & CAN_CON_OPMOD_MASK) >> CAN_CON_OPMOD_SHIFT;
> +}
> +
> +int mcp25xxfd_can_switch_mode(struct spi_device *spi,
> +			      u32 *mode_data, int mode)
> +{
> +	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
> +	int ret, i;
> +
> +	/* get the current mode/register - if mode_data is -1
> +	 * this only happens during initialization phase
> +	 * when the can controller is not setup yet
> +	 * typically by calling mcp25xxfd_can_sleep_mode
> +	 */
> +	if (*mode_data == -1) {
> +		ret = mcp25xxfd_can_get_mode(spi, mode_data);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* compute the effective mode in osc*/
> +	*mode_data &= ~(CAN_CON_REQOP_MASK | CAN_CON_OPMOD_MASK);
> +	*mode_data |= (mode << CAN_CON_REQOP_SHIFT) |
> +		(mode << CAN_CON_OPMOD_SHIFT);
> +
> +	/* if the opmode is sleep then the oscilator will be disabled
> +	 * and also not ready, so fake this change
> +	 */
> +	if (mode == CAN_CON_MODE_SLEEP) {
> +		priv->regs.osc &= ~(MCP25XXFD_OSC_OSCRDY |
> +				    MCP25XXFD_OSC_PLLRDY |
> +				    MCP25XXFD_OSC_SCLKRDY);
> +		priv->regs.osc |= MCP25XXFD_OSC_OSCDIS;
> +	}
> +
> +	/* request the mode switch */
> +	ret = mcp25xxfd_cmd_write(spi, CAN_CON, *mode_data);
> +	if (ret)
> +		return ret;
> +
> +	/* if we are in sleep mode then return immediately
> +	 * the controller does not respond back!
> +	 */
> +	if (mode == CAN_CON_MODE_SLEEP)
> +		return 0;
> +
> +	/* wait for it to stabilize/switch mode
> +	 * we assume 256 rounds should be enough as this is > 12ms
> +	 * at 1MHz Can Bus speed without any extra overhead
> +	 *
> +	 * The assumption here is that it depends on bus activity
> +	 * how long it takes the controller to switch modes
> +	 */
> +	for (i = 0; i < 256; i++) {
> +		/* get the mode */
> +		ret = mcp25xxfd_can_get_mode(spi, mode_data);
> +		if (ret < 0)
> +			return ret;
> +		/* check that we have reached our mode */
> +		if (ret == mode)
> +			return 0;
> +	}
> +
> +	dev_err(&spi->dev, "Failed to switch to mode %u in time\n", mode);
> +	return -ETIMEDOUT;
> +}
> +
> +int mcp25xxfd_can_sleep_mode(struct spi_device *spi)
> +{
> +	u32 value = -1;
> +
> +	return mcp25xxfd_can_switch_mode(spi, &value, CAN_CON_MODE_SLEEP);
> +}
> +
> +int mcp25xxfd_can_hw_probe_modeswitch(struct spi_device *spi)
> +{
> +	u32 mode_data;
> +	int ret;
> +
> +	/* so we should be in config mode now, so move to INTERNAL_LOOPBACK */
> +	ret = mcp25xxfd_can_switch_mode(spi, &mode_data,
> +					CAN_CON_MODE_INTERNAL_LOOPBACK);
> +	if (ret) {
> +		dev_err(&spi->dev,
> +			"Failed to switch into loopback mode\n");
> +		return ret;
> +	}
> +
> +	/* and back into config mode */
> +	ret = mcp25xxfd_can_switch_mode(spi, &mode_data,
> +					CAN_CON_MODE_CONFIG);
> +	if (ret) {
> +		dev_err(&spi->dev,
> +			"Failed to switch back to config mode\n");
> +		return ret;
> +	}
> +
> +	/* so we have checked basic functionality successfully */
> +	return 0;
> +}
> +
> +int mcp25xxfd_can_hw_probe(struct spi_device *spi)
> +{
> +	u32 mode_data;
> +	int mode, ret;
> +
> +	/* read TXQCON - the TXEN bit should always read as 1 */
> +	ret = mcp25xxfd_cmd_read(spi, CAN_TXQCON, &mode_data);
> +	if (ret)
> +		return ret;
> +	if ((mode_data & CAN_TXQCON_TXEN) == 0) {
> +		dev_err(&spi->dev,
> +			"Register TXQCON does not have bit TXEN set - reads as %08x",
> +			mode_data);
> +		return -EINVAL;
> +	}
> +
> +	/* try to get the current mode */
> +	mode = mcp25xxfd_can_get_mode(spi, &mode_data);
> +	if (mode < 0)
> +		return mode;
> +
> +	/* we would expect to be in config mode, as a SPI-reset should
> +	 * have moved us into config mode.
> +	 * But then the documentation says that SPI-reset may only work
> +	 * reliably when already in config mode
> +	 */
> +
> +	/* so if we are in config mode then everything is fine
> +	 * and we check that a mode switch works propperly
> +	 */
> +	if (mode == CAN_CON_MODE_CONFIG)
> +		return mcp25xxfd_can_hw_probe_modeswitch(spi);
> +
> +	/* if the bitfield is 0 then there is something is wrong */
> +	if (!mode_data) {
> +		dev_err(&spi->dev,
> +			"got controller config register reading as 0\n");
> +		return -EINVAL;
> +	}
> +
> +	/* any other mode is unexpected */
> +	dev_err(&spi->dev,
> +		"Found controller in unexpected mode %i - register reads as %08x\n",
> +		mode, mode_data);
> +
> +	/* so try to move to config mode
> +	 * if this fails, then everything is lost and the controller
> +	 * is not identified
> +	 * This action MAY be destructive if a different device is connected
> +	 * but note that the first hurdle (oscillator) was already
> +	 * successful - so we should be safe...
> +	 */
> +	ret = mcp25xxfd_can_switch_mode(spi, &mode_data,
> +					CAN_CON_MODE_CONFIG);
> +	if (ret) {
> +		dev_err(&spi->dev,
> +			"Mode did not switch to config as expected - could not identify controller - register reads as %08x\n",
> +			mode_data);
> +		return -EINVAL;
> +	}
> +	/* check that modeswitch is really working */
> +	return mcp25xxfd_can_hw_probe_modeswitch(spi);
> +}
> diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> new file mode 100644
> index 000000000000..fe0e93e28b62
> --- /dev/null
> +++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
> @@ -0,0 +1,487 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
> + *
> + * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
> + *
> + * Based on Microchip MCP251x CAN controller driver written by
> + * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
> + */
> +
> +#include "mcp25xxfd.h"
> +#include <linux/bitops.h>
> +
> +#define CAN_SFR_BASE(x)			(0x000 + (x))
> +#define CAN_CON				CAN_SFR_BASE(0x00)

The prefix "CAN_" is not generic enough. Name clashes, e.g. with
"CAN_INT" are not that unlikely. Why not using "MCP25XXFD_" instead?

And could you please mov the register definitions into "mcp25xxfd_reg.h".

> +#  define CAN_CON_DNCNT_BITS		5
> +#  define CAN_CON_DNCNT_SHIFT		0
> +#  define CAN_CON_DNCNT_MASK					\
> +	GENMASK(CAN_CON_DNCNT_SHIFT + CAN_CON_DNCNT_BITS - 1,	\
> +		CAN_CON_DNCNT_SHIFT)
> +#  define CAN_CON_ISOCRCEN		BIT(5)
> +#  define CAN_CON_PXEDIS		BIT(6)
> +#  define CAN_CON_WAKFIL		BIT(8)
> +#  define CAN_CON_WFT_BITS		2
> +#  define CAN_CON_WFT_SHIFT		9
> +#  define CAN_CON_WFT_MASK					\
> +	GENMASK(CAN_CON_WFT_SHIFT + CAN_CON_WFT_BITS - 1,	\
> +		CAN_CON_WFT_SHIFT)
> +#  define CAN_CON_BUSY			BIT(11)
> +#  define CAN_CON_BRSDIS		BIT(12)
> +#  define CAN_CON_RTXAT			BIT(16)
> +#  define CAN_CON_ESIGM			BIT(17)
> +#  define CAN_CON_SERR2LOM		BIT(18)
> +#  define CAN_CON_STEF			BIT(19)
> +#  define CAN_CON_TXQEN			BIT(20)
> +#  define CAN_CON_OPMODE_BITS		3
> +#  define CAN_CON_OPMOD_SHIFT		21
> +#  define CAN_CON_OPMOD_MASK					\
> +	GENMASK(CAN_CON_OPMOD_SHIFT + CAN_CON_OPMODE_BITS - 1,	\
> +		CAN_CON_OPMOD_SHIFT)
> +#  define CAN_CON_REQOP_BITS		3
> +#  define CAN_CON_REQOP_SHIFT		24
> +#  define CAN_CON_REQOP_MASK					\
> +	GENMASK(CAN_CON_REQOP_SHIFT + CAN_CON_REQOP_BITS - 1,	\
> +		CAN_CON_REQOP_SHIFT)
> +#    define CAN_CON_MODE_MIXED			0
> +#    define CAN_CON_MODE_SLEEP			1
> +#    define CAN_CON_MODE_INTERNAL_LOOPBACK	2
> +#    define CAN_CON_MODE_LISTENONLY		3
> +#    define CAN_CON_MODE_CONFIG			4
> +#    define CAN_CON_MODE_EXTERNAL_LOOPBACK	5
> +#    define CAN_CON_MODE_CAN2_0			6
> +#    define CAN_CON_MODE_RESTRICTED		7
> +#  define CAN_CON_ABAT			BIT(27)
> +#  define CAN_CON_TXBWS_BITS		3
> +#  define CAN_CON_TXBWS_SHIFT		28
> +#  define CAN_CON_TXBWS_MASK					\
> +	GENMASK(CAN_CON_TXBWS_SHIFT + CAN_CON_TXBWS_BITS - 1,	\
> +		CAN_CON_TXBWS_SHIFT)
> +#  define CAN_CON_DEFAULT				\
> +	(CAN_CON_ISOCRCEN |				\
> +	 CAN_CON_PXEDIS |				\
> +	 CAN_CON_WAKFIL |				\
> +	 (3 << CAN_CON_WFT_SHIFT) |			\
> +	 CAN_CON_STEF |					\
> +	 CAN_CON_TXQEN |				\
> +	 (CAN_CON_MODE_CONFIG << CAN_CON_OPMOD_SHIFT) |	\
> +	 (CAN_CON_MODE_CONFIG << CAN_CON_REQOP_SHIFT))

Could you please align to the right, here and below.

> +#  define CAN_CON_DEFAULT_MASK	\
> +	(CAN_CON_DNCNT_MASK |	\
> +	 CAN_CON_ISOCRCEN |	\
> +	 CAN_CON_PXEDIS |	\
> +	 CAN_CON_WAKFIL |	\
> +	 CAN_CON_WFT_MASK |	\
> +	 CAN_CON_BRSDIS |	\
> +	 CAN_CON_RTXAT |	\
> +	 CAN_CON_ESIGM |	\
> +	 CAN_CON_SERR2LOM |	\
> +	 CAN_CON_STEF |		\
> +	 CAN_CON_TXQEN |	\
> +	 CAN_CON_OPMOD_MASK |	\
> +	 CAN_CON_REQOP_MASK |	\
> +	 CAN_CON_ABAT |		\
> +	 CAN_CON_TXBWS_MASK)
> +#define CAN_NBTCFG			CAN_SFR_BASE(0x04)
> +#  define CAN_NBTCFG_SJW_BITS		7
> +#  define CAN_NBTCFG_SJW_SHIFT		0
> +#  define CAN_NBTCFG_SJW_MASK					\
> +	GENMASK(CAN_NBTCFG_SJW_SHIFT + CAN_NBTCFG_SJW_BITS - 1, \
> +		CAN_NBTCFG_SJW_SHIFT)
> +#  define CAN_NBTCFG_TSEG2_BITS		7
> +#  define CAN_NBTCFG_TSEG2_SHIFT	8
> +#  define CAN_NBTCFG_TSEG2_MASK					    \
> +	GENMASK(CAN_NBTCFG_TSEG2_SHIFT + CAN_NBTCFG_TSEG2_BITS - 1, \
> +		CAN_NBTCFG_TSEG2_SHIFT)
> +#  define CAN_NBTCFG_TSEG1_BITS		8
> +#  define CAN_NBTCFG_TSEG1_SHIFT	16
> +#  define CAN_NBTCFG_TSEG1_MASK					    \
> +	GENMASK(CAN_NBTCFG_TSEG1_SHIFT + CAN_NBTCFG_TSEG1_BITS - 1, \
> +		CAN_NBTCFG_TSEG1_SHIFT)
> +#  define CAN_NBTCFG_BRP_BITS		8
> +#  define CAN_NBTCFG_BRP_SHIFT		24
> +#  define CAN_NBTCFG_BRP_MASK					\
> +	GENMASK(CAN_NBTCFG_BRP_SHIFT + CAN_NBTCFG_BRP_BITS - 1, \
> +		CAN_NBTCFG_BRP_SHIFT)
> +#define CAN_DBTCFG			CAN_SFR_BASE(0x08)
> +#  define CAN_DBTCFG_SJW_BITS		4
> +#  define CAN_DBTCFG_SJW_SHIFT		0
> +#  define CAN_DBTCFG_SJW_MASK					\
> +	GENMASK(CAN_DBTCFG_SJW_SHIFT + CAN_DBTCFG_SJW_BITS - 1, \
> +		CAN_DBTCFG_SJW_SHIFT)
> +#  define CAN_DBTCFG_TSEG2_BITS		4
> +#  define CAN_DBTCFG_TSEG2_SHIFT	8
> +#  define CAN_DBTCFG_TSEG2_MASK					    \
> +	GENMASK(CAN_DBTCFG_TSEG2_SHIFT + CAN_DBTCFG_TSEG2_BITS - 1, \
> +		CAN_DBTCFG_TSEG2_SHIFT)
> +#  define CAN_DBTCFG_TSEG1_BITS		5
> +#  define CAN_DBTCFG_TSEG1_SHIFT	16
> +#  define CAN_DBTCFG_TSEG1_MASK					    \
> +	GENMASK(CAN_DBTCFG_TSEG1_SHIFT + CAN_DBTCFG_TSEG1_BITS - 1, \
> +		CAN_DBTCFG_TSEG1_SHIFT)
> +#  define CAN_DBTCFG_BRP_BITS		8
> +#  define CAN_DBTCFG_BRP_SHIFT		24
> +#  define CAN_DBTCFG_BRP_MASK					\
> +	GENMASK(CAN_DBTCFG_BRP_SHIFT + CAN_DBTCFG_BRP_BITS - 1, \
> +		CAN_DBTCFG_BRP_SHIFT)
> +#define CAN_TDC				CAN_SFR_BASE(0x0C)
> +#  define CAN_TDC_TDCV_BITS		5
> +#  define CAN_TDC_TDCV_SHIFT		0
> +#  define CAN_TDC_TDCV_MASK					\
> +	GENMASK(CAN_TDC_TDCV_SHIFT + CAN_TDC_TDCV_BITS - 1,	\
> +		CAN_TDC_TDCV_SHIFT)
> +#  define CAN_TDC_TDCO_BITS		5
> +#  define CAN_TDC_TDCO_SHIFT		8
> +#  define CAN_TDC_TDCO_MASK					\
> +	GENMASK(CAN_TDC_TDCO_SHIFT + CAN_TDC_TDCO_BITS - 1,	\
> +		CAN_TDC_TDCO_SHIFT)
> +#  define CAN_TDC_TDCMOD_BITS		2
> +#  define CAN_TDC_TDCMOD_SHIFT		16
> +#  define CAN_TDC_TDCMOD_MASK					\
> +	GENMASK(CAN_TDC_TDCMOD_SHIFT + CAN_TDC_TDCMOD_BITS - 1, \
> +		CAN_TDC_TDCMOD_SHIFT)
> +#  define CAN_TDC_TDCMOD_DISABLED	0
> +#  define CAN_TDC_TDCMOD_MANUAL		1
> +#  define CAN_TDC_TDCMOD_AUTO		2
> +#  define CAN_TDC_SID11EN		BIT(24)
> +#  define CAN_TDC_EDGFLTEN		BIT(25)
> +#define CAN_TBC				CAN_SFR_BASE(0x10)
> +#define CAN_TSCON			CAN_SFR_BASE(0x14)
> +#  define CAN_TSCON_TBCPRE_BITS		10
> +#  define CAN_TSCON_TBCPRE_SHIFT	0
> +#  define CAN_TSCON_TBCPRE_MASK					    \
> +	GENMASK(CAN_TSCON_TBCPRE_SHIFT + CAN_TSCON_TBCPRE_BITS - 1, \
> +		CAN_TSCON_TBCPRE_SHIFT)
> +#  define CAN_TSCON_TBCEN		BIT(16)
> +#  define CAN_TSCON_TSEOF		BIT(17)
> +#  define CAN_TSCON_TSRES		BIT(18)
> +#define CAN_VEC				CAN_SFR_BASE(0x18)
> +#  define CAN_VEC_ICODE_BITS		7
> +#  define CAN_VEC_ICODE_SHIFT		0
> +#  define CAN_VEC_ICODE_MASK					    \
> +	GENMASK(CAN_VEC_ICODE_SHIFT + CAN_VEC_ICODE_BITS - 1,	    \
> +		CAN_VEC_ICODE_SHIFT)
> +#  define CAN_VEC_FILHIT_BITS		5
> +#  define CAN_VEC_FILHIT_SHIFT		8
> +#  define CAN_VEC_FILHIT_MASK					\
> +	GENMASK(CAN_VEC_FILHIT_SHIFT + CAN_VEC_FILHIT_BITS - 1, \
> +		CAN_VEC_FILHIT_SHIFT)
> +#  define CAN_VEC_TXCODE_BITS		7
> +#  define CAN_VEC_TXCODE_SHIFT		16
> +#  define CAN_VEC_TXCODE_MASK					\
> +	GENMASK(CAN_VEC_TXCODE_SHIFT + CAN_VEC_TXCODE_BITS - 1, \
> +		CAN_VEC_TXCODE_SHIFT)
> +#  define CAN_VEC_RXCODE_BITS		7
> +#  define CAN_VEC_RXCODE_SHIFT		24
> +#  define CAN_VEC_RXCODE_MASK					\
> +	GENMASK(CAN_VEC_RXCODE_SHIFT + CAN_VEC_RXCODE_BITS - 1, \
> +		CAN_VEC_RXCODE_SHIFT)
> +#define CAN_INT				CAN_SFR_BASE(0x1C)
> +#  define CAN_INT_IF_SHIFT		0
> +#  define CAN_INT_TXIF			BIT(0)
> +#  define CAN_INT_RXIF			BIT(1)
> +#  define CAN_INT_TBCIF			BIT(2)
> +#  define CAN_INT_MODIF			BIT(3)
> +#  define CAN_INT_TEFIF			BIT(4)
> +#  define CAN_INT_ECCIF			BIT(8)
> +#  define CAN_INT_SPICRCIF		BIT(9)
> +#  define CAN_INT_TXATIF		BIT(10)
> +#  define CAN_INT_RXOVIF		BIT(11)
> +#  define CAN_INT_SERRIF		BIT(12)
> +#  define CAN_INT_CERRIF		BIT(13)
> +#  define CAN_INT_WAKIF			BIT(14)
> +#  define CAN_INT_IVMIF			BIT(15)
> +#  define CAN_INT_IF_MASK		\
> +	(CAN_INT_TXIF |			\
> +	 CAN_INT_RXIF |			\
> +	 CAN_INT_TBCIF	|		\
> +	 CAN_INT_MODIF	|		\
> +	 CAN_INT_TEFIF	|		\
> +	 CAN_INT_ECCIF	|		\
> +	 CAN_INT_SPICRCIF |		\
> +	 CAN_INT_TXATIF |		\
> +	 CAN_INT_RXOVIF |		\
> +	 CAN_INT_CERRIF |		\
> +	 CAN_INT_SERRIF |		\
> +	 CAN_INT_WAKIF |		\
> +	 CAN_INT_IVMIF)
> +#  define CAN_INT_IE_SHIFT		16
> +#  define CAN_INT_TXIE			(CAN_INT_TXIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_RXIE			(CAN_INT_RXIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_TBCIE			(CAN_INT_TBCIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_MODIE			(CAN_INT_MODIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_TEFIE			(CAN_INT_TEFIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_ECCIE			(CAN_INT_ECCIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_SPICRCIE		\
> +	(CAN_INT_SPICRCIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_TXATIE		(CAN_INT_TXATIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_RXOVIE		(CAN_INT_RXOVIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_CERRIE		(CAN_INT_CERRIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_SERRIE		(CAN_INT_SERRIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_WAKIE			(CAN_INT_WAKIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_IVMIE			(CAN_INT_IVMIF << CAN_INT_IE_SHIFT)
> +#  define CAN_INT_IE_MASK		\
> +	(CAN_INT_TXIE |			\
> +	 CAN_INT_RXIE |			\
> +	 CAN_INT_TBCIE	|		\
> +	 CAN_INT_MODIE	|		\
> +	 CAN_INT_TEFIE	|		\
> +	 CAN_INT_ECCIE	|		\
> +	 CAN_INT_SPICRCIE |		\
> +	 CAN_INT_TXATIE |		\
> +	 CAN_INT_RXOVIE |		\
> +	 CAN_INT_CERRIE |		\
> +	 CAN_INT_SERRIE |		\
> +	 CAN_INT_WAKIE |		\
> +	 CAN_INT_IVMIE)
> +#define CAN_RXIF			CAN_SFR_BASE(0x20)
> +#define CAN_TXIF			CAN_SFR_BASE(0x24)
> +#define CAN_RXOVIF			CAN_SFR_BASE(0x28)
> +#define CAN_TXATIF			CAN_SFR_BASE(0x2C)
> +#define CAN_TXREQ			CAN_SFR_BASE(0x30)
> +#define CAN_TREC			CAN_SFR_BASE(0x34)
> +#  define CAN_TREC_REC_BITS		8
> +#  define CAN_TREC_REC_SHIFT		0
> +#  define CAN_TREC_REC_MASK				    \
> +	GENMASK(CAN_TREC_REC_SHIFT + CAN_TREC_REC_BITS - 1, \
> +		CAN_TREC_REC_SHIFT)
> +#  define CAN_TREC_TEC_BITS		8
> +#  define CAN_TREC_TEC_SHIFT		8
> +#  define CAN_TREC_TEC_MASK				    \
> +	GENMASK(CAN_TREC_TEC_SHIFT + CAN_TREC_TEC_BITS - 1, \
> +		CAN_TREC_TEC_SHIFT)
> +#  define CAN_TREC_EWARN		BIT(16)
> +#  define CAN_TREC_RXWARN		BIT(17)
> +#  define CAN_TREC_TXWARN		BIT(18)
> +#  define CAN_TREC_RXBP			BIT(19)
> +#  define CAN_TREC_TXBP			BIT(20)
> +#  define CAN_TREC_TXBO			BIT(21)
> +#define CAN_BDIAG0			CAN_SFR_BASE(0x38)
> +#  define CAN_BDIAG0_NRERRCNT_BITS	8
> +#  define CAN_BDIAG0_NRERRCNT_SHIFT	0
> +#  define CAN_BDIAG0_NRERRCNT_MASK					\
> +	GENMASK(CAN_BDIAG0_NRERRCNT_SHIFT + CAN_BDIAG0_NRERRCNT_BITS - 1, \
> +		CAN_BDIAG0_NRERRCNT_SHIFT)
> +#  define CAN_BDIAG0_NTERRCNT_BITS	8
> +#  define CAN_BDIAG0_NTERRCNT_SHIFT	8
> +#  define CAN_BDIAG0_NTERRCNT_MASK					\
> +	GENMASK(CAN_BDIAG0_NTERRCNT_SHIFT + CAN_BDIAG0_NTERRCNT_BITS - 1, \
> +		CAN_BDIAG0_NTERRCNT_SHIFT)
> +#  define CAN_BDIAG0_DRERRCNT_BITS	8
> +#  define CAN_BDIAG0_DRERRCNT_SHIFT	16
> +#  define CAN_BDIAG0_DRERRCNT_MASK					\
> +	GENMASK(CAN_BDIAG0_DRERRCNT_SHIFT + CAN_BDIAG0_DRERRCNT_BITS - 1, \
> +		CAN_BDIAG0_DRERRCNT_SHIFT)
> +#  define CAN_BDIAG0_DTERRCNT_BITS	8
> +#  define CAN_BDIAG0_DTERRCNT_SHIFT	24
> +#  define CAN_BDIAG0_DTERRCNT_MASK					\
> +	GENMASK(CAN_BDIAG0_DTERRCNT_SHIFT + CAN_BDIAG0_DTERRCNT_BITS - 1, \
> +		CAN_BDIAG0_DTERRCNT_SHIFT)
> +#define CAN_BDIAG1			CAN_SFR_BASE(0x3C)
> +#  define CAN_BDIAG1_EFMSGCNT_BITS	16
> +#  define CAN_BDIAG1_EFMSGCNT_SHIFT	0
> +#  define CAN_BDIAG1_EFMSGCNT_MASK					\
> +	GENMASK(CAN_BDIAG1_EFMSGCNT_SHIFT + CAN_BDIAG1_EFMSGCNT_BITS - 1, \
> +		CAN_BDIAG1_EFMSGCNT_SHIFT)
> +#  define CAN_BDIAG1_NBIT0ERR		BIT(16)
> +#  define CAN_BDIAG1_NBIT1ERR		BIT(17)
> +#  define CAN_BDIAG1_NACKERR		BIT(18)
> +#  define CAN_BDIAG1_NSTUFERR		BIT(19)
> +#  define CAN_BDIAG1_NFORMERR		BIT(20)
> +#  define CAN_BDIAG1_NCRCERR		BIT(21)
> +#  define CAN_BDIAG1_TXBOERR		BIT(23)
> +#  define CAN_BDIAG1_DBIT0ERR		BIT(24)
> +#  define CAN_BDIAG1_DBIT1ERR		BIT(25)
> +#  define CAN_BDIAG1_DFORMERR		BIT(27)
> +#  define CAN_BDIAG1_DSTUFERR		BIT(28)
> +#  define CAN_BDIAG1_DCRCERR		BIT(29)
> +#  define CAN_BDIAG1_ESI		BIT(30)
> +#  define CAN_BDIAG1_DLCMM		BIT(31)
> +#define CAN_TEFCON			CAN_SFR_BASE(0x40)
> +#  define CAN_TEFCON_TEFNEIE		BIT(0)
> +#  define CAN_TEFCON_TEFHIE		BIT(1)
> +#  define CAN_TEFCON_TEFFIE		BIT(2)
> +#  define CAN_TEFCON_TEFOVIE		BIT(3)
> +#  define CAN_TEFCON_TEFTSEN		BIT(5)
> +#  define CAN_TEFCON_UINC		BIT(8)
> +#  define CAN_TEFCON_FRESET		BIT(10)
> +#  define CAN_TEFCON_FSIZE_BITS		5
> +#  define CAN_TEFCON_FSIZE_SHIFT	24
> +#  define CAN_TEFCON_FSIZE_MASK					    \
> +	GENMASK(CAN_TEFCON_FSIZE_SHIFT + CAN_TEFCON_FSIZE_BITS - 1, \
> +		CAN_TEFCON_FSIZE_SHIFT)
> +#define CAN_TEFSTA			CAN_SFR_BASE(0x44)
> +#  define CAN_TEFSTA_TEFNEIF		BIT(0)
> +#  define CAN_TEFSTA_TEFHIF		BIT(1)
> +#  define CAN_TEFSTA_TEFFIF		BIT(2)
> +#  define CAN_TEFSTA_TEVOVIF		BIT(3)
> +#define CAN_TEFUA			CAN_SFR_BASE(0x48)
> +#define CAN_RESERVED			CAN_SFR_BASE(0x4C)
> +#define CAN_TXQCON			CAN_SFR_BASE(0x50)
> +#  define CAN_TXQCON_TXQNIE		BIT(0)
> +#  define CAN_TXQCON_TXQEIE		BIT(2)
> +#  define CAN_TXQCON_TXATIE		BIT(4)
> +#  define CAN_TXQCON_TXEN		BIT(7)
> +#  define CAN_TXQCON_UINC		BIT(8)
> +#  define CAN_TXQCON_TXREQ		BIT(9)
> +#  define CAN_TXQCON_FRESET		BIT(10)
> +#  define CAN_TXQCON_TXPRI_BITS		5
> +#  define CAN_TXQCON_TXPRI_SHIFT	16
> +#  define CAN_TXQCON_TXPRI_MASK					    \
> +	GENMASK(CAN_TXQCON_TXPRI_SHIFT + CAN_TXQCON_TXPRI_BITS - 1, \
> +		CAN_TXQCON_TXPRI_SHIFT)
> +#  define CAN_TXQCON_TXAT_BITS		2
> +#  define CAN_TXQCON_TXAT_SHIFT		21
> +#  define CAN_TXQCON_TXAT_MASK					    \
> +	GENMASK(CAN_TXQCON_TXAT_SHIFT + CAN_TXQCON_TXAT_BITS - 1,   \
> +		CAN_TXQCON_TXAT_SHIFT)
> +#  define CAN_TXQCON_FSIZE_BITS		5
> +#  define CAN_TXQCON_FSIZE_SHIFT	24
> +#  define CAN_TXQCON_FSIZE_MASK					    \
> +	GENMASK(CAN_TXQCON_FSIZE_SHIFT + CAN_TXQCON_FSIZE_BITS - 1, \
> +		CAN_TXQCON_FSIZE_SHIFT)
> +#  define CAN_TXQCON_PLSIZE_BITS	3
> +#  define CAN_TXQCON_PLSIZE_SHIFT	29
> +#  define CAN_TXQCON_PLSIZE_MASK				      \
> +	GENMASK(CAN_TXQCON_PLSIZE_SHIFT + CAN_TXQCON_PLSIZE_BITS - 1, \
> +		CAN_TXQCON_PLSIZE_SHIFT)
> +#    define CAN_TXQCON_PLSIZE_8		0
> +#    define CAN_TXQCON_PLSIZE_12	1
> +#    define CAN_TXQCON_PLSIZE_16	2
> +#    define CAN_TXQCON_PLSIZE_20	3
> +#    define CAN_TXQCON_PLSIZE_24	4
> +#    define CAN_TXQCON_PLSIZE_32	5
> +#    define CAN_TXQCON_PLSIZE_48	6
> +#    define CAN_TXQCON_PLSIZE_64	7
> +
> +#define CAN_TXQSTA			CAN_SFR_BASE(0x54)
> +#  define CAN_TXQSTA_TXQNIF		BIT(0)
> +#  define CAN_TXQSTA_TXQEIF		BIT(2)
> +#  define CAN_TXQSTA_TXATIF		BIT(4)
> +#  define CAN_TXQSTA_TXERR		BIT(5)
> +#  define CAN_TXQSTA_TXLARB		BIT(6)
> +#  define CAN_TXQSTA_TXABT		BIT(7)
> +#  define CAN_TXQSTA_TXQCI_BITS		5
> +#  define CAN_TXQSTA_TXQCI_SHIFT	8
> +#  define CAN_TXQSTA_TXQCI_MASK					    \
> +	GENMASK(CAN_TXQSTA_TXQCI_SHIFT + CAN_TXQSTA_TXQCI_BITS - 1, \
> +		CAN_TXQSTA_TXQCI_SHIFT)
> +
> +#define CAN_TXQUA			CAN_SFR_BASE(0x58)
> +#define CAN_FIFOCON(x)			CAN_SFR_BASE(0x5C + 12 * ((x) - 1))
> +#define CAN_FIFOCON_TFNRFNIE		BIT(0)
> +#define CAN_FIFOCON_TFHRFHIE		BIT(1)
> +#define CAN_FIFOCON_TFERFFIE		BIT(2)
> +#define CAN_FIFOCON_RXOVIE		BIT(3)
> +#define CAN_FIFOCON_TXATIE		BIT(4)
> +#define CAN_FIFOCON_RXTSEN		BIT(5)
> +#define CAN_FIFOCON_RTREN		BIT(6)
> +#define CAN_FIFOCON_TXEN		BIT(7)
> +#define CAN_FIFOCON_UINC		BIT(8)
> +#define CAN_FIFOCON_TXREQ		BIT(9)
> +#define CAN_FIFOCON_FRESET		BIT(10)
> +#  define CAN_FIFOCON_TXPRI_BITS	5
> +#  define CAN_FIFOCON_TXPRI_SHIFT	16
> +#  define CAN_FIFOCON_TXPRI_MASK					\
> +	GENMASK(CAN_FIFOCON_TXPRI_SHIFT + CAN_FIFOCON_TXPRI_BITS - 1,	\
> +		CAN_FIFOCON_TXPRI_SHIFT)
> +#  define CAN_FIFOCON_TXAT_BITS		2
> +#  define CAN_FIFOCON_TXAT_SHIFT	21
> +#  define CAN_FIFOCON_TXAT_MASK					    \
> +	GENMASK(CAN_FIFOCON_TXAT_SHIFT + CAN_FIFOCON_TXAT_BITS - 1, \
> +		CAN_FIFOCON_TXAT_SHIFT)
> +#  define CAN_FIFOCON_TXAT_ONE_SHOT	0
> +#  define CAN_FIFOCON_TXAT_THREE_SHOT	1
> +#  define CAN_FIFOCON_TXAT_UNLIMITED	2
> +#  define CAN_FIFOCON_FSIZE_BITS	5
> +#  define CAN_FIFOCON_FSIZE_SHIFT	24
> +#  define CAN_FIFOCON_FSIZE_MASK					\
> +	GENMASK(CAN_FIFOCON_FSIZE_SHIFT + CAN_FIFOCON_FSIZE_BITS - 1,	\
> +		CAN_FIFOCON_FSIZE_SHIFT)
> +#  define CAN_FIFOCON_PLSIZE_BITS	3
> +#  define CAN_FIFOCON_PLSIZE_SHIFT	29
> +#  define CAN_FIFOCON_PLSIZE_MASK					\
> +	GENMASK(CAN_FIFOCON_PLSIZE_SHIFT + CAN_FIFOCON_PLSIZE_BITS - 1, \
> +		CAN_FIFOCON_PLSIZE_SHIFT)
> +#define CAN_FIFOSTA(x)			CAN_SFR_BASE(0x60 + 12 * ((x) - 1))
> +#  define CAN_FIFOSTA_TFNRFNIF		BIT(0)
> +#  define CAN_FIFOSTA_TFHRFHIF		BIT(1)
> +#  define CAN_FIFOSTA_TFERFFIF		BIT(2)
> +#  define CAN_FIFOSTA_RXOVIF		BIT(3)
> +#  define CAN_FIFOSTA_TXATIF		BIT(4)
> +#  define CAN_FIFOSTA_TXERR		BIT(5)
> +#  define CAN_FIFOSTA_TXLARB		BIT(6)
> +#  define CAN_FIFOSTA_TXABT		BIT(7)
> +#  define CAN_FIFOSTA_FIFOCI_BITS	5
> +#  define CAN_FIFOSTA_FIFOCI_SHIFT	8
> +#  define CAN_FIFOSTA_FIFOCI_MASK					\
> +	GENMASK(CAN_FIFOSTA_FIFOCI_SHIFT + CAN_FIFOSTA_FIFOCI_BITS - 1, \
> +		CAN_FIFOSTA_FIFOCI_SHIFT)
> +#define CAN_FIFOUA(x)			CAN_SFR_BASE(0x64 + 12 * ((x) - 1))
> +#define CAN_FLTCON(x)			CAN_SFR_BASE(0x1D0 + ((x) & 0x1c))
> +#  define CAN_FILCON_SHIFT(x)		(((x) & 3) * 8)
> +#  define CAN_FILCON_BITS(x)		CAN_FILCON_BITS_
> +#  define CAN_FILCON_BITS_		4
> +	/* avoid macro reuse warning, so do not use GENMASK as above */
> +#  define CAN_FILCON_MASK(x)					\
> +	(GENMASK(CAN_FILCON_BITS_ - 1, 0) << CAN_FILCON_SHIFT(x))
> +#  define CAN_FIFOCON_FLTEN(x)		BIT(7 + CAN_FILCON_SHIFT(x))
> +#define CAN_FLTOBJ(x)			CAN_SFR_BASE(0x1F0 + 8 * (x))
> +#  define CAN_FILOBJ_SID_BITS		11
> +#  define CAN_FILOBJ_SID_SHIFT		0
> +#  define CAN_FILOBJ_SID_MASK					\
> +	GENMASK(CAN_FILOBJ_SID_SHIFT + CAN_FILOBJ_SID_BITS - 1, \
> +		CAN_FILOBJ_SID_SHIFT)
> +#  define CAN_FILOBJ_EID_BITS		18
> +#  define CAN_FILOBJ_EID_SHIFT		12
> +#  define CAN_FILOBJ_EID_MASK					\
> +	GENMASK(CAN_FILOBJ_EID_SHIFT + CAN_FILOBJ_EID_BITS - 1, \
> +		CAN_FILOBJ_EID_SHIFT)
> +#  define CAN_FILOBJ_SID11		BIT(29)
> +#  define CAN_FILOBJ_EXIDE		BIT(30)
> +#define CAN_FLTMASK(x)			CAN_SFR_BASE(0x1F4 + 8 * (x))
> +#  define CAN_FILMASK_MSID_BITS		11
> +#  define CAN_FILMASK_MSID_SHIFT	0
> +#  define CAN_FILMASK_MSID_MASK					    \
> +	GENMASK(CAN_FILMASK_MSID_SHIFT + CAN_FILMASK_MSID_BITS - 1, \
> +		CAN_FILMASK_MSID_SHIFT)
> +#  define CAN_FILMASK_MEID_BITS		18
> +#  define CAN_FILMASK_MEID_SHIFT	12
> +#  define CAN_FILMASK_MEID_MASK					    \
> +	GENMASK(CAN_FILMASK_MEID_SHIFT + CAN_FILMASK_MEID_BITS - 1, \
> +		CAN_FILMASK_MEID_SHIFT)
> +#  define CAN_FILMASK_MSID11		BIT(29)
> +#  define CAN_FILMASK_MIDE		BIT(30)
> +
> +#define CAN_OBJ_ID_SID_BITS		11
> +#define CAN_OBJ_ID_SID_SHIFT		0
> +#define CAN_OBJ_ID_SID_MASK					\
> +	GENMASK(CAN_OBJ_ID_SID_SHIFT + CAN_OBJ_ID_SID_BITS - 1, \
> +		CAN_OBJ_ID_SID_SHIFT)
> +#define CAN_OBJ_ID_EID_BITS		18
> +#define CAN_OBJ_ID_EID_SHIFT		11
> +#define CAN_OBJ_ID_EID_MASK					\
> +	GENMASK(CAN_OBJ_ID_EID_SHIFT + CAN_OBJ_ID_EID_BITS - 1, \
> +		CAN_OBJ_ID_EID_SHIFT)
> +#define CAN_OBJ_ID_SID_BIT11		BIT(29)
> +
> +#define CAN_OBJ_FLAGS_DLC_BITS		4
> +#define CAN_OBJ_FLAGS_DLC_SHIFT		0
> +#define CAN_OBJ_FLAGS_DLC_MASK					      \
> +	GENMASK(CAN_OBJ_FLAGS_DLC_SHIFT + CAN_OBJ_FLAGS_DLC_BITS - 1, \
> +		CAN_OBJ_FLAGS_DLC_SHIFT)
> +#define CAN_OBJ_FLAGS_IDE		BIT(4)
> +#define CAN_OBJ_FLAGS_RTR		BIT(5)
> +#define CAN_OBJ_FLAGS_BRS		BIT(6)
> +#define CAN_OBJ_FLAGS_FDF		BIT(7)
> +#define CAN_OBJ_FLAGS_ESI		BIT(8)
> +#define CAN_OBJ_FLAGS_SEQ_BITS		7
> +#define CAN_OBJ_FLAGS_SEQ_SHIFT		9
> +#define CAN_OBJ_FLAGS_SEQ_MASK					      \
> +	GENMASK(CAN_OBJ_FLAGS_SEQ_SHIFT + CAN_OBJ_FLAGS_SEQ_BITS - 1, \
> +		CAN_OBJ_FLAGS_SEQ_SHIFT)
> +#define CAN_OBJ_FLAGS_FILHIT_BITS	11
> +#define CAN_OBJ_FLAGS_FILHIT_SHIFT	5
> +#define CAN_OBJ_FLAGS_FILHIT_MASK				      \
> +	GENMASK(CAN_FLAGS_FILHIT_SHIFT + CAN_FLAGS_FILHIT_BITS - 1,   \
> +		CAN_FLAGS_FILHIT_SHIFT)
> --
> 2.11.0
> 

More soon...

Thanks for your patience.

Wolfgang.
