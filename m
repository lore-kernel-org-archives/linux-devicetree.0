From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management driver
Date: Fri, 30 Oct 2015 20:18:49 +0200
Message-ID: <CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
	<20151030150025.GF31073@leverpostej>
	<CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
	<5633B207.5030505@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5633B207.5030505-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 8:08 PM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

>> The ACPI tables DSDT and CSRT (more info here:
>> http://www.acpi.info/links.htm) defines properties.
>>
>> DSDT:
>>   per DMAC: the resources
>>   per client: FixedDMA descriptor that contains channel / request line
>> pair.
>>
>> CSRT:
>>   necessary table to map which DMAC provides which request line, thus
>> request line numbering are global on platform.
>>
>> When DMAC driver is probed in the running system it should call as
>> well registration function from acpi-dma.c.
>>
>> All clients when use new DMA slave API gets channel automatically
>> based on their FixedDMA property.
>>
>> So, above is how it should be done. Didn't actually checked what this
>> driver does.
>>
> I was going to reply to all the questions in one pass but let me handle
> piece by piece.
>
> Here are some facts.
> - This hardware supports memcpy and memset only.
> - Memset feature was removed from the kernel sometime around 3.14. So no
> memset support in this driver either.
> - The hardware does not support DMA slave support
> - The goal is to provide an interface to DMA engine framework for memcpy
> optimization so that the rest of the kernel drivers and applications make
> use of the hardware.
>

> CSRT is an Intel specific ACPI table for slave devices.

Wrong.
It was designed by Microsoft to support multiple controllers, in
particular DMACs.
Have you read that document I posted link to?

> It was decided by
> Linaro that CSRT will not be supported for ARM64.

Interesting, ARM64 platforms are not going to have more than one DMAC
per system?

> There were some discussions in ACPI forums to define a similar table for
> ARM64 but we are not there today and this hardware does not support slave
> interface.
>
> ACPI enumeration is just like any other platform device. The driver gets
> looked up by a QCOM specific HID and the driver gets probed with the rest of
> the arguments in DSM object similar to device-tree attributes. The code uses
> device functions so the driver is not aware of where the parameters are
> coming from.



-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
