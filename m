From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] bestcomm: no need to free when kzalloc fail
Date: Wed, 22 May 2013 16:06:28 +1000
Message-ID: <1369202788.3870.3.camel@pasglop>
References: <1367743104-3448-1-git-send-email-libo.chen@huawei.com>
 <519C4E4D.1060101@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <519C4E4D.1060101-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
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
To: Libo Chen <clbchenlibo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Libo Chen <libo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Li Zefan <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, phdm-vQo90/bmh3WzQB+pC5nmwQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-05-22 at 12:49 +0800, Libo Chen wrote:
> ping...

This is pointless. We routinely avoid adding such crap by having
the various free(...) routines cope with NULL. You just need to make
sure you are indeed NULL in the error case.

Ben.

> On 2013/5/5 16:38, chenlibo.3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > From: Libo Chen <libo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > 
> > There is no need to free bcom_eng if kzalloc fail
> > 
> > Signed-off-by: Libo Chen <libo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/dma/bestcomm/bestcomm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> > index a8c2e29..300ee2d 100644
> > --- a/drivers/dma/bestcomm/bestcomm.c
> > +++ b/drivers/dma/bestcomm/bestcomm.c
> > @@ -400,7 +400,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
> >  		printk(KERN_ERR DRIVER_NAME ": "
> >  			"Can't allocate state structure\n");
> >  		rv = -ENOMEM;
> > -		goto error_sramclean;
> > +		goto error_kzalloc;
> >  	}
> >  
> >  	/* Save the node */
> > @@ -449,6 +449,7 @@ error_release:
> >  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> >  error_sramclean:
> >  	kfree(bcom_eng);
> > +error_kzalloc:
> >  	bcom_sram_cleanup();
> >  error_ofput:
> >  	of_node_put(op->dev.of_node);
> > 
> 
