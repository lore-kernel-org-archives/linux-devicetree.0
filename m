From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dma: imx-dma: Add oftree support
Date: Mon, 25 Feb 2013 17:53:24 +0100
Message-ID: <20130225165324.GC32025@pengutronix.de>
References: <1361543838-12604-1-git-send-email-mpa@pengutronix.de>
 <1361808255-17381-1-git-send-email-mpa@pengutronix.de>
 <201302251624.52014.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201302251624.52014.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2013 at 04:24:51PM +0000, Arnd Bergmann wrote:
> On Monday 25 February 2013, Markus Pargmann wrote:
> > Adding devicetree support for imx-dma driver. Use driver name for
> > function 'imx_dma_is_general_purpose' because the devicename for
> > devicetree initialized devices is different.
> > 
> > Changes in V3:
> > - Create a imxdma translate function to pass the device object into the
> >   filter function.
> > 
> > Changes in V2:
> > - Change the driver to use generic DMA DT bindings.
> > - Add a imx-dma filter function that sets the dma request line in
> >   private data.
> > 
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> Looks correct now,
> 
> Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> I have one idea for an optimization though:
> 
> > +static bool imxdma_filter_fn(struct dma_chan *chan, void *param)
> > +{
> > +	struct imxdma_filter_data *fdata = param;
> > +	struct imx_dma_data *data;
> > +
> > +	if (chan->device->dev != fdata->imxdma->dev)
> > +		return false;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +
> > +	if (!data)
> > +		return false;
> > +
> > +	data->dma_request = fdata->request;
> > +	data->alloc_ctl_filter = true;
> > +	chan->private = data;
> > +
> > +	return true;
> > +}
> 
> There is already a "dma_request" member in "struct imxdma_channel", so
> you could use that instead of allocating the imx_dma_data here.
> 
> Then you don't need to keep track of freeing that memory again, but
> you might have to change a few other functions that look at data->dma_request
> rather than chan->dma_request at the moment and change them to
> use the latter instead. You can copy data->dma_request over in the
> alloc_chan_resources functions for the legacy case.

Thanks, that is much better than the current use of kzalloc. I updated it for v4.

Markus

> 
> 	Arnd

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
