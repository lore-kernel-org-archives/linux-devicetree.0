From: Martin Fuzzey <mfuzzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] usb: chipidea: usbmisc: add post handling and errata
 fix for mx25
Date: Thu, 15 Nov 2012 11:08:15 +0100
Message-ID: <CALBypN6U=np93ZwnEZqbh=j0Vb_-x630GaktEiv+4K26eYp4Pg@mail.gmail.com>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de>
	<1352894137-2050-7-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352894137-2050-7-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Nov 14, 2012 at 12:55 PM, Michael Grzeschik
<m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> @@ -213,6 +216,15 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>                 goto put_np;
>         }
>
> +       if (usbmisc_ops && usbmisc_ops->post) {
> +               ret = usbmisc_ops->post(&pdev->dev);
> +               if (ret) {
> +                       dev_err(&pdev->dev,
> +                               "usbmisc post failed, ret=%d\n", ret);
> +                       goto err;
> +               }
> +       }
> +
>         data->ci_pdev = plat_ci;
>         platform_set_drvdata(pdev, data);
>
This hunk fails to apply for me on 3.7-rc5:
error: while searching for:
		goto put_np;
	}

	data->ci_pdev = plat_ci;
	platform_set_drvdata(pdev, data);

Regards,

Martin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
