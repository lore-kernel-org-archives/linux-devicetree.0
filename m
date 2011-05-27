From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: linaro-uboot: device tree without ramdisk and boot_relocate_fdt cause
	illegal memory access in kernel
Date: Fri, 27 May 2011 16:52:38 +0800
Message-ID: <BANLkTikK9EVVZrRa1--8n1j_OXv2qK8XmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,
i am using linaro uboot(u-boot-linaro-stable.git).  i have let our
prima2 board support device tree with some workaround in uboot.  two
problems i have meet:
1. device tree without ramdisk
now uboot used commands like
"bootm kernel_address  ramdisk_address dtb_address"
to start linux kernel.
in many cases, people have no ramdisk at all, but the following codes
will still stop people to use device tree to start kernel since it got
an illegal ramdisk:

common/cmd_bootm.c:
        if (((images.os.type == IH_TYPE_KERNEL) ||
             (images.os.type == IH_TYPE_MULTI)) &&
            (images.os.os == IH_OS_LINUX)) {
                /* find ramdisk */
                ret = boot_get_ramdisk (argc, argv, &images, IH_INITRD_ARCH,
                                &images.rd_start, &images.rd_end);
                if (ret) {
                        puts ("Ramdisk image is corrupt or invalid\n");
                       return 1;
                }

#if defined(CONFIG_OF_LIBFDT)
                /* find flattened device tree */
                ret = boot_get_fdt (flag, argc, argv, &images,
                                    &images.ft_addr, &images.ft_len);
                if (ret) {
                        puts ("Could not find a valid device tree\n");
                        return 1;
                }
then i delete the first return 1 to let uboot ignore the ramdisk checking.

2. boot_relocate_fdt in common/image.c
this function will relocate fdt to an new address by:
lmb_alloc_base(lmb, of_len, 0x1000, getenv_bootm_mapsize() + getenv_bootm_low())

but the return address is probably not in the initilized scale which
kernel will build mapping in head.S. then in the function
setup_machine_fdt() of arch/arm/kernel/devtree.c, when executing:
         devtree = phys_to_virt(dt_phys);

        /* check device tree validity */
        if (be32_to_cpu(devtree->magic) != OF_DT_HEADER)
                return NULL;
kernel will die due to illegal memory access since dt_phys was not
mapped to virtual address yet.

For problem1 , could uboot have a way to ignore ramdisk by itself?
since we need 3 param in bootm to support device tree. For problem2,
could uboot just relocate fdt to the original address of old ATAG,
OFF+ 0x100?

Thanks
Barry
