From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers/of: Validate device node in
 __unflatten_device_tree()
Date: Tue, 9 Aug 2016 12:25:43 -0500
Message-ID: <20160809172543.GA5041@rob-hp-laptop>
References: <1470035873-21072-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470035873-21072-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 01, 2016 at 05:17:53PM +1000, Gavin Shan wrote:
> @mynodes is set to NULL when __unflatten_device_tree() is called
> to unflatten device sub-tree in PCI hot add scenario on PowerPC
> PowerNV platform. Marking @mynodes detached unconditionally causes
> kernel crash as below backtrace shows:
> 
> Unable to handle kernel paging request for data at address 0x00000000
> Faulting instruction address: 0xc000000000b26f64
> cpu 0x0: Vector: 300 (Data Access) at [c000003fcc7cf740]
>     pc: c000000000b26f64: __unflatten_device_tree+0xf4/0x190
>     lr: c000000000b26f40: __unflatten_device_tree+0xd0/0x190
>     sp: c000003fcc7cf9c0
>    msr: 900000000280b033
>    dar: 0
>  dsisr: 40000000
>   current = 0xc000003fcc281680
>   paca    = 0xc00000000ff00000	 softe: 0	 irq_happened: 0x01
>     pid   = 2724, comm = sh
> Linux version 4.7.0-gavin-07754-g92a6836 (gwshan@gwshan) (gcc version \
> 4.9.3 (Buildroot 2016.02-rc2-00093-g5ea3bce) ) #539 SMP Mon Aug 1 \
> 12:40:29 AEST 2016
> enter ? for help
> [c000003fcc7cfa50] c000000000b27060 of_fdt_unflatten_tree+0x60/0x90
> [c000003fcc7cfaa0] c0000000004c6288 pnv_php_set_slot_power_state+0x118/0x440
> [c000003fcc7cfb80] c0000000004c6a10 pnv_php_enable+0xc0/0x170
> [c000003fcc7cfbd0] c0000000004c4d80 power_write_file+0xa0/0x190
> [c000003fcc7cfc50] c0000000004be93c pci_slot_attr_store+0x3c/0x60
> [c000003fcc7cfc70] c0000000002d3fd4 sysfs_kf_write+0x94/0xc0
> [c000003fcc7cfcb0] c0000000002d2c30 kernfs_fop_write+0x180/0x260
> [c000003fcc7cfd00] c000000000230fe0 __vfs_write+0x40/0x190
> [c000003fcc7cfd90] c000000000232278 vfs_write+0xc8/0x240
> [c000003fcc7cfde0] c000000000233d90 SyS_write+0x60/0x110
> [c000003fcc7cfe30] c000000000009524 system_call+0x38/0x108
> 
> This avoids the kernel crash by marking @mynodes detached only when
> @mynodes is dereferencing valid device node in __unflatten_device_tree().
> 
> Fixes: 1d1bde550ea3 ("of: fdt: mark unflattened tree as detached")
> Reported-by: Meng Li <shlimeng-vtt25B2cwJLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
