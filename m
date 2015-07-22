From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v9 5/7] staging: fpga manager core
Date: Wed, 22 Jul 2015 14:47:24 -0700
Message-ID: <CAAtXAHdyt+18+xNckxZtm0hYNwwMborFJUE-QR+JmWqzy=8cmw@mail.gmail.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
	<1437148277-5405-6-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1437148277-5405-6-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, Nicolas Pitre <nico@linaro.org>, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, Philip Balister <philip@balister.org>, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, yvanderv@opensource.altera.coml
List-Id: devicetree@vger.kernel.org

Hi Alan,

a couple of small things I found while reworking the Zynq version to
match the v9 patchset:

On Fri, Jul 17, 2015 at 8:51 AM,  <atull@opensource.altera.com> wrote:
> From: Alan Tull <atull@opensource.altera.com>
>
> API to support programming FPGA.
>
> The following functions are exported as GPL:
> * fpga_mgr_buf_load
>    Load fpga from image in buffer
>
> * fpga_mgr_firmware_load
>    Request firmware and load it to the FPGA.
>
> * fpga_mgr_register
> * fpga_mgr_unregister
>    FPGA device drivers can be added by calling
>    fpga_mgr_register() to register a set of
>    fpga_manager_ops to do device specific stuff.
>
> * of_fpga_mgr_get
> * fpga_mgr_put
>    Get/put a reference to a fpga manager.
>
> The following sysfs files are created:
> * /sys/class/fpga_manager/<fpga>/name
>   Name of low level driver.
>
> * /sys/class/fpga_manager/<fpga>/state
>   State of fpga manager
>
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> v2: s/mangager/manager/
>     check for invalid request_nr
>     add fpga reset interface
>     rework the state code
>     remove FPGA_MGR_FAIL flag
>     add _ERR states to fpga manager states enum
>     low level state op now returns a state enum value
>     initialize framework state from driver state op
>     remove unused fpga read stuff
>     merge sysfs.c into fpga-mgr.c
>     move suspend/resume from bus.c to fpga-mgr.c
>
> v3: Add struct device to fpga_manager (not as a pointer)
>     Add to_fpga_manager
>     Don't get irq in fpga-mgr.c (let low level driver do it)
>     remove from struct fpga_manager: nr, np, parent
>     get rid of fpga_mgr_get_new_minor()
>     simplify fpga_manager_register:
>       reorder parameters
>       use dev instead of pdev
>     get rid of code that used to make more sense when this
>       was a char driver, don't alloc_chrdev_region
>     use a mutex instead of flags
>
> v4: Move to drivers/staging
>
> v5: Make some things be static
>     Kconfig: add 'if FPGA'
>     Makefile: s/fpga-mgr-core.o/fpga-mgr.o/
>     clean up includes
>     use enum fpga_mgr_states instead of int
>     static const char *state_str
>     use DEVICE_ATTR_RO/RW/WO and ATTRIBUTE_GROUPS
>     return -EINVAL instead of BUG_ON
>     move ida_simple_get after kzalloc
>     clean up fpga_mgr_remove
>     fpga-mgr.h: remove '#if IS_ENABLED(CONFIG_FPGA)'
>     add kernel-doc documentation
>     Move header to new include/linux/fpga folder
>     static const struct fpga_mgr_ops
>     dev_info msg simplified
>
> v6: no statically allocated string for image_name
>     kernel doc fixes
>     changes regarding enabling SYSFS for fpga mgr
>     Makefile cleanup
>
> v7: no change in this patch for v7 of the patchset
>
> v8: no change in this patch for v8 of the patchset
>
> v9: remove writable attributes 'firmware' and 'reset'
>     remove suspend/resume support for now
>     remove list of fpga managers; use class device iterators instead
>     simplify locking by giving out only one ref exclusively
>     add device tree support
>     add flags
>     par down API into fewer functions
>     update copyright year
>     rename some functions for clarity
>     clean up unnecessary #includes
>     add some error messages
>     write_init may need to look at buffer header, so add to params
> ---
>  drivers/staging/Kconfig         |    2 +
>  drivers/staging/Makefile        |    1 +
>  drivers/staging/fpga/Kconfig    |   14 ++
>  drivers/staging/fpga/Makefile   |    8 +
>  drivers/staging/fpga/fpga-mgr.c |  373 +++++++++++++++++++++++++++++++++++++++
>  include/linux/fpga/fpga-mgr.h   |  127 +++++++++++++
>  6 files changed, 525 insertions(+)
>  create mode 100644 drivers/staging/fpga/Kconfig
>  create mode 100644 drivers/staging/fpga/Makefile
>  create mode 100644 drivers/staging/fpga/fpga-mgr.c
>  create mode 100644 include/linux/fpga/fpga-mgr.h
>
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index 7f6cae5..89c089c 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -112,4 +112,6 @@ source "drivers/staging/fsl-mc/Kconfig"
>
>  source "drivers/staging/wilc1000/Kconfig"
>
> +source "drivers/staging/fpga/Kconfig"
> +
>  endif # STAGING
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index 347f647..e129940 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -48,3 +48,4 @@ obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD) += clocking-wizard/
>  obj-$(CONFIG_FB_TFT)           += fbtft/
>  obj-$(CONFIG_FSL_MC_BUS)       += fsl-mc/
>  obj-$(CONFIG_WILC1000)         += wilc1000/
> +obj-$(CONFIG_FPGA)             += fpga/
> diff --git a/drivers/staging/fpga/Kconfig b/drivers/staging/fpga/Kconfig
> new file mode 100644
> index 0000000..8254ca0
> --- /dev/null
> +++ b/drivers/staging/fpga/Kconfig
> @@ -0,0 +1,14 @@
> +#
> +# FPGA framework configuration
> +#
> +
> +menu "FPGA Configuration Support"
> +
> +config FPGA
> +       bool "FPGA Configuration Framework"
> +       help
> +         Say Y here if you want support for configuring FPGAs from the
> +         kernel.  The FPGA framework adds a FPGA manager class and FPGA
> +         manager drivers.
> +
> +endmenu
> diff --git a/drivers/staging/fpga/Makefile b/drivers/staging/fpga/Makefile
> new file mode 100644
> index 0000000..3313c52
> --- /dev/null
> +++ b/drivers/staging/fpga/Makefile
> @@ -0,0 +1,8 @@
> +#
> +# Makefile for the fpga framework and fpga manager drivers.
> +#
> +
> +# Core FPGA Manager Framework
> +obj-$(CONFIG_FPGA)                     += fpga-mgr.o
> +
> +# FPGA Manager Drivers
> diff --git a/drivers/staging/fpga/fpga-mgr.c b/drivers/staging/fpga/fpga-mgr.c
> new file mode 100644
> index 0000000..1363f8f
> --- /dev/null
> +++ b/drivers/staging/fpga/fpga-mgr.c
> @@ -0,0 +1,373 @@
> +/*
> + * FPGA Manager Core
> + *
> + *  Copyright (C) 2013-2015 Altera Corporation
> + *
> + * With code from the mailing list:
> + * Copyright (C) 2013 Xilinx, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/firmware.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/idr.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +
> +static DEFINE_IDA(fpga_mgr_ida);
> +static struct class *fpga_mgr_class;
> +
> +/**
> + * fpga_mgr_buf_load - load fpga from image in buffer
> + * @mgr:       fpga manager
> + * @flags:     flags setting fpga confuration modes
> + * @buf:       buffer contain fpga image
> + * @count:     byte count of buf
> + *
> + * Step the low level fpga manager through the device-specific steps of getting
> + * an FPGA ready to be configured, writing the image to it, then doing whatever
> + * post-configuration steps necessary.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags, const char *buf,
> +                     size_t count)
> +{
> +       struct device *dev = &mgr->dev;
> +       int ret;
> +
> +       if (!mgr)
> +               return -ENODEV;
> +
> +       /*
> +        * Call the low level driver's write_init function.  This will do the
> +        * device-specific things to get the FPGA into the state where it is
> +        * ready to receive an FPGA image.
> +        */
> +       mgr->state = FPGA_MGR_STATE_WRITE_INIT;
> +       ret = mgr->mops->write_init(mgr, flags, buf, count);
> +       if (ret) {
> +               dev_err(dev, "Error preparing FPGA for writing\n");
> +               mgr->state = FPGA_MGR_STATE_WRITE_INIT_ERR;
> +               return ret;
> +       }
> +
> +       /*
> +        * Write the FPGA image to the FPGA.
> +        */
> +       mgr->state = FPGA_MGR_STATE_WRITE;
> +       ret = mgr->mops->write(mgr, buf, count);
> +       if (ret) {
> +               dev_err(dev, "Error while writing image data to FPGA\n");
> +               mgr->state = FPGA_MGR_STATE_WRITE_ERR;
> +               return ret;
> +       }
> +
> +       /*
> +        * After all the FPGA image has been written, do the device specific
> +        * steps to finish and set the FPGA into operating mode.
> +        */
> +       mgr->state = FPGA_MGR_STATE_WRITE_COMPLETE;
> +       ret = mgr->mops->write_complete(mgr);

Could we pass in flags here? This way the driver wouldn't have to keep
track of the flags. For my case it would simplify the partial reconfig
case.
> +       if (ret) {
> +               dev_err(dev, "Error after writing image data to FPGA\n");
> +               mgr->state = FPGA_MGR_STATE_WRITE_COMPLETE_ERR;
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_buf_load);
> +
> +/**
> + * fpga_mgr_firmware_load - request firmware and load to fpga
> + * @mgr:       fpga manager
> + * @flags:     flags setting fpga confuration modes
> + * @image_name:        name of image file on the firmware search path
> + *
> + * Request an FPGA image using the firmware class, then write out to the FPGA.
> + * Update the state before each step to provide info on what step failed if
> + * there is a failure.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> +                          const char *image_name)
> +{
> +       struct device *dev = &mgr->dev;
> +       const struct firmware *fw;
> +       int ret;
> +
> +       if (!mgr)
> +               return -ENODEV;
> +
> +       dev_info(dev, "writing %s to %s\n", image_name, mgr->name);
> +
> +       mgr->state = FPGA_MGR_STATE_FIRMWARE_REQ;
> +
> +       ret = request_firmware(&fw, image_name, dev);
> +       if (ret) {
> +               mgr->state = FPGA_MGR_STATE_FIRMWARE_REQ_ERR;
> +               dev_err(dev, "Error requesting firmware %s\n", image_name);
> +               return ret;
> +       }
> +
> +       ret = fpga_mgr_buf_load(mgr, flags, fw->data, fw->size);
> +       if (ret)
> +               return ret;
> +
> +       release_firmware(fw);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_firmware_load);
> +
> +static const char * const state_str[] = {
> +       [FPGA_MGR_STATE_UNKNOWN] =              "unknown",
> +       [FPGA_MGR_STATE_POWER_OFF] =            "power off",
> +       [FPGA_MGR_STATE_POWER_UP] =             "power up",
> +       [FPGA_MGR_STATE_RESET] =                "reset",
> +
> +       /* requesting FPGA image from firmware */
> +       [FPGA_MGR_STATE_FIRMWARE_REQ] =         "firmware request",
> +       [FPGA_MGR_STATE_FIRMWARE_REQ_ERR] =     "firmware request error",
> +
> +       /* Preparing FPGA to receive image */
> +       [FPGA_MGR_STATE_WRITE_INIT] =           "write init",
> +       [FPGA_MGR_STATE_WRITE_INIT_ERR] =       "write init error",
> +
> +       /* Writing image to FPGA */
> +       [FPGA_MGR_STATE_WRITE] =                "write",
> +       [FPGA_MGR_STATE_WRITE_ERR] =            "write error",
> +
> +       /* Finishing configuration after image has been written */
> +       [FPGA_MGR_STATE_WRITE_COMPLETE] =       "write complete",
> +       [FPGA_MGR_STATE_WRITE_COMPLETE_ERR] =   "write complete error",
> +
> +       /* FPGA reports to be in normal operating mode */
> +       [FPGA_MGR_STATE_OPERATING] =            "operating",
> +};
> +
> +static ssize_t name_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
> +{
> +       struct fpga_manager *mgr = to_fpga_manager(dev);
> +
> +       return sprintf(buf, "%s\n", mgr->name);
> +}
> +
> +static ssize_t state_show(struct device *dev,
> +                         struct device_attribute *attr, char *buf)
> +{
> +       struct fpga_manager *mgr = to_fpga_manager(dev);
> +
> +       return sprintf(buf, "%s\n", state_str[mgr->state]);
> +}
> +
> +static DEVICE_ATTR_RO(name);
> +static DEVICE_ATTR_RO(state);
> +
> +static struct attribute *fpga_mgr_attrs[] = {
> +       &dev_attr_name.attr,
> +       &dev_attr_state.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(fpga_mgr);
> +
> +static int fpga_mgr_of_node_match(struct device *dev, const void *data)
> +{
> +       return dev->of_node == data;
> +}
> +
> +/**
> + * of_fpga_mgr_get - get an exclusive reference to a fpga mgr
> + * @node:      device node
> + *
> + * Given a device node, get an exclusive reference to a fpga mgr.
> + *
> + * Return: fpga manager struct or IS_ERR() condition containing error code.
> + */
> +struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
> +{
> +       struct fpga_manager *mgr;
> +       struct device *dev;
> +
> +       if (!node)
> +               return ERR_PTR(-EINVAL);
> +
> +       dev = class_find_device(fpga_mgr_class, NULL, node,
> +                               fpga_mgr_of_node_match);
> +       if (!dev)
> +               return ERR_PTR(-ENODEV);
> +
> +       mgr = to_fpga_manager(dev);
> +       put_device(dev);
> +       if (!mgr)
> +               return ERR_PTR(-ENODEV);
> +
> +       if (!mutex_trylock(&mgr->ref_mutex))
> +               return ERR_PTR(-EBUSY);
> +
> +       return mgr;
> +}
> +EXPORT_SYMBOL_GPL(of_fpga_mgr_get);
> +
> +/**
> + * fpga_mgr_put - release a reference to a fpga manager
> + * @mgr:       fpga manager structure
> + */
> +void fpga_mgr_put(struct fpga_manager *mgr)
> +{
> +       if (mgr)
> +               mutex_unlock(&mgr->ref_mutex);
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_put);
> +
> +/**
> + * fpga_mgr_register - register a low level fpga manager driver
> + * @dev:       fpga manager device from pdev
> + * @name:      fpga manager name
> + * @mops:      pointer to structure of fpga manager ops
> + * @priv:      fpga manager private data
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int fpga_mgr_register(struct device *dev, const char *name,
> +                     const struct fpga_manager_ops *mops,
> +                     void *priv)
> +{
> +       struct fpga_manager *mgr;
> +       const char *dt_label;
> +       int id, ret;
> +
> +       if (!mops || !mops->write_init || !mops->write ||
> +           !mops->write_complete || !mops->state) {
> +               dev_err(dev, "Attempt to register without fpga_manager_ops\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!name || !strlen(name)) {
> +               dev_err(dev, "Attempt to register with no name!\n");
> +               return -EINVAL;
> +       }
> +
> +       mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> +       if (!mgr)
> +               return -ENOMEM;
> +
> +       id = ida_simple_get(&fpga_mgr_ida, 0, 0, GFP_KERNEL);
> +       if (id < 0) {
> +               ret = id;
> +               goto error_kfree;
> +       }
> +
> +       mutex_init(&mgr->ref_mutex);
> +
> +       mgr->name = name;
> +       mgr->mops = mops;
> +       mgr->priv = priv;
> +
> +       /*
> +        * Initialize framework state by requesting low level driver read state
> +        * from device.  FPGA may be in reset mode or may have been programmed
> +        * by bootloader or EEPROM.
> +        */
> +       mgr->state = mgr->mops->state(mgr);
> +
> +       device_initialize(&mgr->dev);
> +       mgr->dev.class = fpga_mgr_class;
> +       mgr->dev.parent = dev;
> +       mgr->dev.of_node = dev->of_node;
> +       mgr->dev.id = id;
> +       dev_set_drvdata(dev, mgr);
> +
> +       dt_label = of_get_property(mgr->dev.of_node, "label", NULL);
> +       if (dt_label)
> +               ret = dev_set_name(&mgr->dev, "%s", dt_label);
> +       else
> +               ret = dev_set_name(&mgr->dev, "fpga%d", id);
> +
> +       ret = device_add(&mgr->dev);
> +       if (ret)
> +               goto error_device;
> +
> +       dev_info(&mgr->dev, "%s registered\n", mgr->name);
> +
> +       return 0;
> +
> +error_device:
> +       ida_simple_remove(&fpga_mgr_ida, id);
> +error_kfree:
> +       kfree(mgr);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_register);
> +
> +/**
> + * fpga_mgr_unregister - unregister a low level fpga manager driver
> + * @dev:       fpga manager device from pdev
> + */
> +void fpga_mgr_unregister(struct device *dev)
> +{
> +       struct fpga_manager *mgr = dev_get_drvdata(dev);
> +
> +       dev_info(&mgr->dev, "%s %s\n", __func__, mgr->name);
> +
> +       /*
> +        * If the low level driver provides a method for putting fpga into
> +        * a desired state upon unregister, do it.
> +        */
> +       if (mgr->mops->fpga_remove)
> +               mgr->mops->fpga_remove(mgr);
> +
> +       device_unregister(&mgr->dev);
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_unregister);
> +
> +static void fpga_mgr_dev_release(struct device *dev)
> +{
> +       struct fpga_manager *mgr = to_fpga_manager(dev);
> +
> +       ida_simple_remove(&fpga_mgr_ida, mgr->dev.id);
> +       kfree(mgr);
> +}
> +
> +static int __init fpga_mgr_class_init(void)
> +{
> +       pr_info("FPGA manager framework\n");
> +
> +       fpga_mgr_class = class_create(THIS_MODULE, "fpga_manager");
> +       if (IS_ERR(fpga_mgr_class))
> +               return PTR_ERR(fpga_mgr_class);
> +
> +       fpga_mgr_class->dev_groups = fpga_mgr_groups;
> +       fpga_mgr_class->dev_release = fpga_mgr_dev_release;
> +
> +       return 0;
> +}
> +
> +static void __exit fpga_mgr_class_exit(void)
> +{
> +       class_destroy(fpga_mgr_class);
> +       ida_destroy(&fpga_mgr_ida);
> +}
> +
> +MODULE_AUTHOR("Alan Tull <atull@opensource.altera.com>");
> +MODULE_DESCRIPTION("FPGA manager framework");
> +MODULE_LICENSE("GPL v2");
> +
> +subsys_initcall(fpga_mgr_class_init);
> +module_exit(fpga_mgr_class_exit);
> diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
> new file mode 100644
> index 0000000..14a2ca6
> --- /dev/null
> +++ b/include/linux/fpga/fpga-mgr.h
> @@ -0,0 +1,127 @@
> +/*
> + * FPGA Framework
> + *
> + *  Copyright (C) 2013-2015 Altera Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#ifndef _LINUX_FPGA_MGR_H
> +#define _LINUX_FPGA_MGR_H
> +
> +struct fpga_manager;
> +
> +/**
> + * enum fpga_mgr_states - fpga framework states
> + * @FPGA_MGR_STATE_UNKNOWN: can't determine state
> + * @FPGA_MGR_STATE_POWER_OFF: FPGA power is off
> + * @FPGA_MGR_STATE_POWER_UP: FPGA reports power is up
> + * @FPGA_MGR_STATE_RESET: FPGA in reset state
> + * @FPGA_MGR_STATE_FIRMWARE_REQ: firmware request in progress
> + * @FPGA_MGR_STATE_FIRMWARE_REQ_ERR: firmware request failed
> + * @FPGA_MGR_STATE_WRITE_INIT: preparing FPGA for programming
> + * @FPGA_MGR_STATE_WRITE_INIT_ERR: Error during WRITE_INIT stage
> + * @FPGA_MGR_STATE_WRITE: writing image to FPGA
> + * @FPGA_MGR_STATE_WRITE_ERR: Error while writing FPGA
> + * @FPGA_MGR_STATE_WRITE_COMPLETE: Doing post programming steps
> + * @FPGA_MGR_STATE_WRITE_COMPLETE_ERR: Error during WRITE_COMPLETE
> + * @FPGA_MGR_STATE_OPERATING: FPGA is programmed and operating
> + */
> +enum fpga_mgr_states {
> +       /* default FPGA states */
> +       FPGA_MGR_STATE_UNKNOWN,
> +       FPGA_MGR_STATE_POWER_OFF,
> +       FPGA_MGR_STATE_POWER_UP,
> +       FPGA_MGR_STATE_RESET,
> +
> +       /* getting an image for loading */
> +       FPGA_MGR_STATE_FIRMWARE_REQ,
> +       FPGA_MGR_STATE_FIRMWARE_REQ_ERR,
> +
> +       /* write sequence: init, write, complete */
> +       FPGA_MGR_STATE_WRITE_INIT,
> +       FPGA_MGR_STATE_WRITE_INIT_ERR,
> +       FPGA_MGR_STATE_WRITE,
> +       FPGA_MGR_STATE_WRITE_ERR,
> +       FPGA_MGR_STATE_WRITE_COMPLETE,
> +       FPGA_MGR_STATE_WRITE_COMPLETE_ERR,
> +
> +       /* fpga is programmed and operating */
> +       FPGA_MGR_STATE_OPERATING,
> +};
> +
> +/*
> + * FPGA Manager flags
> + * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> + */
> +#define FPGA_MGR_PARTIAL_RECONFIG (1)
Could this be BIT(0) instead?
> +
> +/**
> + * struct fpga_manager_ops - ops for low level fpga manager drivers
> + * @state: returns an enum value of the FPGA's state
> + * @write_init: prepare the FPGA to receive confuration data
> + * @write: write count bytes of configuration data to the FPGA
> + * @write_complete: set FPGA to operating state after writing is done
> + * @fpga_remove: optional: Set FPGA into a specific state during driver remove
> + *
> + * fpga_manager_ops are the low level functions implemented by a specific
> + * fpga manager driver.  The optional ones are tested for NULL before being
> + * called, so leaving them out is fine.
> + */
> +struct fpga_manager_ops {
> +       enum fpga_mgr_states (*state)(struct fpga_manager *mgr);
> +       int (*write_init)(struct fpga_manager *mgr, u32 flags,
> +                         const char *buf, size_t count);
> +       int (*write)(struct fpga_manager *mgr, const char *buf, size_t count);
> +       int (*write_complete)(struct fpga_manager *mgr);
See comment above, having the flags here would be very convenient for
my usecase.
> +       void (*fpga_remove)(struct fpga_manager *mgr);
> +};
> +
> +/**
> + * struct fpga_manager - fpga manager structure
> + * @name: name of low level fpga manager
> + * @dev: fpga manager device
> + * @ref_mutex: only allows one reference to fpga manager
> + * @state: state of fpga manager
> + * @mops: pointer to struct of fpga manager ops
> + * @priv: low level driver private date
> + */
> +struct fpga_manager {
> +       const char *name;
> +       struct device dev;
> +       struct mutex ref_mutex;
> +       enum fpga_mgr_states state;
> +       const struct fpga_manager_ops *mops;
> +       void *priv;
> +};
> +
> +#define to_fpga_manager(d) container_of(d, struct fpga_manager, dev)
> +
> +int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags,
> +                     const char *buf, size_t count);
> +
> +int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> +                          const char *image_name);
> +
> +struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
> +
> +void fpga_mgr_put(struct fpga_manager *mgr);
> +
> +int fpga_mgr_register(struct device *dev, const char *name,
> +                     const struct fpga_manager_ops *mops, void *priv);
> +
> +void fpga_mgr_unregister(struct device *dev);
> +
> +#endif /*_LINUX_FPGA_MGR_H */
> --
> 1.7.9.5
>
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

Overall looks pretty good. I still need to look at the bridge part,
currently I have the resets and level shifters in the zynq-fpga
driver,
but maybe breaking them out makes sense.

Cheers,

Moritz
