From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Fri, 21 Jun 2013 16:15:10 +0530
Message-ID: <20130621104510.GH23141@intel.com>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
 <201306172258.08185.arnd@arndb.de>
 <CAMj5Bkh8=zc=RYoS9T_9ORYFuJeswQP2hfZ5GH_vywa_qM2DRA@mail.gmail.com>
 <201306181609.14966.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306181609.14966.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, zhangfei gao <zhangfei.gao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 04:09:14PM +0200, Arnd Bergmann wrote:
> On Tuesday 18 June 2013, zhangfei gao wrote:
> > On Tue, Jun 18, 2013 at 4:58 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > >
> > >> +static struct of_dma_filter_info k3_dma_filter;
> > >> +static bool k3_dma_filter_fn(struct dma_chan *chan, void *param)
> > >> +{
> > >> +     return  (*(int *)param == chan->chan_id);
> > >> +}
> > >
> > > This filter function works only as long as there is no more than
> > > one DMA engine in the system, which is something that needs to
> > > be documented better. Unfortunately, providing a filter
> > > function to be called by .xlate is currently the only way that
> > > the dma-engine API supports, but we should really get over that.
> > >
> > > Vinod: I think we need to add a way for a dmaengine driver to
> > > just return one of its channels to the xlate function. The
> > > current method is getting very silly, and it adds run-time and
> > > code complexity without any need.
> > >
> > > How about something like
> > >
> > > int dma_get_slave_channel(struct dma_chan *chan)
> > > {
> > >         /* lock against __dma_request_channel */
> > >         mutex_lock(&dma_list_mutex);
> > >
> > >         if (chan->client_count == 0)
> > >                 ret = dma_chan_get(chan);
> > >         else
> > >                 ret = -EBUSY;
> > >
> > >         mutex_unlock(&dma_list_mutex);
> > >
> > >         return ret;
> > > }
> > > EXPORT_SYMBOL_GPL(dma_get_slave_channel);
> > 
> > Want to double check here.
> > Device need specific channel via request line, the requirement still
> > can be met, right?
> 
> The driver can have a simple array of pointers that is indexed by
> the request number, so you end up with something like
> 
> struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
>                                                 struct of_dma *ofdma)
> {
>         struct k3_dma_dev *dev = ofdma->of_dma_data;
> 	unsigned int vchan = dma_spec->args[0];
> 
> 	if (vchan > dev->nr_channels)
> 		return NULL;
> 
>         return dma_get_slave_channel(dev->vchan[vchan]);
> }
> 
> With no need to have a filter function.
for SW muxes this may work well IMO

--
~Vinod
