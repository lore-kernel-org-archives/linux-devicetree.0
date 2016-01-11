From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v2 03/12] ARM: dts: rockchip: override the clocks in i2s
 for kylin board
Date: Mon, 11 Jan 2016 21:38:30 +0800
Message-ID: <5693B056.7010507@gmail.com>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
 <1452155155-16232-4-git-send-email-wxt@rock-chips.com>
 <1878139.nbddSBf70A@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1878139.nbddSBf70A@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, leecam@google.com, linux-arm-kernel@lists.infradead.org, keescook@google.com, leozwang@google.com
List-Id: devicetree@vger.kernel.org

Heiko,

=E5=9C=A8 2016=E5=B9=B401=E6=9C=8809=E6=97=A5 10:31, Heiko Stuebner =E5=
=86=99=E9=81=93:
> Hi Caesar,
>
> Am Donnerstag, 7. Januar 2016, 16:25:46 schrieb Caesar Wang:
>> The sysclk seems be incorrect since we use the simple card for kylin
>> board.
>>
>> The simple card call:
>>
>> asoc_simple_card_probe ->
>>   asoc_simple_card_dai_link_of ->
>>    asoc_simple_card_sub_parse_of ->
>> ...
>> clk =3D of_clk_get(args.np, 0);
>> if (!IS_ERR(clk))
>> dai->sysclk =3D clk_get_rate(clk);
>>
>> The sysclk come from the first clock, then first clock is hclk_i2s
>> in i2s for rk3036 dtsi.
>> So, we can override the clocks to fit the simple card in here.
> It's not that effective, doing that change on a per-board level - as =
it
> would possibly need to be repeated for future boards.
> The i2s driver doesn't care, as it uses named clocks, so I instead di=
d
> the swap in the rk3036.dtsi for all boards. Can you check if that is =
ok
> for you or if I did overlook something?

That's okay for me.

>
> Thanks
> Heiko
>
> ------- 8< -------
> Subject: [PATCH] ARM: dts: rockchip: swap i2s clock ordering on rk303=
6
>
> For sound setups using the simple-card mechanism, the main clock
> (sysclk) is expected to be the first element. For the i2s-driver
> itself it doesn't matter, as it uses named clocks, so we can just
> swap them.
>
> Reported-by: Caesar Wang <wxt@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/arm/boot/dts/rk3036.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036=
=2Edtsi
> index 8f1bb0f..ee457a2 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -241,8 +241,8 @@
>   		interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
>   		#address-cells =3D <1>;
>   		#size-cells =3D <0>;
> -		clock-names =3D "i2s_hclk", "i2s_clk";
> -		clocks =3D <&cru HCLK_I2S>, <&cru SCLK_I2S>;
> +		clock-names =3D "i2s_clk", "i2s_hclk";
> +		clocks =3D <&cru SCLK_I2S>, <&cru HCLK_I2S>;
>   		dmas =3D <&pdma 0>, <&pdma 1>;
>   		dma-names =3D "tx", "rx";
>   		pinctrl-names =3D "default";


--=20
Thanks,
Caesar
