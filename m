From: "elaine.zhang" <zhangqing@rock-chips.com>
Subject: Re: [PATCH 4/5] ARM: dts: rockchip: vcc33_ccd off in suspend for
 rk3288-veyron-chromebook
Date: Fri, 12 Apr 2019 09:53:57 +0800
Message-ID: <d032d8b2-3b21-03f2-ecad-fc0889f6011b@rock-chips.com>
References: <20190411232157.55125-1-dianders@chromium.org>
 <20190411232157.55125-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-4-dianders@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

hi,

ÔÚ 2019/4/12 ÉÏÎç7:21, Douglas Anderson Ð´µÀ:
> As per my comments when the device tree for rk3288-veyron-chromebook
> first landed:
>
>> Technically I think vcc33_ccd can be off since we have
>> 'needs-reset-on-resume' down in the EHCI port (this regulator is for
>> the USB webcam that's connected to the EHCI port).
>>
>>   ...but leaving it on for now seems fine until we get suspend/resume
>> more solid.
> It's probably about time to do it right.
>
> [1] https://lore.kernel.org/linux-arm-kernel/CAD=FV=U37Yx8Mqk75_x05zxonvdc3qRMhqp8TyTDPWGHqSuRqg@mail.gmail.com/
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> index b9cc90f0f25c..fbef34578100 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> @@ -176,8 +176,7 @@
>   			regulator-min-microvolt = <3300000>;
>   			regulator-max-microvolt = <3300000>;
>   			regulator-state-mem {
> -				regulator-on-in-suspend;
> -				regulator-suspend-microvolt = <3300000>;
> +				regulator-off-in-suspend;
>   			};
>   		};
>   	};

Reviewed-by: Elaine Zhang<zhangqing@rock-chips.com>
