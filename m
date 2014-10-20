From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCHv2 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Mon, 20 Oct 2014 08:46:56 -0700
Message-ID: <CAD=FV=X=DOVLeW6YQzFcXBrVte9vCizMvDy9DJQFLYUnzEAeHQ@mail.gmail.com>
References: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>
	<1413819079-17120-2-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413819079-17120-2-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dinh,

On Mon, Oct 20, 2014 at 8:31 AM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Without this patch, the booting the SOCFPGA platform would hang at the
> SDMMC driver loading. There were 2 patches that caused this to happen:
>
> - Patch 9795a846e10 "mmc: dw_mmc: remove dw_mci_of_cd_gpio/wp_gpio()" removed
>   looking for "cd-gpios", since mmc_of_parse was getting called.
> - Patch 3cf890fc42b "mmc: dw_mmc: Pass back errors from mmc_of_parse()" would
>   hang the system at the SDMMC driver loading.
>
> This patch will fix booting with SDMMC enabled on SOCFPGA dev kit.
>
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> index d7296a5..739c3b7 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> @@ -69,7 +69,7 @@
>  };
>
>  &mmc0 {
> -       cd-gpios = <&gpio1 18 0>;
> +       cd = <&gpio1 18 0>;

This doesn't look right to me.  What was the error that was passed back?

I think your change has the same net effect as just deleting the
"cd-gpios" line.  ...or is there some code somewhere that is parsing
the "cd" property.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
