From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Limit WiFi TX power on rk3288-veyron-jerry
Date: Thu, 25 Jul 2019 22:23:04 +0200
Message-ID: <2130412.AuREfPFnmH@phil>
References: <20190723225258.93058-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723225258.93058-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 24. Juli 2019, 00:52:58 CEST schrieb Matthias Kaehlcke:
> The downstream Chrome OS 3.14 kernel for jerry limits WiFi TX power
> through calibration data in the device tree [1]. Add a DT node for
> the WiFi chip and use the downstream calibration data.
> 
> Not all calibration data entries have the length specified in the
> binding (Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt),
> however this is the data used by the downstream ('official') kernel
> and the binding mentions that "the length can vary between hw
> versions".
> 
> [1] https://crrev.com/c/271237
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts | 147 ++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> index b1613af83d5d..2d0d5a4603ba 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> @@ -82,6 +82,153 @@
>  	};
>  };
>  
> +&sdio0 {

added #address-cells = <1> and #size-cells = <0> here
as it was creating dtc warnings due to the reg=1 below

> +	mwifiex: wifi@1 {
> +		compatible = "marvell,sd8897";
> +		reg = <1>;
> +		status = "okay";

dropped status ... okay is the default and the wifi node only was
added to this board, not before.

and applied for 5.4

Thanks
Heiko
