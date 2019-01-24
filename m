From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Fri, 25 Jan 2019 00:01:04 +0530
Message-ID: <1384cbbb-6e3e-f2e3-5ea4-8d0b237d64c7@codeaurora.org>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
 <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
 <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
 <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com>
 <5b54c6e0-7d22-ecee-486f-31333f49f84a@codeaurora.org>
 <CANLsYkxLJS-N0V4eOHM5rfe8MXMZHQApZFsDQns+DAS7xhGCoQ@mail.gmail.com>
 <71ae9f41-50ff-742b-3e12-ca2ce84e0d3c@codeaurora.org>
 <CANLsYkyeG4mZTJbFPnAsTNpt_2OBy5JYP6g80rbmZv-F8KTrUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkyeG4mZTJbFPnAsTNpt_2OBy5JYP6g80rbmZv-F8KTrUA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, John Horley <john.horley@arm.com>
List-Id: devicetree@vger.kernel.org

Good day Mathieu,

On 1/24/2019 9:37 PM, Mathieu Poirier wrote:
> Good day Sai,
> 
> On Wed, 23 Jan 2019 at 13:18, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>>
>> Hi Mathieu,
>>
>> On 1/24/2019 12:44 AM, Mathieu Poirier wrote:
>>> On Wed, 23 Jan 2019 at 05:12, Sai Prakash Ranjan
>>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>
>>> That depends on whether the ETMs have been modified at all, something
>>> Suzuki has asked to be clarified.  If ETMs have been modified then we
>>> need to understand how they differ from the driver's implementation.
>>
>> We had asked hardware team for clarification regarding this. Let me
>> poke them again. As for the driver, downstream implementation also
>> uses the same driver, so I am not sure what do you mean by differing
>> from the driver's implementation.
> 
> The driver has been implemented in accordance to ARM's coresight
> technical reference manual and expects the HW to behave in accordance
> to that specification.  Here we want to make sure the IP on your board
> is conformant to the same specification.  If not then the driver needs
> to be made flexible to handle both kind IPs.
> 

The HW does behave as per the specification. As discussed in reply to
Suzuki, Coresight peripherals do use JEP106 ID of ARM for SDM845 and for 
MSM8996, the ID is of QCOM(0x70) since it was not based on any ARM 
derivative.
And the etm4x driver handles it all well. Other values of PID registers
are implementation defined and can be different from standard ARM cpu
core types.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
