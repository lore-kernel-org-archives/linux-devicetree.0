From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dmaengine: mpc512x_dma: use generic DMA DT bindings
Date: Tue, 2 Apr 2013 19:01:51 +0000
Message-ID: <201304021901.51705.arnd@arndb.de>
References: <1364746680-6564-1-git-send-email-agust@denx.de> <20130402182215.GO10326@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130402182215.GO10326@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tuesday 02 April 2013, Vinod Koul wrote:
> On Sun, Mar 31, 2013 at 06:17:59PM +0200, Anatolij Gustschin wrote:
> > Add generic DMA bindings and register the DMA controller
> > to DT DMA helpers.
> I need someone who understands DT better than me to comment/ack...
> Arnd...?

> >  
> > +struct mpc_dma_filter_args {
> > +	struct mpc_dma *mdma;
> > +	unsigned int chan_id;
> > +};
> > +
> > +static bool mpc_dma_filter(struct dma_chan *chan, void *param)
> > +{
> > +	struct mpc_dma_filter_args *fargs = param;
> > +
> > +	if (chan->device != &fargs->mdma->dma)
> > +		return false;
> > +
> > +	return (chan->chan_id == fargs->chan_id);
> > +}

This assumes that there is a 1:1 mapping between channels and request lines,
which is unusual, but I assume it's correct for the hardware.

> > @@ -791,11 +830,26 @@ static int mpc_dma_probe(struct platform_device *op)
> >  	/* Register DMA engine */
> >  	dev_set_drvdata(dev, mdma);
> >  	retval = dma_async_device_register(dma);
> > -	if (retval) {
> > -		devm_free_irq(dev, mdma->irq, mdma);
> > -		irq_dispose_mapping(mdma->irq);
> > +	if (retval)
> > +		goto reg_err;
> > +
> > +	if (dev->of_node) {
> > +		retval = of_dma_controller_register(dev->of_node,
> > +						    mpc_dma_xlate, mdma);
> > +		if (retval) {
> > +			dev_err(&op->dev,
> > +				"could not register of_dma_controller\n");
> > +			goto of_err;
> > +		}
> >  	}

Here we rely on the fact that all device trees including this dma engine
have a correct representation of the device, which breaks backwards
compatibility with old device trees, which don't yet follow the binding
or don't need to because they only use memory-to-memory channels.

You can easily make it backwards compatible by making the above a
non-fatal error and just continuing here even if of_dma_controller_register
failed. If compatiblity is not a concern, the above is good.

The main thing missing is a binding file in
Documentation/devicetree/bindings/dma/mpc512x-dma.txt

	Arnd
