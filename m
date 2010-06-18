From: "Lorenzo Pieralisi" <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: RE: Platform data with function pointers
Date: Fri, 18 Jun 2010 15:25:43 +0100
Message-ID: <30559.2862809592$1276871179@news.gmane.org>
References: <-71663801230973480@unknownmsgid>
	<AANLkTikqONUs722_ev6hqfpJiehUq2qAGWGhmxg6WkTs@mail.gmail.com>
	<000901cb0ee4$68e19e20$3aa4da60$@Pieralisi@arm.com>
	<20100618131301.GA21333@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100618131301.GA21333-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Russell King - ARM Linux' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Concerning platform_devices ids, sorry I wasn't meant to report an amba primecell binding snippet, I wanted to report here just a
binding for a simple memory mapped platform device (not a primecell one). I was asking that question about platform_device
statically defined structs that use the id for enumeration, and going with FDT the id has to be initialized somehow from the tree
because the struct is allocated dynamically.

Wrt map_desc point taken, I was looking into possible ways of getting rid of platform specific statically defined data, that array
in particular.

Thanks a lot for your feedback,

Lorenzo

-----Original Message-----
From: Russell King - ARM Linux [mailto:linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org] 
Sent: Friday, June 18, 2010 2:13 PM
To: Lorenzo Pieralisi
Cc: 'Grant Likely'; devicetree-discuss; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Jeremy Kerr; Nicolas Pitre
Subject: Re: Platform data with function pointers

On Fri, Jun 18, 2010 at 01:47:28PM +0100, Lorenzo Pieralisi wrote:
> I think chip-select addressing should be used if that is the way HW handles it. If the device is described through a
memory-mapping,
> ex. snippet follows:
> 
> serial@101f2000 {
>         compatible = "arm,pl011";
>         reg = <0x101f2000 0x1000 >;
> };

Primecell devices aren't platform devices.  They have no 'id' field as
such.  Instead, modern implementations have PCI-like IDs.

> struct map_desc {
> 	unsigned long virtual;
> 	unsigned long pfn;
> 	unsigned long length;
> 	unsigned int type;
> };
> 
> static struct map_desc realview_eb_io_desc[] __initdata = {
> 	{
> 		.virtual	= IO_ADDRESS(REALVIEW_SYS_BASE),
> 		.pfn		= __phys_to_pfn(REALVIEW_SYS_BASE),
> 		.length		= SZ_4K,
> 		.type		= MT_DEVICE,
> 	}, ...

These mappings are entirely arbitary, and change according to the
implementation of the platform.

Some platforms want to avoid using ioremap() to create 4K page mappings
for their devices, so instead they statically map them and arrange for
ioremap() to know about that static mapping.

Given that PAGE_OFFSET can be changed, it would be absolutely silly to
put this into the device tree.
