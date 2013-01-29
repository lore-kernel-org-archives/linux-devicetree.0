From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 11:18:50 +0000
Message-ID: <20130129111850.GR23505@n2100.arm.linux.org.uk>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-2-git-send-email-arnd@arndb.de>
 <1359445171.31148.30.camel@smile> <201301291050.23743.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201301291050.23743.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2013 at 10:50:23AM +0000, Arnd Bergmann wrote:
> (putting back the Cc list, I assumed you dropped them accidentally)

That'll be why I don't have a copy of Andy's email to reply to.

> On Tuesday 29 January 2013, Andy Shevchenko wrote:
> > On Mon, 2013-01-28 at 21:58 +0000, Arnd Bergmann wrote: 
> > > -	if ((last_dw == dw) && (last_bus_id == param))
> > > +	/* both the driver and the device must match */
> > > +        if (chan->device->dev->driver != &dw_driver.driver)
> > 
> > Could we somehow pass the &.driver to the generic filter function (via
> > *_dma_controller_register() ? ) and do this to each DMA driver?

How, and what driver gets passed?

> My hope is still that we can avoid using filter functions entirely
> when we use xlate() logic, and instead just go through the channels
> of the dma engine we know we are looking at.

Has anyone yet determined whether any of these new DMA engine slave APIs
are usable for implementations which have a separate MUX between the
DMA engine and the DMA peripheral?
