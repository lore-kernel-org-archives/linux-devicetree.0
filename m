From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: dts: rockchip: enable RGA for rk3288 devices
Date: Sat, 15 Jul 2017 12:16:55 +0300
Message-ID: <2238838.k7NpPUxaC0@avalon>
References: <1500101920-24039-1-git-send-email-jacob-chen@iotwrt.com> <1500101920-24039-6-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500101920-24039-6-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jacob,

Thank you for the patch.

On Saturday 15 Jul 2017 14:58:39 Jacob Chen wrote:
> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-evb.dtsi                 | 4 ++++
>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 4 ++++
>  arch/arm/boot/dts/rk3288-firefly.dtsi             | 4 ++++
>  arch/arm/boot/dts/rk3288-miqi.dts                 | 4 ++++
>  arch/arm/boot/dts/rk3288-popmetal.dts             | 4 ++++
>  arch/arm/boot/dts/rk3288-tinker.dts               | 4 ++++

Some boards are missing from this list (Fennec, Phycore, ...) What criteria 
have you used to decide on which ones to enable the RGA ? That should be 
explained in the commit message.

>  6 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> b/arch/arm/boot/dts/rk3288-evb.dtsi index 4905760..ec12162 100644
> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -379,6 +379,10 @@
>  	};
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &usbphy {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi index 8134966..fffa92e2
> 100644
> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> @@ -283,6 +283,10 @@
>  	};
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &tsadc {
>  	rockchip,hw-tshut-mode = <0>;
>  	rockchip,hw-tshut-polarity = <0>;
> diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi
> b/arch/arm/boot/dts/rk3288-firefly.dtsi index f520589..74a6ce5 100644
> --- a/arch/arm/boot/dts/rk3288-firefly.dtsi
> +++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
> @@ -500,6 +500,10 @@
>  	};
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_18>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/rk3288-miqi.dts
> b/arch/arm/boot/dts/rk3288-miqi.dts index 21326f3..dc5e6bd 100644
> --- a/arch/arm/boot/dts/rk3288-miqi.dts
> +++ b/arch/arm/boot/dts/rk3288-miqi.dts
> @@ -401,6 +401,10 @@
>  	};
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_18>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts
> b/arch/arm/boot/dts/rk3288-popmetal.dts index aa1f9ec..362e5aa 100644
> --- a/arch/arm/boot/dts/rk3288-popmetal.dts
> +++ b/arch/arm/boot/dts/rk3288-popmetal.dts
> @@ -490,6 +490,10 @@
>  	};
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &tsadc {
>  	rockchip,hw-tshut-mode = <0>;
>  	rockchip,hw-tshut-polarity = <0>;
> diff --git a/arch/arm/boot/dts/rk3288-tinker.dts
> b/arch/arm/boot/dts/rk3288-tinker.dts index 525b0e5..1a8c149 100644
> --- a/arch/arm/boot/dts/rk3288-tinker.dts
> +++ b/arch/arm/boot/dts/rk3288-tinker.dts
> @@ -460,6 +460,10 @@
>  	status = "okay";
>  };
> 
> +&rga {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc18_ldo1>;
>  	status ="okay";

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
