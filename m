From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
Date: Tue, 20 Sep 2016 16:52:03 +0930
Message-ID: <CACPK8XdtaoMqVc-x3cc6Tp9hfWfXiGFJk2aPYjYMinE=EqFH2Q@mail.gmail.com>
References: <1474354900-5618-1-git-send-email-clg@kaod.org> <1474354900-5618-3-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474354900-5618-3-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2016 at 4:31 PM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

I'll this in my tree to send to Arnd.

Cheers,

Joel
> ---
>
>  Changes since v1:
>
>  - renamed config option
>
>  arch/arm/configs/aspeed_g4_defconfig | 1 +
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspe=
ed_g4_defconfig
> index ca39c04fec6b..af3847db00f8 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -53,6 +53,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
>  CONFIG_SERIAL_8250_EXTENDED=3Dy
>  CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
> +CONFIG_ASPEED_BT_IPMI_BMC=3Dy
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_USB_SUPPORT is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index 4f366b0370e9..5d46290736fb 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -54,6 +54,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
>  CONFIG_SERIAL_8250_EXTENDED=3Dy
>  CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
> +CONFIG_ASPEED_BT_IPMI_BMC=3Dy
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_USB_SUPPORT is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
