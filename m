From: Vishnu Patekar <vishnupatekar0510@gmail.com>
Subject: Re: [PATCH 1/4] ARM: sunxi: Introduce Allwinner for A83T support
Date: Thu, 24 Sep 2015 18:52:37 +0800
Message-ID: <CAEzqOZv_L3A7kpKqNQnHjL6Wb1Lzw6dSU4Qy52yJVf2h1QmcLA@mail.gmail.com>
References: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
 <1442936337-3104-2-git-send-email-vishnupatekar0510@gmail.com> <CAGb2v665FhnSoWYGJn+Tf79F7pZitYBrEOmAts4nVoUWb-uBqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAGb2v665FhnSoWYGJn+Tf79F7pZitYBrEOmAts4nVoUWb-uBqg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Linus Walleij <linus.walleij@linaro.org>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Sep 22, 2015 at 11:47 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Tue, Sep 22, 2015 at 11:38 PM, Vishnu Patekar
> <vishnupatekar0510@gmail.com> wrote:
>> Allwinner A83T is octa-core cortex-a7 based SoC.
>> It's clock control unit and prcm, pinmux are different from previous sun8i
>> series.
>> Its processor cores are arragned in two clusters 4 cores each,
>> similar to A80.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>>  drivers/clk/sunxi/clk-sunxi.c                   | 6 ++++++
>>  3 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
>> index 67da205..cf5ed27 100644
>> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> @@ -11,4 +11,5 @@ using one of the following compatible strings:
>>    allwinner,sun8i-a23
>>    allwinner,sun8i-a33
>>    allwinner,sun8i-h3
>> +  allwinner,sun8i-a83t
>
> Alphabetic order please.
Okie, I'll correct.
>
>>    allwinner,sun9i-a80
>> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
>> index 65bab28..b04aefa 100644
>> --- a/arch/arm/mach-sunxi/sunxi.c
>> +++ b/arch/arm/mach-sunxi/sunxi.c
>> @@ -69,6 +69,7 @@ static const char * const sun8i_board_dt_compat[] = {
>>         "allwinner,sun8i-a23",
>>         "allwinner,sun8i-a33",
>>         "allwinner,sun8i-h3",
>> +       "allwinner,sun8i-a83t",
>
> Same here.
>
>>         NULL,
>>  };
>>
>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> index 413070d..f216d5d 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
>> @@ -1212,6 +1212,12 @@ CLK_OF_DECLARE(sun6i_a31s_clk_init, "allwinner,sun6i-a31s", sun6i_init_clocks);
>>  CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clocks);
>>  CLK_OF_DECLARE(sun8i_a33_clk_init, "allwinner,sun8i-a33", sun6i_init_clocks);
>>
>> +static void __init sun8ia83t_init_clocks(struct device_node *node)
>> +{
>> +       sunxi_init_clocks(NULL, 0);
>> +}
>> +CLK_OF_DECLARE(sun9i_a83t_clk_init, "allwinner,sun8i-a83t", sun8ia83t_init_clocks);
>
> sun8i? Missing underscore too.
Sorry, yes, sun8i. will add _.
>
> I think you should add this once you actually have clock support.
> Otherwise this call basically does nothing.
>
>> +
>>  static void __init sun9i_init_clocks(struct device_node *node)
>>  {
>>         sunxi_init_clocks(NULL, 0);
>
> On the side, I will send patches to remove sun9i_init_clocks.
>
>
> Regards
> ChenYu
Thanks for review.
