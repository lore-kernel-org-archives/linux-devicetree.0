From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/4] dmaengine: dw_dmac: move to generic DMA binding
Date: Sat, 16 Feb 2013 10:51:59 +0000
Message-ID: <20130216105159.GN17833@n2100.arm.linux.org.uk>
References: <1360952512-971558-1-git-send-email-arnd@arndb.de>
 <1360952512-971558-3-git-send-email-arnd@arndb.de>
 <CAKohpo=u_b9u1=78+tm-rhVR14P0=2XbLrZEDJrQBY5W8LXiCw@mail.gmail.com>
 <201302161007.39657.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201302161007.39657.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 16, 2013 at 10:07:39AM +0000, Arnd Bergmann wrote:
> On Saturday 16 February 2013, Viresh Kumar wrote:
> > On 15 February 2013 23:51, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > > +static bool dw_dma_generic_filter(struct dma_chan *chan, void *param)
> > >  {
> > 
> > > +       dws->cfg_hi     = 0xffffffff;
> > > +       dws->cfg_lo     = 0xffffffff;
> > 
> > s/0xffffffff/-1 ?
> 
> It's an 'unsigned int'. While -1 would work here, I always find it a little
> odd to rely on that feature of the C language.

However, relying on an 'int' being 32-bits is also rather odd, and
probably much more dubious too.  If you want to set all bits in an
int, the portable way to do that is ~0.
