From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 01/13] devicetree: bindings: Renesas APMU and SMP
 Enable method
Date: Mon, 27 Jun 2016 11:44:26 +0200
Message-ID: <CAMuHMdWvbWS=-tjcHo_iKpYMOtTd_e1y_dHjfrKOTh7PuezwhQ@mail.gmail.com>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be> <1466072862-28030-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466072862-28030-2-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Keita Kobayashi <keita.kobayashi.ym-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 12:27 PM, Geert Uytterhoeven
<geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
>
> Add DT binding documentation for the APMU hardware and add "renesas,apmu"
> to the list of enable methods for the ARM cpus.
>
> Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> v4:
>   - s/reigsters/registers/,
>   - Use "renesas,<soctype>-apmu" instead of "renesas,apmu-<soctype>",
>
> v3:
>   - s/Until/Unit/g,
>
> v2:
>   - No changes.
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  .../devicetree/bindings/power/renesas,apmu.txt     | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 3f0cbbb8395f84ef..fa7520eb6387edbe 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -204,6 +204,7 @@ nodes to be present and contain the properties described below.
>                             "qcom,gcc-msm8660"
>                             "qcom,kpss-acc-v1"
>                             "qcom,kpss-acc-v2"
> +                           "renesas,apmu"

Any Acked-by from the ARM people?
Thanks!

>                             "rockchip,rk3036-smp"
>                             "rockchip,rk3066-smp"
>                             "ste,dbx500-smp"
> diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
> new file mode 100644
> index 0000000000000000..84404c9edff73d97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/renesas,apmu.txt
> @@ -0,0 +1,31 @@
> +DT bindings for the Renesas Advanced Power Management Unit
> +
> +Renesas R-Car line of SoCs utilize one or more APMU hardware units
> +for CPU core power domain control including SMP boot and CPU Hotplug.
> +
> +Required properties:
> +
> +- compatible: Should be "renesas,<soctype>-apmu", "renesas,apmu" as fallback.
> +             Examples with soctypes are:
> +               - "renesas,r8a7790-apmu" (R-Car H2)
> +               - "renesas,r8a7791-apmu" (R-Car M2-W)
> +               - "renesas,r8a7792-apmu" (R-Car V2H)
> +               - "renesas,r8a7793-apmu" (R-Car M2-N)
> +               - "renesas,r8a7794-apmu" (R-Car E2)
> +
> +- reg: Base address and length of the I/O registers used by the APMU.
> +
> +- cpus: This node contains a list of CPU cores, which should match the order
> +  of CPU cores used by the WUPCR and PSTR registers in the Advanced Power
> +  Management Unit section of the device's datasheet.
> +
> +
> +Example:
> +
> +This shows the r8a7791 APMU that can control CPU0 and CPU1.
> +
> +       apmu@e6152000 {
> +               compatible = "renesas,r8a7791-apmu", "renesas,apmu";
> +               reg = <0 0xe6152000 0 0x188>;
> +               cpus = <&cpu0 &cpu1>;
> +       };
> --
> 1.9.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
