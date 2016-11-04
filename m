From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: add basic support for Rockchip RK1108 SOC
Date: Fri, 04 Nov 2016 09:07:11 +0100
Message-ID: <18728215.xtkCC4d9TF@phil>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <1478176848-12132-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478176848-12132-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. November 2016, 20:40:48 CET schrieb Andy Yan:
> RK1108 is embedded with an ARM Cortex-A7 single core and a DSP core.
> It is designed for varies application scenario such as car DVR, sports
> DV, secure camera and UAV camera.
> 
> This patch add basic support for it with DMAC / UART / CRU / pinctrl
> enabled.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rk1108.dtsi     | 420
> ++++++++++++++++++++++++++++++++++++++ arch/arm/mach-rockchip/rockchip.c | 
>  1 +
>  2 files changed, 421 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk1108.dtsi
> 
> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> new file mode 100644
> index 0000000..9dccfea
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk1108.dtsi

[...]

> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rk1108-pinctrl";
> +		rockchip,grf = <&grf>;

missing rockchip,pmu phandle for gpio0 iomuxes and also syscon declaration for 
said pmugrf syscon in this file.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
