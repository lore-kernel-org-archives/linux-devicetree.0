From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v8 3/5] phy: Add QMP phy based UFS phy support for sdm845
Date: Thu, 9 Aug 2018 22:56:35 +0530
Message-ID: <c5ccbdac-8816-2a64-eb29-23e506b5cf7c@codeaurora.org>
References: <20180731100914.19856-1-cang@codeaurora.org>
 <20180731100914.19856-4-cang@codeaurora.org>
 <CAE=gft6cdE+oMYf779VGrQHfYQ5Xb1v+Qr6cAznTtAovehCOxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft6cdE+oMYf779VGrQHfYQ5Xb1v+Qr6cAznTtAovehCOxw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>, cang@codeaurora.org
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Evan,


On 8/9/2018 3:25 AM, Evan Green wrote:
> On Tue, Jul 31, 2018 at 3:09 AM Can Guo <cang@codeaurora.org> wrote:
>> Add UFS PHY support to make SDM845 UFS work with common PHY framework.
>>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 172 +++++++++++++++++++++++++++++++++++-
>>   drivers/phy/qualcomm/phy-qcom-qmp.h |  15 ++++
>>   2 files changed, 186 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 9be9754..de7ff18 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> ...
>>   static void qcom_qmp_phy_configure(void __iomem *base,
>>                                     const unsigned int *regs,
>>                                     const struct qmp_phy_init_tbl tbl[],
>> @@ -1131,6 +1249,14 @@ static int qcom_qmp_phy_init(struct phy *phy)
>>          qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
>>
>>          /*
>> +        * UFS PHY requires the deassert of software reset before serdes start.
>> +        * For UFS PHYs that do not have software reset control bits, defer
>> +        * starting serdes until the power on callback.
>> +        */
> I'm relatively thick when it comes to PHYs, but I'm a little confused.
> The sequence of code right below this (not shown) looks like it is
> deasserting reset before starting serdes, seemingly doing what the
> comment wants. I guess the problem is the lack of SW reset? So then
> you defer serdes start until UFS does... something. Can you explain
> how deferring to after UFS HC init actually helps? Is it the UFS HC
> that releases reset on the PHY?

As you can see in [1], the ufs first asserts the sw_reset, then phy 
initialization is done.
This phy_init() is just programming the phy registers. Now as per the H/W
programming doc, we can't start the phy until we de-assert the sw_reset.
So the sequence as per the programming doc should be:

assert SW_reset --> program phy serdes/tx/rx/pcs registers --> deassert 
SW_reset --> start serdes --> test PCS status

That's the reason that serdes_start has been moved to phy_power_on(), as 
that seemed
a more cleaner way of handling the above sequence.
UFS HC init doesn't help more than this in terms of phy initialization.

>
> I was hoping the next patch would help, but I'm still confused. It
> looks like you've added a call to phy_power_on in
> ufs_qcom_setup_clocks, but there's also one still in
> ufs_qcom_power_up_sequence. What does the original phy_power_on in
> ufs_qcom_power_up_sequence do now? It seems like that one would do the
> power on too early, and then your new added call in
> ufs_qcom_setup_clocks would do nothing.

I think [patch 4/5] of this series handles this. We skip the 
phy_power_on until
we do phy_init.
phy_power_on/off() in setup_clocks() is also used for suspend/resume case
and that's the reason you see couple of phy_power_on(). Patch 4/5 should 
handle
this now.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/ufs/ufs-qcom.c#n268

[snip]

Regards
Vivek
