From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000 chip
Date: Fri, 22 Mar 2019 11:30:59 +0530
Message-ID: <CAJ2_jOHBHXrVHyVdd7+pDYDyb2sT3iL4W=FhYVCvxG_rx+3ZyQ@mail.gmail.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com> <20190321133340.GB7047@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321133340.GB7047@nazgul.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 7:03 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Mar 20, 2019 at 05:22:08PM +0530, Yash Shah wrote:
> > This EDAC driver supports:
> > - Initial configuration reporting on bootup via debug logs
> > - ECC event monitoring and reporting through the EDAC framework
> > - ECC event injection
> >
> > This driver is partially based on pnd2_edac.c and altera_edac.c
> >
> > Initially L2 Cache controller is added as a subcomponent to
> > this EDAC driver.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> ...
>
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index e286b5b..112d9d1 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -440,6 +440,19 @@ config EDAC_ALTERA_SDMMC
> >         Support for error detection and correction on the
> >         Altera SDMMC FIFO Memory for Altera SoCs.
> >
> > +config EDAC_SIFIVE
> > +     tristate "Sifive ECC"
> > +     depends on RISCV
> > +     help
> > +       Support for error detection and correction on the SiFive SoCs.
> > +
> > +config EDAC_SIFIVE_L2
>
> That config item is unused. Drop it.

Sure, will drop it.

> > +static irqreturn_t sifive_edac_l2_int_handler(int irq, void *device)
> > +{
> > +     struct edac_device_ctl_info *dci =
> > +                                     (struct edac_device_ctl_info *)device;
>
> No ugly linebreaks like that - just let it stick out even if it is > 80
> cols long.

Ok. Will let it stick out.

> > +
> > +/*
> > + * sifive_edac_device_probe()
> > + *   This is a generic EDAC device driver that will support
> > + *   various SiFive memory devices as well as the memories
> > + *   for other peripherals. Module specific initialization is
> > + *   done by passing the function index in the device tree.
>
> This comment doesn't have anything to do with that function but rather
> belongs at the top of this file.

Will move it at the top.

>
> > + */
> > +static int sifive_edac_device_probe(struct platform_device *pdev)
> > +{
> > +     struct edac_device_ctl_info *dci;
> > +     struct sifive_edac_device_dev *drvdata;
> > +     int rc, i;
> > +     struct resource *res;
> > +     void __iomem *baseaddr;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     char *ecc_name = (char *)np->name;
> > +     static int dev_instance;
>
> Please sort function local variables declaration in a reverse christmas
> tree order:
>
>         <type_a> longest_variable_name;
>         <type_b> shorter_var_name;
>         <type_c> even_shorter;
>         <type_d> i;
>

Sure, will be done.

> > +
> > +     rc = edac_device_add_device(dci);
> > +     if (rc) {
> > +             dev_err(&pdev->dev, "failed to register with EDAC core\n");
> > +             goto del_edac_device;
> > +     }
>
> Call setup_sifive_debug() in the success case here so that you don't
> have to teardown below.

Ok.

>
> > +
> > +     return rc;
> > +
> > +del_edac_device:
> > +     teardown_sifive_debug();
> > +     edac_device_del_device(&pdev->dev);
> > +     edac_device_free_ctl_info(dci);
>
> Those three can be replaced by a call to sifive_edac_device_remove() ?

Since now there won't be a need to teardown, I will stick with this
(bottom two function calls).

>
> Btw, you have prefixed your static functions with "sifive_edac_" which
> doesn't make much sense and you have long names for no good reason.

Will remove the prefix "sifive_edac_" on static functions wherever feasible.

> > +static struct platform_driver sifive_edac_device_driver = {
> > +     .driver = {
> > +              .name = "sifive_edac_device",
>
> "device"? I think it is clear that it is a device and thus kinda
> tautological. "sifive_edac" should be enough...

Sure. Will keep it just "sifive_edac"

>
> Last but not least, building this driver with the riscv64 cross compilers from
> here:
>
> http://cdn.kernel.org/pub/tools/crosstool/files/bin/
>
> fails like below. With the riscv32 compiler it fails the same.
>
> Provided I'm not doing anything wrong, you should not be sending me
> half-baked stuff which doesn't even build.

Sorry about that. It fails if configured as 'module'.
I intended this driver to be built-in only hence I never came across
these errors while testing.
I somehow missed it in Kconfig file.
I will make the correction in Kconfig (change 'tristate' to 'bool')
and make sure everything builds fine.

> --
> Regards/Gruss,
>     Boris.

Thanks for your comments.

- Yash

>
> ECO tip #101: Trim your mails when you reply.
> --
