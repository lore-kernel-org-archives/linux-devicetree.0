From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: sun8i: a83t: Add device node for
 DMA controller
Date: Mon, 22 May 2017 15:20:36 +0800
Message-ID: <CAGb2v66fHr4uiDfO2dF-ER1fFoxfah4cmiPbsM2VOWkdo_+VuQ@mail.gmail.com>
References: <20170522062552.19026-1-wens@csie.org> <20170522062552.19026-5-wens@csie.org>
 <CAEKpxB=daPuD0YNToTiEzcD0VAUjVen0nTDY0BhkLfQzcLFoTw@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBXFCRLEQKGQEHBUIQHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAEKpxB=daPuD0YNToTiEzcD0VAUjVen0nTDY0BhkLfQzcLFoTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 22, 2017 at 3:18 PM, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 22 May 2017 at 08:25, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> The A83T SoC has a DMA controller that supports 8 DMA channels
>> to and from various peripherals.
>>
>> Add a device node for it.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-a83t.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> index e12dd7170b8f..47196feda26b 100644
>> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> @@ -163,6 +163,15 @@
>>                 #size-cells = <1>;
>>                 ranges;
>>
>> +               dma: dma-controller@1c02000 {
>> +                       compatible = "allwinner,sun8i-a83t-dma";
>> +                       reg = <0x01c02000 0x1000>;
>> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&ccu 21>;
>> +                       resets = <&ccu 7>;
> Hi Wens,
> these should be ccu defines, otherwise everything else looks great.

Correct. Since the CCU bindings was just introduced, I'm saving all the macros
for v4.13-rc2.

ChenYu

> Great Work,
> CK
>> +                       #dma-cells = <1>;
>> +               };
>> +
>>                 ccu: clock@1c20000 {
>>                         compatible = "allwinner,sun8i-a83t-ccu";
>>                         reg = <0x01c20000 0x400>;
>> --
>> 2.11.0
>>
>> --
>> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.
