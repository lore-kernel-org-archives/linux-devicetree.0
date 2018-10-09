From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 11/14] mtd: maps: Merge physmap_of.c into physmap-core.c
Date: Tue, 9 Oct 2018 09:06:54 +0200
Message-ID: <20181009090654.44e54b3e@bbrezillon>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-12-boris.brezillon@bootlin.com>
 <CAPybu_1AA-fqSdS_+S=D8XEMaHs9SyECsf1SWq7cRBF8Z3oOzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAPybu_1AA-fqSdS_+S=D8XEMaHs9SyECsf1SWq7cRBF8Z3oOzQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Ricardo,

On Tue, 9 Oct 2018 08:58:40 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:


> > +
> > +static int physmap_flash_probe(struct platform_device *dev)
> > +{
> >         struct physmap_flash_info *info;
> >         const char * const *probe_type;
> > -       const char * const *part_types;
> >         int err = 0;
> >         int i;
> >
> > -       physmap_data = dev_get_platdata(&dev->dev);
> > -       if (!physmap_data)
> > -               return -ENODEV;
> > +       if (!dev->dev.of_node && dev_get_platdata(&dev->dev))
> > +               return -EINVAL;  
> 
> Maybe you want:
>             if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))

Yes, I'll fix that.

> >
> >         info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
> >         if (!info)
> > @@ -132,14 +341,15 @@ static int physmap_flash_probe(struct platform_device *dev)
> >         if (!info->mtds)
> >                 return -ENOMEM;
> >
> > -       if (physmap_data->init) {
> > -               err = physmap_data->init(dev);
> > -               if (err)
> > -                       goto err_out;
> > -       }
> > -
> >         platform_set_drvdata(dev, info);
> >
> > +       err = physmap_flash_of_init(dev);
> > +       if (err)
> > +               err = physmap_flash_pdata_init(dev);
> > +  
> 
> Maybe replace this with:
>   if (dev->dev.of_node)
>      err = physmap_flash_of_init(dev);
>  else
>     err = physmap_flash_pdata_init(dev);
> 
> Otherwise we are hiding the returncode from  of_init, which might be
> defered probing.

Will fix that one too.

Thanks for your review.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
