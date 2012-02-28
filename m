From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH WIP] ARM: kirkwood: covert orion-spi to fdt.
Date: Tue, 28 Feb 2012 16:07:26 +0000
Message-ID: <201202281607.27027.arnd@arndb.de>
References: <4a9b37f69d6cec5049627b8afa777bb010af05f6.1330381705.git.jason@lakedaemon.net>
 <201202280739.24399.arnd@arndb.de>
 <20120228152553.GZ23524@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120228152553.GZ23524-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 February 2012, Jason wrote:
> On Tue, Feb 28, 2012 at 07:39:24AM +0000, Arnd Bergmann wrote:
> > Same thing here:
> > 
> > 	if (of_find_property(spi->master->dev.of_node, "spi-clock-fix", NULL) ||
> > 		(orion_spi->spi_info && orion_spi->spi_info->enable_clock_fix))
> 
> Also, should this be "mv,spi-clock-fix" like I've seen for some ti
> custom dt bindings?

I'm never sure about this either. Maybe Grant can comment on this.

> > > +#ifdef CONFIG_OF
> > > +	orion_spi_wq = create_singlethread_workqueue(
> > > +				orion_spi_driver.driver.name);
> > > +	if (orion_spi_wq == NULL)
> > > +		return -ENOMEM;
> > > +#endif
> > 
> > This seems wrong: why do you have to create the workqueue again here?
> 
> Gah!  Originally, I was trying to mirror spi-tegra.c, which uses
> module_platform_driver().  So, I was moving code out of orion_spi_init()
> into orion_spi_probe() and setting .probe = orion_spi_probe().  I forgot
> to undo this when I backed away from that approach (to get it working
> first).
> 
> Should I go ahead and convert it to module_platform_driver()?

You can do that if you like, but it's not required here. If you do,
best send that conversion as a separate patch in a series before this
one.

> > > +
> > > +	spi->max_speed = DIV_ROUND_UP(tclk, 4);
> > > +	spi->min_speed = DIV_ROUND_UP(tclk, 30);
> > > +#else
> > >  	spi->spi_info = spi_info;
> > >  
> > >  	spi->max_speed = DIV_ROUND_UP(spi_info->tclk, 4);
> > >  	spi->min_speed = DIV_ROUND_UP(spi_info->tclk, 30);
> > > +#endif
> > 
> > Same code as above? Just find the clock frequency once and store it in  
> > spi->tclk.
> 
> Do you mean spi_info->tclk?  If so, spi_info is NULL when using device
> tree because orion_spi_init() in plat-orion/common.c never gets called,
> so the platform data isn't set.

I meant you should add a new "tclk" member to struct orion_spi and set
that to spi_info->tclk or the value from the device tree.

	Arnd
