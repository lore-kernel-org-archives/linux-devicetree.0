From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add video decoder entries
Date: Mon, 29 Jul 2019 15:05:33 +0200
Message-ID: <77240589-1e86-6e35-0d7b-25f349057a79@baylibre.com>
References: <20190726124639.7713-1-mjourdan@baylibre.com>
 <20190726124639.7713-4-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726124639.7713-4-mjourdan@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/07/2019 14:46, Maxime Jourdan wrote:
> This enables the video decoder for GXBB, GXL and GXM chips
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 11 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 11 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi  |  4 ++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index f734faaf7b78..0cb40326b0d3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -845,3 +845,14 @@
>  	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
>  	power-domains = <&pwrc_vpu>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
> +	clocks = <&clkc CLKID_DOS_PARSER>,
> +		 <&clkc CLKID_DOS>,
> +		 <&clkc CLKID_VDEC_1>,
> +		 <&clkc CLKID_VDEC_HEVC>;
> +	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
> +	resets = <&reset RESET_PARSER>;
> +	reset-names = "esparser";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index c959456bacc6..a09c53aaa0e8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -848,3 +848,14 @@
>  	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
>  	power-domains = <&pwrc_vpu>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxl-vdec", "amlogic,gx-vdec";
> +	clocks = <&clkc CLKID_DOS_PARSER>,
> +		 <&clkc CLKID_DOS>,
> +		 <&clkc CLKID_VDEC_1>,
> +		 <&clkc CLKID_VDEC_HEVC>;
> +	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
> +	resets = <&reset RESET_PARSER>;
> +	reset-names = "esparser";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> index 7a85a82bf65d..a0e677d5a8f7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> @@ -144,3 +144,7 @@
>  &dwc3 {
>  	phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxm-vdec", "amlogic,gx-vdec";
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
