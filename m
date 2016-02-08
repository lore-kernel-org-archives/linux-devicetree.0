From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V14 0/9] dma: add Qualcomm Technologies HIDMA driver
Date: Mon, 8 Feb 2016 09:24:39 -0500
Message-ID: <56B8A527.7010206@codeaurora.org>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <20160208101432.GA1150@cbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160208101432.GA1150@cbox>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Christoffer Dall <christoffer.dall@linaro.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, vikrams@codeaurora.org, arnd@arndb.de, eric.auger@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, agross@codeaurora.org, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2/8/2016 5:14 AM, Christoffer Dall wrote:
> Hi Sinan,
> 
> On Thu, Feb 04, 2016 at 11:34:31PM -0500, Sinan Kaya wrote:
>> The Qualcomm Technologies HIDMA device has been designed
>> to support virtualization technology. The driver has been
>> divided into two to follow the hardware design.
>>
>> 1. HIDMA Management driver
>> 2. HIDMA Channel driver
>>
>> Each HIDMA HW consists of multiple channels. These channels
>> share some set of common parameters. These parameters are
>> initialized by the management driver during power up.
>> Same management driver is used for monitoring the execution
>> of the channels. Management driver can change the performance
>> behavior dynamically such as bandwidth allocation and
>> prioritization in the future.
>>
>> The management driver is executed in host context and
>> is the main management entity for all channels provided by
>> the device.
> 
> I'm not at all familiar with this kind of hardware.
> 

Let me help. 

> Once an entity (userspace or VM) has a HIDAM channel assigned via VFIO,
> how does it use it?  

HIDMA is a HW accelerator for memory operations like memcpy and memset. It fits
into the DMA engine framework.

There are two classes of DMA HW. These are slave DMA and standalone DMA. Slave DMA
is generally related to another piece of HW that needs DMA for moving data. 
Standalone DMA is intended for OS/CPU consumption not HW. These can be used to offload
crypto operations (XOR) or other memory transactions (memcpy and memset) that are
lengthy. 

Once the HIDMA channel is assigned to the guest machine, guest operating system uses the
DMA channel to offload memory operations as HIDMA only supports memcpy. 

IOMMU HW provides the isolation from the rest of the host kernel or from other guest machines.

> Is it used in relation with another device to
> perform DMA on its behalf or is a HIDMA channel something that's useful
> on its own?

It is standalone only. The relationship you are referring to is known as slave DMA engine. 
HIDMA does not support slave DMA. HIDMA only supports memcpy and memset in HW and only memcpy in SW
as the memset support has been removed from the kernel long time ago.

> 
> Thanks,
> -Christoffer
> 


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
