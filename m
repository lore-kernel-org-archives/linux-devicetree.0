From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Fri, 21 Jun 2013 13:41:53 +0200
Message-ID: <201306211341.53928.arnd@arndb.de>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
 <201306172258.08185.arnd@arndb.de> <20130621104355.GG23141@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130621104355.GG23141-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
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
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 21 June 2013, Vinod Koul wrote:
> On Mon, Jun 17, 2013 at 10:58:07PM +0200, Arnd Bergmann wrote:
> > On Monday 17 June 2013, Zhangfei Gao wrote:
> >
> > int dma_get_slave_channel(struct dma_chan *chan)
> > {
> >       /* lock against __dma_request_channel */
> >       mutex_lock(&dma_list_mutex);
> > 
> >       if (chan->client_count == 0)
> >               ret = dma_chan_get(chan);
> >       else    
> >               ret = -EBUSY;
> > 
> >       mutex_unlock(&dma_list_mutex);
> > 
> >       return ret;
> > }
> > EXPORT_SYMBOL_GPL(dma_get_slave_channel);
> and you add filter on top?

No, the idea is to no longer require a filter function when
we use dma_request_slave_channel with a DT specifier.

> This is getting you any channel and maynot work where we need to do some
> filtering. 

This function would be called only by the dmaengine driver's
xlate function. That driver obviously has to ensure that the
channel works for the specification from DT (or ACPI or
something else), but that part is easy, since that is
the same information that we currently pass into the filter
function.

	Arnd
