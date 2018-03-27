From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 1/6] phy: qcom-qmp: Enable pipe_clk before checking
 USB3 PHY_STATUS
Date: Tue, 27 Mar 2018 12:26:08 +0530
Message-ID: <921929e2-405e-703a-038e-732f8c790a2c@codeaurora.org>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org>
 <1521785487-29866-2-git-send-email-mgautam@codeaurora.org>
 <CAD=FV=V7xDh6fvG12xOV9=WwTDLiuQxdWFr7Bq6wjPJ5gShrVA@mail.gmail.com>
 <8724ae37-5d71-4d5f-f750-da0cb8838f47@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8724ae37-5d71-4d5f-f750-da0cb8838f47@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Varadarajan Narayanan <varada@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, Fengguang Wu <fengguang.wu@intel.com>, anischal@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 3/27/2018 10:37 AM, Manu Gautam wrote:
> Hi Doug,
>
>
> On 3/27/2018 9:56 AM, Doug Anderson wrote:
>> Manu
>>
>> On Thu, Mar 22, 2018 at 11:11 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
>>> QMP PHY for USB mode requires pipe_clk for calibration and PLL lock
>>> to take place. This clock is output from PHY to GCC clock_ctl and then
>>> fed back to QMP PHY and is available from PHY only after PHY is reset
>>> and initialized, hence it can't be enabled too early in initialization
>>> sequence.
>>>
>>> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 33 ++++++++++++++++++++++++++++++++-
>>>   1 file changed, 32 insertions(+), 1 deletion(-)
>> So it's now new with this patch, but it's more obvious with this
>> patch.  It seems like "UFS/PCIE" is kinda broken w/ respect to how it
>> controls its clock.  Specifically:
>>
>> * If you init the PHY but don't power it on, then you "exit" the PHY:
>> you'll disable/unprepare "pipe_clk" even though you never
>> prepare/enabled it.
>>
>> * If you init the PHY, power it on, power it off, power it on, and
>> exit the PHY: you'll leave the clock prepared one extra time.
>>
>> Specifically I'd expect: for UFS/PCIE the disable/unprepare should be
>> symmetric with the enable/prepare and should be in "power off", not in
>> exit.
>>
>> ...or did I miss something?
>>
>>
>> Interestingly, your patch fixes this problem for USB3 (where init/exit
>> are now symmetric), but leaves the problem there for UFS/PCIE.
>>
> Thanks for review.
> One of the reason why pipe_clk is disabled as part of phy_exit is that
> halt_check from clk_disable reports error if called after PHY has been
> powered down or phy_exit.
> I believe that warning should be ignored in qcom gcc-clock driver
> (for applicable platforms) by using BRANCH_HALT_DELAY as halt_check
> for pipe_clk and performing clk_disable from power_off for UFS/PCIE.
UFS doesn't use PIPE clock.
But considering for PCIe, if we disable pipe clock when phy is still 
running, then
it shouldn't be a problem. We should also not see the halt warning as 
the gcc
driver should be able to just turn the gate off.
The reason why it will throw that error is when the parent clock to that 
gate
is gated, i.e. the pipe clock is not flowing on that branch.

Best regards
Vivek

>
> I can implement that as separate patch once dependent gcc driver
> patch(es) gets in. Would that be ok?
>
> -Manu
>
