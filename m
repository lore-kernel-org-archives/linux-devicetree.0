From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 11/12] ARM: mvebu: Relocate Armada 370 PCIe device tree
 nodes
Date: Wed, 19 Jun 2013 20:55:41 +0200
Message-ID: <201306192055.41678.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306191411.59010.arnd@arndb.de>
 <20130619165348.GA32155@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130619165348.GA32155-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 June 2013, Jason Gunthorpe wrote:
> 
> Today 18:53:48
>    
> On Wed, Jun 19, 2013 at 02:11:58PM +0200, Arnd Bergmann wrote:
> 
> > > Mmm.. and why is this option acceptable?
> > 
> > As I explained on IRC, there is no requirement to pick a specific bus
> > aperture. The only two sensible choices are to make the bus address
> > the same as the CPU address, or to make the bus address start at 0,
> > which is what this does.
> 
> PCI bus addresses must not alias other addresess in the system or
> you'll get weirdness. For instance DMA initiated from the PCI bus at
> address 0, intended to read from SDRAM at 0 must not be claimed by
> another device on the PCI bus. IMHO, a 1:1 mapping between PCI and CPU
> is strongly preferred. Any other configuration will need some
> additional techniques to avoid aliasing.

Ah, good point. You are obviously right, it should definitely be a 1:1
mapping, anything else just creates a mess. I was working on a system
like that before, it wasn't pretty (you have to provide separate
dma_map_ops then).

	Arnd
