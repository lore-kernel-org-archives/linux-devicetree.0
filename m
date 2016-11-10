From: wlf <wulf@rock-chips.com>
Subject: Re: [PATCH] phy: rockchip-inno-usb2: correct 480MHz output clock
 stable time
Date: Thu, 10 Nov 2016 10:54:49 +0800
Message-ID: <9eeb3d84-f850-4b76-ce6a-67cc92d6de3b@rock-chips.com>
References: <1478523658-9400-1-git-send-email-wulf@rock-chips.com>
 <CAD=FV=VC15_QAs7+DOoqCeWrU6-qqnUku2SSPFLOvLanu8xL3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VC15_QAs7+DOoqCeWrU6-qqnUku2SSPFLOvLanu8xL3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@google.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Wang <frank.wang@rock-chips.com>, =?UTF-8?B?6buE5rab?= <huangtao@rock-chips.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Matthias Kaehlcke <mka@chromium.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,

在 2016年11月10日 04:54, Doug Anderson 写道:
> Hi,
>
> On Mon, Nov 7, 2016 at 5:00 AM, William Wu <wulf@rock-chips.com> wrote:
>> We found that the system crashed due to 480MHz output clock of
>> USB2 PHY was unstable after clock had been enabled by gpu module.
>>
>> Theoretically, 1 millisecond is a critical value for 480MHz
>> output clock stable time, so we try to change the delay time
>> to 1.2 millisecond to avoid this issue.
>>
>> Signed-off-by: William Wu <wulf@rock-chips.com>
>> ---
>>   drivers/phy/phy-rockchip-inno-usb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
>> index ecfd7d1..8f2d2b6 100644
>> --- a/drivers/phy/phy-rockchip-inno-usb2.c
>> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
>> @@ -267,7 +267,7 @@ static int rockchip_usb2phy_clk480m_enable(struct clk_hw *hw)
>>                          return ret;
>>
>>                  /* waitting for the clk become stable */
>> -               mdelay(1);
>> +               udelay(1200);
> Several people who have seen this patch have expressed concern that a
> 1.2 ms delay is pretty long for something that's supposed to be
> "atomic" like a clk_enable().  Consider that someone might call
> clk_enable() while interrupts are disabled and that a 1.2 ms interrupt
> latency is not so great.
>
> It seems like this clock should be moved to be enabled in "prepare"
> and the "enable" should be a no-op.  This is a functionality change,
> but I don't think there are any real users for this clock at the
> moment so it should be fine.
>
> (of course, the 1 ms latency that existed before this patch was still
> pretty bad, but ...)
Thanks a lot for your suggestion.
I agree with you.  clk_enable() will call spin_lock_irqsave() to disable 
interrupt, and we add
more than 1ms in clk_enable may cause big latency.

And according to clk_prepare() description:
  In a simple case, clk_prepare can be used instead of clk_enable to 
ungate a clk if the
  operation may sleep.  One example is a clk which is accessed over I2c.

So maybe we can remove the clock to clk_prepare.

Hi Heiko, Frank,
        What  do you think of it?

Best regards,
         wulf
>
> -Doug
>
>
>
