From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: sun9i: Switch to the AC100
 RTC clock outputs for osc32k
Date: Tue, 16 Aug 2016 15:20:17 +0800
Message-ID: <CAGb2v66kLO2RnAyzasuqDbJXYZhcH0pBKraE3MUEJzb6hsEoTg@mail.gmail.com>
References: <1467988422-17934-1-git-send-email-wens@csie.org>
 <1467988422-17934-8-git-send-email-wens@csie.org> <20160711065042.GC4589@lukather>
 <CAGb2v66OhH=C5CqB56jN=T4c8TDgyuC=F0689d7=GBhy_rEonA@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBBSP5ZK6QKGQEGMCU6NI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66OhH=C5CqB56jN=T4c8TDgyuC=F0689d7=GBhy_rEonA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 10:02 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Mon, Jul 11, 2016 at 2:50 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> Hi,
>>
>> On Fri, Jul 08, 2016 at 10:33:42PM +0800, Chen-Yu Tsai wrote:
>>> The 32.768 kHz clock inside the A80 SoC is fed from an external source,
>>> typically the AC100 RTC module.
>>>
>>> Make the osc32k placeholder a fixed-factor clock so board dts files can
>>> specify its source.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>> ---
>>> Changes since v4: none
>>> Changes since v3: none
>>> Changes since v2: none
>>> Changes since v1: none
>>> ---
>>>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 5 +++++
>>>  arch/arm/boot/dts/sun9i-a80-optimus.dts     | 5 +++++
>>>  arch/arm/boot/dts/sun9i-a80.dtsi            | 9 +++------
>>>  3 files changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>>> index cf2f4b72a841..04b014603659 100644
>>> --- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>>> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>>> @@ -103,6 +103,11 @@
>>>       allwinner,drive = <SUN4I_PINCTRL_40_MA>;
>>>  };
>>>
>>> +&osc32k {
>>> +     /* osc32k input is from AC100 */
>>> +     clocks = <&ac100_rtc 0>;
>>> +};
>>> +
>>
>> I'm guessing that an unresolved dependency when the driver has not
>> loaded yet, or is not even compiled ?
>>
>> How is it working then?
>
> I assume the clk framework will leave it unresolved and unusable.
> Also it seems that none of existing clks use it as a parent by
> default. I will need to check the remaining unimplemented ones
> though.

On the latest sunxi-next kernel, one clock is clocked from osc32k, which
becomes an orphaned clock:

   clock                         enable_cnt  prepare_cnt        rate
accuracy   phase
----------------------------------------------------------------------------------------
 osc24M                                   6            6    24000000
       0 0
    r_ir                                  1            1     8000000
       0 0
 r_1wire                                  0            0           0
       0 0

r_ir is clocked from osc32k by default, but the clk_set_rate call in the
IR driver seems to forces it to reparent to the working osc24M clock.

So I think we're good here. Can you merge the 3 remaining dts patches?

Thanks
ChenYu

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
