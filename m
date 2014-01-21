From: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Add Xilinx AXI Video DMA Engine driver
Date: Tue, 21 Jan 2014 15:51:15 +0530
Message-ID: <CA+mB=1Lb9cXUwxKG5ZqmDVtFgMgyGBP+G6mugxU-zjFs87_pew@mail.gmail.com>
References: <1389894803-4147-1-git-send-email-sthokal@xilinx.com>
	<1389972737.7619.14.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389972737.7619.14.camel@smile>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Fri, Jan 17, 2014 at 9:02 PM, Andy Shevchenko
<andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> On Thu, 2014-01-16 at 23:23 +0530, Srikanth Thokala wrote:
>> Hi,
>>
>> This is the driver for Xilinx AXI Video Direct Memory Access Engine.
>> It is a soft IP core, which provides high-bandwidth direct memory
>> access between memory and AXI4-Stream video type target peripherals
>> including peripherals which support AXI4-Stream Video Protocol. The
>> core provides efficient two dimensional DMA operations with independent
>> asynchronous read and write channel operation.
>>
>> For more information on the IP, please refer to
>> http://www.xilinx.com/support/documentation/ip_documentation/axi_vdma/v6_1/pg020_axi_vdma.pdf
>>
>> This patch also provides a test client, which assumes read and write channels
>> of the core are configured in a back-to-back connection.  It transfers
>> data on the write channel, read and verify the data on the read channel.
>>
>>  drivers/dma/xilinx/xilinx_vdma_test.c              |  629 ++++++++
>
> What about to modify dmatest.c accordingly to your needs?
> I see no much sense to have another copy of that in the tree.

I agree with you, we thought it will be good to provide a simple test
case for our driver,
I will drop off this test client from my v2 patch set.

Thanks
Srikanth

>
> --
> Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Intel Finland Oy
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
