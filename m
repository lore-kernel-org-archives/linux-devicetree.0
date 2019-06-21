From: Alan Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH 2/6] usb: bdc: Cleanup clock support
Date: Fri, 21 Jun 2019 09:44:11 -0400
Message-ID: <CAOGqxeV=7kwt9oyso_0yuBOT-a9bhzXJcvav-+jRY_j_=-W8QA@mail.gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
 <1561064991-16874-3-git-send-email-alcooperx@gmail.com> <1561094780.19385.2.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561094780.19385.2.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index ccbd1d34eb2a..11a43de6c1c6 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -490,8 +490,14 @@ static int bdc_probe(struct platform_device *pdev)
> >
> >       dev_dbg(dev, "%s()\n", __func__);
> >
> > +     bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
> > +     if (!bdc)
> > +             return -ENOMEM;
> > +
> >       clk = devm_clk_get(dev, "sw_usbd");
> >       if (IS_ERR(clk)) {
> > +             if (PTR_ERR(clk) == -EPROBE_DEFER)
> > +                     return -EPROBE_DEFER;
> what about using devm_clk_get_optional()?

Good suggestion.
Thanks
Al


On Fri, Jun 21, 2019 at 1:26 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Thu, 2019-06-20 at 17:09 -0400, Al Cooper wrote:
> > - Fix driver to defer on clk_get defer
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/bdc/bdc_core.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index ccbd1d34eb2a..11a43de6c1c6 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -490,8 +490,14 @@ static int bdc_probe(struct platform_device *pdev)
> >
> >       dev_dbg(dev, "%s()\n", __func__);
> >
> > +     bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
> > +     if (!bdc)
> > +             return -ENOMEM;
> > +
> >       clk = devm_clk_get(dev, "sw_usbd");
> >       if (IS_ERR(clk)) {
> > +             if (PTR_ERR(clk) == -EPROBE_DEFER)
> > +                     return -EPROBE_DEFER;
> what about using devm_clk_get_optional()?
>
> >               dev_info(dev, "Clock not found in Device Tree\n");
> >               clk = NULL;
> >       }
> > @@ -501,11 +507,6 @@ static int bdc_probe(struct platform_device *pdev)
> >               dev_err(dev, "could not enable clock\n");
> >               return ret;
> >       }
> > -
> > -     bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
> > -     if (!bdc)
> > -             return -ENOMEM;
> > -
> >       bdc->clk = clk;
> >
> >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > @@ -551,7 +552,7 @@ static int bdc_probe(struct platform_device *pdev)
> >       ret = bdc_phy_init(bdc);
> >       if (ret) {
> >               dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);
> > -             return ret;
> > +             goto clk_cleanup;
> >       }
> >
> >       temp = bdc_readl(bdc->regs, BDC_BDCCAP1);
> > @@ -583,6 +584,8 @@ static int bdc_probe(struct platform_device *pdev)
> >       bdc_hw_exit(bdc);
> >  phycleanup:
> >       bdc_phy_exit(bdc);
> > +clk_cleanup:
> > +     clk_disable_unprepare(bdc->clk);
> >       return ret;
> >  }
> >
>
>
