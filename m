From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Device tree with early buffer allocations and aliased memory
Date: Wed, 27 Oct 2010 11:49:08 -0700
Message-ID: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a very long question and appreciate your forebearance--I'm using
Linux and I have a pretty complicated memory structure for which I'm
trying to define a device tree and I need some help making sense out
it all. The basic scenario:
1	I'm using a MIPS processor, which has low memory from 0x0 to
	0x1fffffff.
2.	I have two banks of memory with the following DMA addresses:
		Bank 0	0x20000000-0x3fffffff
		Bank 1	0x60000000-0x7fffffff
	With a page map, the processor can also get to these so they
	are also physical addresses.
3.	All device registers are at physical addresses < 0x10000000.
4.	Since the processor needs memory to run, the first 0x0fc00000
	bytes also appear at 0x10000000. Our hardware guys call this
	a memory "alias". These addresses are physical, but not DMA
	addresses. (The hole is so we can alias the reset vector)
5.	We need huge buffers (up to 80 MiB) that are way too large to
	allocate with the usual functions, so we allocate them very
	early through the bootmem allocator. Some of these must be
	at a fixed address and some may be allocated in one or the
	other bank of memory. Dynamic address assignment is generally
	preferred to avoid overlapping static assignments.

Memory seems straight-forward-just use the process physical addresses
wherever possible:

	memories {
		memory@10000000 {
			device_type = "memory";
			reg = <10000000 0x0fc00000>;
		};
		memory@20000000 {
			device_type = "memory";
			reg = <2fc00000 10400000>;
		};
		memory@60000000 {
			default_type = "memory";
			reg = <60000000 20000000>;
		};
	};

For a device with buffers allocated at a static address in memory
without an alias I use a new property, cisco,memory-buffers, which
specifies triples for buffers where:
	item 1	Lowest allowable address of the first byte of the buffer
	item 2	Highest allowable address of the last byte of the buffer
	item 3	Number of bytes in the buffer.
If item 1 = item 2 - item 3 this buffer must be allocated at the address
given in item 1, i.e. it has a static address. Otherwise it may be
dynamically allocated within the given range:

	static-dev-noalias@08000000 {
		compatible = "cisco,static-dev-noalias";
		reg = <0x08000000>;
		cisco,memory-buffers=<0x60000000 0x60200000 0x00200000>;
	};

I think this is reasonable, though I'd prefer a standard way to specify
memory buffers allocation parameters. Things get complicated for a device
with buffers dynamically allocated in the part of memory with an alias.
The device registers are still in non-aliased memory, so this isn't a
completely independent bus:

	dyn-dev-alias@08001000 {
		compatible = "cisco,dyn-dev-alias";
		reg = <0x08001000>;
		cisco,memory-buffers = <0x10000000 0x1fb00000 0x00100000>;
	};

The problem is that I haven't supplied enough information to turn the
memory buffer physical addresses into DMA addresses, but if I wrap this
in something like a simple-bus, the address for the reg property will
be wrong. I could simply adjust it, but then it gets a lot harder to
read and maintain.

So, questions:
1.	Is there a better way to specify parameters for very early
	buffer allocations?
2.	Is there a better way to handle devices whose device registers
	live nicely in physical address space but whose buffers live
	in different physical and DMA address spaces?

I'm open to any and all suggestions.
-- 
David VL
