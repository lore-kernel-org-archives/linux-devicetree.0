From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: Add driver for RAVE Supervisory Processor
Date: Tue, 6 Jun 2017 18:26:29 -0700
Message-ID: <CAHQ1cqGfcZEyXKd2oLknsbdv9jwF57XjezC6zZKfw_qY3hSAYg@mail.gmail.com>
References: <20170606180643.14258-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606180643.14258-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 6, 2017 at 11:06 AM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
> Note that the driver for "zii,rave-sp-watchdog" exists, but I haven't
> submitted it yet, becuase I wanted to make sure that API exposed by
> this MFD is acceptable and doesn't need drastic changes
>
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        |   33 +
>  drivers/mfd/Kconfig                                |    9 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/rave-sp.c                              | 1009 ++++++++++++++++++++
>  include/linux/rave-sp.h                            |   54 ++
>  5 files changed, 1106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>  create mode 100644 drivers/mfd/rave-sp.c
>  create mode 100644 include/linux/rave-sp.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> new file mode 100644
> index 0000000..46a904c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
> @@ -0,0 +1,33 @@
> +Zodiac Inflight Innovations RAVE Supervisory Processor
> +
> +Required parent device properties:
> +
> + - compatible: Should be one of:
> +       - "zii,rave-sp-niu"
> +       - "zii,rave-sp-mezz"
> +       - "zii,rave-sp-esb"
> +       - "zii,rave-sp-rdu1"
> +       - "zii,rave-sp-rdu2"
> +
> + - current-speed: Should be set to baud rate SP device is using
> +
> +RAVE SP consists of the following sub-devices:
> +
> +Device                          Description
> +------                          -----------
> +rave-sp-wdt                    : Watchdog
> +
> +
> +Example of usage:
> +
> +       rdu {
> +               compatible = "zii,rave-sp-rdu2";
> +               current-speed = <1000000>;
> +               status = "okay";
> +
> +               watchdog {
> +                       compatible = "zii,rave-sp-watchdog";
> +                       status = "okay";
> +               };
> +       };
> +
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3eb5c93..6cab311 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -867,6 +867,15 @@ config MFD_SPMI_PMIC
>           Say M here if you want to include support for the SPMI PMIC
>           series as a module.  The module will be called "qcom-spmi-pmic".
>
> +config MFD_RAVE_SP
> +       tristate "RAVE SP MCU core driver"
> +       select MFD_CORE
> +       select SERIAL_DEV_BUS
> +       select CRC_CCITT
> +       help
> +         Select this to get support for the RAVE Supervisory
> +         Processor driver
> +
>  config MFD_RDC321X
>         tristate "RDC R-321x southbridge"
>         select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c16bf1e..bc3df0a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -221,3 +221,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)       += sun4i-gpadc.o
>
>  obj-$(CONFIG_MFD_STM32_TIMERS)         += stm32-timers.o
>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> +obj-$(CONFIG_MFD_RAVE_SP)      += rave-sp.o
> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> new file mode 100644
> index 0000000..1260f94
> --- /dev/null
> +++ b/drivers/mfd/rave-sp.c
> @@ -0,0 +1,1009 @@
> +/*
> + * rave-sp.c - Multifunction core driver for Zodiac Inflight Innovations
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
> +
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
> +       STX = 0x02,
> +       ETX = 0x03,
> +       DLE = 0x10,
> +};
> +
> +enum {
> +       RAVE_SP_BOOT_SOURCE_GET = 0,
> +       RAVE_SP_BOOT_SOURCE_SET = 1,
> +
> +       RAVE_SP_MAX_DATA_SIZE   = 64,
> +       RAVE_SP_CHECKSUM_SIZE   = 2, /* Worst case scenariou on RDU2 */
> +       /*
> +        * We don't store STX, ETX and unescaped bytes, so Rx is only
> +        * DATA + CSUM
> +        */
> +       RAVE_SP_RX_BUFFER_SIZE  = RAVE_SP_MAX_DATA_SIZE +
> +                                 RAVE_SP_CHECKSUM_SIZE,
> +       RAVE_SP_STX_ETX_SIZE    = 2,
> +       /*
> +        * For Tx we have to have space for everything, STX, EXT and
> +        * potentially stuffed DATA + CSUM data + csum
> +        */
> +       RAVE_SP_TX_BUFFER_SIZE  = RAVE_SP_STX_ETX_SIZE +
> +                                 2 * RAVE_SP_RX_BUFFER_SIZE,
> +};
> +
> +enum rave_sp_deframer_state {
> +       RAVE_SP_EXPECT_SOF,
> +       RAVE_SP_EXPECT_DATA,
> +       RAVE_SP_EXPECT_ESCAPED_DATA,
> +};
> +
> +struct rave_sp_deframer {
> +       enum rave_sp_deframer_state state;
> +       unsigned char data[RAVE_SP_RX_BUFFER_SIZE];
> +       size_t length;
> +};
> +
> +struct rave_sp_reply {
> +       size_t length;
> +       void  *data;
> +       u8     code;
> +       u8     ackid;
> +       struct completion received;
> +};
> +
> +struct rave_sp_checksum {
> +       size_t length;
> +       void (*subroutine)(const u8 *, size_t, u8 *);
> +};
> +
> +enum rave_sp_boot_source {
> +       RAVE_SP_BOOT_SOURCE_SD          = 0,
> +       RAVE_SP_BOOT_SOURCE_EMMC        = 1,
> +       RAVE_SP_BOOT_SOURCE_NOR         = 2,
> +};
> +
> +struct rave_sp_variant {
> +       const struct rave_sp_checksum *checksum;
> +
> +       struct {
> +               int (*translate)(enum rave_sp_command);
> +               int (*get_boot_source)(struct rave_sp *);
> +               int (*set_boot_source)(struct rave_sp *,
> +                                      enum rave_sp_boot_source);
> +       } cmd;
> +
> +       void (*init)(struct rave_sp *);
> +
> +       struct attribute_group group;
> +};
> +
> +struct rave_sp {
> +       struct serdev_device *serdev;
> +
> +       struct rave_sp_deframer deframer;
> +       atomic_t ackid;
> +
> +       struct mutex bus_lock;
> +       struct mutex reply_lock;
> +       struct rave_sp_reply *reply;
> +
> +       const char *part_number_firmware;
> +       const char *part_number_bootloader;
> +
> +       const char *reset_reason;
> +       const char *copper_rev_rmb;
> +       const char *copper_rev_deb;
> +       const char *silicon_devid;
> +       const char *silicon_devrev;
> +
> +       const char *copper_mod_rmb;
> +       const char *copper_mod_deb;
> +
> +       const struct rave_sp_variant *variant;
> +
> +       struct blocking_notifier_head event_notifier_list;
> +
> +       struct attribute_group *group;
> +};
> +
> +struct rave_sp_rsp_status {
> +       u8 bl_bytes[6];
> +       u8 fw_bytes[6];
> +       u8 gs_format;
> +} __packed;
> +
> +static bool rave_sp_id_is_event(u8 code)
> +{
> +       return (code & 0xF0) == RAVE_SP_EVNT_BASE;
> +}
> +
> +static void
> +devm_rave_sp_unregister_event_notifier(struct device *dev, void *res)
> +{
> +       struct rave_sp *sp = dev_get_drvdata(dev->parent);
> +       struct notifier_block *nb = *(struct notifier_block **)res;
> +       struct blocking_notifier_head *bnh = &sp->event_notifier_list;
> +
> +       WARN_ON(blocking_notifier_chain_unregister(bnh, nb));
> +}
> +
> +int devm_rave_sp_register_event_notifier(struct device *dev,
> +                                        struct notifier_block *nb)
> +{
> +       struct rave_sp *sp = dev_get_drvdata(dev->parent);
> +       struct notifier_block **rcnb;
> +       int ret;
> +
> +       rcnb = devres_alloc(devm_rave_sp_unregister_event_notifier,
> +                           sizeof(*rcnb), GFP_KERNEL);
> +       if (!rcnb)
> +               return -ENOMEM;
> +
> +       ret = blocking_notifier_chain_register(&sp->event_notifier_list, nb);
> +       if (!ret) {
> +               *rcnb = nb;
> +               devres_add(dev, rcnb);
> +       } else {
> +               devres_free(rcnb);
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_rave_sp_register_event_notifier);
> +
> +static const char *devm_rave_sp_version(struct device *dev, const char *buf)
> +{
> +       return devm_kasprintf(dev, GFP_KERNEL, "%02d%02d%02d.%c%c\n",
> +                             buf[0], le16_to_cpup((const __le16 *)&buf[1]),
> +                             buf[3], buf[4], buf[5]);
> +}
> +
> +static int rave_sp_get_status(struct rave_sp *sp,
> +                             struct rave_sp_rsp_status *status)
> +{
> +       u8 cmd[] = {
> +               [0] = RAVE_SP_CMD_STATUS,
> +               [1] = 0
> +       };
> +       return rave_sp_exec(sp, cmd, sizeof(cmd), &status, sizeof(status));

Ugh, found a bug in my code, should be:

return rave_sp_exec(sp, cmd, sizeof(cmd), status, sizeof(*status));

will be fixed in v2.

Sorry for missing that!

Andrey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
