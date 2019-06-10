From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v7 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 10 Jun 2019 06:33:29 +0000
Message-ID: <BYAPR07MB4709F32FF0C6DAE8905703C7DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-6-git-send-email-pawell@cadence.com>
 <20190607101602.GD10298@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607101602.GD10298@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>On Wed, Jun 05, 2019 at 11:03:49AM +0100, Pawel Laszczak wrote:
>> diff --git a/drivers/usb/cdns3/debugfs.c b/drivers/usb/cdns3/debugfs.c
>> new file mode 100644
>> index 000000000000..dfcbeb5e14f8
>> --- /dev/null
>> +++ b/drivers/usb/cdns3/debugfs.c
>> @@ -0,0 +1,173 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Cadence USBSS DRD Controller DebugFS filer.
>> + *
>> + * Copyright (C) 2018-2019 Cadence.
>> + *
>> + * Author: Pawel Laszczak <pawell@cadence.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "core.h"
>> +#include "gadget.h"
>> +#include "drd.h"
>
>static const char *const cdns3_mode[] =3D {
>        [USB_DR_MODE_UNKNOWN]           =3D "unknown",
>        [USB_DR_MODE_OTG]               =3D "otg",
>        [USB_DR_MODE_HOST]              =3D "host",
>        [USB_DR_MODE_PERIPHERAL]        =3D "device",
>};
>
>> +static int cdns3_mode_show(struct seq_file *s, void *unused)
>> +{
>> +	struct cdns3 *cdns =3D s->private;
>> +
>> +	switch (cdns->current_dr_mode) {
>> +	case USB_DR_MODE_HOST:
>> +		seq_puts(s, "host\n");
>> +		break;
>> +	case USB_DR_MODE_PERIPHERAL:
>> +		seq_puts(s, "device\n");
>> +		break;
>> +	case USB_DR_MODE_OTG:
>> +		seq_puts(s, "otg\n");
>> +		break;
>> +	default:
>> +		seq_puts(s, "UNKNOWN mode\n");
>> +	}
>
>All you should need here is:
>
>        seq_puts(s, cdns3_mode[cdns->current_dr_mode]);
>
>> +	return 0;
>> +}
>> +
>> +static int cdns3_mode_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, cdns3_mode_show, inode->i_private);
>> +}
>> +
>> +static ssize_t cdns3_mode_write(struct file *file,
>> +				const char __user *ubuf,
>> +				size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file	 *s =3D file->private_data;
>> +	struct cdns3 *cdns =3D s->private;
>> +	u32 mode =3D USB_DR_MODE_UNKNOWN;
>> +	char buf[32];
>> +	int ret =3D 0;
>
>        int ret;
>
>> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>> +		return -EFAULT;
>
>                return -EINVAL;

Why? I've checked in some place in kernel and after copy_from_user are used=
 EFAULT.
I think that EINVAL is better but I wanted be  consistent with the rest of =
kernel.=20

Is there any explanation for this ?

>
>> +
>> +	if (cdns->debug_disable) {
>> +		dev_err(cdns->dev,
>> +			"Mode can't be changed when disable is set\n");
>> +		return -EFAULT;
>
>                return -EPERM;
>
>> +	}
>> +
>> +	if (!strncmp(buf, "host", 4)) {
>> +		if (cdns->dr_mode =3D=3D USB_DR_MODE_HOST ||
>> +		    cdns->dr_mode =3D=3D USB_DR_MODE_OTG) {
>> +			mode =3D USB_DR_MODE_HOST;
>> +		}
>> +	}
>> +
>> +	if (!strncmp(buf, "device", 6))
>> +		if (cdns->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL ||
>> +		    cdns->dr_mode =3D=3D USB_DR_MODE_OTG)
>> +			mode =3D USB_DR_MODE_PERIPHERAL;
>> +
>> +	if (!strncmp(buf, "otg", 3) && cdns->dr_mode =3D=3D USB_DR_MODE_OTG)
>> +		mode =3D USB_DR_MODE_OTG;
>> +
>> +	if (mode =3D=3D USB_DR_MODE_UNKNOWN) {
>> +		dev_err(cdns->dev, "Failed: incorrect mode setting\n");
>> +		return -EFAULT;
>> +	}
>
>To cover all those, you just need to:
>
>        ret =3D match_string(cdns3_mode, ARRAY_SIZE(cdns3_mode), buf));
>        if (ret < 0 ||=A0ret =3D=3D USB_DR_MODE_UNKNOWN)
>                return -EINVAL;
>
>> +	if (cdns->current_dr_mode !=3D mode) {
>> +		cdns->desired_dr_mode =3D mode;
>
>        if (cdns->current_dr_mode !=3D ret)
>		cdns->desired_dr_mode =3D ret;
>
>> +		cdns3_role_stop(cdns);
>> +		ret =3D cdns3_drd_update_mode(cdns);
>> +		if (ret)
>> +			return ret;
>> +
>> +		queue_work(system_freezable_wq, &cdns->role_switch_wq);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations cdns3_mode_fops =3D {
>> +	.open			=3D cdns3_mode_open,
>> +	.write			=3D cdns3_mode_write,
>> +	.read			=3D seq_read,
>> +	.llseek			=3D seq_lseek,
>> +	.release		=3D single_release,
>> +};
>> +
>> +static int cdns3_disable_show(struct seq_file *s, void *unused)
>> +{
>> +	struct cdns3 *cdns =3D s->private;
>> +
>> +	if (!cdns->debug_disable)
>> +		seq_puts(s, "0\n");
>> +	else
>> +		seq_puts(s, "1\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t cdns3_disable_write(struct file *file,
>> +				   const char __user *ubuf,
>> +				   size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file	 *s =3D file->private_data;
>> +	struct cdns3 *cdns =3D s->private;
>> +	bool disable;
>> +	char buf[16];
>> +
>> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>> +		return -EFAULT;
>> +
>> +	if (kstrtobool(buf, &disable)) {
>> +		dev_err(cdns->dev, "wrong setting\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (disable !=3D cdns->debug_disable) {
>> +		cdns->debug_disable =3D disable;
>> +		queue_work(system_freezable_wq, &cdns->role_switch_wq);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static int cdns3_disable_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, cdns3_disable_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations cdns3_disable_fops =3D {
>> +	.open			=3D cdns3_disable_open,
>> +	.write			=3D cdns3_disable_write,
>> +	.read			=3D seq_read,
>> +	.llseek			=3D seq_lseek,
>> +	.release		=3D single_release,
>> +};
>> +
>> +void cdns3_debugfs_init(struct cdns3 *cdns)
>> +{
>> +	struct dentry *root;
>> +
>> +	root =3D debugfs_create_dir(dev_name(cdns->dev), NULL);
>> +	cdns->root =3D root;
>> +	if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET) &&
>> +	    IS_ENABLED(CONFIG_USB_CDNS3_HOST))
>> +		debugfs_create_file("mode", 0644, root, cdns,
>> +				    &cdns3_mode_fops);
>> +
>> +	debugfs_create_file("disable", 0644, root, cdns,
>> +			    &cdns3_disable_fops);
>> +}
>> +
>> +void cdns3_debugfs_exit(struct cdns3 *cdns)
>> +{
>> +	debugfs_remove_recursive(cdns->root);
>> +}
>
>thanks,
>
>--
>heikki

Thank for nice simplification.=20
Regards=20
Pawel
