From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 14:24:34 +0000
Message-ID: <20130129142434.GW23505@n2100.arm.linux.org.uk>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301291050.23743.arnd@arndb.de>
 <20130129111850.GR23505@n2100.arm.linux.org.uk>
 <201301291344.11066.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201301291344.11066.arnd-r2nGTMty4D4@public.gmane.org>
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

On Tue, Jan 29, 2013 at 01:44:10PM +0000, Arnd Bergmann wrote:
> Can you give an example for this? We were careful to make sure it
> works with platforms that connect a slave to multiple dma engines,
> out of which any could be used for a given transfer. In the device
> tree binding, you specify all possible controllers and give the
> alternatives the same name, for example:
> 
> 	serial@10000000 {
> 		compatible = "arm,pl011", "arm,primecell";
> 		dmas = <dwdma0 7 0>, <dwdma0 8 1>, <&pl330 17>, <&pl330 15>;
> 		dma-names = "rx", "tx", "rx", "tx;
> 		...
> 	};

No, that's not what I mean.  I mean the situation we find on Versatile
platforms:

            8     3                   >3
PL080 DMA --/--+--/------> FPGA Mux --/--> {bunch of off-CPU peripherals}
               |  5
               `--/------> {On-CPU peripherals}

This is something that I've been raising _every time_ I've been involved
with DMA engine discussions when it comes to the matching stuff, so this
is nothing new, and it's not unknown about.

What is different this time around is that I've been purposely omitted
from the discussions (like what seems to be happening more and more - I
notice that I'm no longer copied on PL011 patches despite being the
driver author, or GIC patches, or VIC patches) so this stuff doesn't
get properly considered.

But it doesn't matter anymore; I'm soo out of the loop on stuff like DT
and the like that my input would be more of a hinderence now.
