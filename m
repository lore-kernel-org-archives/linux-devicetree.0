From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
Date: Mon, 12 Aug 2019 19:50:47 +0300
Message-ID: <CAHp75VcgZjXj8PqBrm5pOxjQuhS-6=e7ZP9HnO9j+BbMEfb-9Q@mail.gmail.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-3-git-send-email-luis.oliveira@synopsys.com>
 <20190809141000.GB864@valkosipuli.retiisi.org.uk> <CAHp75VeutP=W43GHtY+FKvVGjBnQrF+nKbdaq_QXy8ZCoS=k1g@mail.gmail.com>
 <MN2PR12MB3710E54A1E4BA4FD3AD77B87CBD30@MN2PR12MB3710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MN2PR12MB3710E54A1E4BA4FD3AD77B87CBD30@MN2PR12MB3710.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis de Oliveira <Luis.Oliveira@synopsys.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Rob Herring <robh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree <devicetree@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joao Pinto <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 12:45 PM Luis de Oliveira
<Luis.Oliveira@synopsys.com> wrote:
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Date: Sat, Aug 10, 2019 at 14:09:21
> > On Fri, Aug 9, 2019 at 5:38 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > On Tue, Jun 11, 2019 at 09:20:51PM +0200, Luis Oliveira wrote:

> > > > +     of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
> > > > +     if (!of_id)
> > > > +             return -EINVAL;
> >
> > Is it possible to have this asserted?
> >
>
> I will remove it.

But please double check that is really the case.

> > > > +     ret = devm_request_irq(dev, csi->ctrl_irq_number,
> > > > +                            dw_mipi_csi_irq1, IRQF_SHARED,
> > > > +                            dev_name(dev), csi);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "irq csi %s failed\n", of_id->name);
> > > > +
> > > > +             goto end;
> > > > +     }
> >
> > devm_*irq() might be a bad idea. Is it race free in your driver?
> >
>
> I never thought about it like that. Should I use request_irq and
> free_irq?

It's you, author of the driver, who knows it better :-)


> > I told once, can repeat again. Synopsys perhaps needs better reviews
> > inside company. Each time I see the code, it repeats same mistakes
> > over and over. Have you, guys, do something about it?
>
> We are working on it. It will get better, sorry.

Thanks! Hope to see a progress!

-- 
With Best Regards,
Andy Shevchenko
