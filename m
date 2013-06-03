From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: at91: dt: add header to define at_hdmac
 configuration
Date: Mon, 3 Jun 2013 09:32:26 +0200
Message-ID: <28436.6322136068$1370244762@news.gmane.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <1369930103-11963-2-git-send-email-ludovic.desroches@atmel.com>
 <201305312330.29364.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201305312330.29364.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2013 at 11:30:29PM +0200, Arnd Bergmann wrote:
> On Thursday 30 May 2013, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org wrote:
> > +/*
> > + * Source and/or destination peripheral ID
> > + */
> > +#define AT91_DMA_CFG_PER_ID_MASK       (0xff)
> > +#define AT91_DMA_CFG_PER_ID(id)                (id & AT91_DMA_CFG_PER_ID_MASK)
> > +
> 
> I'm a little worried about macros like this one spreading in the name
> of readability, and I don't see this as actual value-add here:
> 
> The output of the macro is always the same as the input, and passing
> an invalid number still results in an invalid output and no error message,
> it actually prevents us from warning about the mistake at run-time.
> 

You are right, this macro is here only for readability in order to not have
something like this:

dmas = <&dma0 AT91_DMA_CFG_FIFOCFG_ASAP | 13>

In this case, I prefer having a macro instead of using a numeric value which
can stand for other things than the peripheral id and which could conflict
with other parameters such as the FIFO configuration.

If adding this macro is really an issue, it could be removed of course but
in this case I am in favour of readability.

Ludovic

> The other macros are fine.
> 
> 	Arnd
