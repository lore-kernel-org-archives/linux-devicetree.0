From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Tue, 22 Jan 2019 19:11:34 +0530
Message-ID: <91bcd4cc-9f66-0ca3-43bf-d912c6080b49@codeaurora.org>
References: <cover.1547813804.git.saiprakash.ranjan@codeaurora.org>
 <73bf137fd5d6cb6bddecdf13026156afcf9d473b.1547813804.git.saiprakash.ranjan@codeaurora.org>
 <20190121183731.GA14049@xps15>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121183731.GA14049@xps15>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On 1/22/2019 12:07 AM, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Fri, Jan 18, 2019 at 05:52:53PM +0530, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>
>> ---
>> This depends on AMBA bus pclk change by Bjorn Andersson [1].
>> Also depends on patch ("arm64: dts: qcom: sdm845: Increase address
>> and size cells for soc") [2].
>>
>> [1] https://lore.kernel.org/lkml/20190106080915.4493-7-bjorn.andersson@linaro.org/
>> [2] https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/
> 
> Thank you for making modifications to this patch - I am happy with how it stands
> now.  I tried to compile it on my side on a 5.0-rc3 kernel and even after
> applying the above two patches you pointed out I get the following error:
> 
> Error: /home/mpoirier/work/coresight/kernel-maint/arch/arm64/boot/dts/qcom/sdm845.dtsi:1356.31-32 syntax error
> FATAL ERROR: Unable to parse input tree
> 
>  From what I see neither aoss_qmp or AOSS_QMP_QDSS_CLK are defined.  Are there
> more patches that need to be applied?
> 

Sorry, I added all the dependent patches in the cover letter, but
forgot to add the main dependent patch here, now added in v4.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
