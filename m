From: =?ISO-8859-2?Q?Micha=B3_Miros=B3aw?= <mirqus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 08/11] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 5 Nov 2013 22:02:35 +0100
Message-ID: <CAHXqBFKTTY8vxs9BzK1xQAa7HeRLSBucsxb4wkLejLWmCnckaA@mail.gmail.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com> <1383616183-10511-9-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383616183-10511-9-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/11/5 Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Some PHY bugs are fixed by IC logic, but these bits are not
> enabled by default, so we enable them at driver.
>
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   32 ++++++++++++++++++++++++++++++-=
-
>  1 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-=
usb.c
> index c794011..b7e1744 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -31,6 +31,10 @@
>  #define HW_USBPHY_CTRL_SET                     0x34
>  #define HW_USBPHY_CTRL_CLR                     0x38
>
> +#define HW_USBPHY_IP                           0x90
> +#define HW_USBPHY_IP_SET                       0x94
> +#define HW_USBPHY_IP_CLR                       0x98
> +
>  #define BM_USBPHY_CTRL_SFTRST                  BIT(31)
>  #define BM_USBPHY_CTRL_CLKGATE                 BIT(30)
>  #define BM_USBPHY_CTRL_ENAUTOSET_USBCLKS       BIT(26)
> @@ -60,6 +64,18 @@
>   */
>  #define MXS_PHY_SENDING_SOF_TOO_FAST           BIT(2)
>
> +/*
> + * IC fix for MXS_PHY_ABNORAML_IN_SUSPEND, bit 17 is the effective b=
it
> + * in HW_USBPHY_IP.
> + */
> +#define MXS_PHY_FIX_ABNORAML_IN_SUSPEND                BIT(17)
[...]

s/ABNORAML/ABNORMAL/ ?

Best Regards,
Micha=C5=82 Miros=C5=82aw
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
