From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mfd: Add driver for RAVE Supervisory Processor
Date: Tue, 20 Jun 2017 09:19:00 +0100
Message-ID: <20170620081900.geyv7v564xmlk2am@dell>
References: <20170613012358.15084-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170613012358.15084-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jun 2017, Andrey Smirnov wrote:

> Add a driver for RAVE Supervisory Processor, an MCU implementing
> varoius bits of housekeeping functionality (watchdoging, backlight
> control, LED control, etc) on RAVE family of products by Zodiac
> Inflight Innovations.
> 
> This driver implementes core MFD/serdev device as well as
> communication subroutines necessary for commanding the device.
> 
> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Changes since [v1]:
> 
>  - Fix MODULE_LICENSE to specify "GPL v2"
> 
>  - Fix a bug in rave_sp_get_status()
> 
>  - Use %zu to fix warning repored by kbuild test robot
> 
>  - Remove "status" properties from examples zii,rave-sp.txt as well as
>    clarify the fact that device node is expected to be a child of a
>    serial device node
> 
> NOTE:
> 
>  * The driver for "zii,rave-sp-watchdog" exists, but I haven't
>    submitted it yet, becuase I wanted to make sure that API exposed by
>    this MFD is acceptable and doesn't need drastic changes
> 
>  * This driver is dependent on crc_ccitt_false() introduced in
>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next'
> 
> 
> [v1] lkml.kernel.org/r/20170606180643.14258-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> 
> 
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        |   36 +

This should be a separate patch.

>  drivers/mfd/Kconfig                                |    9 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/rave-sp.c                              | 1009 ++++++++++++++++++++
>  include/linux/rave-sp.h                            |   54 ++
>  5 files changed, 1109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>  create mode 100644 drivers/mfd/rave-sp.c
>  create mode 100644 include/linux/rave-sp.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> new file mode 100644
> index 0000000..903c889
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> @@ -0,0 +1,36 @@
> +Zodiac Inflight Innovations RAVE Supervisory Processor
> +
> +RAVE Supervisory Processor communicates with SoC over UART and is
> +presented to the kernel as a "serdev". Given that it is expected that

Please revisit this sentence.

> +its device-tree node is specified as a child of a node corresponding
> +to UART controller used for communication.

This is unusual.  I believe we sometimes do this with I2C devices, but
we don't normally have the supported comms medium as the parent.

> +Required parent device properties:
> +
> + - compatible: Should be one of:
> +	- "zii,rave-sp-niu"
> +	- "zii,rave-sp-mezz"
> +	- "zii,rave-sp-esb"
> +	- "zii,rave-sp-rdu1"
> +	- "zii,rave-sp-rdu2"
> +
> + - current-speed: Should be set to baud rate SP device is using
> +
> +RAVE SP consists of the following sub-devices:
> +
> +Device				 Description
> +------				 -----------
> +rave-sp-wdt			: Watchdog

What else does it contain.

MFDs always have more than one device.

> +Example of usage:
> +
> +	rdu {

What is an RDU?

> +		compatible = "zii,rave-sp-rdu2";
> +		current-speed = <1000000>;
> +
> +		watchdog {
> +			compatible = "zii,rave-sp-watchdog";
> +		};
> +	};
> +
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3eb5c93..6cab311 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -867,6 +867,15 @@ config MFD_SPMI_PMIC
>  	  Say M here if you want to include support for the SPMI PMIC
>  	  series as a module.  The module will be called "qcom-spmi-pmic".
>  
> +config MFD_RAVE_SP
> +	tristate "RAVE SP MCU core driver"
> +	select MFD_CORE
> +	select SERIAL_DEV_BUS
> +	select CRC_CCITT
> +	help
> +	  Select this to get support for the RAVE Supervisory
> +	  Processor driver

Missing '.'.

>  config MFD_RDC321X
>  	tristate "RDC R-321x southbridge"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c16bf1e..bc3df0a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -221,3 +221,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>  
>  obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> +obj-$(CONFIG_MFD_RAVE_SP)	+= rave-sp.o
> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> new file mode 100644
> index 0000000..41cdbd2
> --- /dev/null
> +++ b/drivers/mfd/rave-sp.c
> @@ -0,0 +1,1009 @@
> +/*
> + * rave-sp.c - Multifunction core driver for Zodiac Inflight Innovations

Drop the filename please, they have a habit of becoming incorrect

> + * SP MCU that is connected via dedicated UART port
> + *
> + * Copyright (C) 2017 Zodiac Inflight Innovations
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.

Are you able to use the short version?

> + */
> +
> +/*
> + * UART protocol using following entities:
> + *  - message to MCU => ACK response
> + *  - event from MCU => event ACK
> + *
> + * Frame structure:
> + * <STX> <DATA> <CHECKSUM> <ETX>
> + * Where:
> + * - STX - is start of transmission character
> + * - ETX - end of transmission
> + * - DATA - payload
> + * - CHECKSUM - checksum calculated on <DATA>
> + *
> + * If <DATA> or <CHECKSUM> contain one of control characters, then it is
> + * escaped using <DLE> control code. Added <DLE> does not participate in
> + * checksum calculation.
> + */
> +
> +/* #define DEBUG */

If you're going to do this, add a comment to the tune of:

"Uncomment this to provide driver specific debugging."

> +#include <linux/atomic.h>
> +#include <linux/crc-ccitt.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/sched.h>
> +#include <linux/serdev.h>
> +#include <linux/rave-sp.h>
> +
> +enum {
> +	STX = 0x02,
> +	ETX = 0x03,
> +	DLE = 0x10,
> +};

We usually prefix defines/enums.

Also these are not very human readable.  Either improve the
nomenclature or add a comment/header.

> +enum {
> +	RAVE_SP_BOOT_SOURCE_GET = 0,
> +	RAVE_SP_BOOT_SOURCE_SET = 1,
> +
> +	RAVE_SP_MAX_DATA_SIZE   = 64,
> +	RAVE_SP_CHECKSUM_SIZE   = 2, /* Worst case scenariou on RDU2 */
> +	/*
> +	 * We don't store STX, ETX and unescaped bytes, so Rx is only
> +	 * DATA + CSUM
> +	 */
> +	RAVE_SP_RX_BUFFER_SIZE  = RAVE_SP_MAX_DATA_SIZE +
> +				  RAVE_SP_CHECKSUM_SIZE,
> +	RAVE_SP_STX_ETX_SIZE    = 2,
> +	/*
> +	 * For Tx we have to have space for everything, STX, EXT and
> +	 * potentially stuffed DATA + CSUM data + csum
> +	 */
> +	RAVE_SP_TX_BUFFER_SIZE  = RAVE_SP_STX_ETX_SIZE +
> +				  2 * RAVE_SP_RX_BUFFER_SIZE,
> +};

This format is unusual for an enum.

These would better suit #includes I think.

> +enum rave_sp_deframer_state {
> +	RAVE_SP_EXPECT_SOF,
> +	RAVE_SP_EXPECT_DATA,
> +	RAVE_SP_EXPECT_ESCAPED_DATA,
> +};

It's normal to set the first attribute as 0.

I can't remember what the C standard says about that.

> +struct rave_sp_deframer {
> +	enum rave_sp_deframer_state state;
> +	unsigned char data[RAVE_SP_RX_BUFFER_SIZE];
> +	size_t length;
> +};
> +
> +struct rave_sp_reply {
> +	size_t length;
> +	void  *data;
> +	u8     code;
> +	u8     ackid;
> +	struct completion received;
> +};
> +
> +struct rave_sp_checksum {
> +	size_t length;
> +	void (*subroutine)(const u8 *, size_t, u8 *);
> +};
> +
> +enum rave_sp_boot_source {
> +	RAVE_SP_BOOT_SOURCE_SD		= 0,
> +	RAVE_SP_BOOT_SOURCE_EMMC	= 1,
> +	RAVE_SP_BOOT_SOURCE_NOR		= 2,
> +};

Just set the first one.  The C standard will do the rest.

> +struct rave_sp_variant {
> +	const struct rave_sp_checksum *checksum;
> +
> +	struct {
> +		int (*translate)(enum rave_sp_command);
> +		int (*get_boot_source)(struct rave_sp *);
> +		int (*set_boot_source)(struct rave_sp *,
> +				       enum rave_sp_boot_source);
> +	} cmd;

Declare this struct separately, then reference it.

> +	void (*init)(struct rave_sp *);
> +
> +	struct attribute_group group;
> +};
> +
> +struct rave_sp {
> +	struct serdev_device *serdev;
> +
> +	struct rave_sp_deframer deframer;
> +	atomic_t ackid;
> +
> +	struct mutex bus_lock;
> +	struct mutex reply_lock;
> +	struct rave_sp_reply *reply;
> +
> +	const char *part_number_firmware;
> +	const char *part_number_bootloader;
> +
> +	const char *reset_reason;
> +	const char *copper_rev_rmb;
> +	const char *copper_rev_deb;
> +	const char *silicon_devid;
> +	const char *silicon_devrev;
> +
> +	const char *copper_mod_rmb;
> +	const char *copper_mod_deb;
> +
> +	const struct rave_sp_variant *variant;
> +
> +	struct blocking_notifier_head event_notifier_list;
> +
> +	struct attribute_group *group;
> +};

This is going to require a kerneldoc header.

[...]

I'm going to stop the review here.  Looking at the rest of the code,
it looks like you're submitting to the wrong subsystem.

Please consider submitting to drivers/platform instead.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
