From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/4] dmaengine: dw_dmac: move to generic DMA binding
Date: Sat, 16 Feb 2013 10:07:39 +0000
Message-ID: <201302161007.39657.arnd@arndb.de>
References: <1360952512-971558-1-git-send-email-arnd@arndb.de>
 <1360952512-971558-3-git-send-email-arnd@arndb.de>
 <CAKohpo=u_b9u1=78+tm-rhVR14P0=2XbLrZEDJrQBY5W8LXiCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpo=u_b9u1=78+tm-rhVR14P0=2XbLrZEDJrQBY5W8LXiCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 16 February 2013, Viresh Kumar wrote:
> On 15 February 2013 23:51, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > +- #dma-cells: must be <3>
> 
> > +DMA clients connected to the Designware DMA controller must use the format
> > +described in the dma.txt file, using a five-cell specifier for each channel.
> 
> s/five/four ?

Right. I thought I had fixed up all instances.

> > +static bool dw_dma_generic_filter(struct dma_chan *chan, void *param)
> >  {
> 
> > +       dws->cfg_hi     = 0xffffffff;
> > +       dws->cfg_lo     = 0xffffffff;
> 
> s/0xffffffff/-1 ?

It's an 'unsigned int'. While -1 would work here, I always find it a little
odd to rely on that feature of the C language.

Thannks for the review.

	Arnd
