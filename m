From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RFC 3/6] hwmon: Add support for RPi voltage sensor
Date: Wed, 16 May 2018 11:05:49 -0700
Message-ID: <20180516180549.GA22705@roeck-us.net>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-4-git-send-email-stefan.wahren@i2se.com>
 <b053c458-e50c-d4db-3a18-699327f021f3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <b053c458-e50c-d4db-3a18-699327f021f3@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 02:51:49PM +0100, Robin Murphy wrote:
> Hi Stefan,
> =

> On 16/05/18 14:37, Stefan Wahren wrote:
> >Currently there is no easy way to detect under-voltage conditions on a r=
emote
> >Raspberry Pi. This hwmon driver retrieves the state of the under-voltage=
 sensor
> >via mailbox interface. The handling based on Noralf's modifications to t=
he
> >downstream firmware driver. In case of an under-voltage condition only a=
n entry
> >is written to the kernel log.
> >
> >CC: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> >Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> >---
> >  drivers/hwmon/Kconfig             |  10 ++
> >  drivers/hwmon/Makefile            |   1 +
> >  drivers/hwmon/raspberrypi-hwmon.c | 207 ++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 218 insertions(+)
> >  create mode 100644 drivers/hwmon/raspberrypi-hwmon.c
> >
> >diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >index 768aed5..7f935cf 100644
> >--- a/drivers/hwmon/Kconfig
> >+++ b/drivers/hwmon/Kconfig
> >@@ -1298,6 +1298,16 @@ config SENSORS_PWM_FAN
> >  	  This driver can also be built as a module.  If so, the module
> >  	  will be called pwm-fan.
> >+config SENSORS_RASPBERRYPI_HWMON
> >+	tristate "Raspberry Pi voltage monitor"
> >+	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && =
!RASPBERRYPI_FIRMWARE)
> =

> Since RASPBERRYPI_FIRMWARE already implies ARCH_BCM2835 (via BCM2835_MBOX=
),
> this is just a very roundabout way to say:
> =

> 	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> =

That would permit SENSORS_RASPBERRYPI_HWMON=3Dy combined with
RASPBERRYPI_FIRMWARE=3Dm, which AFAICS would result in a build error
because include/soc/bcm2835/raspberrypi-firmware.h uses IS_ENABLED()
and not IS_REACHABLE().

Guenter

> Robin.
> =

> >+	help
> >+	  If you say yes here you get support for voltage sensor on the
> >+	  Raspberry Pi.
> >+
> >+	  This driver can also be built as a module. If so, the module
> >+	  will be called raspberrypi-hwmon.
> >+
> >  config SENSORS_SHT15
> >  	tristate "Sensiron humidity and temperature sensors. SHT15 and compat=
."
> >  	depends on GPIOLIB || COMPILE_TEST
> >diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >index e7d52a3..a929770 100644
> >--- a/drivers/hwmon/Makefile
> >+++ b/drivers/hwmon/Makefile
> >@@ -141,6 +141,7 @@ obj-$(CONFIG_SENSORS_PC87427)	+=3D pc87427.o
> >  obj-$(CONFIG_SENSORS_PCF8591)	+=3D pcf8591.o
> >  obj-$(CONFIG_SENSORS_POWR1220)  +=3D powr1220.o
> >  obj-$(CONFIG_SENSORS_PWM_FAN)	+=3D pwm-fan.o
> >+obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+=3D raspberrypi-hwmon.o
> >  obj-$(CONFIG_SENSORS_S3C)	+=3D s3c-hwmon.o
> >  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
> >  obj-$(CONFIG_SENSORS_SCH5627)	+=3D sch5627.o
> >diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberry=
pi-hwmon.c
> >new file mode 100644
> >index 0000000..2003f6c
> >--- /dev/null
> >+++ b/drivers/hwmon/raspberrypi-hwmon.c
> >@@ -0,0 +1,207 @@
> >+// SPDX-License-Identifier: GPL-2.0+
> >+/*
> >+ * Raspberry Pi voltage sensor driver
> >+ *
> >+ * Based on firmware/raspberrypi.c by Noralf Tr=F8nnes
> >+ *
> >+ * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
> >+ */
> >+#include <linux/device.h>
> >+#include <linux/err.h>
> >+#include <linux/hwmon.h>
> >+#include <linux/hwmon-sysfs.h>
> >+#include <linux/module.h>
> >+#include <linux/of_device.h>
> >+#include <linux/platform_device.h>
> >+#include <linux/slab.h>
> >+#include <linux/workqueue.h>
> >+#include <soc/bcm2835/raspberrypi-firmware.h>
> >+
> >+#define UNDERVOLTAGE_STICKY_BIT	BIT(16)
> >+
> >+struct rpi_hwmon_data {
> >+	struct device *hwmon_dev;
> >+	struct rpi_firmware *fw;
> >+	u32 last_throttled;
> >+	struct delayed_work get_values_poll_work;
> >+};
> >+
> >+static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
> >+{
> >+	u32 new_uv, old_uv, value;
> >+	int ret;
> >+
> >+	/* Clear sticky bits */
> >+	value =3D 0xffff;
> >+
> >+	ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> >+				    &value, sizeof(value));
> >+	if (ret) {
> >+		dev_err_once(data->hwmon_dev, "%s: Failed to get throttled (%d)\n",
> >+			     __func__, ret);
> >+		return;
> >+	}
> >+
> >+	new_uv =3D value & UNDERVOLTAGE_STICKY_BIT;
> >+	old_uv =3D data->last_throttled & UNDERVOLTAGE_STICKY_BIT;
> >+	data->last_throttled =3D value;
> >+
> >+	if (new_uv =3D=3D old_uv)
> >+		return;
> >+
> >+	if (new_uv)
> >+		dev_crit(data->hwmon_dev, "Under-voltage detected! (0x%08x)\n",
> >+			 value);
> >+	else
> >+		dev_info(data->hwmon_dev, "Voltage normalised (0x%08x)\n",
> >+			 value);
> >+
> >+	sysfs_notify(&data->hwmon_dev->kobj, NULL, "in0_lcrit_alarm");
> >+}
> >+
> >+static void get_values_poll(struct work_struct *work)
> >+{
> >+	struct rpi_hwmon_data *data;
> >+
> >+	data =3D container_of(work, struct rpi_hwmon_data,
> >+			    get_values_poll_work.work);
> >+
> >+	rpi_firmware_get_throttled(data);
> >+
> >+	/*
> >+	 * We can't run faster than the sticky shift (100ms) since we get
> >+	 * flipping in the sticky bits that are cleared.
> >+	 */
> >+	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
> >+}
> >+
> >+static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
> >+		    u32 attr, int channel, long *val)
> >+{
> >+	struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
> >+
> >+	if (type !=3D hwmon_in)
> >+		return -EOPNOTSUPP;
> >+
> >+	if (attr !=3D hwmon_in_lcrit_alarm)
> >+		return -EOPNOTSUPP;
> >+
> >+	if (channel)
> >+		return -EOPNOTSUPP;
> >+
> >+	*val =3D !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> >+	return 0;
> >+}
> >+
> >+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_type=
s type,
> >+			      u32 attr, int channel)
> >+{
> >+	if (type !=3D hwmon_in)
> >+		return 0;
> >+
> >+	if (attr !=3D hwmon_in_lcrit_alarm)
> >+		return 0;
> >+
> >+	if (channel)
> >+		return 0;
> >+
> >+	return 0444;
> >+}
> >+
> >+static const u32 rpi_in_config[] =3D {
> >+	HWMON_I_LCRIT_ALARM,
> >+	0
> >+};
> >+
> >+static const struct hwmon_channel_info rpi_in =3D {
> >+	.type =3D hwmon_in,
> >+	.config =3D rpi_in_config,
> >+};
> >+
> >+static const struct hwmon_channel_info *rpi_info[] =3D {
> >+	&rpi_in,
> >+	NULL
> >+};
> >+
> >+static const struct hwmon_ops rpi_hwmon_ops =3D {
> >+	.is_visible =3D rpi_is_visible,
> >+	.read =3D rpi_read,
> >+};
> >+
> >+static const struct hwmon_chip_info rpi_chip_info =3D {
> >+	.ops =3D &rpi_hwmon_ops,
> >+	.info =3D rpi_info,
> >+};
> >+
> >+static int rpi_hwmon_probe(struct platform_device *pdev)
> >+{
> >+	struct device *dev =3D &pdev->dev;
> >+	struct device_node *fw_node;
> >+	struct rpi_hwmon_data *data;
> >+	int ret;
> >+
> >+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >+	if (!data)
> >+		return -ENOMEM;
> >+
> >+	fw_node =3D of_get_parent(dev->of_node);
> >+	if (!fw_node) {
> >+		dev_err(dev, "Missing firmware node\n");
> >+		return -ENOENT;
> >+	}
> >+
> >+	data->fw =3D rpi_firmware_get(fw_node);
> >+	of_node_put(fw_node);
> >+	if (!data->fw)
> >+		return -EPROBE_DEFER;
> >+
> >+	ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> >+				    &data->last_throttled,
> >+				    sizeof(data->last_throttled));
> >+	if (ret) {
> >+		dev_info(dev, "Firmware doesn't support GET_THROTTLED\n");
> >+		return -EOPNOTSUPP;
> >+	}
> >+
> >+	data->hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "rpi_vol=
t",
> >+							       data,
> >+							       &rpi_chip_info,
> >+							       NULL);
> >+
> >+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
> >+	platform_set_drvdata(pdev, data);
> >+
> >+	if (!PTR_ERR_OR_ZERO(data->hwmon_dev))
> >+		schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
> >+
> >+	return PTR_ERR_OR_ZERO(data->hwmon_dev);
> >+}
> >+
> >+static int rpi_hwmon_remove(struct platform_device *pdev)
> >+{
> >+	struct rpi_hwmon_data *data =3D platform_get_drvdata(pdev);
> >+
> >+	cancel_delayed_work_sync(&data->get_values_poll_work);
> >+
> >+	return 0;
> >+}
> >+
> >+static const struct of_device_id rpi_hwmon_of_match[] =3D {
> >+	{ .compatible =3D "raspberrypi,bcm2835-hwmon", },
> >+	{ /* sentinel */},
> >+};
> >+MODULE_DEVICE_TABLE(of, rpi_hwmon_of_match);
> >+
> >+static struct platform_driver rpi_hwmon_driver =3D {
> >+	.probe =3D rpi_hwmon_probe,
> >+	.remove =3D rpi_hwmon_remove,
> >+	.driver =3D {
> >+		.name =3D "raspberrypi-hwmon",
> >+		.of_match_table =3D rpi_hwmon_of_match,
> >+	},
> >+};
> >+module_platform_driver(rpi_hwmon_driver);
> >+
> >+MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
> >+MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
> >+MODULE_LICENSE("GPL v2");
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
