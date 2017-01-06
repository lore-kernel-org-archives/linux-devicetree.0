From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 14/19] media: imx: Add Camera Interface subdev driver
Date: Fri, 6 Jan 2017 10:42:34 -0800
Message-ID: <119f0a16-ff23-e62b-5e90-3d56df7be894@gmail.com>
References: <1483477049-19056-1-git-send-email-steve_longerbeam@mentor.com>
 <1483477049-19056-15-git-send-email-steve_longerbeam@mentor.com>
 <4a893d70-f34a-9fb1-401f-bcb954e3a2cb@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <4a893d70-f34a-9fb1-401f-bcb954e3a2cb@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mchehab@kernel.org, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/04/2017 06:55 AM, Vladimir Zapolskiy wrote:
> On 01/03/2017 10:57 PM, Steve Longerbeam wrote:
>>
>> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
>> index d2a962c..fe9e992 100644
>> --- a/drivers/staging/media/imx/Makefile
>> +++ b/drivers/staging/media/imx/Makefile
>> @@ -8,4 +8,4 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-ic.o
>>   
>>   obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-csi.o
>>   obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-smfc.o
>> -
>> +obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-camif.o
> obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-camif.o imx-csi.o imx-smfc.o
>
> as an option.

I prefer to keep on separate lines as explained earlier.

>
>> diff --git a/drivers/staging/media/imx/imx-camif.c b/drivers/staging/media/imx/imx-camif.c
>> new file mode 100644
>> index 0000000..3cf167e
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-camif.c
>> @@ -0,0 +1,1010 @@
>> +/*
>> + * Video Camera Capture Subdev for Freescale i.MX5/6 SOC
>> + *
>> + * Copyright (c) 2012-2016 Mentor Graphics Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +#include <linux/module.h>
>> +#include <linux/delay.h>
>> +#include <linux/fs.h>
>> +#include <linux/timer.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/of_platform.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +#include <media/v4l2-subdev.h>
>> +#include <media/v4l2-of.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
> Please sort the list of headers alphabetically.

done.

>> +#include <video/imx-ipu-v3.h>
>> +#include <media/imx.h>
>> +#include "imx-media.h"
>> +
>> +#define DEVICE_NAME "imx-media-camif"
> I would propose to drop this macro.

done.

>> +
>> +#define CAMIF_DQ_TIMEOUT        5000
> Add a comment about time unit?

actually that was ancient and no longer used, removed.

>
>> +
>> +struct camif_priv;
>> +
> This is a leftover apparently.

ditto, removed.

>> +
>> +	ret = v4l2_async_register_subdev(&priv->sd);
>> +	if (ret)
>> +		goto free_ctrls;
>> +
>> +	return 0;
>> +free_ctrls:
>> +	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
>> +	return ret;
> A shorter version:
>
> if (ret)
> 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
>
> return ret;

done.

>> +
>> +static struct platform_driver imx_camif_driver = {
>> +	.probe		= camif_probe,
>> +	.remove		= camif_remove,
>> +	.driver		= {
>> +		.name	= DEVICE_NAME,
>> +		.owner	= THIS_MODULE,
> Please drop the owner assignment.

done.


Steve
