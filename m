From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/5] dma: mxs-dma: add device tree probe support
Date: Mon, 23 Apr 2012 16:02:21 +0800
Message-ID: <20120423080220.GE24843@shlinux2.ap.freescale.net>
References: <1334753197-12032-1-git-send-email-b29396@freescale.com>
 <1334753197-12032-4-git-send-email-b29396@freescale.com>
 <20120423031518.GJ26306@S2101-09.ap.freescale.net>
 <20120423040129.GC24843@shlinux2.ap.freescale.net>
 <20120423050358.GL26306@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120423050358.GL26306-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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

On Mon, Apr 23, 2012 at 01:04:00PM +0800, Shawn Guo wrote:
> On Mon, Apr 23, 2012 at 12:01:29PM +0800, Dong Aisheng wrote:
> > > > +#ifdef CONFIG_OF
> > > > +static const struct of_device_id mxs_dma_dt_ids[] = {
> > > > +	{ .compatible = "fsl,imx23-dma-apbh", .data = &mxs_dma_idt[0], },
> > > > +	{ .compatible = "fsl,imx23-dma-apbx", .data = &mxs_dma_idt[1], },
> > > > +	{ .compatible = "fsl,imx28-dma-apbh", .data = &mxs_dma_idt[2], },
> > > > +	{ .compatible = "fsl,imx28-dma-apbx", .data = &mxs_dma_idt[3], },
> > > > +	{ /* sentinel */ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
> > > > +#endif
> > > > +
> > > As out goal is to convert mxs over to DT, you can remove the #ifdef
> > > here ...
> > > 
> > But the non-dt is still exist, right?
> > So i think we can keep it now unless we totally removed the non-dt code.
> > 
> The non-dt still exist during the transition.  But even without the
> #ifdef, the driver works for non-dt.  It just saves a few bytes for
> non-dt only build.  We will soon enable DT build for mxs permanently.
> What's the point to have it at all?
> 
Hmm, i think the point is non-dt does not need it, not relate to whether
user decide to enable dt or not.
Since you insist that, i can remove it first in my v2 patch and see people's
comment.

Regards
Dong Aisheng
