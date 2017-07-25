From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: mark the clock controller also
 as reset controller
Date: Tue, 25 Jul 2017 09:58:49 +0200
Message-ID: <5976FA39.6070803@baylibre.com>
References: <20170722185807.10504-1-martin.blumenstingl@googlemail.com> <20170722185807.10504-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170722185807.10504-4-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, jbrunet@baylibre.com, linux-clk@vger.kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org



Le 22/07/2017 20:58, Martin Blumenstingl a écrit :
> The clock controller provides a few reset lines as well. Add the
> #reset-cells property so we can pass the CPU soft reset lines to their
> corresponding CPU cores.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi  | 1 +
>  arch/arm/boot/dts/meson8b.dtsi | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 6fe6a159e960..b98d44fde6b6 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -168,6 +168,7 @@
>  &cbus {
>  	clkc: clock-controller@4000 {
>  		#clock-cells = <1>;
> +		#reset-cells = <1>;
>  		compatible = "amlogic,meson8-clkc";
>  		reg = <0x8000 0x4>, <0x4000 0x460>;
>  	};
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 8fce13844b0c..bc278da7df0d 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -119,6 +119,7 @@
>  &cbus {
>  	clkc: clock-controller@4000 {
>  		#clock-cells = <1>;
> +		#reset-cells = <1>;
>  		compatible = "amlogic,meson8b-clkc";
>  		reg = <0x8000 0x4>, <0x4000 0x460>;
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
