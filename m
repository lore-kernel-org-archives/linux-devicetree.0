From: "Lorenzo Pieralisi" <Lorenzo.Pieralisi@arm.com>
Subject: RE: Platform data with function pointers
Date: Fri, 18 Jun 2010 15:25:43 +0100
Message-ID: <22138.6788799011$1276871193@news.gmane.org>
References: <-71663801230973480@unknownmsgid>
	<AANLkTikqONUs722_ev6hqfpJiehUq2qAGWGhmxg6WkTs@mail.gmail.com>
	<000901cb0ee4$68e19e20$3aa4da60$@Pieralisi@arm.com>
	<20100618131301.GA21333@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100618131301.GA21333@n2100.arm.linux.org.uk>
Content-Language: en-gb
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
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
From: Russell King - ARM Linux [mailto:linux@arm.linux.org.uk] 
Sent: Friday, June 18, 2010 2:13 PM
To: Lorenzo Pieralisi
Cc: 'Grant Likely'; devicetree-discuss; linux-arm-kernel@lists.infradead.org; Jeremy Kerr; Nicolas Pitre
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
