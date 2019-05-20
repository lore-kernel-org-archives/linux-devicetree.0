From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH 4/4] iio: auxadc: mediatek: change to subsys_initcall
Date: Mon, 20 May 2019 14:06:38 +0800
Message-ID: <1558332398.11080.9.camel@mtkswgap22>
References: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
         <1557994247-16739-5-git-send-email-chun-hung.wu@mediatek.com>
         <20190518113643.53a42976@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190518113643.53a42976@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com, jg_poxu@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Sat, 2019-05-18 at 11:36 +0100, Jonathan Cameron wrote:
> On Thu, 16 May 2019 16:10:47 +0800
> Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
> 
> >   Move auxadc platform_driver_register() from module_init
> > to subsys_initcall because auxadc user drivers
> > are all moudle drivers, need to gurantee
> > auxadc driver ready before module_init.
> > 
> Is it not possible to make them use deferred handling to come
> back later if this isn't yet available?
> 
> subsys_initcall often ends up being a more fragile approach.

Agreed, I will ask auxadc driver users to add deferred handling
instead of moving auxadc platform_driver_register() from module_init
to subsys_initcall.

Thanks,
Chun-hung

> 
> Thanks,
> 
> Jonathan
> 
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >  drivers/iio/adc/mt6577_auxadc.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > index 58d7cb2..cb8e3dd 100644
> > --- a/drivers/iio/adc/mt6577_auxadc.c
> > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > @@ -350,7 +350,19 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
> >  	.probe	= mt6577_auxadc_probe,
> >  	.remove	= mt6577_auxadc_remove,
> >  };
> > -module_platform_driver(mt6577_auxadc_driver);
> > +
> > +static int __init mt6577_auxadc_init(void)
> > +{
> > +	return platform_driver_register(&mt6577_auxadc_driver);
> > +}
> > +
> > +static void __exit mt6577_auxadc_exit(void)
> > +{
> > +	platform_driver_unregister(&mt6577_auxadc_driver);
> > +}
> > +
> > +subsys_initcall(mt6577_auxadc_init);
> > +module_exit(mt6577_auxadc_exit);
> >  
> >  MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
> >  MODULE_DESCRIPTION("MTK AUXADC Device Driver");
> 
