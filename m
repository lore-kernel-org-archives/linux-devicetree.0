From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3 3/4] coresight: etm4x: Add support to enable ETMv4.2
Date: Tue, 22 Jan 2019 19:13:04 +0530
Message-ID: <6824138d-fa5f-0bec-d5f7-9c10d9a40948@codeaurora.org>
References: <cover.1547813804.git.saiprakash.ranjan@codeaurora.org>
 <d52546764f8570e8c07ac8e3e2841e087e66648c.1547813804.git.saiprakash.ranjan@codeaurora.org>
 <cc71cfa9-8a11-9356-ac41-e27564a9f7b4@codeaurora.org>
 <20190121184831.GB14049@xps15>
 <CANLsYkw5h+-fWhiit+kNJHnGPF__Bz1MHc94sG=WOyfTPHi_NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkw5h+-fWhiit+kNJHnGPF__Bz1MHc94sG=WOyfTPHi_NQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/22/2019 3:07 AM, Mathieu Poirier wrote:
> On Mon, 21 Jan 2019 at 11:48, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>>
>> On Mon, Jan 21, 2019 at 04:18:36PM +0530, Vivek Gautam wrote:
>>>
>>> On 1/18/2019 5:52 PM, Sai Prakash Ranjan wrote:
>>>> SDM845 has ETMv4.2 and can use the existing etm4x driver.
>>>> But the current etm driver checks only for ETMv4.0 and
>>>> errors out for other etm4x versions. This patch adds this
>>>> missing support to enable SoC's with ETMv4x to use same
>>>> driver by checking only the ETM architecture major version
>>>> number.
>>>>
>>>> Without this change, we get below error during etm probe:
>>>>
>>>> / # dmesg | grep etm
>>>> [    6.660093] coresight-etm4x: probe of 7040000.etm failed with error -22
>>>> [    6.666902] coresight-etm4x: probe of 7140000.etm failed with error -22
>>>> [    6.673708] coresight-etm4x: probe of 7240000.etm failed with error -22
>>>> [    6.680511] coresight-etm4x: probe of 7340000.etm failed with error -22
>>>> [    6.687313] coresight-etm4x: probe of 7440000.etm failed with error -22
>>>> [    6.694113] coresight-etm4x: probe of 7540000.etm failed with error -22
>>>> [    6.700914] coresight-etm4x: probe of 7640000.etm failed with error -22
>>>> [    6.707717] coresight-etm4x: probe of 7740000.etm failed with error -22
>>>>
>>>> With this change, etm probe is successful:
>>>>
>>>> / # dmesg | grep coresight
>>>> [    6.659198] coresight-etm4x 7040000.etm: CPU0: ETM v4.2 initialized
>>>> [    6.665848] coresight-etm4x 7140000.etm: CPU1: ETM v4.2 initialized
>>>> [    6.672493] coresight-etm4x 7240000.etm: CPU2: ETM v4.2 initialized
>>>> [    6.679129] coresight-etm4x 7340000.etm: CPU3: ETM v4.2 initialized
>>>> [    6.685770] coresight-etm4x 7440000.etm: CPU4: ETM v4.2 initialized
>>>> [    6.692403] coresight-etm4x 7540000.etm: CPU5: ETM v4.2 initialized
>>>> [    6.699024] coresight-etm4x 7640000.etm: CPU6: ETM v4.2 initialized
>>>> [    6.705646] coresight-etm4x 7740000.etm: CPU7: ETM v4.2 initialized
>>>>
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> ---
>>>>    drivers/hwtracing/coresight/coresight-etm4x.c | 2 +-
>>>>    drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> index 53e2fb6e86f6..93d5f1f3145e 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> @@ -55,7 +55,7 @@ static void etm4_os_unlock(struct etmv4_drvdata *drvdata)
>>>>    static bool etm4_arch_supported(u8 arch)
>>>>    {
>>>> -   switch (arch) {
>>>> +   switch (arch >> 4) {
>>>
>>>
>>> While this looks good, from what it looks like arch is a combination of
>>> major version
>>> minor version. So, will it be better to masks, and shifts macros instead of
>>> a magic
>>> number shift.
>>> But, frankly it's upto Mathieu to decide the readability of this. So, I
>>> leave it to him.
>>
>> The layout of the architecture is already well defined in etm4_init_arch_data()
>> [1].  As such just doing the following would be fine with me:
>>
>>          /* Mask out the minor version nuber */
>>          switch (arch & 0xf) {
> 
> s/0xf/0xf0
> 
> Apologies for the confusion.
> 

Thanks Mathieu, made this change in v4 of this series.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
