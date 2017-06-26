From: zhiyong tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: adc: mt7622: Add compatible node for mt7622.
Date: Mon, 26 Jun 2017 09:55:39 +0800
Message-ID: <1498442139.536.4.camel@mhfsdcap03>
References: <1498110274-18678-1-git-send-email-zhiyong.tao@mediatek.com>
         <1498110274-18678-4-git-send-email-zhiyong.tao@mediatek.com>
         <20170624210213.5e552e5c@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170624210213.5e552e5c-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2017-06-24 at 21:02 +0100, Jonathan Cameron wrote:
> On Thu, 22 Jun 2017 13:44:34 +0800
> Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > This commit adds mt7622 compatible node.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/iio/adc/mt6577_auxadc.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > index 2dd7c74..4a2cd9e 100644
> > --- a/drivers/iio/adc/mt6577_auxadc.c
> > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > @@ -308,6 +308,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
> >  static const struct of_device_id mt6577_auxadc_of_match[] = {
> >  	{ .compatible = "mediatek,mt2701-auxadc", },
> >  	{ .compatible = "mediatek,mt8173-auxadc", },
> > +	{ .compatible = "mediatek,mt7622-auxadc", },
> Keep them in numeric order perhaps?
> 
> Might become a worthwhile step if this logic gets used for lot more parts in future!
> 
> Jonathan

==>Ok, we will change them in numeric order perhaps in v2.
Thanks.

> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mt6577_auxadc_of_match);
> 
