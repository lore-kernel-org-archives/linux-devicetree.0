From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 12/19] media: imx: Add SMFC subdev driver
Date: Fri, 6 Jan 2017 10:11:54 -0800
Message-ID: <7814d422-0782-9e5a-bcd9-29e747ba2858@gmail.com>
References: <1483477049-19056-1-git-send-email-steve_longerbeam@mentor.com>
 <1483477049-19056-13-git-send-email-steve_longerbeam@mentor.com>
 <13ff9579-ce8e-9272-ee44-9b597631f6b5@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <13ff9579-ce8e-9272-ee44-9b597631f6b5@mentor.com>
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



On 01/04/2017 06:23 AM, Vladimir Zapolskiy wrote:
> On 01/03/2017 10:57 PM, Steve Longerbeam wrote:
>> This is a media entity subdevice driver for the i.MX Sensor Multi-FIFO
>> Controller module. Video frames are received from the CSI and can
>> be routed to various sinks including the i.MX Image Converter for
>> scaling, color-space conversion, motion compensated deinterlacing,
>> and image rotation.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> ---
>>   drivers/staging/media/imx/Makefile   |   1 +
>>   drivers/staging/media/imx/imx-smfc.c | 739 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 740 insertions(+)
>>   create mode 100644 drivers/staging/media/imx/imx-smfc.c
>>
>> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
>> index 133672a..3559d7b 100644
>> --- a/drivers/staging/media/imx/Makefile
>> +++ b/drivers/staging/media/imx/Makefile
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media.o
>>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
>>   
>>   obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-csi.o
>> +obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-smfc.o
> May be
>
> obj-$(CONFIG_VIDEO_IMX_CAMERA) += imx-csi.o imx-smfc.o

I'd prefer to keep them on separate lines, to indicate they
are all built as separate modules.

>
>>   
>> diff --git a/drivers/staging/media/imx/imx-smfc.c b/drivers/staging/media/imx/imx-smfc.c
>> new file mode 100644
>> index 0000000..565048c
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-smfc.c
>> @@ -0,0 +1,739 @@
>> +/*
>> + * V4L2 Capture SMFC Subdev for Freescale i.MX5/6 SOC
>> + *
>> + * This subdevice handles capture of raw/unconverted video frames
>> + * from the CSI, directly to memory via the Sensor Multi-FIFO Controller.
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
>> +#include <linux/interrupt.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +#include <media/v4l2-subdev.h>
>> +#include <media/v4l2-of.h>
>> +#include <media/v4l2-ctrls.h>
> Please sort the list of headers alphabetically.

done.

>
>> +static irqreturn_t imx_smfc_eof_interrupt(int irq, void *dev_id)
>> +{
>> +	struct imx_smfc_priv *priv = dev_id;
>> +	struct imx_media_dma_buf *done, *next;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&priv->irqlock, flags);
> spin_lock(&priv->irqlock) should be sufficient.

yes thanks.

>
>> +
>> +static const struct platform_device_id imx_smfc_ids[] = {
>> +	{ .name = "imx-ipuv3-smfc" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(platform, imx_smfc_ids);
>> +
>> +static struct platform_driver imx_smfc_driver = {
>> +	.probe = imx_smfc_probe,
>> +	.remove = imx_smfc_remove,
>> +	.id_table = imx_smfc_ids,
>> +	.driver = {
>> +		.name = "imx-ipuv3-smfc",
>> +		.owner = THIS_MODULE,
> You can drop owner assignment.

done.


Steve
