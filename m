From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: da850: add power controller nodes
Date: Wed, 7 Feb 2018 15:58:32 -0600
Message-ID: <41f32de3-5daa-75fd-51e9-e6dc1f7142a3@lechnology.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
 <20180207134553.13510-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207134553.13510-5-brgl-ARrdPY/1zhM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2018 07:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> Add two power controller nodes corresponding with the two PSC modules
> present on the da850 SoC.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arm/boot/dts/da850.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 3a1f2ced05ca..ac2eef4e6b7c 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -24,6 +24,11 @@
>   		};
>   	};
>   
> +	aliases {
> +		pwc0 = &pwc0;
> +		pwc1 = &pwc1;
> +	};

Why do we need aliases? (would be nice to have the reason in the commit
message if there is a good reason)

> +
>   	opp_table: opp-table {
>   		compatible = "operating-points-v2";
>   
> @@ -141,6 +146,10 @@
>   				      "pll0_sysclk4", "pll0_sysclk6",
>   				      "async1";
>   		};
> +		pwc0: power-controller@10000 {
> +			compatible = "ti,davinci-pm-domains";
> +			#power-domain-cells = <0>;
> +		};
>   		pll0: clock-controller@11000 {
>   			compatible = "ti,da850-pll0";
>   			reg = <0x11000 0x1000>;
> @@ -757,6 +766,10 @@
>   				 <&async3_clk>;
>   			clock-names = "pll0_sysclk2", "pll0_sysclk4", "async3";
>   		};
> +		pwc1: power-controller@227000 {
> +			compatible = "ti,davinci-pm-domains";
> +			#power-domain-cells = <0>;
> +		};
>   		pinconf: pin-controller@22c00c {
>   			compatible = "ti,da850-pupd";
>   			reg = <0x22c00c 0x8>;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
