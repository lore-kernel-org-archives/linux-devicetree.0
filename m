From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Tue, 22 Jan 2019 22:18:31 +0530
Message-ID: <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
 <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 1/22/2019 9:38 PM, Suzuki K Poulose wrote:
> 
> By inconsistent, I meant the registers provides values which are not
> the same on two different CPUs of the *same type*. And it is expected
> that two different CPU/ETM implementations will have different PIDs.
> 

SDM845 has 4 Kryo 385 Gold (ARM A75) + 4 Kryo 385 Silver (ARM A55),
so the PID values should be same for 4 ETMs atleast. But here one
pid value(001bb803) is same for 6 ETMs and other one for 2
ETMs(001bb802) which seems odd and hence the doubt if these pids
are even valid ones.

>>
>> Below are the PIDs read for SDM845:
>>
>> [    5.996448] resname=etm@7040000 pid=001bb803
>> [    6.052891] resname=etm@7140000 pid=001bb803
>>
>> <snip> .. (Same pid=001bb803 for etm@7240000 to etm@7540000 but differs
>> for other 2 cpus as shown below)
>>
>> [    6.266687] resname=etm@7640000 pid=001bb802
>> [    6.329171] resname=etm@7740000 pid=001bb802
>>
>> This is the case for MSM8996 also as shown below where PID
>> value is not correct and has to be hardcoded.
> 
> They differ because they are two different types of CPU cores (and thus 
> different ETM PIDs). What does the Register descriptions say for
> the Cores ?
> 
> To me it looks like there are two different types of Qualcomm
> Cores with their respective ETMs which are missing in the ETM4x
> driver and we are trying to "make the ETM" work by faking it as
> something else, which is not nice. I would rather prefer
> to add the appropriate masks and the expected value for these
> two different ETM implementations and be done with it, instead
> of faking it in all the DTs where these cores appear.
> 

ETM4x driver does not have entries for A55 and A75. Could you please
let me know the PIDs for these CPUs so that we can compare?

>>
>> For MSM8996:
>>
>> resname=etm@3b40000 pid=102f0205
> 
> I don't know what CPUs the MSM8996 have. If they don't have A53, you
> must add the actual PIDs to the table once and for all.
> 

But again, this PID is some invalid value. And does not correspond
to any of the ARM CPU cores and would be MSM8996 specific.
MSM8996 has 2+2 Kryo cores which are not ARM derivative as SDM845
if I am right.

>>
>>>> +        etm@7040000 {
>>>> +            compatible = "arm,coresight-etm4x", "arm,primecell";
>>>> +            arm,primecell-periphid = <0x000bb95d> > +            
>>>> reg = <0 0x07040000 0 0x1000>;
>>>> +
>>>> +            cpu = <&CPU0>;
>>>> +
>>>
>>> You seem to be specifying the PID of A53 ETM all over, while at least
>>> one of your cores is ETMv4.2 (from the other patch) and A53 is not
>>> ETMv4.2. As above, it would be good to add the PID to the table.
>>>
>>
>> As explained in above comment, PID values read are not correct. Please 
>> let me know if I am not clear.
> 
> There is no measure for "correctness" here. If the ETM exposes different
> PID than what you expect from the TRM, then we could think of overriding
> it. Otherwise please add the PIDs to the table.
> 

This is exactly the case, ETM PID registers are exposing some invalid
value and hence we override in DT.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
