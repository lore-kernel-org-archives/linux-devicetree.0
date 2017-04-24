From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH 1/2] arc: axs10x: Add DT bindings for I2S audio
 playback
Date: Mon, 24 Apr 2017 10:36:40 -0700
Message-ID: <77599cf5-33e5-2ecd-2b2a-43630195a3b8@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/21/2017 03:15 AM, Jose Abreu wrote:
> This patch adds the necessary DT bindings to get HDMI audio
> output in ARC AXS10x SDP. The bindings for I2S controller were
> added as well as the bindings for simple audio card.

Are these waiting on Rob or is it OK for me to pick these up for 4.12 ?

-Vineet

>
> Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Acked-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Carlos Palminha <palminha-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arc/boot/dts/axs10x_mb.dtsi | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index d6c1bbc..9d882b1 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -149,12 +149,13 @@
>  			interrupts = <14>;
>  		};
>  
> -		i2c@0x1e000 {
> -			compatible = "snps,designware-i2c";
> +		i2s: i2s@1e000 {
> +			compatible = "snps,designware-i2s";
>  			reg = <0x1e000 0x100>;
> -			clock-frequency = <400000>;
> -			clocks = <&i2cclk>;
> +			clocks = <&i2sclk 0>;
> +			clock-names = "i2sclk";
>  			interrupts = <15>;
> +			#sound-dai-cells = <0>;
>  		};
>  
>  		i2c@0x1f000 {
> @@ -174,6 +175,7 @@
>  				adi,input-colorspace = "rgb";
>  				adi,input-clock = "1x";
>  				adi,clock-delay = <0x03>;
> +				#sound-dai-cells = <0>;
>  
>  				ports {
>  					#address-cells = <1>;
> @@ -295,5 +297,17 @@
>  				};
>  			};
>  		};
> +
> +		sound_playback {
> +			compatible = "simple-audio-card";
> +			simple-audio-card,name = "AXS10x HDMI Audio";
> +			simple-audio-card,format = "i2s";
> +			simple-audio-card,cpu {
> +				sound-dai = <&i2s>;
> +			};
> +			simple-audio-card,codec {
> +				sound-dai = <&adv7511>;
> +			};
> +		};
>  	};
>  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
