From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: Fix GXBB periphs pinctrl pull-enable
 register base
Date: Wed, 24 May 2017 10:40:05 +0200
Message-ID: <1495615205.14589.4.camel@baylibre.com>
References: <1495549311-23660-1-git-send-email-narmstrong@baylibre.com>
         <1495549311-23660-4-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495549311-23660-4-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-05-23 at 16:21 +0200, Neil Armstrong wrote:
> The pull-enable register base was wrongly copied from the meson8b pinctrl
> node,
> but was not used yet.

Reviewed-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> 
> Fixes: c328666d58aa ("ARM64: dts: amlogic: Add Meson GX dtsi from GXBB")
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 6f8b301..47ca44d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -351,7 +351,7 @@
>  		gpio: bank@4b0 {
>  			reg = <0x0 0x004b0 0x0 0x28>,
>  			      <0x0 0x004e8 0x0 0x14>,
> -			      <0x0 0x00120 0x0 0x14>,
> +			      <0x0 0x00520 0x0 0x14>,
>  			      <0x0 0x00430 0x0 0x40>;
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
