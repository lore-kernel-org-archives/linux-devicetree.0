From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Fri, 3 Jun 2016 18:14:43 +0900
Message-ID: <20160603181443.561409f6d65cce501c94d51d@linaro.org>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
	<1461801489-16254-2-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461801489-16254-2-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sagar,

I have some comments on it.

On Wed, 27 Apr 2016 17:58:04 -0600
Sagar Dharia <sdharia@codeaurora.org> wrote:

[..]
> diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
> new file mode 100644
> index 0000000..6024f74
> --- /dev/null
> +++ b/drivers/slimbus/slim-core.c
> @@ -0,0 +1,684 @@
> +/* Copyright (c) 2011-2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/completion.h>
> +#include <linux/idr.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slimbus.h>
> +
> +static DEFINE_MUTEX(slim_lock);
> +static DEFINE_IDR(ctrl_idr);
> +
> +static bool slim_eaddr_equal(struct slim_eaddr *a, struct slim_eaddr *b)
> +{
> +	return (a->manf_id == b->manf_id &&
> +		a->prod_code == b->prod_code &&
> +		a->dev_index == b->dev_index &&
> +		a->instance == b->instance);
> +}
> +
> +static const struct slim_device_id *
> +slim_match(const struct slim_device_id *id, const struct slim_device *slim_dev)

Why does this not return bool? (and the name seems too generic,
it can be __slim_device_match() )

> +{
> +	while (id->manf_id != 0 || id->prod_code != 0) {
> +		if (id->manf_id == slim_dev->e_addr.manf_id &&
> +		    id->prod_code == slim_dev->e_addr.prod_code &&
> +		    id->dev_index == slim_dev->e_addr.dev_index)
> +			return id;
> +		id++;
> +	}
> +	return NULL;
> +}
> +
> +static int slim_device_match(struct device *dev, struct device_driver *driver)
> +{
> +	struct slim_device *slim_dev;
> +	struct slim_driver *drv = to_slim_driver(driver);
> +
> +	slim_dev = to_slim_device(dev);

You can do this at definition line as slim_driver does.

> +	if (drv->id_table)
> +		return slim_match(drv->id_table, slim_dev) != NULL;
> +	return 0;
> +}
> +
> +struct sb_report_wd {
> +	struct work_struct wd;
> +	struct slim_device *sb;
> +	bool report;
> +};
> +
> +static void slim_report(struct work_struct *work)
> +{
> +	struct slim_driver *sbdrv;

It would be better to give a consistent naming rule for local variables.
I see "sbdrv", "driver", "drv" etc. I think sbdrv and sbdev are good choice.

> +	struct sb_report_wd *sbw = container_of(work, struct sb_report_wd, wd);
> +	struct slim_device *sbdev = sbw->sb;
> +
> +	mutex_lock(&sbdev->report_lock);
> +	if (!sbdev->dev.driver)
> +		goto report_exit;
> +
> +	/* check if device-up or down needs to be called */
> +	if ((!sbdev->reported && !sbdev->notified) ||
> +	    (sbdev->reported && sbdev->notified))
> +		goto report_exit;
> +
> +	sbdrv = to_slim_driver(sbdev->dev.driver);
> +
> +	/**
> +	 * address no longer valid, means device reported absent, whereas
> +	 * address valid, means device reported present
> +	 */
> +	if (sbdev->notified && !sbdev->reported) {
> +		sbdev->notified = false;
> +		if (sbdrv->device_down)
> +			sbdrv->device_down(sbdev);
> +	} else if (!sbdev->notified && sbdev->reported) {
> +		sbdev->notified = true;
> +		if (sbdrv->device_up)
> +			sbdrv->device_up(sbdev);
> +	}
> +report_exit:
> +	mutex_unlock(&sbdev->report_lock);
> +	kfree(sbw);
> +}
> +
> +/**
> + * Report callbacks(device_up, device_down) are implemented by slimbus-devices.
> + * The calls are scheduled into a workqueue to avoid holding up controller
> + * intialization/tear-down.
> + */
> +static void schedule_slim_report(struct slim_controller *ctrl,
> +				 struct slim_device *sb, bool report)
> +{
> +	struct sb_report_wd *sbw;
> +
> +	dev_dbg(&ctrl->dev, "report:%d for slave:%s\n", report, sb->name);
> +
> +	sbw = kmalloc(sizeof(*sbw), GFP_KERNEL);
> +	if (!sbw)
> +		return;
> +
> +	INIT_WORK(&sbw->wd, slim_report);
> +	sbw->sb = sb;

Wouldn't we check whether the device is under another reporting or not?
Maybe we can cancel ongoing workqueue.

> +	sbw->report = report;
> +	if (!queue_work(ctrl->wq, &sbw->wd)) {
> +		dev_err(&ctrl->dev, "failed to queue report:%d slave:%s\n",
> +				    report, sb->name);
> +		kfree(sbw);
> +	}
> +}
> +
> +static int slim_device_probe(struct device *dev)
> +{
> +	struct slim_device	*slim_dev;
> +	struct slim_driver	*driver;

"driver" looks generic name. sbdev and sbdrv are much better.

> +	struct slim_controller	*ctrl;
> +	int status = 0;
> +
> +	slim_dev = to_slim_device(dev);
> +	driver = to_slim_driver(dev->driver);
> +	if (!driver->id_table)
> +		return -ENODEV;
> +
> +	slim_dev->driver = driver;
> +
> +	if (driver->probe)
> +		status = driver->probe(slim_dev);
> +	if (status) {
> +		slim_dev->driver = NULL;
> +	} else if (driver->device_up) {
> +		ctrl = slim_dev->ctrl;
> +		schedule_slim_report(ctrl, slim_dev, true);

Here, "crtl" seems a bit redundant.

> +	}
> +	return status;
> +}
> +

[..]
> +/**
> + * slim_add_device: Add a new device without register board info.
> + * @ctrl: Controller to which this device is to be added to.
> + * Called when device doesn't have an explicit client-driver to be probed, or
> + * the client-driver is a module installed dynamically.
> + */
> +int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev)
> +{
> +	sbdev->dev.bus = &slimbus_type;
> +	sbdev->dev.parent = &ctrl->dev;
> +	sbdev->dev.release = slim_dev_release;
> +	sbdev->dev.driver = NULL;
> +	sbdev->ctrl = ctrl;
> +
> +	slim_ctrl_get(ctrl);
> +	if (!sbdev->name) {
> +		sbdev->name = kasprintf(GFP_KERNEL, "%x:%x:%x:%x",
> +					sbdev->e_addr.manf_id,
> +					sbdev->e_addr.prod_code,
> +					sbdev->e_addr.dev_index,
> +					sbdev->e_addr.instance);
> +		if (!sbdev->name)
> +			return -ENOMEM;
> +	}
> +	dev_set_name(&sbdev->dev, "%s", sbdev->name);
> +	mutex_init(&sbdev->report_lock);
> +
> +	/* probe slave on this controller */
> +	return device_register(&sbdev->dev);
> +}
> +EXPORT_SYMBOL_GPL(slim_add_device);
> +
> +struct sbi_boardinfo {
> +	struct list_head	list;
> +	struct slim_boardinfo	board_info;
> +};
> +
> +static LIST_HEAD(board_list);
> +static LIST_HEAD(slim_ctrl_list);
> +static DEFINE_MUTEX(board_lock);
> +
> +/* If controller is not present, only add to boards list */

This comment would better be placed in slim_register_board_info()
since this function doesn't add boards to the list.

> +static void slim_match_ctrl_to_boardinfo(struct slim_controller *ctrl,
> +					 struct slim_boardinfo *bi)
> +{
> +	int ret;
> +
> +	if (ctrl->nr != bi->bus_num)
> +		return;
> +
> +	ret = slim_add_device(ctrl, bi->slim_slave);
> +	if (ret != 0)
> +		dev_err(ctrl->dev.parent, "can't create new device %s, ret:%d\n",
> +			bi->slim_slave->name, ret);
> +}
> +
> +/**
> + * slim_register_board_info: Board-initialization routine.
> + * @info: List of all devices on all controllers present on the board.
> + * @n: number of entries.
> + * API enumerates respective devices on corresponding controller.
> + * Called from board-init function.
> + */
> +int slim_register_board_info(struct slim_boardinfo const *info, unsigned n)
> +{
> +	struct sbi_boardinfo *bi;
> +	int i;
> +
> +	bi = kcalloc(n, sizeof(*bi), GFP_KERNEL);
> +	if (!bi)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n; i++, bi++, info++) {
> +		struct slim_controller *ctrl;
> +
> +		memcpy(&bi->board_info, info, sizeof(*info));
> +		mutex_lock(&board_lock);
> +		list_add_tail(&bi->list, &board_list);
> +		list_for_each_entry(ctrl, &slim_ctrl_list, list)
> +			slim_match_ctrl_to_boardinfo(ctrl, &bi->board_info);
> +		mutex_unlock(&board_lock);
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(slim_register_board_info);
> +
> +static void slim_ctrl_add_boarddevs(struct slim_controller *ctrl)
> +{
> +	struct sbi_boardinfo *bi;
> +
> +	mutex_lock(&board_lock);
> +	list_add_tail(&ctrl->list, &slim_ctrl_list);
> +	list_for_each_entry(bi, &board_list, list)
> +		slim_match_ctrl_to_boardinfo(ctrl, &bi->board_info);
> +	mutex_unlock(&board_lock);
> +}
> +
> +/**
> + * slim_register_controller: Controller bring-up and registration.
> + * @ctrl: Controller to be registered.
> + * A controller is registered with the framework using this API.
> + * If devices on a controller were registered before controller,
> + * this will make sure that they get probed when controller is up
> + */
> +int slim_register_controller(struct slim_controller *ctrl)
> +{
> +	int id, ret = 0;
> +
> +	mutex_lock(&slim_lock);
> +	id = idr_alloc(&ctrl_idr, ctrl, ctrl->nr, -1, GFP_KERNEL);
> +	mutex_unlock(&slim_lock);
> +
> +	if (id < 0)
> +		return id;
> +
> +	ctrl->nr = id;
> +
> +	dev_set_name(&ctrl->dev, "sb-%d", ctrl->nr);
> +	ctrl->num_dev = 0;
> +
> +	if (!ctrl->min_cg)
> +		ctrl->min_cg = SLIM_MIN_CLK_GEAR;
> +	if (!ctrl->max_cg)
> +		ctrl->max_cg = SLIM_MAX_CLK_GEAR;
> +
> +	mutex_init(&ctrl->m_ctrl);
> +	ret = device_register(&ctrl->dev);
> +	if (ret)
> +		goto dev_reg_failed;
> +
> +	dev_dbg(&ctrl->dev, "Bus [%s] registered:dev:%p\n",
> +		ctrl->name, &ctrl->dev);
> +
> +	ctrl->wq = create_singlethread_workqueue(dev_name(&ctrl->dev));
> +	if (!ctrl->wq)
> +		goto err_workq_failed;
> +
> +	slim_ctrl_add_boarddevs(ctrl);
> +	return 0;
> +
> +err_workq_failed:
> +	device_unregister(&ctrl->dev);
> +dev_reg_failed:
> +	mutex_lock(&slim_lock);
> +	idr_remove(&ctrl_idr, ctrl->nr);
> +	mutex_unlock(&slim_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(slim_register_controller);
> +
> +/* slim_remove_device: Remove the effect of slim_add_device() */
> +void slim_remove_device(struct slim_device *sbdev)
> +{
> +	device_unregister(&sbdev->dev);
> +}
> +EXPORT_SYMBOL_GPL(slim_remove_device);
> +
> +static int slim_ctrl_remove_device(struct device *dev, void *null)
> +{
> +	slim_remove_device(to_slim_device(dev));
> +	return 0;
> +}
> +
> +/**
> + * slim_del_controller: Controller tear-down.
> + * @ctrl: Controller to tear-down.
> + */
> +int slim_del_controller(struct slim_controller *ctrl)
> +{
> +	struct slim_controller *found;
> +
> +	/* First make sure that this bus was added */
> +	mutex_lock(&slim_lock);
> +	found = idr_find(&ctrl_idr, ctrl->nr);
> +	mutex_unlock(&slim_lock);
> +	if (found != ctrl)
> +		return -EINVAL;
> +
> +	/* Remove all clients */
> +	device_for_each_child(&ctrl->dev, NULL, slim_ctrl_remove_device);
> +
> +
> +	list_del(&ctrl->list);

This list operation should be protected by slim_lock as
slim_ctrl_add_boarddevs() does.


> +	destroy_workqueue(ctrl->wq);
> +
> +	/* free bus id */
> +	mutex_lock(&slim_lock);
> +	idr_remove(&ctrl_idr, ctrl->nr);
> +	mutex_unlock(&slim_lock);
> +
> +	device_unregister(&ctrl->dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(slim_del_controller);

Thank you,

-- 
Masami Hiramatsu <masami.hiramatsu@linaro.org>
