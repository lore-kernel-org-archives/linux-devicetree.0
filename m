From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V14 0/9] dma: add Qualcomm Technologies HIDMA driver
Date: Thu, 3 Mar 2016 10:22:33 -0500
Message-ID: <56D856B9.4070301@codeaurora.org>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <56D07B71.4080209@codeaurora.org> <56D082D7.1050002@codeaurora.org>
 <56D733BA.6030203@codeaurora.org> <20160303034451.GH11154@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160303034451.GH11154@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Timur Tabi <timur@codeaurora.org>, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/2/2016 10:44 PM, Vinod Koul wrote:
> On Wed, Mar 02, 2016 at 01:40:58PM -0500, Sinan Kaya wrote:
>> On 2/26/2016 11:52 AM, Timur Tabi wrote:
>>> Sinan Kaya wrote:
>>>> Hi Marc Zyngier, Mark Rutland;
>>>>
>>>> I'm looking forward to hear your feedback on this series.
>>>
>>> Would it be possible to get this patchset into 4.6?  We're already at v14, and there have been no review comments since this patch was posted on the fourth (over three weeks ago).
>>
>> Vinod?
>>
>> I have my DT ACK from Rob Herring as you initially asked. I responded to 
>> Mark Rutland and Marc Zyngier's comments by improving the cover letter 
>> and adding IOMMU binding. 
>>
>> I pinged both Mark and Marc twice with no response.
>>
>> I don't know what else it takes besides waiting.
> 
> I did check first couple of patches last week, things seemed fine to me.
> I will do details review in next couple of days and decide.
> 
> At least I will merge dmaengine patches for this cycle if all is good.
> 

Thanks, let me know if you have questions. The VFIO patches (8/9) need to 
be submitted separately anyhow. I have some follow up work on them too. 

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
