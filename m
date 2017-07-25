From: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>
Subject: Duplicated memory node in the Device-Tree (WAS [XEN] Re: Duplicated
 memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 15:23:40 +0100
Message-ID: <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914-uRwfk40T5oI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>
Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 25/07/17 13:24, Andrii Anisov wrote:
> Dear All,

Hi,

>
>
> In case of memory nodes duplication (or overlapping) in a device tree,
> we get a BUG at page_alloc.c:226.
>
> This appears e.g. for Renesas R-Car Gen3 SoC based boards. Their u-boot
> does write memory nodes to the device tree before image (Linux kernel,
> xen) boot. So having following memory description in the compiled device
> tree for Salvator-X:
> \ {
>         memory@48000000 {
>                 device_type = "memory";
>                 reg = <0x0 0x48000000 0x0 0x38000000>;
>         };
>         memory@500000000 {
>                 device_type = "memory";
>                 reg = <0x5 0x00000000 0x0 0x40000000>;
>         };
>         memory@600000000 {
>                 device_type = "memory";
>                 reg = <0x6 0x00000000 0x0 0x40000000>;
>         };
>         memory@700000000 {
>                 device_type = "memory";
>                 reg = <0x7 0x00000000 0x0 0x40000000>;
>         };
> }
>
> The hypervisor in runtime receives following:
> \ {
>         memory@48000000 {
>                 device_type = "memory";
>                 reg = <0x0 0x48000000 0x0 0x38000000>,
>                           <0x5 0x00000000 0x0 0x40000000>,
>                           <0x6 0x00000000 0x0 0x40000000>,
>                           <0x7 0x00000000 0x0 0x40000000>;
>         };
>         memory@500000000 {
>                 device_type = "memory";
>                 reg = <0x5 0x00000000 0x0 0x40000000>;
>         };
>         memory@600000000 {
>                 device_type = "memory";
>                 reg = <0x6 0x00000000 0x0 0x40000000>;
>         };
>         memory@700000000 {
>                 device_type = "memory";
>                 reg = <0x7 0x00000000 0x0 0x40000000>;
>         };
> }
>
> And crashes:
>
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000048000000 - 000000007fffffff
> (XEN) RAM: 0000000500000000 - 000000053fffffff
> (XEN) RAM: 0000000600000000 - 000000063fffffff
> (XEN) RAM: 0000000700000000 - 000000073fffffff
> (XEN) RAM: 0000000500000000 - 000000053fffffff
> (XEN) RAM: 0000000600000000 - 000000063fffffff
> (XEN) RAM: 0000000700000000 - 000000073fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000048000000 - 0000000048011000 Device Tree
> (XEN) MODULE[1]: 000000007a000000 - 000000007c000000 Kernel
> (XEN)  RESVD[0]: 0000000048000000 - 0000000048011000
> (XEN)
> (XEN) Command line: dom0_mem=752M console=dtuart dtuart=serial0
> dom0_max_vcpus=4
> (XEN) Placing Xen at 0x000000073fe00000-0x0000000740000000
> (XEN) Update BOOTMOD_XEN from 0000000078080000-0000000078192d81 =>
> 000000073fe00000-000000073ff12d81
> (XEN) PFN compression on bits 19...19
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Boot BUG at page_alloc.c:226
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
> This mainly happens because duplicated memory nodes are accounted as
> separate memory banks (in process_memory_node()).
> I select now of two approaches to fix the issue:
> * ignore next duplicating (overlapping) memory node in favor of one
> already in a memory banks list
> * merge duplicating (overlapping), even neighboring, memory banks
>
> Actually I tend to follow the second approach, but want to get some
> advisory from community first.
> ps. Linux kernel does tolerate duplicated memory nodes by merging memory
> blocks. I.e. memblock_add_range() function is commented as following:

I think this is by chance rather than by design. The first question to 
answer is why a Firmware would specify twice the same memory banks? Is 
it valid from the specification?

I have CCed the devicetree ML to get feedback from them here.

Regardless that, it looks like to me that the device-tree you give to 
the board should not contain the memory nodes.

>     /**
>      * memblock_add_range - add new memblock region
>      * @type: memblock type to add new region into
>      * @base: base address of the new region
>      * @size: size of the new region
>      * @nid: nid of the new region
>      * @flags: flags of the new region
>      *
>      * Add new memblock region [@base,@base+@size) into @type.  The new
> region
>      * is allowed to overlap with existing ones - overlaps don't affect
> already
>      * existing regions.  @type is guaranteed to be minimal (all
> neighbouring
>      * compatible regions are merged) after the addition.
>      *
>      * RETURNS:
>      * 0 on success, -errno on failure.
>      */
>

Cheers,

-- 
Julien Grall
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
