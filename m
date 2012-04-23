From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/5] dma: mxs-dma: add device tree probe support
Date: Mon, 23 Apr 2012 12:01:29 +0800
Message-ID: <20120423040129.GC24843@shlinux2.ap.freescale.net>
References: <1334753197-12032-1-git-send-email-b29396@freescale.com>
 <1334753197-12032-4-git-send-email-b29396@freescale.com>
 <20120423031518.GJ26306@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120423031518.GJ26306-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Huang Shijie-B32955 <B32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2012 at 11:15:20AM +0800, Shawn Guo wrote:
> On Wed, Apr 18, 2012 at 08:46:35PM +0800, Dong Aisheng wrote:
> > From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
> > Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/dma/fsl-mxs-dma.txt        |   19 +++++++++++++
> >  drivers/dma/mxs-dma.c                              |   29 +++++++++++++++++---
> >  2 files changed, 44 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/fsl-mxs-dma.txt b/Documentation/devicetree/bindings/dma/fsl-mxs-dma.txt
> > new file mode 100644
> > index 0000000..ded0398
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/fsl-mxs-dma.txt
> > @@ -0,0 +1,19 @@
> > +* Freescale MXS DMA
> > +
> > +Required properties:
> > +- compatible : Should be "fsl,<chip>-dma-apbh" or "fsl,<chip>-dma-apbx"
> > +- reg : Should contain registers location and length
> > +
> > +Supported chips:
> > +imx23, imx28.
> > +
> > +Examples:
> > +dma-apbh@80004000 {
> > +	compatible = "fsl,imx28-dma-apbh";
> > +	reg = <0x80004000 2000>;
> > +};
> > +
> > +dma-apbx@80024000 {
> > +	compatible = "fsl,imx28-dma-apbx";
> > +	reg = <0x80024000 2000>;
> > +};
> > diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> > index 51a29f9..74c3275 100644
> > --- a/drivers/dma/mxs-dma.c
> > +++ b/drivers/dma/mxs-dma.c
> > @@ -22,8 +22,11 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/dmaengine.h>
> >  #include <linux/delay.h>
> > +#include <linux/module.h>
> >  #include <linux/fsl/mxs-dma.h>
> >  #include <linux/stmp_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  
> >  #include <asm/irq.h>
> >  
> > @@ -178,6 +181,17 @@ static struct platform_device_id mxs_dma_idt[] = {
> >  	}
> >  };
> >  
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id mxs_dma_dt_ids[] = {
> > +	{ .compatible = "fsl,imx23-dma-apbh", .data = &mxs_dma_idt[0], },
> > +	{ .compatible = "fsl,imx23-dma-apbx", .data = &mxs_dma_idt[1], },
> > +	{ .compatible = "fsl,imx28-dma-apbh", .data = &mxs_dma_idt[2], },
> > +	{ .compatible = "fsl,imx28-dma-apbx", .data = &mxs_dma_idt[3], },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
> > +#endif
> > +
> As out goal is to convert mxs over to DT, you can remove the #ifdef
> here ...
> 
But the non-dt is still exist, right?
So i think we can keep it now unless we totally removed the non-dt code.

Regards
Dong Aisheng
