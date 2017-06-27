From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH 3/3] mtd: spi-nor: Altera Quadspi Flash Controller v2
 Platform driver
Date: Tue, 27 Jun 2017 10:38:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1706271028260.8058@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com> <1498493619-4633-4-git-send-email-matthew.gerlach@linux.intel.com> <2ac33989-5665-33e0-c6f0-6791c8e46b0d@gmail.com> <alpine.DEB.2.20.1706270800240.8058@mgerlach-VirtualBox>
 <5f0e2ddd-d329-cb3d-01bc-c101247281a7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5f0e2ddd-d329-cb3d-01bc-c101247281a7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tue, 27 Jun 2017, Marek Vasut wrote:

> On 06/27/2017 05:15 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>
>>
>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>
>>> On 06/26/2017 06:13 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>
>>> Just wrap it into the Altera QSPI driver , no need for separate platform
>>> driver IMO.
>>
>> Hi Marek,
>>
>> I answered this question when you asked why the header file was
>> necessary, but I think further discussion could be helpful, since this
>> problem is becoming more prevelent.  The Altera Quadspi component is a
>> soft IP in a
>> FPGA, and the processor using the component may or may not have device
>> tree support compiled into the Linux kernel.  Since device tree support
>> may or may not be available, the device tree specific code must be
>> separated
>> from the core driver code.
>
> I see, that's fine, although there is no PCIe or other support in this
> submission. Is that planned ?

You probably would not see a PCIe driver for a card with a FPGA that would 
only have the Altera Quadspi component on it.  Usually a FPGA has several 
components, each requiring their own driver which are considered 
sub-drivers of the PCIe driver.  I will be adding Altera Quadspi support 
to the Intel-FPGA PCIe driver that is currently under review.  We have 
also seen people use the Altera Quadspi with a NIOS-II soft processor, and 
I expect someone would want to use the component with ARM SOCFPGAs.

Matthew Gerlach

>
>> One can certainly make the case, that device tree support could/should
>> be available everywhere, but the current reality is most x86 Linux
>> kernel configurations do not include device tree support.
>>
>> For the record, I believe device trees, and more specifically device
>> tree overlays, are the best way for Linux to use FPGAs, but I have to
>> deal with the current realities.
>>
>> Thanks again for all the great feedback.
>>
>> Matthew Gerlach
>
> [...]
>
> -- 
> Best regards,
> Marek Vasut
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
