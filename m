From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] at_hdmac: dt dma bindings update
Date: Thu, 30 May 2013 22:13:21 +0200
Message-ID: <20130530201321.GE23653@game.jcrosoft.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <20130530172649.GC3767@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130530172649.GC3767-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22:56 Thu 30 May     , Vinod Koul wrote:
> On Thu, May 30, 2013 at 06:08:20PM +0200, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org wrote:
> > From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > 
> > Hi,
> > 
> > This set of patches update the dt dma binding for at_hdmac since we need one
> > more parameter. In order to keep backward compatibility, an existing cell will
> > be used to add this parameter. Since the content of that cell will become a
> > magic value due to the concatenation of the two parameters, it is time to
> > use macros.
> which tree is this targetted to be applied? 

arm-soc as this depends on alreadied applied cleanup I've 
> 
> Arnd, can you review this series and ack if this needs to be applied thru
> dmaengine?

I prefer the invert

Best Regards,
J.
> 
> --
> ~Vinod
> > 
> > Regards
> > 
> > Ludovic Desroches (3):
> >   ARM: at91: dt: add header to define at_hdmac configuration
> >   ARM: at91: dt: switch DMA DT bindings to pre-processor
> >   at_hdmac: add FIFO configuration parameter to DMA DT binding
> > 
> >  .../devicetree/bindings/dma/atmel-dma.txt          |  7 ++++--
> >  arch/arm/boot/dts/at91sam9g45.dtsi                 |  5 ++--
> >  arch/arm/boot/dts/at91sam9n12.dtsi                 | 11 +++++----
> >  arch/arm/boot/dts/at91sam9x5.dtsi                  | 17 +++++++-------
> >  arch/arm/boot/dts/sama5d3.dtsi                     | 19 +++++++--------
> >  drivers/dma/at_hdmac.c                             | 25 ++++++++++++++++----
> >  include/dt-bindings/dma/at91.h                     | 27 ++++++++++++++++++++++
> >  7 files changed, 81 insertions(+), 30 deletions(-)
> >  create mode 100644 include/dt-bindings/dma/at91.h
> > 
> > -- 
> > 1.7.11.3
> > 
> 
> -- 
