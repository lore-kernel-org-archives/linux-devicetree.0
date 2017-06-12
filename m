From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 06/13] ARM: dts: meson8: add the PWM_E and PWM_F pins
Date: Mon, 12 Jun 2017 09:32:29 +0200
Message-ID: <3de48b20-b2d2-e6bc-6cf1-04cc93cbe917@baylibre.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-7-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611101644.28581-7-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> This adds the definition of the PWM_E (CBUS) and PWM_F (AOBUS) to
> meson8.dtsi, allowing devices to use them. PWM_E can be used on some
> devices to generate the 32.768kHz clock for the SDIO wifi module, while
> PWM_F can be used to control the power LED.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson8.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index e4f7357b4b31..93e437c91c61 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -123,6 +123,13 @@
>  				function = "remote";
>  			};
>  		};
> +
> +		pwm_f_ao_pins: pwm-f-ao {
> +			mux {
> +				groups = "pwm_f_ao";
> +				function = "pwm_f_ao";
> +			};
> +		};
>  	};
>  };
>  
> @@ -168,6 +175,13 @@
>  				function = "ethernet";
>  			};
>  		};
> +
> +		pwm_e_pins: pwm-e {
> +			mux {
> +				groups = "pwm_e";
> +				function = "pwm_e";
> +			};
> +		};
>  	};
>  };
>  
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
