From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk/mpc85xx: Update the compatible string
Date: Thu, 30 May 2013 12:21:43 -0700
Message-ID: <20130530192143.4470.23214@quantum>
References: <1369210939-25087-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130530185732.4470.91176@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130530185732.4470.91176@quantum>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Mike Turquette (2013-05-30 11:57:32)
> Quoting Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org (2013-05-22 01:22:19)
> > From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > The compatible string of clock is changed from *-2 to *-2.0
> > on chassis 2. So updated it accordingly.
> > 
> > Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Taken into clk-next.
> 

One small nitpick.  I updated the $SUBJECT to:

clk: mpc85xx: Update the compatible string

The difference being "clk: mpc85xx:" versus "clk/mpc85xx:".  Please use
the former format in the future.

Thanks,
Mike

> Regards,
> Mike
> 
> > ---
> >  drivers/clk/clk-ppc-corenet.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/clk-ppc-corenet.c b/drivers/clk/clk-ppc-corenet.c
> > index a2d483f..e958707 100644
> > --- a/drivers/clk/clk-ppc-corenet.c
> > +++ b/drivers/clk/clk-ppc-corenet.c
> > @@ -260,7 +260,7 @@ static int __init ppc_corenet_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id ppc_clk_ids[] __initconst = {
> >         { .compatible = "fsl,qoriq-clockgen-1.0", },
> > -       { .compatible = "fsl,qoriq-clockgen-2", },
> > +       { .compatible = "fsl,qoriq-clockgen-2.0", },
> >         {}
> >  };
> >  
> > -- 
> > 1.8.0
