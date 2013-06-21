From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Fri, 21 Jun 2013 16:13:55 +0530
Message-ID: <20130621104355.GG23141@intel.com>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
 <201306172258.08185.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306172258.08185.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2013 at 10:58:07PM +0200, Arnd Bergmann wrote:
> On Monday 17 June 2013, Zhangfei Gao wrote:
> > Add dmaengine driver for hisilicon k3 platform based on virt_dma
> > 
> > Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Tested-by: Kai Yang <jean.yangkai-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> 
> This filter function works only as long as there is no more than
> one DMA engine in the system, which is something that needs to
> be documented better. Unfortunately, providing a filter
> function to be called by .xlate is currently the only way that
> the dma-engine API supports, but we should really get over that.
> 
> Vinod: I think we need to add a way for a dmaengine driver to
> just return one of its channels to the xlate function. The
> current method is getting very silly, and it adds run-time and
> code complexity without any need.
> 
> How about something like
> 
> int dma_get_slave_channel(struct dma_chan *chan)
> {
> 	/* lock against __dma_request_channel */
> 	mutex_lock(&dma_list_mutex);
> 
> 	if (chan->client_count == 0)
> 		ret = dma_chan_get(chan);
> 	else	
> 		ret = -EBUSY;
> 
> 	mutex_unlock(&dma_list_mutex);
> 
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(dma_get_slave_channel);
and you add filter on top?

This is getting you any channel and maynot work where we need to do some
filtering. 

--
~vinod
-- 
