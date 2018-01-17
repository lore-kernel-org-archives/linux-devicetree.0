From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] dmaengine: qcom: bam_dma: fixes for remotely
 controlled bam
Date: Wed, 17 Jan 2018 10:55:34 +0000
Message-ID: <d40a9ecb-c620-034a-8e88-e9254bb95305@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180117101835.GM18649@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117101835.GM18649@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org



On 17/01/18 10:18, Vinod Koul wrote:
> On Tue, Jan 16, 2018 at 07:02:32PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> Hi Andy,
>>
>> I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
>> is remotely controlled and powered up after ADSP is booted using QMI commands.
> 
> What do you mean by "remotely controlled" in this series?

DMA controller is controlled by the remote processor, which is a DSP in 
this case.
Linux side is in remote mode in this setup, this can setup transfer 
descriptors and start/stop a transfer. But all the 
initialization/powerup part will be done in the remote processor.

--srini

> 
>>
>> Firstly some of the master registers are written even when the BAM is remotely
>> controlled, and secondly reading registers when bam is not ready yet.
>>
>> These 4 patches address these issues, there are few more issues like doing PM
>> in simillar usecase, these will be addressed soon.
>>
>> Thanks,
>> Srini
>>
>> Srinivas Kandagatla (4):
>>    dmaengine: qcom: bam_dma: make bam clk optional
>>    dmaengine: qcom: bam_dma: add num-channels binding for remotely
>>      controlled
>>    dmaengine: qcom: bam_dma: do not write to global regs in remote mode
>>    dmaengine: qcom: bam_dma: Add num-ees dt binding for remotely
>>      controlled
>>
>>   .../devicetree/bindings/dma/qcom_bam_dma.txt       |  4 ++
>>   drivers/dma/qcom/bam_dma.c                         | 56 +++++++++++++++-------
>>   2 files changed, 43 insertions(+), 17 deletions(-)
>>
>> -- 
>> 2.15.1
>>
> 
