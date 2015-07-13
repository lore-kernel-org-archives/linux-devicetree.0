From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: soc: Add documentation for the MediaTek
 SCPSYS unit
Date: Mon, 13 Jul 2015 12:51:50 +0800
Message-ID: <CAGS+omBt+0+pQ4P2kRqVOB5XJFB2BxgCcPn=j4MNVMYLY4TvBg@mail.gmail.com>
References: <1435126625-9634-1-git-send-email-s.hauer@pengutronix.de> <1435126625-9634-3-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435126625-9634-3-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 24, 2015 at 2:17 PM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This adds documentation for the MediaTek SCPSYS unit found in MT8173 SoCs.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> new file mode 100644
> index 0000000..c051114
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -0,0 +1,41 @@
> +MediaTek SCPSYS
> +===============
> +
> +The System Control Processor System (SCPSYS) has several power management
> +related tasks in the system. The tasks include thermal measurement, dynamic
> +voltage frequency scaling (DVFS), interrupt filter and lowlevel sleep control.
> +The System Power Manager (SPM) inside the SCPSYS is for the MTCMOS power
> +domain control.
> +
> +The driver implements the Generic PM domain bindings described in
> +power/power_domain.txt. It provides the power domains defined in
> +include/dt-bindings/power/mt8173-power.h.
> +
> +Required properties:
> +- compatible: Must be "mediatek,mt8173-scpsys"
> +- #power-domain-cells: Must be 1
> +- reg: Address range of the SCPSYS unit
> +- infracfg: must contain a phandle to the infracfg controller
> +- clock, clock-names: clocks according to the common clock binding.
> +                      The clocks needed "mm" and "mfg". These are the
> +                     clocks which hardware needs to be enabled before
> +                     enabling certain power domains.
> +
> +Example:
> +
> +       scpsys: scpsys@10006000 {

Perhaps it is too late, and/or too pedantic, but, since this node
defines a PM domain provider as defined in [0], shouldn't its node
have been the more generic:

  scpsys: power-controller@10006000

[0] /Documentation/devicetree/bindings/power/power_domain.txt

> +               #power-domain-cells = <1>;
> +               compatible = "mediatek,mt8173-scpsys";
> +               reg = <0 0x10006000 0 0x1000>;
> +               infracfg = <&infracfg>;
> +               clocks = <&clk26m>,
> +                        <&topckgen CLK_TOP_MM_SEL>;
> +               clock-names = "mfg", "mm";
> +       };
> +
> +Example consumer:
> +
> +       afe: mt8173-afe-pcm@11220000 {
> +               compatible = "mediatek,mt8173-afe-pcm";
> +               power-domains = <&scpsys MT8173_POWER_DOMAIN_AUDIO>;
> +       };
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
