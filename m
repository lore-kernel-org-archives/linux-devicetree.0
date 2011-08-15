From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Date: Mon, 15 Aug 2011 15:38:16 +0100
Message-ID: <20110815143816.GH2636@pulham.picochip.com>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313418543.2600.2.camel@sauron>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 15, 2011 at 05:28:57PM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-08-09 at 16:12 +0100, Jamie Iles wrote:
> > -	res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> > +	if (!dev->dev.of_node)
> > +		res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> > +	else
> > +		res1 = gpio_nand_of_get_io_sync(&dev->dev);
> > +
> >  	if (res1) {
> >  		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
> >  		if (!gpiomtd->io_sync) {
> > @@ -257,7 +362,16 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
> >  		}
> >  	}
> >  
> > -	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
> > +	if (dev->dev.of_node)
> > +		kfree(res1);
> > +
> > +	if (dev->dev.platform_data)
> > +		memcpy(&gpiomtd->plat, dev->dev.platform_data,
> > +		       sizeof(gpiomtd->plat));
> > +	else
> > +		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
> > +	if (ret)
> > +		goto err_nce;
> >  
> 
> So with this code you can mix platform data and DT? Say, io_sync may
> come from platform data and the rest from the DT? Is this normal
> practice?

Well you can use platform_data with DT - it's the only way to pass 
function pointers for example, but I'm not convinced it's required in 
this case (there is the adjust_parts callback, but I can't see a user of 
it) so I'd be inclined to change the conditionals to:

	if (!dev->dev.of_node)
		memcpy(&gpiomtd->plat, dev->dev.platform_data, ...);
	else
		gpio_nand_of_get_config(...);

so that we don't use platform_data for the DT case.

Jamie
