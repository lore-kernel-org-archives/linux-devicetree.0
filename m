From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Fix #ifdef dependency of early flattree
 declarations
Date: Thu, 4 Jan 2018 09:15:20 +0800
Message-ID: <201801040900.pzfQnXIl%fengguang.wu@intel.com>
References: <1514888297-10791-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1514888297-10791-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on v4.15-rc6 next-20180103]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/of-fdt-Fix-ifdef-dependency-of-early-flattree-declarations/20180104-062259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: cris-etrax-100lx_v2_defconfig (attached as .config)
compiler: cris-linux-gcc (GCC) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=cris 

All errors (new ones prefixed by >>):

   arch/cris/kernel/setup.c: In function 'setup_arch':
>> arch/cris/kernel/setup.c:151:2: error: implicit declaration of function 'unflatten_and_copy_device_tree' [-Werror=implicit-function-declaration]
     unflatten_and_copy_device_tree();
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/unflatten_and_copy_device_tree +151 arch/cris/kernel/setup.c

a9f75ac5 Rabin Vincent  2015-02-08   73  
^1da177e Linus Torvalds 2005-04-16   74  	/* register an initial console printing routine for printk's */
^1da177e Linus Torvalds 2005-04-16   75  
^1da177e Linus Torvalds 2005-04-16   76  	init_etrax_debug();
^1da177e Linus Torvalds 2005-04-16   77  
^1da177e Linus Torvalds 2005-04-16   78  	/* we should really poll for DRAM size! */
^1da177e Linus Torvalds 2005-04-16   79  
^1da177e Linus Torvalds 2005-04-16   80  	high_memory = &dram_end;
^1da177e Linus Torvalds 2005-04-16   81  
^1da177e Linus Torvalds 2005-04-16   82  	if(romfs_in_flash || !romfs_length) {
^1da177e Linus Torvalds 2005-04-16   83  		/* if we have the romfs in flash, or if there is no rom filesystem,
^1da177e Linus Torvalds 2005-04-16   84  		 * our free area starts directly after the BSS
^1da177e Linus Torvalds 2005-04-16   85  		 */
^1da177e Linus Torvalds 2005-04-16   86  		memory_start = (unsigned long) &_end;
^1da177e Linus Torvalds 2005-04-16   87  	} else {
^1da177e Linus Torvalds 2005-04-16   88  		/* otherwise the free area starts after the ROM filesystem */
^1da177e Linus Torvalds 2005-04-16   89  		printk("ROM fs in RAM, size %lu bytes\n", romfs_length);
^1da177e Linus Torvalds 2005-04-16   90  		memory_start = romfs_start + romfs_length;
^1da177e Linus Torvalds 2005-04-16   91  	}
^1da177e Linus Torvalds 2005-04-16   92  
^1da177e Linus Torvalds 2005-04-16   93  	/* process 1's initial memory region is the kernel code/data */
^1da177e Linus Torvalds 2005-04-16   94  
^1da177e Linus Torvalds 2005-04-16   95  	init_mm.start_code = (unsigned long) &text_start;
^1da177e Linus Torvalds 2005-04-16   96  	init_mm.end_code =   (unsigned long) &_etext;
^1da177e Linus Torvalds 2005-04-16   97  	init_mm.end_data =   (unsigned long) &_edata;
^1da177e Linus Torvalds 2005-04-16   98  	init_mm.brk =        (unsigned long) &_end;
^1da177e Linus Torvalds 2005-04-16   99  
^1da177e Linus Torvalds 2005-04-16  100  	/* min_low_pfn points to the start of DRAM, start_pfn points
^1da177e Linus Torvalds 2005-04-16  101  	 * to the first DRAM pages after the kernel, and max_low_pfn
^1da177e Linus Torvalds 2005-04-16  102  	 * to the end of DRAM.
^1da177e Linus Torvalds 2005-04-16  103  	 */
^1da177e Linus Torvalds 2005-04-16  104  
^1da177e Linus Torvalds 2005-04-16  105          /*
^1da177e Linus Torvalds 2005-04-16  106           * partially used pages are not usable - thus
^1da177e Linus Torvalds 2005-04-16  107           * we are rounding upwards:
^1da177e Linus Torvalds 2005-04-16  108           */
^1da177e Linus Torvalds 2005-04-16  109  
^1da177e Linus Torvalds 2005-04-16  110          start_pfn = PFN_UP(memory_start);  /* usually c0000000 + kernel + romfs */
^1da177e Linus Torvalds 2005-04-16  111  	max_pfn =   PFN_DOWN((unsigned long)high_memory); /* usually c0000000 + dram size */
^1da177e Linus Torvalds 2005-04-16  112  
^1da177e Linus Torvalds 2005-04-16  113          /*
^1da177e Linus Torvalds 2005-04-16  114           * Initialize the boot-time allocator (start, end)
^1da177e Linus Torvalds 2005-04-16  115  	 *
^1da177e Linus Torvalds 2005-04-16  116  	 * We give it access to all our DRAM, but we could as well just have
^1da177e Linus Torvalds 2005-04-16  117  	 * given it a small slice. No point in doing that though, unless we
^1da177e Linus Torvalds 2005-04-16  118  	 * have non-contiguous memory and want the boot-stuff to be in, say,
^1da177e Linus Torvalds 2005-04-16  119  	 * the smallest area.
^1da177e Linus Torvalds 2005-04-16  120  	 *
^1da177e Linus Torvalds 2005-04-16  121  	 * It will put a bitmap of the allocated pages in the beginning
^1da177e Linus Torvalds 2005-04-16  122  	 * of the range we give it, but it won't mark the bitmaps pages
^1da177e Linus Torvalds 2005-04-16  123  	 * as reserved. We have to do that ourselves below.
^1da177e Linus Torvalds 2005-04-16  124  	 *
^1da177e Linus Torvalds 2005-04-16  125  	 * We need to use init_bootmem_node instead of init_bootmem
^1da177e Linus Torvalds 2005-04-16  126  	 * because our map starts at a quite high address (min_low_pfn).
^1da177e Linus Torvalds 2005-04-16  127           */
^1da177e Linus Torvalds 2005-04-16  128  
^1da177e Linus Torvalds 2005-04-16  129  	max_low_pfn = max_pfn;
^1da177e Linus Torvalds 2005-04-16  130  	min_low_pfn = PAGE_OFFSET >> PAGE_SHIFT;
^1da177e Linus Torvalds 2005-04-16  131  
^1da177e Linus Torvalds 2005-04-16  132  	bootmap_size = init_bootmem_node(NODE_DATA(0), start_pfn,
^1da177e Linus Torvalds 2005-04-16  133  					 min_low_pfn,
^1da177e Linus Torvalds 2005-04-16  134  					 max_low_pfn);
^1da177e Linus Torvalds 2005-04-16  135  
^1da177e Linus Torvalds 2005-04-16  136  	/* And free all memory not belonging to the kernel (addr, size) */
^1da177e Linus Torvalds 2005-04-16  137  
^1da177e Linus Torvalds 2005-04-16  138  	free_bootmem(PFN_PHYS(start_pfn), PFN_PHYS(max_pfn - start_pfn));
^1da177e Linus Torvalds 2005-04-16  139  
^1da177e Linus Torvalds 2005-04-16  140          /*
^1da177e Linus Torvalds 2005-04-16  141           * Reserve the bootmem bitmap itself as well. We do this in two
^1da177e Linus Torvalds 2005-04-16  142           * steps (first step was init_bootmem()) because this catches
^1da177e Linus Torvalds 2005-04-16  143           * the (very unlikely) case of us accidentally initializing the
^1da177e Linus Torvalds 2005-04-16  144           * bootmem allocator with an invalid RAM area.
^1da177e Linus Torvalds 2005-04-16  145  	 *
^1da177e Linus Torvalds 2005-04-16  146  	 * Arguments are start, size
^1da177e Linus Torvalds 2005-04-16  147           */
^1da177e Linus Torvalds 2005-04-16  148  
72a7fe39 Bernhard Walle 2008-02-07  149  	reserve_bootmem(PFN_PHYS(start_pfn), bootmap_size, BOOTMEM_DEFAULT);
^1da177e Linus Torvalds 2005-04-16  150  
a9f75ac5 Rabin Vincent  2015-02-08 @151  	unflatten_and_copy_device_tree();
a9f75ac5 Rabin Vincent  2015-02-08  152  
^1da177e Linus Torvalds 2005-04-16  153  	/* paging_init() sets up the MMU and marks all pages as reserved */
^1da177e Linus Torvalds 2005-04-16  154  
^1da177e Linus Torvalds 2005-04-16  155  	paging_init();
^1da177e Linus Torvalds 2005-04-16  156  
7cf32cad Mikael Starvik 2005-07-27  157  	*cmdline_p = cris_command_line;
^1da177e Linus Torvalds 2005-04-16  158  

:::::: The code at line 151 was first introduced by commit
:::::: a9f75ac5a24cb94c2373daa3d73f90d22cf5d94b CRISv32: add device tree support

:::::: TO: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
:::::: CC: Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--y0ulUmNC+osPPQO6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
WLeuXJvBu9g9ZIHnJs7/AYipUZfSiAAA

--y0ulUmNC+osPPQO6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
