From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v7 03/14] usb: chipidea: msm: add missing section annotation
Date: Tue, 26 Jun 2012 23:52:35 +0200
Message-ID: <201206262352.35258.marex@denx.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <1340607391-16380-4-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340607391-16380-4-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

> From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> 
> no functional changes, it will just free up some
> code if we don't have hotplug.

Well, start the sentence with a capital letter ;-)

Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> 
> Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/usb/chipidea/ci13xxx_msm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci13xxx_msm.c
> b/drivers/usb/chipidea/ci13xxx_msm.c index 958069e..8d438b8 100644
> --- a/drivers/usb/chipidea/ci13xxx_msm.c
> +++ b/drivers/usb/chipidea/ci13xxx_msm.c
> @@ -55,7 +55,7 @@ static struct ci13xxx_udc_driver ci13xxx_msm_udc_driver =
> { .notify_event		= ci13xxx_msm_notify_event,
>  };
> 
> -static int ci13xxx_msm_probe(struct platform_device *pdev)
> +static int __devinit ci13xxx_msm_probe(struct platform_device *pdev)
>  {
>  	struct platform_device *plat_ci;
>  	int ret;

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
