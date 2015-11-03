From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Tue, 3 Nov 2015 00:18:20 -0500
Message-ID: <5638439C.1050301@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org>
 <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 11/2/2015 10:57 AM, Rob Herring wrote:
> On Mon, Nov 2, 2015 at 12:07 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
>> The Qualcomm Technologies HIDMA device has been designed
>> to support virtualization technology. The driver has been
>> divided into two to follow the hardware design. The management
>> driver is executed in hypervisor context and is the main
>> management entity for all channels provided by the device.
>> The channel driver is executed in the hypervisor/guest OS
>> context.
>>
>> All channel devices get probed in the hypervisor
>> context during power up. They show up as DMA engine
>> channels. Then, before starting the virtualization; each
>> channel device is unbound from the hypervisor by VFIO
>> and assigned to the guest machine for control.
>>
>> This management driver will be used by the system
>> admin to monitor/reset the execution state of the DMA
>> channels. This will be the management interface.
>>
>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>> ---
>>   .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  56 ++
>>   drivers/dma/Kconfig                                |  11 +
>>   drivers/dma/Makefile                               |   1 +
>>   drivers/dma/qcom_hidma_mgmt.c                      | 747 +++++++++++++++++++++
>>   4 files changed, 815 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>>   create mode 100644 drivers/dma/qcom_hidma_mgmt.c
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> new file mode 100644
>> index 0000000..514d37d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> @@ -0,0 +1,56 @@
>> +Qualcomm Technologies HIDMA Management interface
>> +
>> +The Qualcomm Technologies HIDMA device has been designed
>> +to support virtualization technology. The driver has been
>> +divided into two to follow the hardware design. The management
>> +driver is executed in hypervisor context and is the main
>> +management entity for all channels provided by the device.

Let me try one more time. Hope this helps.

Each HIDMA HW consists of multiple channels. These channels share
some set of common parameters. These parameters are initialized
by the management driver during power up. Same management driver is used 
for monitoring the execution of the channels. Management driver
can change the performance behaviors dynamically such as bandwidth
allocation and prioritization.

>
> This doesn't really explain what the block is.
>
>> +All channel devices get probed in the hypervisor
>> +context during power up. They show up as DMA engine
>> +DMA channels. Then, before starting the virtualization; each
>> +channel device is unbound from the hypervisor by VFIO
>> +and assign to the guest machine for control.
>> +
>> +This management driver will  be used by the system
>> +admin to monitor/reset the execution state of the DMA
>> +channels. This will be the management interface.
>> +
>> +
>> +Required properties:
>> +- compatible: must contain "qcom,hidma-mgmt"
>
> Please make this more specific. It doesn't match your example either.
> Unless "1.0" type versioning is tightly controlled and defined,
> version numbers are usually not a good practice.
>
>> +- reg: Address range for DMA device
>> +- dma-channels: Number of channels supported by this DMA controller.
>> +- max-write-burst-bytes: Maximum write burst in bytes. A memcpy requested is
>> +  fragmented to multiples of this amount.
>> +- max-read-burst-bytes: Maximum read burst in bytes. A memcpy request is
>> +  fragmented to multiples of this amount.
>> +- max-write-transactions: Maximum write transactions to perform in a burst
>> +- max-read-transactions: Maximum read transactions to perform in a burst
>
> This would be a function of burst-bytes and bus width. Are you sure
> you don't me number of outstanding transactions which is a common
> parameter for AXI bus peripherals.
>

These are all the available HW knobs for performance at this moment. 
max-write-transactions corresponds to the max number of outstanding 
transactions.

>> +- channel-reset-timeout: Channel reset timeout for this SOC.
>
> Please add units to property name.

ok, changed to channel-reset-timeout-cycles

>
>> +- channel-priority: Priority of the channel.
>> +  Each dma channel share the same HW bandwidth with other dma channels.
>> +  If two requests reach to the HW at the same time from a low priority and
>> +  high priority channel, high priority channel will claim the bus.
>> +  0=low priority, 1=high priority
>> +- channel-weight: Round robin weight of the channel
>> +  Since there are only two priority levels supported, scheduling among
>> +  the equal priority channels is done via weights.
>> +
>> +Example:
>> +
>> +       hidma-mgmt@f9984000 = {
>> +               compatible = "qcom,hidma-mgmt-1.0";
>> +               reg = <0xf9984000 0x15000>;
>> +               dma-channels = 6;
>> +               max-write-burst-bytes = 1024;
>> +               max-read-burst-bytes = 1024;
>> +               max-write-transactions = 31;
>> +               max-read-transactions = 31;
>> +               channel-reset-timeout = 0x500;
>> +               channel-priority = < 1 1 0 0 0 0>;
>> +               channel-weight = < 1 13 10 3 4 5>;
>> +       };
>> +

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
