From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] nvmem: meson: use generic compatible
Date: Fri, 13 Oct 2017 21:14:59 +0200
Message-ID: <CAFBinCBVNEqTk+NUHz62FetLhYagFb5K+g17P_2Xb7sBUfEmdA@mail.gmail.com>
References: <20171012152450.12454-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171012152450.12454-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Thu, Oct 12, 2017 at 5:24 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> The meson efuse driver seems to be compatible with more SoCs than
> initially thought. Let's use the most generic compatible he have in
> DT instead of the gxbb specific one
>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 4 ++--
>  drivers/nvmem/meson-efuse.c                               | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> index fafd85bd67a6..0260524292fe 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> @@ -1,7 +1,7 @@
>  = Amlogic eFuse device tree bindings =
>
>  Required properties:
> -- compatible: should be "amlogic,meson-gxbb-efuse"
> +- compatible: should be "amlogic,meson-gx-efuse"
have you checked with the devicetree maintainers how they want the
documentation to look like in this case?
(I don't know if the old one should be kept instead of removing it)

>
>  = Data cells =
>  Are child nodes of eFuse, bindings of which as described in
> @@ -10,7 +10,7 @@ bindings/nvmem/nvmem.txt
>  Example:
>
>         efuse: efuse {
> -               compatible = "amlogic,meson-gxbb-efuse";
> +               compatible = "amlogic,meson-gx-efuse";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index 70bfc9839bb2..e90c6d68a263 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -44,7 +44,7 @@ static struct nvmem_config econfig = {
>  };
>
>  static const struct of_device_id meson_efuse_match[] = {
> -       { .compatible = "amlogic,meson-gxbb-efuse", },
> +       { .compatible = "amlogic,meson-gx-efuse", },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_efuse_match);
> --
> 2.13.6
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
