From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5 v2] ARM: kirkwood: covert orion-spi to fdt.
Date: Sun, 4 Mar 2012 20:29:59 +0000
Message-ID: <201203042030.00064.arnd@arndb.de>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <a3c65ac8146eab1796dec771c1ddfe403d1471a9.1330709314.git.jason@lakedaemon.net>
 <201203041912.21137.michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203041912.21137.michael-QKn5cuLxLXY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 04 March 2012, Michael Walle wrote:
> > @@ -481,8 +485,26 @@ static int __init orion_spi_probe(struct
> > platform_device *pdev) spi->master = master;
> >       spi->spi_info = spi_info;
> > 
> > -     spi->max_speed = DIV_ROUND_UP(spi_info->tclk, 4);
> > -     spi->min_speed = DIV_ROUND_UP(spi_info->tclk, 30);
> > +     if (spi_info)
> > +             spi->tclk = spi_info->tclk;
> > +
> > +     of_property_read_u32(master->dev.of_node,
> > +                             "clock-frequency", &spi->tclk);
> > +
> > +     if (!spi->tclk) {
> > +             dev_err(&pdev->dev, "cannot set clock rate\n");
> shouldn't you check the return value of of_property_read_u32 instead? and 
> report a more meaningful error message, eg no valid clock-frequency property 
> in the OF case?

I suggested this version, because it keeps the code very simple. Checking
the return value would of course be correct, but I don't think we
need any extra information here: there are only a few ways how this can
go wrong and it will be pretty obvious from the device tree when you
see the message.

	Arnd
