From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RESEND] arm64: dts: meson-axg: fix dtc warning about unit
 address
Date: Thu, 8 Nov 2018 14:28:22 +0100
Message-ID: <1a0aa100-1d44-b2d1-178d-059e95debda1@baylibre.com>
References: <20181030150614.19461-1-jbrunet@baylibre.com>
 <20181108095156.26810-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108095156.26810-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

On 08/11/2018 10:51, Jerome Brunet wrote:
> section 2.2.1 of the DT specs says: " If the node has no reg property,
> the @unit-address must be omitted and the node-name alone differentiates
> the node from other nodes at the same level in the tree"
> 
> Simply replace the '@' with a '-' to fix this warning.
> 
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
> Hi Kevin,
> 
> I'm resending this change because I noticed the previous patch I sent had
> references to spdif input which has not been merged yet. This would have
> triggered a conflict in your tree.
> 
> Hopefully, this new version will apply correctly
> 
> Cheers
> Jerome
> 
>  .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 26 +++++++++----------
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  6 ++---
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 18778ada7bd3..ba44b0419404 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -60,7 +60,7 @@
>  		serial1 = &uart_A;
>  	};
>  

[...]

>  
> -	tdmif_c: audio-controller@2 {
> +	tdmif_c: audio-controller-2 {
>  		compatible = "amlogic,axg-tdm-iface";
>  		#sound-dai-cells = <0>;
>  		sound-name-prefix = "TDM_C";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
