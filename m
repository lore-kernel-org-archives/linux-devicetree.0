Return-Path: <SRS0=915k=P6=linuxfoundation.org=gregkh@kernel.org>
Date: Tue, 22 Jan 2019 14:20:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10 03/12] peci: Add support for PECI bus driver core
Message-ID: <20190122132047.GA12357@kroah.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, David Kershner <david.kershner@unisys.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, Gavin Schenk <g.schenk@eckelmann.de>, Viresh Kumar <viresh.kumar@linaro.org>, Cyrille Pitchen <cyrille.pitchen@free-electrons.com>, Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Julia Cartwright <juliac@eso.teric.us>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 07, 2019 at 01:41:27PM -0800, Jae Hyun Yoo wrote:
> +config PECI
> +	bool "PECI support"
> +	select RT_MUTEXES
> +	select CRC8
> +	help
> +	  The Platform Environment Control Interface (PECI) is a one-wire bus
> +	  interface that provides a communication channel from Intel processors
> +	  and chipset components to external monitoring or control devices.

Why can't this be built as a module?

And why do you rely on rt mutexes?

Anyway, the driver core interaction looks good, I have a few other minor
comments on the ioctl handling:

> +typedef int (*peci_ioctl_fn_type)(struct peci_adapter *, void *);
> +
> +static const peci_ioctl_fn_type peci_ioctl_fn[PECI_CMD_MAX] = {
> +	peci_ioctl_xfer,
> +	peci_ioctl_ping,
> +	peci_ioctl_get_dib,
> +	peci_ioctl_get_temp,
> +	peci_ioctl_rd_pkg_cfg,
> +	peci_ioctl_wr_pkg_cfg,
> +	peci_ioctl_rd_ia_msr,
> +	NULL, /* Reserved */
> +	peci_ioctl_rd_pci_cfg,
> +	NULL, /* Reserved */
> +	peci_ioctl_rd_pci_cfg_local,
> +	peci_ioctl_wr_pci_cfg_local,
> +};

That's "interesting", why not have a list that has the ioctl number, and
the function pointer?  That way no need for "reserved" entries, and you
don't have to add a new item to your "is this a valid ioctl" check
below:

> +static long peci_ioctl(struct file *file, unsigned int iocmd, unsigned long arg)
> +{
> +	struct peci_adapter *adapter = file->private_data;
> +	void __user *argp = (void __user *)arg;
> +	unsigned int msg_len;
> +	enum peci_cmd cmd;
> +	int rc = 0;

No need to set rc here.

> +	u8 *msg;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;

Really?  Nice, you have userspace tools running as root, what could go
wrong... :)

> +
> +	dev_dbg(&adapter->dev, "ioctl, cmd=0x%x, arg=0x%lx\n", iocmd, arg);

I understand the need for this type of thing when debugging the code
initially, but you can remove them all now, ftrace should provide what
you need now, right?

> +
> +	switch (iocmd) {
> +	case PECI_IOC_XFER:
> +	case PECI_IOC_PING:
> +	case PECI_IOC_GET_DIB:
> +	case PECI_IOC_GET_TEMP:
> +	case PECI_IOC_RD_PKG_CFG:
> +	case PECI_IOC_WR_PKG_CFG:
> +	case PECI_IOC_RD_IA_MSR:
> +	case PECI_IOC_RD_PCI_CFG:
> +	case PECI_IOC_RD_PCI_CFG_LOCAL:
> +	case PECI_IOC_WR_PCI_CFG_LOCAL:
> +		cmd = _IOC_NR(iocmd);
> +		msg_len = _IOC_SIZE(iocmd);
> +		break;

That check up there can be replaced with an iteration over the list of
ioctl functions, right?


> +
> +	default:
> +		dev_dbg(&adapter->dev, "Invalid ioctl cmd : 0x%x\n", iocmd);
> +		return -ENOTTY;
> +	}
> +
> +	if (!access_ok(argp, msg_len))
> +		return -EFAULT;
> +
> +	msg = memdup_user(argp, msg_len);
> +	if (IS_ERR(msg))
> +		return PTR_ERR(msg);

Why call access_ok() if you are going to copy the memory anyways?
memdup_user should fail with -EFAULT if you can't copy the memory
properly.

> +
> +	rc = peci_command(adapter, cmd, msg);

Are you _SURE_ you audited your ioctls to not do foolish things with
userspace values?  I sure didn't, so can you please have someone else do
this and sign off on this patch that they did so?

> +static int peci_detect(struct peci_adapter *adapter, u8 addr)
> +{
> +	struct peci_ping_msg msg;
> +
> +	msg.addr = addr;

What about the un-initialized fields in this structure?  Can you
properly handle that, and also, is this ok to be on the stack?

> +static ssize_t peci_sysfs_new_device(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct peci_adapter *adapter = to_peci_adapter(dev);
> +	struct peci_board_info info = {};
> +	struct peci_client *client;
> +	char *blank, end;
> +	int rc;
> +
> +	/* Parse device type */
> +	blank = strchr(buf, ' ');
> +	if (!blank) {
> +		dev_err(dev, "%s: Missing parameters\n", "new_device");
> +		return -EINVAL;
> +	}
> +	if (blank - buf > PECI_NAME_SIZE - 1) {
> +		dev_err(dev, "%s: Invalid device type\n", "new_device");
> +		return -EINVAL;
> +	}
> +	memcpy(info.type, buf, blank - buf);
> +
> +	/* Parse remaining parameters, reject extra parameters */
> +	rc = sscanf(++blank, "%hi%c", &info.addr, &end);

Please do not tell me you are parsing a sysfs write to do some type of
new configuration.  That is not what sysfs is for, that is what configfs
is for, please use that instead, this isn't ok.



> +	if (rc < 1) {
> +		dev_err(dev, "%s: Can't parse client address\n", "new_device");
> +		return -EINVAL;
> +	}
> +	if (rc > 1  && end != '\n') {
> +		dev_err(dev, "%s: Extra parameters\n", "new_device");
> +		return -EINVAL;
> +	}
> +
> +	client = peci_new_device(adapter, &info);
> +	if (!client)
> +		return -EINVAL;
> +
> +	/* Keep track of the added device */
> +	mutex_lock(&adapter->userspace_clients_lock);
> +	list_add_tail(&client->detected, &adapter->userspace_clients);
> +	mutex_unlock(&adapter->userspace_clients_lock);
> +	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
> +		 info.type, info.addr);

Don't be noisy for things that are expected to happen.


> +
> +	return count;
> +}
> +static DEVICE_ATTR(new_device, 0200, NULL, peci_sysfs_new_device);

Not that you should be doing this, but DEVICE_ATTR_RO() is what you want
here, right?


> +
> +static ssize_t peci_sysfs_delete_device(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct peci_adapter *adapter = to_peci_adapter(dev);
> +	struct peci_client *client, *next;
> +	struct peci_board_info info = {};
> +	struct peci_driver *driver;
> +	char *blank, end;
> +	int rc;
> +
> +	/* Parse device type */
> +	blank = strchr(buf, ' ');
> +	if (!blank) {
> +		dev_err(dev, "%s: Missing parameters\n", "delete_device");
> +		return -EINVAL;
> +	}
> +	if (blank - buf > PECI_NAME_SIZE - 1) {
> +		dev_err(dev, "%s: Invalid device type\n", "delete_device");
> +		return -EINVAL;
> +	}
> +	memcpy(info.type, buf, blank - buf);
> +
> +	/* Parse remaining parameters, reject extra parameters */
> +	rc = sscanf(++blank, "%hi%c", &info.addr, &end);
> +	if (rc < 1) {
> +		dev_err(dev, "%s: Can't parse client address\n",
> +			"delete_device");
> +		return -EINVAL;
> +	}
> +	if (rc > 1  && end != '\n') {
> +		dev_err(dev, "%s: Extra parameters\n", "delete_device");
> +		return -EINVAL;
> +	}

Same here, no parsing of configurations through sysfs, that is not ok.
Again, use configfs.

> +
> +	/* Make sure the device was added through sysfs */
> +	rc = -ENOENT;
> +	mutex_lock(&adapter->userspace_clients_lock);
> +	list_for_each_entry_safe(client, next, &adapter->userspace_clients,
> +				 detected) {
> +		driver = to_peci_driver(client->dev.driver);
> +
> +		if (client->addr == info.addr &&
> +		    !strncmp(client->name, info.type, PECI_NAME_SIZE)) {
> +			dev_info(dev, "%s: Deleting device %s at 0x%02hx\n",
> +				 "delete_device", client->name, client->addr);
> +			list_del(&client->detected);
> +			peci_unregister_device(client);
> +			rc = count;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&adapter->userspace_clients_lock);
> +
> +	if (rc < 0)
> +		dev_err(dev, "%s: Can't find device in list\n",
> +			"delete_device");

So you can just spam the syslog by writing odd values to the file?  Not
good.

> +
> +	return rc;
> +}
> +static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL,
> +				  peci_sysfs_delete_device);

sysfs files that remove themselves are reserved for a specific circle in
hell, you really don't want to mess with them :(

> +/**
> + * struct peci_adapter - represent a PECI adapter
> + * @owner: owner module of the PECI adpater
> + * @bus_lock: mutex for exclusion of multiple callers
> + * @dev: device interface to this driver
> + * @cdev: character device object to create character device
> + * @nr: the bus number to map
> + * @name: name of the adapter
> + * @userspace_clients_lock: mutex for exclusion of clients handling
> + * @userspace_clients: list of registered clients
> + * @xfer: low-level transfer function pointer of the adapter
> + * @cmd_mask: mask for supportable PECI commands
> + *
> + * Each PECI adapter can communicate with one or more PECI client children.
> + * These make a small bus, sharing a single wired PECI connection.
> + */
> +struct peci_adapter {
> +	struct module		*owner;
> +	struct rt_mutex		bus_lock;
> +	struct device		dev;
> +	struct cdev		cdev;

Yeah, two differently reference counted variables in the same structure,
what could go wrong!  :(

Don't do this, make your cdev a pointer to be sure you get things right,
otherwise this will never work properly.

And shouldn't the character device be a class device?  Don't confuse
devices in the driver model with the interaction of them to userspace in
a specific manner, those should be separate things, right?


> +	int			nr;
> +	char			name[PECI_NAME_SIZE];

What's wrong with the name in struct device?


> +	struct mutex		userspace_clients_lock; /* clients list mutex */
> +	struct list_head	userspace_clients;
> +	int			(*xfer)(struct peci_adapter *adapter,
> +					struct peci_xfer_msg *msg);
> +	uint			cmd_mask;

u32?

> --- /dev/null
> +++ b/include/uapi/linux/peci-ioctl.h
> @@ -0,0 +1,403 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2018-2019 Intel Corporation */
> +
> +#ifndef __PECI_IOCTL_H
> +#define __PECI_IOCTL_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/* Base Address of 48d */
> +#define PECI_BASE_ADDR  0x30  /* The PECI client's default address of 0x30 */
> +#define PECI_OFFSET_MAX 8     /* Max numver of CPU clients */
> +
> +/* PCI Access */
> +#define MAX_PCI_READ_LEN 24   /* Number of bytes of the PCI Space read */

PCI?  Or PECI?  I'm confused now, what does PCI have to do with PECI?

> +
> +#define PCI_BUS0_CPU0      0x00
> +#define PCI_BUS0_CPU1      0x80
> +#define PCI_CPUBUSNO_BUS   0x00
> +#define PCI_CPUBUSNO_DEV   0x08
> +#define PCI_CPUBUSNO_FUNC  0x02
> +#define PCI_CPUBUSNO       0xcc
> +#define PCI_CPUBUSNO_1     0xd0
> +#define PCI_CPUBUSNO_VALID 0xd4

You just abused the PCI core namespace here, are you sure about that?


> +
> +/* Package Identifier Read Parameter Value */
> +#define PKG_ID_CPU_ID               0x0000  /* CPUID Info */
> +#define PKG_ID_PLATFORM_ID          0x0001  /* Platform ID */
> +#define PKG_ID_UNCORE_ID            0x0002  /* Uncore Device ID */
> +#define PKG_ID_MAX_THREAD_ID        0x0003  /* Max Thread ID */
> +#define PKG_ID_MICROCODE_REV        0x0004  /* CPU Microcode Update Revision */
> +#define PKG_ID_MACHINE_CHECK_STATUS 0x0005  /* Machine Check Status */
> +
> +/* RdPkgConfig Index */
> +#define MBX_INDEX_CPU_ID            0   /* Package Identifier Read */
> +#define MBX_INDEX_VR_DEBUG          1   /* VR Debug */
> +#define MBX_INDEX_PKG_TEMP_READ     2   /* Package Temperature Read */
> +#define MBX_INDEX_ENERGY_COUNTER    3   /* Energy counter */
> +#define MBX_INDEX_ENERGY_STATUS     4   /* DDR Energy Status */
> +#define MBX_INDEX_WAKE_MODE_BIT     5   /* "Wake on PECI" Mode bit */
> +#define MBX_INDEX_EPI               6   /* Efficient Performance Indication */
> +#define MBX_INDEX_PKG_RAPL_PERF     8   /* Pkg RAPL Performance Status Read */
> +#define MBX_INDEX_PER_CORE_DTS_TEMP 9   /* Per Core DTS Temperature Read */
> +#define MBX_INDEX_DTS_MARGIN        10  /* DTS thermal margin */
> +#define MBX_INDEX_SKT_PWR_THRTL_DUR 11  /* Socket Power Throttled Duration */
> +#define MBX_INDEX_CFG_TDP_CONTROL   12  /* TDP Config Control */
> +#define MBX_INDEX_CFG_TDP_LEVELS    13  /* TDP Config Levels */
> +#define MBX_INDEX_DDR_DIMM_TEMP     14  /* DDR DIMM Temperature */
> +#define MBX_INDEX_CFG_ICCMAX        15  /* Configurable ICCMAX */
> +#define MBX_INDEX_TEMP_TARGET       16  /* Temperature Target Read */
> +#define MBX_INDEX_CURR_CFG_LIMIT    17  /* Current Config Limit */
> +#define MBX_INDEX_DIMM_TEMP_READ    20  /* Package Thermal Status Read */
> +#define MBX_INDEX_DRAM_IMC_TMP_READ 22  /* DRAM IMC Temperature Read */
> +#define MBX_INDEX_DDR_CH_THERM_STAT 23  /* DDR Channel Thermal Status */
> +#define MBX_INDEX_PKG_POWER_LIMIT1  26  /* Package Power Limit1 */
> +#define MBX_INDEX_PKG_POWER_LIMIT2  27  /* Package Power Limit2 */
> +#define MBX_INDEX_TDP               28  /* Thermal design power minimum */
> +#define MBX_INDEX_TDP_HIGH          29  /* Thermal design power maximum */
> +#define MBX_INDEX_TDP_UNITS         30  /* Units for power/energy registers */
> +#define MBX_INDEX_RUN_TIME          31  /* Accumulated Run Time */
> +#define MBX_INDEX_CONSTRAINED_TIME  32  /* Thermally Constrained Time Read */
> +#define MBX_INDEX_TURBO_RATIO       33  /* Turbo Activation Ratio */
> +#define MBX_INDEX_DDR_RAPL_PL1      34  /* DDR RAPL PL1 */
> +#define MBX_INDEX_DDR_PWR_INFO_HIGH 35  /* DRAM Power Info Read (high) */
> +#define MBX_INDEX_DDR_PWR_INFO_LOW  36  /* DRAM Power Info Read (low) */
> +#define MBX_INDEX_DDR_RAPL_PL2      37  /* DDR RAPL PL2 */
> +#define MBX_INDEX_DDR_RAPL_STATUS   38  /* DDR RAPL Performance Status */
> +#define MBX_INDEX_DDR_HOT_ABSOLUTE  43  /* DDR Hottest Dimm Absolute Temp */
> +#define MBX_INDEX_DDR_HOT_RELATIVE  44  /* DDR Hottest Dimm Relative Temp */
> +#define MBX_INDEX_DDR_THROTTLE_TIME 45  /* DDR Throttle Time */
> +#define MBX_INDEX_DDR_THERM_STATUS  46  /* DDR Thermal Status */
> +#define MBX_INDEX_TIME_AVG_TEMP     47  /* Package time-averaged temperature */
> +#define MBX_INDEX_TURBO_RATIO_LIMIT 49  /* Turbo Ratio Limit Read */
> +#define MBX_INDEX_HWP_AUTO_OOB      53  /* HWP Autonomous Out-of-band */
> +#define MBX_INDEX_DDR_WARM_BUDGET   55  /* DDR Warm Power Budget */
> +#define MBX_INDEX_DDR_HOT_BUDGET    56  /* DDR Hot Power Budget */
> +#define MBX_INDEX_PKG_PSYS_PWR_LIM3 57  /* Package/Psys Power Limit3 */
> +#define MBX_INDEX_PKG_PSYS_PWR_LIM1 58  /* Package/Psys Power Limit1 */
> +#define MBX_INDEX_PKG_PSYS_PWR_LIM2 59  /* Package/Psys Power Limit2 */
> +#define MBX_INDEX_PKG_PSYS_PWR_LIM4 60  /* Package/Psys Power Limit4 */
> +#define MBX_INDEX_PERF_LIMIT_REASON 65  /* Performance Limit Reasons */
> +
> +/* WrPkgConfig Index */
> +#define MBX_INDEX_DIMM_AMBIENT      19
> +#define MBX_INDEX_DIMM_TEMP         24
> +
> +/* Device Specific Completion Code (CC) Definition */
> +#define DEV_PECI_CC_SUCCESS          0x40
> +#define DEV_PECI_CC_TIMEOUT          0x80
> +#define DEV_PECI_CC_OUT_OF_RESOURCE  0x81
> +#define DEV_PECI_CC_UNAVAIL_RESOURCE 0x82
> +#define DEV_PECI_CC_INVALID_REQ      0x90
> +
> +/* Completion Code mask to check retry needs */
> +#define DEV_PECI_CC_RETRY_CHECK_MASK 0xf0
> +#define DEV_PECI_CC_NEED_RETRY       0x80
> +
> +/* Skylake EDS says to retry for 250ms */
> +#define DEV_PECI_RETRY_TIME_MS       250
> +#define DEV_PECI_RETRY_INTERVAL_USEC 10000
> +#define DEV_PECI_RETRY_BIT           0x01
> +
> +#define GET_TEMP_WR_LEN   1
> +#define GET_TEMP_RD_LEN   2
> +#define GET_TEMP_PECI_CMD 0x01
> +
> +#define GET_DIB_WR_LEN   1
> +#define GET_DIB_RD_LEN   8
> +#define GET_DIB_PECI_CMD 0xf7
> +
> +#define RDPKGCFG_WRITE_LEN     5
> +#define RDPKGCFG_READ_LEN_BASE 1
> +#define RDPKGCFG_PECI_CMD      0xa1
> +
> +#define WRPKGCFG_WRITE_LEN_BASE 6
> +#define WRPKGCFG_READ_LEN       1
> +#define WRPKGCFG_PECI_CMD       0xa5
> +
> +#define RDIAMSR_WRITE_LEN 5
> +#define RDIAMSR_READ_LEN  9
> +#define RDIAMSR_PECI_CMD  0xb1
> +
> +#define WRIAMSR_PECI_CMD  0xb5
> +
> +#define RDPCICFG_WRITE_LEN 6
> +#define RDPCICFG_READ_LEN  5
> +#define RDPCICFG_PECI_CMD  0x61
> +
> +#define WRPCICFG_PECI_CMD  0x65
> +
> +#define RDPCICFGLOCAL_WRITE_LEN     5
> +#define RDPCICFGLOCAL_READ_LEN_BASE 1
> +#define RDPCICFGLOCAL_PECI_CMD      0xe1
> +
> +#define WRPCICFGLOCAL_WRITE_LEN_BASE 6
> +#define WRPCICFGLOCAL_READ_LEN       1
> +#define WRPCICFGLOCAL_PECI_CMD       0xe5

Alignment?

> +
> +#define PECI_BUFFER_SIZE 32

Why don't all of these have PECI_ at the front of them?

> +/**
> + * enum peci_cmd - PECI client commands
> + * @PECI_CMD_XFER: raw PECI transfer
> + * @PECI_CMD_PING: ping, a required message for all PECI devices
> + * @PECI_CMD_GET_DIB: get DIB (Device Info Byte)
> + * @PECI_CMD_GET_TEMP: get maximum die temperature
> + * @PECI_CMD_RD_PKG_CFG: read access to the PCS (Package Configuration Space)
> + * @PECI_CMD_WR_PKG_CFG: write access to the PCS (Package Configuration Space)
> + * @PECI_CMD_RD_IA_MSR: read access to MSRs (Model Specific Registers)
> + * @PECI_CMD_WR_IA_MSR: write access to MSRs (Model Specific Registers)
> + * @PECI_CMD_RD_PCI_CFG: sideband read access to the PCI configuration space
> + *	maintained in downstream devices external to the processor
> + * @PECI_CMD_WR_PCI_CFG: sideband write access to the PCI configuration space
> + *	maintained in downstream devices external to the processor
> + * @PECI_CMD_RD_PCI_CFG_LOCAL: sideband read access to the PCI configuration
> + *	space that resides within the processor
> + * @PECI_CMD_WR_PCI_CFG_LOCAL: sideband write access to the PCI configuration
> + *	space that resides within the processor
> + *
> + * Available commands depend on client's PECI revision.
> + */
> +enum peci_cmd {
> +	PECI_CMD_XFER = 0,
> +	PECI_CMD_PING,
> +	PECI_CMD_GET_DIB,
> +	PECI_CMD_GET_TEMP,
> +	PECI_CMD_RD_PKG_CFG,
> +	PECI_CMD_WR_PKG_CFG,
> +	PECI_CMD_RD_IA_MSR,
> +	PECI_CMD_WR_IA_MSR,
> +	PECI_CMD_RD_PCI_CFG,
> +	PECI_CMD_WR_PCI_CFG,
> +	PECI_CMD_RD_PCI_CFG_LOCAL,
> +	PECI_CMD_WR_PCI_CFG_LOCAL,
> +	PECI_CMD_MAX
> +};
> +
> +/**
> + * struct peci_xfer_msg - raw PECI transfer command
> + * @addr; address of the client
> + * @tx_len: number of data to be written in bytes
> + * @rx_len: number of data to be read in bytes
> + * @tx_buf: data to be written, or NULL
> + * @rx_buf: data to be read, or NULL
> + *
> + * raw PECI transfer
> + */
> +struct peci_xfer_msg {
> +	__u8 addr;
> +	__u8 tx_len;
> +	__u8 rx_len;
> +	__u8 tx_buf[PECI_BUFFER_SIZE];
> +	__u8 rx_buf[PECI_BUFFER_SIZE];
> +} __attribute__((__packed__));

Go kick the hardware engineer who did not align things on a 32bit
boundry.  They should have known better :(

> +
> +/**
> + * struct peci_ping_msg - ping command
> + * @addr: address of the client
> + *
> + * Ping() is a required message for all PECI devices. This message is used to
> + * enumerate devices or determine if a device has been removed, been
> + * powered-off, etc.
> + */
> +struct peci_ping_msg {
> +	__u8 addr;
> +} __attribute__((__packed__));
> +
> +/**
> + * struct peci_get_dib_msg - GetDIB command
> + * @addr: address of the client
> + * @dib: DIB data to be read
> + *
> + * The processor PECI client implementation of GetDIB() includes an 8-byte
> + * response and provides information regarding client revision number and the
> + * number of supported domains. All processor PECI clients support the GetDIB()
> + * command.
> + */
> +struct peci_get_dib_msg {
> +	__u8  addr;
> +	__u64 dib;
> +} __attribute__((__packed__));

Ick, really?  That's horrible, again, go kick them hard!

> +/**
> + * struct peci_get_temp_msg - GetTemp command
> + * @addr: address of the client
> + * @temp_raw: raw temperature data to be read
> + *
> + * The GetTemp() command is used to retrieve the maximum die temperature from a
> + * target PECI address. The temperature is used by the external thermal
> + * management system to regulate the temperature on the die. The data is
> + * returned as a negative value representing the number of degrees centigrade
> + * below the maximum processor junction temperature.
> + */
> +struct peci_get_temp_msg {
> +	__u8  addr;
> +	__s16 temp_raw;
> +} __attribute__((__packed__));

{kick kick kick}

> +
> +/**
> + * struct peci_rd_pkg_cfg_msg - RdPkgConfig command
> + * @addr: address of the client
> + * @index: encoding index for the requested service
> + * @param: specific data being requested
> + * @rx_len: number of data to be read in bytes
> + * @pkg_config: package config data to be read
> + *
> + * The RdPkgConfig() command provides read access to the Package Configuration
> + * Space (PCS) within the processor, including various power and thermal
> + * management functions. Typical PCS read services supported by the processor
> + * may include access to temperature data, energy status, run time information,
> + * DIMM temperatures and so on.
> + */
> +struct peci_rd_pkg_cfg_msg {
> +	__u8  addr;
> +	__u8  index;
> +	__u16 param;
> +	__u8  rx_len;
> +	__u8  pkg_config[4];
> +} __attribute__((__packed__));

Ok, that's better, someone finally wisened up.

> +
> +/**
> + * struct peci_wr_pkg_cfg_msg - WrPkgConfig command
> + * @addr: address of the client
> + * @index: encoding index for the requested service
> + * @param: specific data being requested
> + * @tx_len: number of data to be written in bytes
> + * @value: package config data to be written
> + *
> + * The WrPkgConfig() command provides write access to the Package Configuration
> + * Space (PCS) within the processor, including various power and thermal
> + * management functions. Typical PCS write services supported by the processor
> + * may include power limiting, thermal averaging constant programming and so on.
> + */
> +struct peci_wr_pkg_cfg_msg {
> +	__u8  addr;
> +	__u8  index;
> +	__u16 param;
> +	__u8  tx_len;
> +	__u32 value;
> +} __attribute__((__packed__));

No they didn't, ick, no one cares about speed here I guess.  Oh well :(

> +
> +/**
> + * struct peci_rd_ia_msr_msg - RdIAMSR command
> + * @addr: address of the client
> + * @thread_id: ID of the specific logical processor
> + * @address: address of MSR to read from
> + * @value: data to be read
> + *
> + * The RdIAMSR() PECI command provides read access to Model Specific Registers
> + * (MSRs) defined in the processor's Intel Architecture (IA).
> + */
> +struct peci_rd_ia_msr_msg {
> +	__u8  addr;
> +	__u8  thread_id;
> +	__u16 address;
> +	__u64 value;
> +} __attribute__((__packed__));

They got lucky!

oh well,

greg k-h
