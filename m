From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Fri, 12 Oct 2012 10:48:24 +0000
Message-ID: <201210121048.24998.arnd@arndb.de>
References: <20121007015300.828366635@gmail.com>
 <201210120803.54539.arnd@arndb.de> <20121012101252.6c3b7dce@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121012101252.6c3b7dce@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 12 October 2012, Thomas Petazzoni wrote:
> On Fri, 12 Oct 2012 08:03:54 +0000, Arnd Bergmann wrote:
> 
> > I would certainly like to see this, yes. I had a patch for it ages
> > ago, but would start over again if I did this now.
> > 
> > I don't have time to do the conversion at the moment, but I would
> > certainly welcome a patch that does it. I can give some details about
> > the problems with that and how I think they should be solved.
> 
> I did start working on such a patch a few weeks ago, but converting all
> the platforms to use IOMEM() was really boring. But now you did that, I
> can try to revive my patch, see if it works, and post it if you're
> interested.

Ok, cool!

The main thing to watch out for are mappings that are not for MMIO,
such as the call to create_mapping() in map_lowmem() or in
devicemaps_init().

I would suggest making struct map_desc specific to callers of
iotable_init() and changing the prototype for create_mapping() to

void __init create_mapping(unsigned long virtual, unsigned long pfn,
			   size_t length, unsigned int type);

That means we still need to add one type cast in iotable_init(), but
everything else should become simpler. There are a few instances in
platform code that use MT_MEMORY rather MT_DEVICE. At least the TCM
one should not really be __iomem, but I'm not sure about the various
TI SRAM locations. Probably doesn't matter all that much for those.

	Arnd
