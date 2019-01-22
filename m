From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Tue, 22 Jan 2019 16:08:40 +0000
Message-ID: <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
 <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sai,

On 01/22/2019 03:02 PM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> Thanks for looking into this. Please find my response inline.
> 
> On 1/22/2019 7:30 PM, Suzuki K Poulose wrote:
>> Hi Sai,
>>
>> On 01/22/2019 01:37 PM, Sai Prakash Ranjan wrote:
>>> Add coresight components found on Qualcomm SDM845 SoC.
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>
>>
>> Sorry, but I hadn't noticed the PID override strings below. Please
>> find the question.
>>
> [..]
> 
>>> +        /*
>>> +         * On QCOM SDM845, we bypass the normal AMBA bus discovery
>>> +         * method by forcing the peripheral ID because of the wrong
>>> +         * value read from ETM PID registers.
>>> +         */
>>
>> What is the value read back from the ETM PIDx registers ? Do they
>> provide inconsistent or incompatible value w.r.t the ETM/Coresight
>> architecture ? If it is an unsupported CPU with proper values,
>> you must add them to the table in etm4x driver.
>>
> 
> The values read from ETM PIDx registers are actually inconsistent
> and is different for some ETMs.

By inconsistent, I meant the registers provides values which are not
the same on two different CPUs of the *same type*. And it is expected
that two different CPU/ETM implementations will have different PIDs.

> 
> Below are the PIDs read for SDM845:
> 
> [    5.996448] resname=etm@7040000 pid=001bb803
> [    6.052891] resname=etm@7140000 pid=001bb803
> 
> <snip> .. (Same pid=001bb803 for etm@7240000 to etm@7540000 but differs
> for other 2 cpus as shown below)
> 
> [    6.266687] resname=etm@7640000 pid=001bb802
> [    6.329171] resname=etm@7740000 pid=001bb802
> 
> This is the case for MSM8996 also as shown below where PID
> value is not correct and has to be hardcoded.

They differ because they are two different types of CPU cores (and thus 
different ETM PIDs). What does the Register descriptions say for
the Cores ?

To me it looks like there are two different types of Qualcomm
Cores with their respective ETMs which are missing in the ETM4x
driver and we are trying to "make the ETM" work by faking it as
something else, which is not nice. I would rather prefer
to add the appropriate masks and the expected value for these
two different ETM implementations and be done with it, instead
of faking it in all the DTs where these cores appear.

> 
> For MSM8996:
> 
> resname=etm@3b40000 pid=102f0205

I don't know what CPUs the MSM8996 have. If they don't have A53, you
must add the actual PIDs to the table once and for all.

> 
>>> +        etm@7040000 {
>>> +            compatible = "arm,coresight-etm4x", "arm,primecell";
>>> +            arm,primecell-periphid = <0x000bb95d> > +            reg 
>>> = <0 0x07040000 0 0x1000>;
>>> +
>>> +            cpu = <&CPU0>;
>>> +
>>
>> You seem to be specifying the PID of A53 ETM all over, while at least
>> one of your cores is ETMv4.2 (from the other patch) and A53 is not
>> ETMv4.2. As above, it would be good to add the PID to the table.
>>
> 
> As explained in above comment, PID values read are not correct. Please 
> let me know if I am not clear.

There is no measure for "correctness" here. If the ETM exposes different
PID than what you expect from the TRM, then we could think of overriding
it. Otherwise please add the PIDs to the table.

Cheers
Suzuki
