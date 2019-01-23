From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Wed, 23 Jan 2019 17:41:57 +0530
Message-ID: <5b54c6e0-7d22-ecee-486f-31333f49f84a@codeaurora.org>
References: <cover.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <ad16cfb9b6f5efb85149458d5f5a1abf43fa027c.1548133311.git.saiprakash.ranjan@codeaurora.org>
 <1bd39862-0725-70ce-6535-fdb59569f683@arm.com>
 <75ed74af-6946-b86d-092e-42dc16e55308@codeaurora.org>
 <91a90daa-9e14-2d2e-e633-2ddfdc0955bf@arm.com>
 <3906faf1-abbd-9c28-ad55-ed3800f06352@codeaurora.org>
 <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c03b63bf-aca8-ea46-70ad-ee4558f0319e@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, john.horley@arm.com
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 1/23/2019 1:42 AM, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 01/22/2019 04:48 PM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>>
[..]
>>
>> SDM845 has 4 Kryo 385 Gold (ARM A75) + 4 Kryo 385 Silver (ARM A55),
>> so the PID values should be same for 4 ETMs atleast. But here one
>> pid value(001bb803) is same for 6 ETMs and other one for 2
>> ETMs(001bb802) which seems odd and hence the doubt if these pids
>> are even valid ones.
> 
> Have you checked other SoCs with A55 for the ETM PID ? The drivers
> usually only care about PID0[7-0], PID1[7-0], PID2[3-0] and ignores
> the other fields that may change over revisions of the core. So, in your
> case the ETM ID could be treated as 0xbb802 and 0xbb803.
> 

Very sorry to have mislead you here. I checked again today on SDM845 and 
as you said 4 ETMs based on A75 has 0xbb803 and other 4 ETMs based on
A55 has 0Xbb803. I wrongly mentioned it as 6 and 2.

[    6.688809] resname=etm@7040000 pid = 0x1bb803
[    6.694957]
[    6.694957] resname=etm@7140000 pid = 0x1bb803
[    6.701135]
[    6.701135] resname=etm@7240000 pid = 0x1bb803
[    6.707256]
[    6.707256] resname=etm@7340000 pid = 0x1bb803
[    6.713454]
[    6.713454] resname=etm@7440000 pid = 0x1bb802
[    6.719621]
[    6.719621] resname=etm@7540000 pid = 0x1bb802
[    6.725814]
[    6.725814] resname=etm@7640000 pid = 0x1bb802
[    6.731971]
[    6.731971] resname=etm@7740000 pid = 0x1bb802

So is it ok to add these to table as below in etm4x driver with the
following comment since these do not exactly match A75 and A55 PIDs
which you provided? Or any other way you prefer?

@@ -1079,6 +1079,10 @@ static const struct amba_id etm4_ids[] = {
         ETM4x_AMBA_ID(0x000bb95a),              /* Cortex-A72 */
         ETM4x_AMBA_ID(0x000bb959),              /* Cortex-A73 */
         ETM4x_AMBA_ID(0x000bb9da),              /* Cortex-A35 */
+       ETM4x_AMBA_ID(0x000f0211),              /* Qualcomm Kryo */
+       ETM4x_AMBA_ID(0x000f0205),              /* Qualcomm Kryo */
+       ETM4x_AMBA_ID(0x000bb803),              /* Qualcomm Kryo 385 
Cortex-A75 */
+       ETM4x_AMBA_ID(0x000bb802),              /* Qualcomm Kryo 385 
Cortex-A55 */
         {},
  };

For msm8996, cpu debug module pid returned is same as ETM
which is causing the probe failure for cpu debug coresight module
as shown in below logs.
For this case, I tried adding these ids to cpu debug driver, but it
splits some errors (coresight-cpu-debug: probe of 3840000.etm failed 
with error -16) since the ids are same. Can we override for this case
or there is something else we can do here?

[    5.480629] resname=debug@3810000 pid = 0x102f0211
[    5.480920] OF: graph: no port node found in /soc/debug@3810000
[    5.513214] coresight-etm4x: probe of 3810000.debug failed with error -22
[    5.524362]
[    5.524362] resname=debug@3910000 pid = 0x102f0211
[    5.524888] OF: graph: no port node found in /soc/debug@3910000
[    5.537586] coresight-etm4x: probe of 3910000.debug failed with error -22
[    5.541481]
[    5.549643] resname=debug@3a10000 pid = 0x102f0205
[    5.580990] OF: graph: no port node found in /soc/debug@3a10000
[    5.586817] coresight-etm4x: probe of 3a10000.debug failed with error -22
[    5.592082]
[    5.592629] resname=debug@3b10000 pid = 0x102f0205
[    5.604922] OF: graph: no port node found in /soc/debug@3b10000
[    5.611234] coresight-etm4x: probe of 3b10000.debug failed with error -22


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
