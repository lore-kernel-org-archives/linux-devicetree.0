From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Tue, 29 Jan 2019 00:47:50 +0530
Message-ID: <eec64938-ef6a-a3d5-d93f-7a63df8b132f@codeaurora.org>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
 <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
 <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
 <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com>
 <5b54c6e0-7d22-ecee-486f-31333f49f84a@codeaurora.org>
 <18b70426-60fe-4871-6388-6e09fd5feb37@arm.com>
 <de6e021a-4f9a-8e2e-dff0-1e7c61ad8b2b@codeaurora.org>
 <CANLsYkxkTTfTMNNZZ1tmS=cjakcfveMDrW6wxXPXie8M9_VDOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkxkTTfTMNNZZ1tmS=cjakcfveMDrW6wxXPXie8M9_VDOg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, John Horley <John.Horley@arm.com>
List-Id: devicetree@vger.kernel.org

On 1/28/2019 10:45 PM, Mathieu Poirier wrote:

>> For SDM845(A75 based):
>>
>> *0xB_B8_03* does indicate that the JEP106 identification
>> code is 0x3B and continuation code is 0x4 which is of ARM and not
>> QCOM(JEP106 ID is 0x70) which is expected.
>>
>> And the other values of PIDR0[0:7] and PIDR1[3:0] are *Implementation
>> defined part numbers* and can be different from ARM A75/A55.
>>
>> I think this clears up case for SDM845.
>>
>> As for MSM8996, it is not based on any ARM derivative and hence the
>> JEP106 ID is of QCOM(0x70) from the value of pid = *0xF_02_11*
>> based on PIDR1[7:4] and PIDR2[2:0]. This clears this as well.
>>
>> Please correct me if I am wrong and also let me know if I can
>> continue with PID addition to table.
> 
> Please proceed.
> 

Thanks Mathieu, posted the next version now.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
