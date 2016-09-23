From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V3 01/10] Documentation: DT: qcom_hidma: update binding
 for MSI
Date: Fri, 23 Sep 2016 14:58:32 -0400
Message-ID: <0ec888b5-65cf-37eb-1cbf-9e462a4a5592@codeaurora.org>
References: <1473960166-30155-1-git-send-email-okaya@codeaurora.org>
 <1473960166-30155-2-git-send-email-okaya@codeaurora.org>
 <20160923180239.GC29830@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160923180239.GC29830@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 9/23/2016 2:02 PM, Mark Rutland wrote:
> On Thu, Sep 15, 2016 at 01:22:37PM -0400, Sinan Kaya wrote:
>> Adding a new binding for qcom,hidma-1.1 to distinguish HW supporting
>> MSI interrupts from the older revision.
>>
>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> index fd5618b..47bfb5a 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>> @@ -47,12 +47,23 @@ When the OS is not in control of the management interface (i.e. it's a guest),
>>  the channel nodes appear on their own, not under a management node.
>>  
>>  Required properties:
>> -- compatible: must contain "qcom,hidma-1.0"
>> +- compatible: must contain "qcom,hidma-1.0" for initial HW or "qcom,hidma-1.1"
>> +for MSI capable HW.
>>  - reg: Addresses for the transfer and event channel
>>  - interrupts: Should contain the event interrupt
>>  - desc-count: Number of asynchronous requests this channel can handle
>>  - iommus: required a iommu node
>>  
>> +Optional properties for MSI:
>> +- msi-parent: pointer to the MSI controller object with the DeviceID in use.
> 
> The format of msi-cells depends on the particular msi-controller, so no
> need to mention DeviceID here.
> 
> Please refer to
> Documentation/devicetree/bindings/interrupt-controller/msi.txt

Thanks, let me do some more research.

> 
>> +Example:
>> + msi_parent: <&msi0 0x80024>
> 
> This doesn't match (s/_/-/).

ok

> 
>> +msi0 is the MSI controller in the system. Bits 0-5 is the channel ID. 4
>> +is the channel ID. Bits 5-8 is the instance number. This is for the HIDMA
>> +instance 1.
> 
> I don't think you need any of this text, so long as you refer to the
> generic MSI binding document, as above.

ok

> 
> Thanks,
> Mark.
> 


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
