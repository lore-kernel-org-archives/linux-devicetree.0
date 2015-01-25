From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2] clockevents: rockchip: Add rockchip timer for rk3288
Date: Sun, 25 Jan 2015 22:16:10 +0100
Message-ID: <54C55D1A.9010706@linaro.org>
References: <1422178979-12382-1-git-send-email-daniel.lezcano@linaro.org> <2285293.ZBcGIuxxDo@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2285293.ZBcGIuxxDo@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/25/2015 09:52 PM, Heiko St=C3=BCbner wrote:
> Hi Daniel,
>
> one big request and some more style nitpicks :-)
>
> With the nitpicks fixed
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>
> Before applying this patch could you drop the rk3288.dtsi change plea=
se?
> Instead I'd like to add the following patch separately to _my_ device=
tree
> branch for 3.20.
>
> I already wasn't fast enough to prevent the ethernet controller chang=
es
> going through the network tree and would like to prevent a third tree=
 sending
> changes for the same dts area to Linus - merge conflicts and all.
>
>
> I don't think that neither the nitpicks nor dropping the dtsi segment=
 need
> another submission though.

Hi Heiko,

I removed the dtsi change, fixed the spaces indentation and pushed in m=
y=20
tree the driver [1]

Thanks the review

   -- Daniel

[1] http://git.linaro.org/people/daniel.lezcano/linux.git clockevents/3=
=2E20


> ----- 8< -----------
> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> Date: Sun, 25 Jan 2015 10:42:59 +0100
> Subject: [PATCH] ARM: dts: rockchip: Add rockchip timer node for rk32=
88
>
> The rk3288 board uses the architected timers and these ones are shutd=
own when
> the cpu is powered down. There is a need of a broadcast timer in this=
 case to
> ensure proper wakeup when the cpus are in sleep mode and a timer expi=
res.
>
> Add the timer node for the broadcast timer.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/arm/boot/dts/rk3288.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288=
=2Edtsi
> index c7235fa..37847c1 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -149,6 +149,14 @@
>   		clock-frequency =3D <24000000>;
>   	};
>
> +	timer: timer@ff810000 {
> +		compatible =3D "rockchip,rk3288-timer";
> +		reg =3D <0xff810000 0x20>;
> +		interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&xin24m>, <&cru PCLK_TIMER>;
> +		clock-names =3D "timer", "pclk";
> +	};
> +
>   	display-subsystem {
>   		compatible =3D "rockchip,display-subsystem";
>   		ports =3D <&vopl_out>, <&vopb_out>;
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
