From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: disable GPU 500 MHz OPP for veyron
Date: Wed, 22 May 2019 11:14:29 +0200
Message-ID: <3108277.JP5bvJISVS@phil>
References: <20190520220051.54847-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520220051.54847-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 21. Mai 2019, 00:00:49 CEST schrieb Matthias Kaehlcke:
> The NPLL is the only safe way to generate 500 MHz for the GPU. The
> downstream Chrome OS 3.14 kernel ('official' kernel for veyron
> devices) re-purposes NPLL to HDMI and hence disables the OPP for
> the GPU (see https://crrev.com/c/1574579). Disable it here as well
> to keep in sync and avoid problems in case someone decides to
> re-purpose NPLL.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

I was actually expecting to just drop the 500MHz opp from all
of rk3288 ;-) .

To not have to respin, I just modified your patch accordingly,
see [0] and please holler if you disagree :-D .

Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=75481833c6dbab4c29d15452f6b4337c16f5407b


> ---
> Changes in v2:
> - patch added to the series
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
> index 90c8312d01ff..ec10ce4fcf04 100644
> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
> @@ -174,6 +174,14 @@
>  	temperature = <100000>;
>  };
>  
> +/*
> + * Remove 500 MHz since the only way to make 500 MHz is via the NPLL
> + * which might be used for HDMI.
> + */
> +&gpu_opp_table {
> +	/delete-node/ opp-500000000;
> +};
> +
>  &hdmi {
>  	ddc-i2c-bus = <&i2c5>;
>  	status = "okay";
> 
