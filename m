From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 14:08:07 -0400
Message-ID: <5633B207.5030505@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <20151030150025.GF31073@leverpostej>
 <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/30/2015 1:59 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2015 at 5:00 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> On Thu, Oct 29, 2015 at 11:08:12PM -0400, Sinan Kaya wrote:
>>> The Qualcomm Technologies HIDMA device has been designed
>>> to support virtualization technology. The driver has been
>>> divided into two to follow the hardware design. The management
>>> driver is executed in hypervisor context and is the main
>>> managment for all channels provided by the device. The
>>> channel driver is exected in the guest OS context.
>>>
>
>>> +#if IS_ENABLED(CONFIG_ACPI)
>>> +static const struct acpi_device_id qcom_hidma_mgmt_acpi_ids[] = {
>>> +     {"QCOM8060"},
>>> +     {},
>>> +};
>>> +#endif
>>
>> How do DMA engines work with ACPI?
>>
>> How are client relationships defined?
>
> The ACPI tables DSDT and CSRT (more info here:
> http://www.acpi.info/links.htm) defines properties.
>
> DSDT:
>   per DMAC: the resources
>   per client: FixedDMA descriptor that contains channel / request line pair.
>
> CSRT:
>   necessary table to map which DMAC provides which request line, thus
> request line numbering are global on platform.
>
> When DMAC driver is probed in the running system it should call as
> well registration function from acpi-dma.c.
>
> All clients when use new DMA slave API gets channel automatically
> based on their FixedDMA property.
>
> So, above is how it should be done. Didn't actually checked what this
> driver does.
>
I was going to reply to all the questions in one pass but let me handle 
piece by piece.

Here are some facts.
- This hardware supports memcpy and memset only.
- Memset feature was removed from the kernel sometime around 3.14. So no 
memset support in this driver either.
- The hardware does not support DMA slave support
- The goal is to provide an interface to DMA engine framework for memcpy 
optimization so that the rest of the kernel drivers and applications 
make use of the hardware.

CSRT is an Intel specific ACPI table for slave devices. It was decided 
by Linaro that CSRT will not be supported for ARM64.

There were some discussions in ACPI forums to define a similar table for 
ARM64 but we are not there today and this hardware does not support 
slave interface.

ACPI enumeration is just like any other platform device. The driver gets 
looked up by a QCOM specific HID and the driver gets probed with the 
rest of the arguments in DSM object similar to device-tree attributes. 
The code uses device functions so the driver is not aware of where the 
parameters are coming from.


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
