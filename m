From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 01/17] of: add dma-mask binding
Date: Wed, 14 Nov 2012 21:05:39 +0000
Message-ID: <20121114210539.GL3290@n2100.arm.linux.org.uk>
References: <1352710357-3265-1-git-send-email-wenyou.yang@atmel.com>
 <1352710357-3265-2-git-send-email-wenyou.yang@atmel.com>
 <50A3164C.3070301@gmail.com> <20121114060058.GM4576@game.jcrosoft.org>
 <50A4056E.9090700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A4056E.9090700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: JM.Lin-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 02:56:14PM -0600, Rob Herring wrote:
> On 11/14/2012 12:00 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 21:55 Tue 13 Nov     , Rob Herring wrote:
> >> On 11/12/2012 02:52 AM, Wenyou Yang wrote:
> >>> +
> >>> +	dev->dma_mask = &dev->coherent_dma_mask;
> >>
> >> I don't really know, but I suspect this is wrong.
> > no this is correct was suggest by Russell
> > we already do so on other ARM or SH as example
> > 
> > the dma expect a pointer for dma_mask but the value is the same as coherent
> 
> Okay. Then perhaps this part should be a separate patch as that is
> useful on its own for 32-bit machines with no DMA address restrictions
> (most modern ARM h/w).

I'm not sure that I did make the exact suggestion being alluded to above
(I think I may have made the suggestion that dev->dma_mask should be
pointed at a dma_mask, and it might be a good idea that it should be
part of struct device.)

I've always shy'd away from making it the same thing as the coherent
DMA mask, because there are drivers around which modify the value
pointed to by dev->dma_mask via standard DMA API calls.  (Eg, when they
know that the device is only N-bit capable.)

With that set to the same as dev->coherent_dma_mask, it ends up
modifying the coherent DMA mask too which may or may not be entirely
a good thing; I suspect ultimately that depends on the driver.

My thoughts on this though is that the whole thing is a mess.  I'm
not sure why we ended up with a separate coherent_dma_mask from the
main dma_mask, and why we ended up with dma_mask being a pointer to
something allocated elsewhere... it all seems like it's unnecessarily
complicated and was designed to cause confusion...
