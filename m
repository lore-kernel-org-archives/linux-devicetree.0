From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/6] usb: chipidea: usbmisc: add post handling and
 errata fix for mx25
Date: Thu, 15 Nov 2012 11:25:25 +0100
Message-ID: <20121115102525.GA16118@pengutronix.de>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352894137-2050-7-git-send-email-m.grzeschik@pengutronix.de>
 <CALBypN6U=np93ZwnEZqbh=j0Vb_-x630GaktEiv+4K26eYp4Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALBypN6U=np93ZwnEZqbh=j0Vb_-x630GaktEiv+4K26eYp4Pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2012 at 11:08:15AM +0100, Martin Fuzzey wrote:
> On Wed, Nov 14, 2012 at 12:55 PM, Michael Grzeschik
> <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > @@ -213,6 +216,15 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
> >                 goto put_np;
> >         }
> >
> > +       if (usbmisc_ops && usbmisc_ops->post) {
> > +               ret = usbmisc_ops->post(&pdev->dev);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev,
> > +                               "usbmisc post failed, ret=%d\n", ret);
> > +                       goto err;
> > +               }
> > +       }
> > +
> >         data->ci_pdev = plat_ci;
> >         platform_set_drvdata(pdev, data);
> >
> This hunk fails to apply for me on 3.7-rc5:
> error: while searching for:
> 		goto put_np;
> 	}

This is because that series is based on Peter Chen's work. I should have
mentioned this in the cover-letter mail. You can merge his master branch
before adding my series:
https://github.com/hzpeterchen/linux-usb.git

Apart from the latter patches, his work already got queued up by Greg:
http://comments.gmane.org/gmane.linux.usb.general/74537

Thanks,
Michael

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
