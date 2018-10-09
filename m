From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 06/14] mtd: maps: physmap: Remove the MAX_RESOURCES
 limitation
Date: Tue, 9 Oct 2018 09:53:27 +0200
Message-ID: <20181009095327.132c9a5a@bbrezillon>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-7-boris.brezillon@bootlin.com>
 <CAPybu_3ROm1HpX7nqS5w3pZ3RuWnAwL8aTPWBH8t+Q4-UX0ZiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAPybu_3ROm1HpX7nqS5w3pZ3RuWnAwL8aTPWBH8t+Q4-UX0ZiQ@mail.gmail.com>
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

On Tue, 9 Oct 2018 09:31:44 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Hi Boris
> On Mon, Oct 8, 2018 at 10:10 PM Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> >
> > Remove the MAX_RESOURCES limitation by dynamically allocating the  
> > ->mtds[] and ->maps[] at probe time based on the number of iomem  
> > resources attached to the platform device.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/maps/physmap.c | 44 +++++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> > index cbc50b53ec9d..86679d149a49 100644
> > --- a/drivers/mtd/maps/physmap.c
> > +++ b/drivers/mtd/maps/physmap.c
> > @@ -22,12 +22,11 @@
> >  #include <linux/mtd/concat.h>
> >  #include <linux/io.h>
> >
> > -#define MAX_RESOURCES          4
> > -
> >  struct physmap_flash_info {
> > -       struct mtd_info         *mtds[MAX_RESOURCES];
> > +       unsigned int            nmaps;
> > +       struct mtd_info         **mtds;
> >         struct mtd_info         *cmtd;
> > -       struct map_info         maps[MAX_RESOURCES];
> > +       struct map_info         *maps;
> >         spinlock_t              vpp_lock;
> >         int                     vpp_refcnt;
> >  };
> > @@ -50,7 +49,7 @@ static int physmap_flash_remove(struct platform_device *dev)
> >                         mtd_concat_destroy(info->cmtd);
> >         }
> >
> > -       for (i = 0; i < MAX_RESOURCES; i++) {
> > +       for (i = 0; i < info->nmaps; i++) {
> >                 if (info->mtds[i] != NULL)
> >                         map_destroy(info->mtds[i]);
> >         }
> > @@ -101,7 +100,6 @@ static int physmap_flash_probe(struct platform_device *dev)
> >         const char * const *part_types;
> >         int err = 0;
> >         int i;
> > -       int devices_found = 0;
> >
> >         physmap_data = dev_get_platdata(&dev->dev);
> >         if (physmap_data == NULL)
> > @@ -114,6 +112,24 @@ static int physmap_flash_probe(struct platform_device *dev)
> >                 goto err_out;
> >         }
> >
> > +       while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
> > +               info->nmaps++;  
> 
> Maybe you prefer:
> for (info->nmaps = 0; platform_get_resource(dev, IORESOURCE_MEM,
> info->nmaps) ; info->nmaps++);

I don't like when while/for loop bodies are empty, that's why I went for
the while() loop ;-).

> 
> (your choice, they are probably compiled into the same assembly)
> 
> > +
> > +       if (!info->nmaps)
> > +               return -ENODEV;
> > +
> > +       info->maps = devm_kzalloc(&dev->dev,
> > +                                 sizeof(*info->maps) * info->nmaps,
> > +                                 GFP_KERNEL);
> > +       if (!info->maps)
> > +               return -ENOMEM;
> > +
> > +       info->mtds = devm_kzalloc(&dev->dev,
> > +                                 sizeof(*info->mtds) * info->nmaps,
> > +                                 GFP_KERNEL);
> > +       if (!info->mtds)
> > +               return -ENOMEM;
> > +
> >         if (physmap_data->init) {
> >                 err = physmap_data->init(dev);
> >                 if (err)
> > @@ -122,13 +138,10 @@ static int physmap_flash_probe(struct platform_device *dev)
> >
> >         platform_set_drvdata(dev, info);
> >
> > -       for (i = 0; i < MAX_RESOURCES; i++) {
> > +       for (i = 0; i < info->nmaps; i++) {
> >                 struct resource *res;
> >
> >                 res = platform_get_resource(dev, IORESOURCE_MEM, i);
> > -               if (res)
> > -                       break;
> > -
> >                 info->maps[i].virt = devm_ioremap_resource(&dev->dev, res);
> >                 if (IS_ERR(info->maps[i].virt)) {
> >                         err = PTR_ERR(info->maps[i].virt);
> > @@ -159,21 +172,18 @@ static int physmap_flash_probe(struct platform_device *dev)
> >                         dev_err(&dev->dev, "map_probe failed\n");
> >                         err = -ENXIO;
> >                         goto err_out;
> > -               } else {
> > -                       devices_found++;
> >                 }
> >                 info->mtds[i]->dev.parent = &dev->dev;
> >         }
> >
> > -       if (!devices_found) {
> > -               err = -ENODEV;
> > -       } else if (devices_found == 1) {
> > +       if (info->nmaps == 1) {
> >                 info->cmtd = info->mtds[0];
> >         } else {
> >                 /*
> >                  * We detected multiple devices. Concatenate them together.
> >                  */
> > -               info->cmtd = mtd_concat_create(info->mtds, devices_found, dev_name(&dev->dev));
> > +               info->cmtd = mtd_concat_create(info->mtds, info->nmaps,
> > +                                              dev_name(&dev->dev));
> >                 if (info->cmtd == NULL)
> >                         err = -ENXIO;
> >         }
> > @@ -199,7 +209,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
> >         struct physmap_flash_info *info = platform_get_drvdata(dev);
> >         int i;
> >
> > -       for (i = 0; i < MAX_RESOURCES && info->mtds[i]; i++)
> > +       for (i = 0; i < info->nmaps && info->mtds[i]; i++)
> >                 if (mtd_suspend(info->mtds[i]) == 0)
> >                         mtd_resume(info->mtds[i]);
> >  }
> > --
> > 2.14.1
> >  
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
