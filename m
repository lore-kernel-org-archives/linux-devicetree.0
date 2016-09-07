From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gxbb: Add Meson MHU Node
Date: Wed, 07 Sep 2016 13:08:23 -0700
Message-ID: <7hwpinscaw.fsf@baylibre.com>
References: <1471515027-3543-1-git-send-email-narmstrong@baylibre.com>
        <1471515027-3543-4-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471515027-3543-4-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Thu, 18 Aug 2016 12:10:27 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied,

Kevin

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index e502c24..bdbf6e7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -321,6 +321,15 @@
>  				#clock-cells = <1>;
>  				reg = <0x0 0x0 0x0 0x3db>;
>  			};
> +
> +			mailbox: mailbox@404 {
> +				compatible = "amlogic,meson-gxbb-mhu";
> +				reg = <0 0x404 0 0x4c>;
> +				interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
> +					     <0 209 IRQ_TYPE_EDGE_RISING>,
> +					     <0 210 IRQ_TYPE_EDGE_RISING>;
> +				#mbox-cells = <1>;
> +			};
>  		};
>  
>  		apb: apb@d0000000 {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
