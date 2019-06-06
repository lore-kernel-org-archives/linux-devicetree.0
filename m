From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Split GPIO keys for veyron into multiple devices
Date: Thu, 06 Jun 2019 12:44:34 +0200
Message-ID: <3394571.LkITImzWxP@phil>
References: <20190605204320.22343-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605204320.22343-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. Juni 2019, 22:43:19 CEST schrieb Matthias Kaehlcke:
> With a single device DT overrides can become messy, especially when
> keys are added or removed. Multiple devices also allow to
> enable/disable wakeup per key/group.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.3 with 2 minor changes, detailed below.

> ---
>  .../boot/dts/rk3288-veyron-chromebook.dtsi    | 26 +++++++------
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts    | 38 ++++++++++---------
>  arch/arm/boot/dts/rk3288-veyron-pinky.dts     |  2 +-
>  arch/arm/boot/dts/rk3288-veyron.dtsi          |  4 +-
>  4 files changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> index fbef34578100..c5f71af84a40 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> @@ -70,6 +70,20 @@
>  		pinctrl-0 = <&ac_present_ap>;
>  	};
>  
> +	lid_switch: lid-switch {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ap_lid_int_l>;

added a blank line here

> +		lid {
> +			label = "Lid";
> +			gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +			linux,code = <0>; /* SW_LID */
> +			linux,input-type = <5>; /* EV_SW */

actually used the constants in the properties, we have the keycodes as
dt-binding header nowadays.


Heiko
