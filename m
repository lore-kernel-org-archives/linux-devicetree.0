From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: ux500: fix I2C4 clock bit
Date: Fri, 18 Oct 2013 13:30:40 +0200
Message-ID: <CACRpkdYwndBD7dAVC6EitOQ4HHVoP1fhmVztV5g78bLQoeOiqg@mail.gmail.com>
References: <1382087123-31702-1-git-send-email-linus.walleij@linaro.org>
	<20131018110314.GV19112@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131018110314.GV19112@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 18, 2013 at 1:03 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 18 Oct 2013, Linus Walleij wrote:
>
>> The PCLK for I2C4 is controlled by bit 10 in the PCKEN registers
>> while the KCLK is controlled by bit 9 on the KCKEN, it's
>> one of these odd assymetric things. Correct the PCLK bit to 10.
>>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/ste-dbx5x0.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> index 5112f4c..b7d1738 100644
>> --- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> +++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
>> @@ -694,7 +694,7 @@
>>
>>                       clock-frequency = <400000>;
>>
>> -                     clocks = <&prcc_kclk 1 9>, <&prcc_pclk 1 9>;
>> +                     clocks = <&prcc_kclk 1 10>, <&prcc_pclk 1 9>;
>>                       clock-names = "i2cclk", "apb_pclk";
>>               };
>>
>
> NACK: Bit 10 is MSP1

You mean MSP3?

>         clk = clk_reg_prcc_kclk("p1_i2c4_kclk", "i2cclk",
>                         clkrst1_base, BIT(9), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.4");
>         PRCC_KCLK_STORE(clk, 1, 9);
>
>         clk = clk_reg_prcc_kclk("p1_msp3_kclk", "msp1clk",
>                         clkrst1_base, BIT(10), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp3");
>         clk_register_clkdev(clk, NULL, "ux500-msp-i2s.3");
>         PRCC_KCLK_STORE(clk, 1, 10);

This does not correspond to the datasheet, which says MSP3
is at bit 11. Oh that is *another* assymetric thing.

I'll make a combined
patch that fix both things and double-check with the older
clock framework so we get this 100% right.

Ulf: any hints?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
