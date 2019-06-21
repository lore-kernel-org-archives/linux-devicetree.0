From: Alan Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH 3/6] usb: bdc: driver may fail to get USB PHY
Date: Fri, 21 Jun 2019 09:39:08 -0400
Message-ID: <CAOGqxeWUHbo51k-BpBJ0NT=s1hhJW5TOQ_js2QyqHV=mGbYUEw@mail.gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
 <1561064991-16874-4-git-send-email-alcooperx@gmail.com> <1561095579.32589.3.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561095579.32589.3.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

It's been very useful to have the DEFER debug message so I'd like to
leave in the check for DEFER. I should not be skipping the clock
disable, so I'll "goto clk_cleanup" for both cases.

Thanks
Al

On Fri, Jun 21, 2019 at 1:39 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Thu, 2019-06-20 at 17:09 -0400, Al Cooper wrote:
> > Initialization order is important for the USB PHY and the PHY clients.
> > The init order is based on the build order of the drivers in the
> > makefiles and the PHY drivers are built early to help with
> > dependencies, but the new SCMI based clock subsystem has the side
> > effect of making some additional drivers DEFER until the clock
> > is ready. This is causing the USB PHY driver to defer which is causing
> > some PHY clients to fail when they try to get the PHY. The fix is to have
> > the client driver return DEFER when it's "get phy" routine returns DEFER.
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/bdc/bdc_core.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index 11a43de6c1c6..c794890d785b 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -543,9 +543,13 @@ static int bdc_probe(struct platform_device *pdev)
> >                       dev, dev->of_node, phy_num);
> >               if (IS_ERR(bdc->phys[phy_num])) {
> >                       ret = PTR_ERR(bdc->phys[phy_num]);
> > +                     if (ret == -EPROBE_DEFER) {
> > +                             dev_dbg(bdc->dev, "DEFER, waiting for PHY\n");
> why not disable clock here? when re-probe, will enable clock again.
> to me, no need check -EPROBE_DEFFER.
> > +                             return ret;
> > +                     }
>
> >                       dev_err(bdc->dev,
> >                               "BDC phy specified but not found:%d\n", ret);
> > -                     return ret;
> > +                     goto clk_cleanup;
> >               }
> >       }
> >
>
>
