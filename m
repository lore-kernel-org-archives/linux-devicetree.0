Return-Path: <SRS0=o3iy=TK=mediatek.com=chunfeng.yun@kernel.org>
Message-ID: <1557453599.10179.280.camel@mhfsdcap03>
Subject: Re: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Fri, 10 May 2019 09:59:59 +0800
In-Reply-To: <20190509201142.10543-9-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
	 <20190509201142.10543-9-chris.brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 2019-05-09 at 15:11 -0500, Chris Brandt wrote:
> Move flags macros to header file so they can be used by other files.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/usb/renesas_usbhs/common.c |  7 -------
>  drivers/usb/renesas_usbhs/common.h | 10 ++++++++++
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 249fbee97f3f..efb26ffd9809 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>   */
>  
> 
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>  
>  /*
>   * platform call back
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
> index 3777af848a35..1ca94b8f5508 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -339,4 +339,14 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
>  #define usbhs_priv_to_dev(priv)		(&priv->pdev->dev)
>  #define usbhs_priv_to_lock(priv)	(&priv->lock)
>  
> +/*
> + * flags
> + */
> +#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
BIT(0)?
> +
> +#define usbhsc_flags_init(p)   ((p)->flags = 0)
> +#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> +#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> +#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
> +
>  #endif /* RENESAS_USB_DRIVER_H */
