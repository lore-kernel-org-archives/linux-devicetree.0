From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv5 1/7] arm64: dts: qcom: sdm845: Add Coresight support
Date: Thu, 31 Jan 2019 18:46:38 +0530
Message-ID: <6ba118d5-5b54-8b91-d003-3f56fae5b925@codeaurora.org>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <60ebf1617f0285c89e921bf3839cba6906d493c9.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <20190130183723.GA19234@xps15>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130183723.GA19234@xps15>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.or
List-Id: devicetree@vger.kernel.org

On 1/31/2019 12:07 AM, Mathieu Poirier wrote:
> On Tue, Jan 29, 2019 at 12:43:58AM +0530, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>
>> ---
>> Depends on AOSS QMP side channel patches and AMBA bus pclk change
>> by Bjorn Andersson [1][2].
>> Also depends on patch ("arm64: dts: qcom: sdm845: Increase address
>> and size cells for soc") [3].
>>
>> [1] https://lore.kernel.org/lkml/20190106080915.4493-1-bjorn.andersson@linaro.org/
>> [2] https://lore.kernel.org/lkml/20190106080915.4493-7-bjorn.andersson@linaro.org/
>> [3] https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/
> 
> This patch still doesn't compile for me.  In the above [1] is a cover letter and
> [2] is a patch that is part of [1] - what do you want me to do?  Add all the
> patches in [1]?  And how do those related to the dependencies you've listed in
> the cover letter?
> 
> I can't continue reviewing your work until you provide me with a tree based on
> coresight-next [3] with all the depencendies to get this set applied and
> compiled.
> 

Hi Mathieu,

Sorry to have wasted your time. There were many dependencies
with some nesting and getting updated as well, so in the next version, I 
will have my patches rebased on top of coresight-next and also I will
give a tree based on the same with all dependencies applied.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
