From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6qdl: Enable CODA960 VPU
Date: Fri, 13 Jun 2014 15:46:43 -0500
Message-ID: <CAL_JsqL+o+CCRUzXaAmBJBGSxt60k_858S7wQT4TLY0kZC9jgw@mail.gmail.com>
References: <1402679641-868-1-git-send-email-p.zabel@pengutronix.de> <1402679641-868-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402679641-868-4-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 12:14 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This patch adds links to the on-chip SRAM and reset controller nodes
> and switches the interrupts. Make the BIT processor interrupt, which exists on
> all variants, the first one. The JPEG unit interrupt, which does not exist on
> i.MX27 and i.MX5 thus is an optional second interrupt.
> Use different compatible strings for i.MX6Q/D and i.MX6S/DL, as they have to
> load separate firmware images for some reason.
>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6dl.dtsi  |  4 ++++
>  arch/arm/boot/dts/imx6q.dtsi   |  4 ++++
>  arch/arm/boot/dts/imx6qdl.dtsi | 10 ++++++++--
>  3 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> index 5c5f574..fbbdfca 100644
> --- a/arch/arm/boot/dts/imx6dl.dtsi
> +++ b/arch/arm/boot/dts/imx6dl.dtsi
> @@ -110,3 +110,7 @@
>                       "di0_sel", "di1_sel",
>                       "di0", "di1";
>  };
> +
> +&vpu {
> +       compatible = "fsl,imx6dl-vpu", "cnm,coda960";
> +};
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index addd3f8..2c1dbf8 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -291,3 +291,7 @@
>                 };
>         };
>  };
> +
> +&vpu {
> +       compatible = "fsl,imx6q-vpu", "cnm,coda960";
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index eca0971..2052303 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -315,9 +315,15 @@
>                         };
>
>                         vpu: vpu@02040000 {
> +                               compatible = "cnm,coda960";
>                                 reg = <0x02040000 0x3c000>;
> -                               interrupts = <0 3 IRQ_TYPE_LEVEL_HIGH>,
> -                                            <0 12 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>,
> +                                            <0 3 IRQ_TYPE_LEVEL_HIGH>;

Is there an existing user? This would break things if so.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
