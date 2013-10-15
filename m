From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 12/13] usb: phy: msm: Properly check core interrupt
 number
Date: Tue, 15 Oct 2013 10:12:16 +0300
Message-ID: <1381821136.29983.15.camel@iivanov-dev.int.mm-sol.com>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
	 <1381764280-28420-13-git-send-email-iivanov@mm-sol.com>
	 <20131014225933.GF7446@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131014225933.GF7446@radagast>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dsegal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2013-10-14 at 17:59 -0500, Felipe Balbi wrote: 
> On Mon, Oct 14, 2013 at 06:24:39PM +0300, Ivan T. Ivanov wrote:
> > From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > 
> > IRQ with number 0 is valid case, so check for negative
> 
> not entirelly correct... IRQ 0 isn't supposed to be used as a linux IRQ
> number IIRC.

I am not really sure. NO_IRQ is -1 at least on ARM. Also when
taking into account irqdomain's zero as interrupt number is valid??

> 
> > numbers instead.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/usb/phy/phy-msm-usb.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> > index ca2abe6..f34c8a9 100644
> > --- a/drivers/usb/phy/phy-msm-usb.c
> > +++ b/drivers/usb/phy/phy-msm-usb.c
> > @@ -1415,7 +1415,7 @@ static int __init msm_otg_probe(struct platform_device *pdev)
> >  	dev_info(&pdev->dev, "OTG regs = %p\n", motg->regs);
> >  
> >  	motg->irq = platform_get_irq(pdev, 0);
> > -	if (!motg->irq) {
> > +	if (motg->irq < 0) {
> 
> this check is correct though, since platform_get_irq() will return
> -ENXIO if it doesn't find IRQ resource.
> 

Thanks,
Ivan

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
