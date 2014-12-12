From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v4 5/6] staging: fpga manager: framework core
Date: Fri, 12 Dec 2014 11:14:39 -0600
Message-ID: <alpine.DEB.2.02.1412121026480.27443@linuxheads99>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com> <1418156090-23578-6-git-send-email-atull@opensource.altera.com> <049ad99df824432caa190566141d1525@BN1BFFO11FD005.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <049ad99df824432caa190566141d1525@BN1BFFO11FD005.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yva
List-Id: devicetree@vger.kernel.org

On Wed, 10 Dec 2014, Michal Simek wrote:

Hi Michal,

Thanks for the review comments.  I have incorporated most of them.
A few questions below.

> > --- /dev/null
> > +++ b/drivers/staging/fpga/Kconfig
> > @@ -0,0 +1,21 @@
> > +#
> > +# FPGA framework configuration
> > +#
> > +
> > +menu "FPGA devices"
> > +
> > +config FPGA
> > +	tristate "FPGA Framework"
> > +	help
> > +	  Say Y here if you want support for configuring FPGAs from the
> > +	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
> > +	  manager drivers.
> > +
> 
> I would add here
> if FPGA
> 

OK

> 
> > +config FPGA_MGR_SYSFS
> > +	bool "FPGA Manager SysFS Interface"
> > +	depends on FPGA
> 
> remove this line.

Good

> 
> > +	depends on SYSFS
> > +	help
> > +	  FPGA Manager SysFS interface.
> > +
> 
> maybe this is not needed at, i2c has no this dependency too and compilation
> looks good too.
> 

Seems like we are dependent on sysfs, so I need 'depends on SYSFS', right?
Also, I want to be able to disable the sysfs interface (more below on that).

> 
> endif here

OK

> 
> The reason is that all "low level" drivers will depend on FPGA that's why with this
> we don't need to add depends on FPGA to every entry.
> 
> > +endmenu
> > diff --git a/drivers/staging/fpga/Makefile b/drivers/staging/fpga/Makefile
> > new file mode 100644
> > index 0000000..c8a676f
> > --- /dev/null
> > +++ b/drivers/staging/fpga/Makefile
> > @@ -0,0 +1,10 @@
> > +#
> > +# Makefile for the fpga framework and fpga manager drivers.
> > +#
> > +
> > +fpga-mgr-core-y += fpga-mgr.o
> > +
> > +# Core FPGA Manager Framework
> > +obj-$(CONFIG_FPGA)			+= fpga-mgr-core.o
> 
> Just
> obj-$(CONFIG_FPGA)			+= fpga-mgr.o
> should be enough here.

Yes

> 
> > +
> > +# FPGA Manager Drivers
> > diff --git a/drivers/staging/fpga/fpga-mgr.c b/drivers/staging/fpga/fpga-mgr.c
> > new file mode 100644
> > index 0000000..d08cb82
> > --- /dev/null
> > +++ b/drivers/staging/fpga/fpga-mgr.c
> > @@ -0,0 +1,485 @@
> > +/*
> > + * FPGA Manager Core
> > + *
> > + *  Copyright (C) 2013-2014 Altera Corporation
> > + *
> > + * With code from the mailing list:
> > + * Copyright (C) 2013 Xilinx, Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> 
> Greg, Grant: What about to use just SPDX?
> 
> SPDX-License-Identifier:     GPL-2.0
> 

This is a standared GPLv2 header, we're keeping it.  Our legal dept wants it.

> > +#include <linux/delay.h>
> > +#include <linux/firmware.h>
> > +#include <linux/fpga-mgr.h>
> 
> I think it will be worth to add this to linux/fpga/ folder.
> 

OK

> > +#include <linux/fs.h>
> > +#include <linux/idr.h>
> > +#include <linux/interrupt.h>
> 
> Already added by fpga-mgr.h
> 
> > +#include <linux/kernel.h>
> 
> linux/delay.h is adding this header already.

I'm cleaning up the includes in v5.

> > +/*
> > + * Get FPGA state from low level driver
> > + * return value is same enum as fpga_mgr_framework_state
> 
> This is enum fpga_mgr_states based on fpga-mgr.h
> 
> > + *
> > + * This will be used to initialize framework state
> > + */
> 
> We have an opportunity to have this in kernel-doc format.
> Description is pretty similar to kernel doc anyway.

I'll change the core (fpga-mgr.c and fpga-mgr.h) to use kernel-doc.
I'll leave it out of the altera.c part though.

> 
> > +int fpga_mgr_low_level_state(struct fpga_manager *mgr)
> 
> static enum fpga_mgr_states here

OK, there are several places where I've changed to use the enum.

> > +#if IS_ENABLED(CONFIG_FPGA_MGR_SYSFS)
> 
> This shouldn't be needed.

>From the way the discussion has gone about this, there is a desire for
different interfaces for this. I want it to be possible to disable this sysfs
interface if I'm just using the exported functions or some other future
interface.  Part of my main point here is to export enough functionality in
the core functions to make it possible to build other interfaces that people
want to support different use cases or use models.   Since we are going to be
in staging, that is a good place to be doing this.

> 
> > +const char *state_str[] = {
> 
> static const ...

Yes, well actually 'static const *const state_str[]...'

> 
> > +	[FPGA_MGR_STATE_UNKNOWN] =		"unknown",
> > +	[FPGA_MGR_STATE_POWER_OFF] =		"power_off",
> > +	[FPGA_MGR_STATE_POWER_UP] =		"power_up",
> > +	[FPGA_MGR_STATE_RESET] =		"reset",
> > +
> > +	/* write sequence */
> > +	[FPGA_MGR_STATE_FIRMWARE_REQ] =		"firmware_request",
> > +	[FPGA_MGR_STATE_FIRMWARE_REQ_ERR] =	"firmware_request_err",
> > +	[FPGA_MGR_STATE_WRITE_INIT] =		"write_init",
> > +	[FPGA_MGR_STATE_WRITE_INIT_ERR] =	"write_init_err",
> > +	[FPGA_MGR_STATE_WRITE] =		"write",
> > +	[FPGA_MGR_STATE_WRITE_ERR] =		"write_err",
> > +	[FPGA_MGR_STATE_WRITE_COMPLETE] =	"write_complete",
> > +	[FPGA_MGR_STATE_WRITE_COMPLETE_ERR] =	"write_complete_err",
> > +
> > +	[FPGA_MGR_STATE_OPERATING] =		"operating",
> > +};
> > +
> > +/*
> > + * class attributes
> > + */
> > +static ssize_t fpga_mgr_name_show(struct device *dev,
> > +				  struct device_attribute *attr, char *buf)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +
> > +	return fpga_mgr_name(mgr, buf);
> > +}
> > +

> > +static DEVICE_ATTR(name, S_IRUGO, fpga_mgr_name_show, NULL);
> 
> DEVICE_ATTR_RO - name change.
> 
> > +static DEVICE_ATTR(state, S_IRUGO, fpga_mgr_state_show, NULL);
> 
> DEVICE_ATTR_RO
> 
> > +static DEVICE_ATTR(firmware, S_IRUGO | S_IWUSR,
> > +		   fpga_mgr_firmware_show, fpga_mgr_firmware_store);
> 
> DEVICE_ATTR_RW
> 
> > +static DEVICE_ATTR(reset, S_IWUSR, NULL, fpga_mgr_reset_store);
> 
> DEVICE_ATTR_WO

Good, thanks.

> 
> > +
> > +static struct attribute *fpga_mgr_attrs[] = {
> > +	&dev_attr_name.attr,
> > +	&dev_attr_state.attr,
> > +	&dev_attr_firmware.attr,
> > +	&dev_attr_reset.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group fpga_mgr_group = {
> > +	.attrs = fpga_mgr_attrs,
> > +};
> > +
> > +const struct attribute_group *fpga_mgr_groups[] = {
> > +	&fpga_mgr_group,
> > +	NULL,
> > +};
> > +#else
> > +#define fpga_mgr_groups NULL
> > +#endif /* CONFIG_FPGA_MGR_SYSFS */
> 
> ATTRIBUTE_GROUPS(fpga_mgr)

Yes

> 
> > +
> > +static int fpga_mgr_suspend(struct device *dev)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +
> > +	if (!mgr)
> > +		return -ENODEV;
> > +
> > +	if (mgr->mops->suspend)
> > +		return mgr->mops->suspend(mgr);
> > +
> > +	return 0;
> > +}
> > +
> > +static int fpga_mgr_resume(struct device *dev)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +	int ret = 0;
> > +
> > +	if (!mgr)
> > +		return -ENODEV;
> > +
> > +	if (mgr->mops->resume) {
> > +		ret = mgr->mops->resume(mgr);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (strlen(mgr->image_name) != 0)
> > +		fpga_mgr_firmware_write(mgr, mgr->image_name);
> > +
> > +	return 0;
> > +}
> > +
> > +const struct dev_pm_ops fpga_mgr_dev_pm_ops = {
> 
> static

Yes

> 
> > +	.suspend	= fpga_mgr_suspend,
> > +	.resume		= fpga_mgr_resume,
> > +};
> > +
> > +static void fpga_mgr_dev_release(struct device *dev)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +
> > +	dev_dbg(dev, "releasing '%s'\n", dev_name(dev));
> > +	kfree(mgr);
> > +}
> > +
> > +int fpga_mgr_register(struct device *dev, const char *name,
> > +		      struct fpga_manager_ops *mops,
> > +		      void *priv)
> > +{
> > +	struct fpga_manager *mgr;
> > +	int id, ret;
> > +
> > +	BUG_ON(!mops || !name || !strlen(name));
> 
> Isn't this pretty strong? Any reasonable reaction will be better.

You are right.  Changing it to return an error.

> 
> > +
> > +	id = ida_simple_get(&fpga_mgr_ida, 0, 0, GFP_KERNEL);
> > +	if (id < 0)
> > +		return id;
> > +
> > +	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> > +	if (!mgr)
> > +		return -ENOMEM;
> 
> here is missing error path handling because you got id.
> It should be moved before ida_simple_get call
> 

OK

> > +
> > +void fpga_mgr_remove(struct device *dev)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +	int id;
> > +
> > +	if (mgr)
> > +		id = mgr->dev.id;
> 
> Why is here the checking? What cases this can cover if mrg
> is not there?
> 

Not needed.  Removing it.

> > +
> > +	device_unregister(dev);
> > +
> > +	if (mgr) {
> > +		if (mgr->mops->fpga_remove)
> > +			mgr->mops->fpga_remove(mgr);
> > +
> > +		mutex_lock(&fpga_mgr_mutex);
> > +		list_del(&mgr->list);
> > +		mutex_unlock(&fpga_mgr_mutex);
> > +		kfree(mgr);
> > +		ida_simple_remove(&fpga_mgr_ida, id);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(fpga_mgr_remove);
> > +

> > +++ b/include/linux/fpga-mgr.h
> > @@ -0,0 +1,104 @@
> > +/*
> > + * FPGA Framework
> > + *
> > + *  Copyright (C) 2013-2014 Altera Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +#include <linux/device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/limits.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#ifndef _LINUX_FPGA_MGR_H
> > +#define _LINUX_FPGA_MGR_H
> > +
> > +struct fpga_manager;
> > +
> > +/*
> > + * fpga_manager_ops are the low level functions implemented by a specific
> > + * fpga manager driver.  Leaving any of these out that aren't needed is fine
> > + * as they are all tested for NULL before being called.
> > + */
> > +struct fpga_manager_ops {
> > +	/* Returns an enum value of the FPGA's state */
> > +	int (*state)(struct fpga_manager *mgr);
> 
> here return should be enum not int.
> 

Yes

> > +
> > +	/* Put FPGA into reset state */
> > +	int (*reset)(struct fpga_manager *mgr);
> > +
> > +	/* Prepare the FPGA to receive confuration data */
> > +	int (*write_init)(struct fpga_manager *mgr);
> > +
> > +	/* Write count bytes of configuration data to the FPGA */
> > +	int (*write)(struct fpga_manager *mgr, const char *buf, size_t count);
> > +
> > +	/* Return FPGA to default state after writing is done */
> > +	int (*write_complete)(struct fpga_manager *mgr);
> > +
> 
> Here are missing read options which were in any previous series.
> But they can be added in the following patch.

Yes, they can be added later.

> 
> > +	/* Optional: Set FPGA into a specific state during driver remove */
> > +	void (*fpga_remove)(struct fpga_manager *mgr);
> > +
> > +	int (*suspend)(struct fpga_manager *mgr);
> > +
> > +	int (*resume)(struct fpga_manager *mgr);
> > +};
> > +
> > +/* Valid states may vary by manufacturer; superset is: */
> > +enum fpga_mgr_states {
> > +	FPGA_MGR_STATE_UNKNOWN,		/* can't determine state */
> > +	FPGA_MGR_STATE_POWER_OFF,	/* FPGA power is off */
> > +	FPGA_MGR_STATE_POWER_UP,	/* FPGA reports power is up */
> > +	FPGA_MGR_STATE_RESET,		/* FPGA held in reset state */
> > +
> > +	/* write sequence */
> > +	FPGA_MGR_STATE_FIRMWARE_REQ,	/* firmware request in progress */
> > +	FPGA_MGR_STATE_FIRMWARE_REQ_ERR, /* firmware request failed */
> > +	FPGA_MGR_STATE_WRITE_INIT,	/* preparing FPGA for programming */
> > +	FPGA_MGR_STATE_WRITE_INIT_ERR,	/* Error during write_init stage */
> > +	FPGA_MGR_STATE_WRITE,		/* FPGA ready to receive image data */
> > +	FPGA_MGR_STATE_WRITE_ERR,	/* Error while programming FPGA */
> > +	FPGA_MGR_STATE_WRITE_COMPLETE,	/* Doing post programming steps */
> > +	FPGA_MGR_STATE_WRITE_COMPLETE_ERR, /* Error during write_complete */
> > +
> > +	FPGA_MGR_STATE_OPERATING,	/* FPGA is programmed and operating */
> > +};
> > +
> 
> kernel-doc here will be good.

OK

> 
> > +struct fpga_manager {
> > +	const char *name;
> > +	struct device dev;
> > +	struct list_head list;
> > +	struct mutex lock;
> > +	enum fpga_mgr_states state;
> > +	char image_name[NAME_MAX];
> > +
> > +	struct fpga_manager_ops *mops;
> > +	void *priv;
> > +};
> > +
> > +#define to_fpga_manager(d) container_of(d, struct fpga_manager, dev)
> > +
> > +#if IS_ENABLED(CONFIG_FPGA)
> 
> you can simple remove this if.

Cool.

Alan

