From: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5] powerpc/powernv: hwmon driver for power, fan rpm,
 voltage and temperature
Date: Tue, 08 Jul 2014 14:38:38 +0530
Message-ID: <20140708090315.3866.15604.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, svaidy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, sbhat-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds basic kernel support for reading power values, fan
speed rpm, voltage and temperature data on powernv platforms which
will be exported to user space through sysfs interface.

Test results:
-------------
[root@tul163p1 ~]# sensors
ibmpowernv-isa-0000
Adapter: ISA adapter
fan1:        5465 RPM  (min =3D    0 RPM)
fan2:        5152 RPM  (min =3D    0 RPM)
fan3:        5521 RPM  (min =3D    0 RPM)
fan4:        4891 RPM  (min =3D    0 RPM)
fan5:           0 RPM  (min =3D    0 RPM)
fan6:           0 RPM  (min =3D    0 RPM)
fan7:        7480 RPM  (min =3D    0 RPM)
fan8:        7944 RPM  (min =3D    0 RPM)
temp1:        +39.0=C2=B0C  (high =3D  +0.0=C2=B0C)
power1:      190.00 W =20

[root@tul163p1 ~]# ls /sys/devices/platform/
alarmtimer  ibmpowernv.0  power  rtc-generic  serial8250  uevent
[root@tul163p1 ~]# ls /sys/devices/platform/ibmpowernv.0/hwmon/hwmon0/
device	    fan2_min	fan4_min    fan6_min	fan8_min   power
fan1_fault  fan3_fault	fan5_fault  fan7_fault	in1_fault  power1_input
fan1_input  fan3_input	fan5_input  fan7_input	in2_fault  subsystem
fan1_min    fan3_min	fan5_min    fan7_min	in3_fault  temp1_input
fan2_fault  fan4_fault	fan6_fault  fan8_fault	in4_fault  temp1_max
fan2_input  fan4_input	fan6_input  fan8_input	name	   uevent
[root@tul163p1 ~]# ls /sys/class/hwmon/hwmon0/
device	    fan2_min	fan4_min    fan6_min	fan8_min   power
fan1_fault  fan3_fault	fan5_fault  fan7_fault	in1_fault  power1_input
fan1_input  fan3_input	fan5_input  fan7_input	in2_fault  subsystem
fan1_min    fan3_min	fan5_min    fan7_min	in3_fault  temp1_input
fan2_fault  fan4_fault	fan6_fault  fan8_fault	in4_fault  temp1_max
fan2_input  fan4_input	fan6_input  fan8_input	name	   uevent
[root@tul163p1 ~]#

Signed-off-by: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---

Changes in v5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Addressed couple minor comments in v4.

Changes in v4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Replaced pr_err() with dev_err() for logging print messages.
- Using kstrtou32() function for converting string to u32 instead of ss=
canf().

Changes in v3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Fixed an endianness bug leading the driver to break on LE.
- Fixed a bug that when one of the 'attribute_group' not populated, fol=
lowing
  groups attributes were dropped.
- Rewrite the get_sensor_index_attr() function to handle all the error =
scenarios
  like 'sscanf' etc.
- Fixed all the errors/warnings related to coding style/whitespace.
- Added 'Documentation' files.
- Addressed remaining review comments on V2.

Changes in v2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Generic use of devm_* functions in hwmon like using devm_kzalloc() fo=
r dynamic
  memory request, avoiding the need to explicit free of memory.
  Adding 'struct attribute_group' as member of platform data structure =
to be
  populated and then passed to devm_hwmon_device_register_with_groups()=
=2E

  Note: Having an array of pointers of 'attribute_group' and each group
  corresponds to 'enum sensors' type. Not completely sure, if it's idea=
l or
  could have just one group populated with attributes of sensor types?

- 'ibmpowernv' is not hot-pluggable device so moving 'platform_driver' =
callback
  function (probe) as part of __init code.
- Fixed issues related to coding style.
- Other general comments in v1.

 .../devicetree/bindings/hwmon/ibmpowernv.txt       |   23 +
 Documentation/hwmon/ibmpowernv                     |   41 ++
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1=20
 drivers/hwmon/ibmpowernv.c                         |  364 ++++++++++++=
++++++++
 5 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ibmpowernv.=
txt
 create mode 100644 Documentation/hwmon/ibmpowernv
 create mode 100644 drivers/hwmon/ibmpowernv.c

diff --git a/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt b/D=
ocumentation/devicetree/bindings/hwmon/ibmpowernv.txt
new file mode 100644
index 0000000..f93242b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt
@@ -0,0 +1,23 @@
+IBM POWERNV platform sensors
+----------------------------
+
+Required node properties:
+- compatible: must be one of
+		"ibm,opal-sensor-cooling-fan"
+		"ibm,opal-sensor-amb-temp"
+		"ibm,opal-sensor-power-supply"
+		"ibm,opal-sensor-power"
+- sensor-id: an opaque id provided by the firmware to the kernel, iden=
tifies a
+	     given sensor and its attribute data
+
+Example sensors node:
+
+cooling-fan#8-data {
+	sensor-id =3D <0x7052107>;
+	compatible =3D "ibm,opal-sensor-cooling-fan";
+};
+
+amb-temp#1-thrs {
+	sensor-id =3D <0x5096000>;
+	compatible =3D "ibm,opal-sensor-amb-temp";
+};
diff --git a/Documentation/hwmon/ibmpowernv b/Documentation/hwmon/ibmpo=
wernv
new file mode 100644
index 0000000..644245a
--- /dev/null
+++ b/Documentation/hwmon/ibmpowernv
@@ -0,0 +1,41 @@
+Kernel Driver IBMPOWENV
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported systems:
+  * Any recent IBM P servers based on POWERNV platform
+
+Author: Neelesh Gupta
+
+Description
+-----------
+
+This driver implements reading the platform sensors data like temperat=
ure/fan/
+voltage/power for 'POWERNV' platform.
+
+The driver uses the platform device infrastructure. It probes the devi=
ce tree
+for sensor devices during the __init phase and registers them with the=
 'hwmon'.
+'hwmon' populates the 'sysfs' tree having attribute files, each for a =
given
+sensor type and its attribute data.
+
+All the nodes in the DT appear under "/ibm,opal/sensors" and each vali=
d node in
+the DT maps to an attribute file in 'sysfs'. The node exports unique '=
sensor-id'
+which the driver uses to make an OPAL call to the firmware.
+
+Usage notes
+-----------
+The driver is built statically with the kernel by enabling the config
+CONFIG_SENSORS_IBMPOWERNV. It can also be built as module 'ibmpowernv'=
=2E
+
+Sysfs attributes
+----------------
+
+fanX_input		Measured RPM value.
+fanX_min		Threshold RPM for alert generation.
+fanX_fault		0: No fail condition
+			1: Failing fan
+tempX_input		Measured ambient temperature.
+tempX_max		Threshold ambient temperature for alert generation.
+inX_input		Measured power supply voltage
+inX_fault		0: No fail condition.
+			1: Failing power supply.
+power1_input		System power consumption (microWatt)
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 02d3d85..29c3fcb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -554,6 +554,17 @@ config SENSORS_IBMPEX
 	  This driver can also be built as a module.  If so, the module
 	  will be called ibmpex.
=20
+config SENSORS_IBMPOWERNV
+	tristate "IBM POWERNV platform sensors"
+	depends on PPC_POWERNV
+	default y
+	help
+	  If you say yes here you get support for the temperature/fan/power
+	  sensors on your PowerNV platform.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called ibmpowernv.
+
 config SENSORS_IIO_HWMON
 	tristate "Hwmon driver that uses channels specified via iio maps"
 	depends on IIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3dc0f02..fc4ed26 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_SENSORS_ULTRA45)	+=3D ultra45_env.o
 obj-$(CONFIG_SENSORS_I5K_AMB)	+=3D i5k_amb.o
 obj-$(CONFIG_SENSORS_IBMAEM)	+=3D ibmaem.o
 obj-$(CONFIG_SENSORS_IBMPEX)	+=3D ibmpex.o
+obj-$(CONFIG_SENSORS_IBMPOWERNV)+=3D ibmpowernv.o
 obj-$(CONFIG_SENSORS_IIO_HWMON) +=3D iio_hwmon.o
 obj-$(CONFIG_SENSORS_INA209)	+=3D ina209.o
 obj-$(CONFIG_SENSORS_INA2XX)	+=3D ina2xx.o
diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
new file mode 100644
index 0000000..e6b652a
--- /dev/null
+++ b/drivers/hwmon/ibmpowernv.c
@@ -0,0 +1,364 @@
+/*
+ * IBM PowerNV platform sensors for temperature/fan/voltage/power
+ * Copyright (C) 2014 IBM
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.
+ */
+
+#define DRVNAME		"ibmpowernv"
+#define pr_fmt(fmt)	DRVNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include <linux/platform_device.h>
+#include <asm/opal.h>
+#include <linux/err.h>
+
+#define MAX_ATTR_LEN	32
+
+/* Sensor suffix name from DT */
+#define DT_FAULT_ATTR_SUFFIX		"faulted"
+#define DT_DATA_ATTR_SUFFIX		"data"
+#define DT_THRESHOLD_ATTR_SUFFIX	"thrs"
+
+/*
+ * Enumerates all the types of sensors in the POWERNV platform and doe=
s index
+ * into 'struct sensor_group'
+ */
+enum sensors {
+	FAN,
+	AMBIENT_TEMP,
+	POWER_SUPPLY,
+	POWER_INPUT,
+	MAX_SENSOR_TYPE,
+};
+
+static struct sensor_group {
+	const char *name;
+	const char *compatible;
+	struct attribute_group group;
+	u32 attr_count;
+} sensor_groups[] =3D {
+	{"fan", "ibm,opal-sensor-cooling-fan"},
+	{"temp", "ibm,opal-sensor-amb-temp"},
+	{"in", "ibm,opal-sensor-power-supply"},
+	{"power", "ibm,opal-sensor-power"}
+};
+
+struct sensor_data {
+	u32 id; /* An opaque id of the firmware for each sensor */
+	enum sensors type;
+	char name[MAX_ATTR_LEN];
+	struct device_attribute dev_attr;
+};
+
+struct platform_data {
+	const struct attribute_group *attr_groups[MAX_SENSOR_TYPE + 1];
+	u32 sensors_count; /* Total count of sensors from each group */
+};
+
+/* Platform device representing all the ibmpowernv sensors */
+static struct platform_device *pdevice;
+
+static ssize_t show_sensor(struct device *dev, struct device_attribute=
 *devattr,
+			   char *buf)
+{
+	struct sensor_data *sdata =3D container_of(devattr, struct sensor_dat=
a,
+						 dev_attr);
+	ssize_t ret;
+	u32 x;
+
+	ret =3D opal_get_sensor_data(sdata->id, &x);
+	if (ret)
+		return ret;
+
+	/* Convert temperature to milli-degrees */
+	if (sdata->type =3D=3D AMBIENT_TEMP)
+		x *=3D 1000;
+	/* Convert power to micro-watts */
+	else if (sdata->type =3D=3D POWER_INPUT)
+		x *=3D 1000000;
+
+	return sprintf(buf, "%u\n", x);
+}
+
+static int __init get_sensor_index_attr(const char *name, u32 *index,
+					char *attr)
+{
+	char *hash_pos =3D strchr(name, '#');
+	char buf[8] =3D { 0 };
+	char *dash_pos;
+	u32 copy_len;
+	int err;
+
+	if (!hash_pos)
+		return -EINVAL;
+
+	dash_pos =3D strchr(hash_pos, '-');
+	if (!dash_pos)
+		return -EINVAL;
+
+	copy_len =3D dash_pos - hash_pos - 1;
+	if (copy_len >=3D sizeof(buf))
+		return -EINVAL;
+
+	strncpy(buf, hash_pos + 1, copy_len);
+
+	err =3D kstrtou32(buf, 10, index);
+	if (err)
+		return err;
+
+	strncpy(attr, dash_pos + 1, MAX_ATTR_LEN);
+
+	return 0;
+}
+
+/*
+ * This function translates the DT node name into the 'hwmon' attribut=
e name.
+ * IBMPOWERNV device node appear like cooling-fan#2-data, amb-temp#1-t=
hrs etc.
+ * which need to be mapped as fan2_input, temp1_max respectively befor=
e
+ * populating them inside hwmon device class.
+ */
+static int __init create_hwmon_attr_name(struct device *dev, enum sens=
ors type,
+					 const char *node_name,
+					 char *hwmon_attr_name)
+{
+	char attr_suffix[MAX_ATTR_LEN];
+	char *attr_name;
+	u32 index;
+	int err;
+
+	err =3D get_sensor_index_attr(node_name, &index, attr_suffix);
+	if (err) {
+		dev_err(dev, "Sensor device node name '%s' is invalid\n",
+			node_name);
+		return err;
+	}
+
+	if (!strcmp(attr_suffix, DT_FAULT_ATTR_SUFFIX)) {
+		attr_name =3D "fault";
+	} else if (!strcmp(attr_suffix, DT_DATA_ATTR_SUFFIX)) {
+		attr_name =3D "input";
+	} else if (!strcmp(attr_suffix, DT_THRESHOLD_ATTR_SUFFIX)) {
+		if (type =3D=3D AMBIENT_TEMP)
+			attr_name =3D "max";
+		else if (type =3D=3D FAN)
+			attr_name =3D "min";
+		else
+			return -ENOENT;
+	} else {
+		return -ENOENT;
+	}
+
+	snprintf(hwmon_attr_name, MAX_ATTR_LEN, "%s%d_%s",
+		 sensor_groups[type].name, index, attr_name);
+	return 0;
+}
+
+static int __init populate_attr_groups(struct platform_device *pdev)
+{
+	struct platform_data *pdata =3D platform_get_drvdata(pdev);
+	const struct attribute_group **pgroups =3D pdata->attr_groups;
+	struct device_node *opal, *np;
+	enum sensors type;
+
+	opal =3D of_find_node_by_path("/ibm,opal/sensors");
+	if (!opal) {
+		dev_err(&pdev->dev, "Opal node 'sensors' not found\n");
+		return -ENODEV;
+	}
+
+	for_each_child_of_node(opal, np) {
+		if (np->name =3D=3D NULL)
+			continue;
+
+		for (type =3D 0; type < MAX_SENSOR_TYPE; type++)
+			if (of_device_is_compatible(np,
+					sensor_groups[type].compatible)) {
+				sensor_groups[type].attr_count++;
+				break;
+			}
+	}
+
+	of_node_put(opal);
+
+	for (type =3D 0; type < MAX_SENSOR_TYPE; type++) {
+		sensor_groups[type].group.attrs =3D devm_kzalloc(&pdev->dev,
+					sizeof(struct attribute *) *
+					(sensor_groups[type].attr_count + 1),
+					GFP_KERNEL);
+		if (!sensor_groups[type].group.attrs)
+			return -ENOMEM;
+
+		pgroups[type] =3D &sensor_groups[type].group;
+		pdata->sensors_count +=3D sensor_groups[type].attr_count;
+		sensor_groups[type].attr_count =3D 0;
+	}
+
+	return 0;
+}
+
+/*
+ * Iterate through the device tree for each child of 'sensors' node, c=
reate
+ * a sysfs attribute file, the file is named by translating the DT nod=
e name
+ * to the name required by the higher 'hwmon' driver like fan1_input, =
temp1_max
+ * etc..
+ */
+static int __init create_device_attrs(struct platform_device *pdev)
+{
+	struct platform_data *pdata =3D platform_get_drvdata(pdev);
+	const struct attribute_group **pgroups =3D pdata->attr_groups;
+	struct device_node *opal, *np;
+	struct sensor_data *sdata;
+	const __be32 *sensor_id;
+	enum sensors type;
+	u32 count =3D 0;
+	int err =3D 0;
+
+	opal =3D of_find_node_by_path("/ibm,opal/sensors");
+	sdata =3D devm_kzalloc(&pdev->dev, pdata->sensors_count * sizeof(*sda=
ta),
+			     GFP_KERNEL);
+	if (!sdata) {
+		err =3D -ENOMEM;
+		goto exit_put_node;
+	}
+
+	for_each_child_of_node(opal, np) {
+		if (np->name =3D=3D NULL)
+			continue;
+
+		for (type =3D 0; type < MAX_SENSOR_TYPE; type++)
+			if (of_device_is_compatible(np,
+					sensor_groups[type].compatible))
+				break;
+
+		if (type =3D=3D MAX_SENSOR_TYPE)
+			continue;
+
+		sensor_id =3D of_get_property(np, "sensor-id", NULL);
+		if (!sensor_id) {
+			dev_info(&pdev->dev,
+				 "'sensor-id' missing in the node '%s'\n",
+				 np->name);
+			continue;
+		}
+
+		sdata[count].id =3D be32_to_cpup(sensor_id);
+		sdata[count].type =3D type;
+		err =3D create_hwmon_attr_name(&pdev->dev, type, np->name,
+					     sdata[count].name);
+		if (err)
+			goto exit_put_node;
+
+		sysfs_attr_init(&sdata[count].dev_attr.attr);
+		sdata[count].dev_attr.attr.name =3D sdata[count].name;
+		sdata[count].dev_attr.attr.mode =3D S_IRUGO;
+		sdata[count].dev_attr.show =3D show_sensor;
+
+		pgroups[type]->attrs[sensor_groups[type].attr_count++] =3D
+				&sdata[count++].dev_attr.attr;
+	}
+
+exit_put_node:
+	of_node_put(opal);
+	return err;
+}
+
+static int __init ibmpowernv_probe(struct platform_device *pdev)
+{
+	struct platform_data *pdata;
+	struct device *hwmon_dev;
+	int err;
+
+	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pdata);
+	pdata->sensors_count =3D 0;
+	err =3D populate_attr_groups(pdev);
+	if (err)
+		return err;
+
+	/* Create sysfs attribute data for each sensor found in the DT */
+	err =3D create_device_attrs(pdev);
+	if (err)
+		return err;
+
+	/* Finally, register with hwmon */
+	hwmon_dev =3D devm_hwmon_device_register_with_groups(&pdev->dev, DRVN=
AME,
+							   pdata,
+							   pdata->attr_groups);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver ibmpowernv_driver =3D {
+	.driver =3D {
+		.owner =3D THIS_MODULE,
+		.name =3D DRVNAME,
+	},
+};
+
+static int __init ibmpowernv_init(void)
+{
+	int err;
+
+	pdevice =3D platform_device_alloc(DRVNAME, 0);
+	if (!pdevice) {
+		pr_err("Device allocation failed\n");
+		err =3D -ENOMEM;
+		goto exit;
+	}
+
+	err =3D platform_device_add(pdevice);
+	if (err) {
+		pr_err("Device addition failed (%d)\n", err);
+		goto exit_device_put;
+	}
+
+	err =3D platform_driver_probe(&ibmpowernv_driver, ibmpowernv_probe);
+	if (err) {
+		pr_err("Platfrom driver probe failed\n");
+		goto exit_device_del;
+	}
+
+	return 0;
+
+exit_device_del:
+	platform_device_del(pdevice);
+exit_device_put:
+	platform_device_put(pdevice);
+exit:
+	return err;
+}
+
+static void __exit ibmpowernv_exit(void)
+{
+	platform_driver_unregister(&ibmpowernv_driver);
+	platform_device_unregister(pdevice);
+}
+
+MODULE_AUTHOR("Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>");
+MODULE_DESCRIPTION("IBM POWERNV platform sensors");
+MODULE_LICENSE("GPL");
+
+module_init(ibmpowernv_init);
+module_exit(ibmpowernv_exit);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
