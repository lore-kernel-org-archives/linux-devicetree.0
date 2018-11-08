From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: add secure monitor
Date: Thu, 8 Nov 2018 15:40:46 +0100
Message-ID: <a9e865ff-aa8f-4224-66bc-3ebc94dd1ceb@baylibre.com>
References: <20181108130744.32323-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108130744.32323-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/11/2018 14:07, Jerome Brunet wrote:
> Add the secure monitor device to the axg platform.
> With this, we can read the SoC serial number.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index e0139f174726..3cc0044d3468 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -110,6 +110,10 @@
>  		};
>  	};
>  
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
