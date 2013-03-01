From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dma: imx-dma: Add oftree support
Date: Fri, 1 Mar 2013 14:56:45 +0100
Message-ID: <20130301135645.GA21700@pengutronix.de>
References: <1361543838-12604-1-git-send-email-mpa@pengutronix.de>
 <1361808255-17381-1-git-send-email-mpa@pengutronix.de>
 <20130228063026.GC26106@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130228063026.GC26106-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2013 at 02:30:27PM +0800, Shawn Guo wrote:
> On Mon, Feb 25, 2013 at 05:04:14PM +0100, Markus Pargmann wrote:
> > Adding devicetree support for imx-dma driver. Use driver name for
> > function 'imx_dma_is_general_purpose' because the devicename for
> > devicetree initialized devices is different.
> 
> ...
> 
> > @@ -63,7 +66,8 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
> >  	return strstr(dev_name(chan->device->dev), "sdma") ||
> >  		!strcmp(dev_name(chan->device->dev), "imx1-dma") ||
> >  		!strcmp(dev_name(chan->device->dev), "imx21-dma") ||
> > -		!strcmp(dev_name(chan->device->dev), "imx27-dma");
> > +		!strcmp(dev_name(chan->device->dev), "imx27-dma") ||
> > +		!strcmp(chan->device->dev->driver->name, "imx-dma");
> >  }
> 
> So the function could just look like the following?
> 
> static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
> {
>         return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
>                 !strcmp(chan->device->dev->driver->name, "imx-dma");
> }

Yes. For imx-dma there is only imx1, imx21 and imx27 that use imx-dma
driver. And the devicenames of imx-sdma are imx31-sdma and imx35-sdma,
so all devices using imx-sdma match. I will change it for v4. Thanks

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
