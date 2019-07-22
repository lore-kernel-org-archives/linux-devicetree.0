From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 5/5] coresight: cpu-debug: Add support for Qualcomm Kryo
Date: Mon, 22 Jul 2019 11:18:18 +0530
Message-ID: <c4d88fb1-15ae-6e08-bd74-0ffee5a35e1c@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e2c4cc7c6ccaa5695f25af20c8e487ac53b39955.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717165602.GA4271@xps15> <20190721143553.GA25136@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190721143553.GA25136@leoy-ThinkPad-X240s>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On 7/21/2019 8:05 PM, Leo Yan wrote:
> On Wed, Jul 17, 2019 at 10:56:02AM -0600, Mathieu Poirier wrote:
>> On Fri, Jul 12, 2019 at 07:46:27PM +0530, Sai Prakash Ranjan wrote:
>>> Add support for coresight CPU debug module on Qualcomm
>>> Kryo CPUs. This patch adds the UCI entries for Kryo CPUs
>>> found on MSM8996 which shares the same PIDs as ETMs.
>>>
>>> Without this, below error is observed on MSM8996:
>>>
>>> [    5.429867] OF: graph: no port node found in /soc/debug@3810000
>>> [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
>>> [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
>>> [    5.446474] OF: graph: no port node found in /soc/debug@3910000
>>> [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
>>> [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
>>> [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
>>> [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
>>> [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
>>> [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
>>> [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
>>> [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>   .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
>>>   drivers/hwtracing/coresight/coresight-priv.h  | 10 +++---
>>>   2 files changed, 21 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> index 2463aa7ab4f6..96544b348c27 100644
>>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>>> @@ -646,24 +646,23 @@ static int debug_remove(struct amba_device *adev)
>>>   	return 0;
>>>   }
>>>   
>>> +static const struct amba_cs_uci_id uci_id_debug[] = {
>>> +	{
>>> +		/*  CPU Debug UCI data */
>>> +		.devarch	= 0x47706a15,
>>> +		.devarch_mask	= 0xfff0ffff,
>>> +		.devtype	= 0x00000015,
>>> +	}
>>> +};
>>> +
>>>   static const struct amba_id debug_ids[] = {
>>> -	{       /* Debug for Cortex-A53 */
>>> -		.id	= 0x000bbd03,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A57 */
>>> -		.id	= 0x000bbd07,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A72 */
>>> -		.id	= 0x000bbd08,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{       /* Debug for Cortex-A73 */
>>> -		.id	= 0x000bbd09,
>>> -		.mask	= 0x000fffff,
>>> -	},
>>> -	{ 0, 0 },
>>> +	CS_AMBA_ID(0x000bbd03),				/* Cortex-A53 */
>>> +	CS_AMBA_ID(0x000bbd07),				/* Cortex-A57 */
>>> +	CS_AMBA_ID(0x000bbd08),				/* Cortex-A72 */
>>> +	CS_AMBA_ID(0x000bbd09),				/* Cortex-A73 */
>>> +	CS_AMBA_UCI_ID(0x000f0205, uci_id_debug),	/* Qualcomm Kryo */
>>> +	CS_AMBA_UCI_ID(0x000f0211, uci_id_debug),	/* Qualcomm Kryo */
>>> +	{},
>>>   };
>>>   
>>>   static struct amba_driver debug_driver = {
>>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>>> index 7d401790dd7e..41ae5863104d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>>> @@ -185,11 +185,11 @@ static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
>>>   	}
>>>   
>>>   /* coresight AMBA ID, full UCI structure: id table entry. */
>>> -#define CS_AMBA_UCI_ID(pid, uci_ptr)	\
>>> -	{				\
>>> -		.id	= pid,		\
>>> -		.mask	= 0x000fffff,	\
>>> -		.data	= uci_ptr	\
>>> +#define CS_AMBA_UCI_ID(pid, uci_ptr)		\
>>> +	{					\
>>> +		.id	= pid,			\
>>> +		.mask	= 0x000fffff,		\
>>> +		.data	= (void *)uci_ptr	\
>>>   	}
>>
>> I will pickup this patch - it will show up in my next tree when rc1 comes out.
> 
> I tested this patch on the mainline kernel with latest commit
> f1a3b43cc1f5 ("Merge branch 'for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input"). FWIW:
> 
> Tested-by: Leo Yan <leo.yan@linaro.org>
> 
> P.s. Acutally I tested this patch for 5.2-rcx a few days ago and found
> a regression for CPU debug module: I observed the CPU debug module
> panic dump will stuck.  After I pulled to latest kernel code base the
> CPU debug module can work well; also works well with this patch.  F.Y.I.
> 

Thanks Leo.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
