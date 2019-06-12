From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Fix multiple thermal zones
 conflict in rk3399.dtsi
Date: Wed, 12 Jun 2019 16:55:28 +0200
Message-ID: <5423af35-9ba0-cf41-88a0-cf3f01777aac@linaro.org>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604165802.7338-1-daniel.lezcano@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, edubezval@gmail.com, manivannan.sadhasivam@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Emil Renner Berthing <kernel@esmil.dk>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infr>
List-Id: devicetree@vger.kernel.org


Hi all,

is there any comment on these two patches?


On 04/06/2019 18:57, Daniel Lezcano wrote:
> Currently the common thermal zones definitions for the rk3399 assumes
> multiple thermal zones are supported by the governors. This is not the
> case and each thermal zone has its own governor instance acting
> individually without collaboration with other governors.
> 
> As the cooling device for the CPU and the GPU thermal zones is the
> same, each governors take different decisions for the same cooling
> device leading to conflicting instructions and an erratic behavior.
> 
> As the cooling-maps is about to become an optional property, let's
> remove the cpu cooling device map from the GPU thermal zone.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 196ac9b78076..e1357e0f60f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -821,15 +821,6 @@
>  					type = "critical";
>  				};
>  			};
> -
> -			cooling-maps {
> -				map0 {
> -					trip = <&gpu_alert0>;
> -					cooling-device =
> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> -				};
> -			};
>  		};
>  	};
>  
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
