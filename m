From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v7 04/14] usb: chipidea: msm: add remove method
Date: Mon, 25 Jun 2012 15:33:20 +0200
Message-ID: <201206251533.20788.marex@denx.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <1340607391-16380-5-git-send-email-richard.zhao@freescale.com> <CAAe_U6JJe4U+oMR+xj4TwdNsXEzHNhQ0+t-PUPJT=kezHCqL2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAe_U6JJe4U+oMR+xj4TwdNsXEzHNhQ0+t-PUPJT=kezHCqL2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear ABRAHAM, KISHON VIJAY,

> Hi,
> 
> On Mon, Jun 25, 2012 at 12:26 PM, Richard Zhao
> 
> <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > 
> > allow this driver to be removed too.
> > 
> > Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/ci13xxx_msm.c |   20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/ci13xxx_msm.c
> > b/drivers/usb/chipidea/ci13xxx_msm.c index 8d438b8..68512d4 100644
> > --- a/drivers/usb/chipidea/ci13xxx_msm.c
> > +++ b/drivers/usb/chipidea/ci13xxx_msm.c
> > @@ -84,6 +84,8 @@ static int __devinit ci13xxx_msm_probe(struct
> > platform_device *pdev) if (ret)
> >                goto put_platform;
> > 
> > +       platform_set_drvdata(pdev, plat_ci);
> > +
> >        pm_runtime_no_callbacks(&pdev->dev);
> >        pm_runtime_enable(&pdev->dev);
> > 
> > @@ -95,16 +97,22 @@ put_platform:
> >        return ret;
> >  }
> > 
> > +static int __devexit ci13xxx_msm_remove(struct platform_device *pdev)
> > +{
> > +       struct platform_device *plat_ci = platform_get_drvdata(pdev);
> 
> How about a pm_runtime_disable() here?

MX28 doesn't do runtime PM yet. Actually it doesn't do any PM.

> > +
> > +       platform_device_unregister(plat_ci);
> > +
> > +       return 0;
> > +}
> 
> Thanks
> Kishon

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
