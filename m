From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Sat, 31 Oct 2015 13:11:39 -0400
Message-ID: <5634F64B.5000000@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <20151030150025.GF31073@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151030150025.GF31073@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/30/2015 11:00 AM, Mark Rutland wrote:
> On Thu, Oct 29, 2015 at 11:08:12PM -0400, Sinan Kaya wrote:
>> The Qualcomm Technologies HIDMA device has been designed
>> to support virtualization technology. The driver has been
>> divided into two to follow the hardware design. The management
>> driver is executed in hypervisor context and is the main
>> managment for all channels provided by the device. The
>> channel driver is exected in the guest OS context.
>>
>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>> ---
>>   .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  42 +
>>   drivers/dma/Kconfig                                |  11 +
>>   drivers/dma/Makefile                               |   1 +
>>   drivers/dma/qcom_hidma_mgmt.c                      | 868 +++++++++++++++++++++
>>   4 files changed, 922 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>>   create mode 100644 drivers/dma/qcom_hidma_mgmt.c
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> new file mode 100644
>> index 0000000..81674ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> @@ -0,0 +1,42 @@
>> +Qualcomm Technologies HIDMA Management interface
>> +
>> +Required properties:
>> +- compatible: must contain "qcom,hidma_mgmt"
>
> s/_/-/ in property names and compatible strings.
>
done

> Per your rationale for splitting the device nodes, surely the
> relationship between the two needs to be described?
>
I changed the commit message to make it more clear. I also added
the same message to the device binding document for reference.

> The GIC has a similar split, yet we use a single node, with the
> hypervisor portions being optional.
>
> What if there were multiple instances?
>
The driver already supports multiple instances. It has been tested 
against 4 instances. I ended up having 4 management device entities 
managing 6 different channels each.


>> +- reg: Address range for DMA device
>> +- interrupts: Should contain the one interrupt shared by all channels
>> +- nr-channels: Number of channels supported by this DMA controller.
>> +- max-write: Maximum write burst in bytes. A memcpy requested is
>> +  fragmented to multiples of this amount.
>> +- max-read: Maximum read burst in bytes. A memcpy request is
>> +  fragmented to multiples of this amount.
>
> Thse would be better named as max-read-burst-bytes and
> min-read-burst-bytes.

ok

>
>> +- max-wxactions: Maximum write transactions to perform in a burst
>> +- max-rdactions: Maximum read transactions to perform in a burst
>
> max-{write,read}-transactions
ok
>
>> +- max-memset-limit: Maximum memset limit
>
> I have no idea what this is meant to mean.
>
old stuff. no memset support anymore. will remove it.

>> +- ch-priority-#n: Priority of the channel
>> +- ch-weight-#n: Round robin weight of the channel
>
> These need better descriptions. They sound like configuration options.
>
ok.

> [...]
>
>> +#if IS_ENABLED(CONFIG_ACPI)
>> +static const struct acpi_device_id qcom_hidma_mgmt_acpi_ids[] = {
>> +	{"QCOM8060"},
>> +	{},
>> +};
>> +#endif
>
> How do DMA engines work with ACPI?
>
> How are client relationships defined?
>
> THanks,
> Mark.
>

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
