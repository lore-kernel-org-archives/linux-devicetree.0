From: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/8] Allow usage of independant devicetrees
Date: Fri, 11 Mar 2016 17:37:21 +0100
Message-ID: <CAJfOKBzRL2dzjGPKvCQSO4oiT88uJ0Pg5iMDy2cfThgqB1hvVg@mail.gmail.com>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-03-11 16:56 GMT+01:00 Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>:
> This patch serie allow modules to register their own devicetree.
>
> I started to work on this because I work on a PCIe board with
> a FPGA. The FPGA acts as a bridge. Behind this bridge I use Xilinx
> IPs. The problem is that Xilinx IPs support in the Kernel as been
> made with Zynq or Microblaze in mind. They require devicetree
> support.
>
> The idea is that a pci module could be shipped with its own
> devicetree describing whats behind the BARs.
>
> Here is an example of what could be such a tree:
> /dts-v1/;
> / {
>         compatible = "pci,pci_dev";
>         #address-cells = <1>;
>         #size-cells = <1>;
>
>         bar@0 {
>                 compatible = "pci,pci_bar";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 reg = <0 0>;
>                 /* Dynamically set by module */
>                 ranges = <0 0 0>;
>
>                 axi_vdma_0: axivdma@10000 {
>                         compatible = "xlnx,axi-vdma-1.00.a";
>                         #dma-cells = <1>;
>                         reg = <0x10000 0x10000>;
>                         xlnx,num-fstores = <0x8>;
>                         xlnx,flush-fsync = <0x1>;
>                         dma-channel@0x10000 {
>                                 compatible = "xlnx,axi-vdma-s2mm-channel";
>                                 /* New flag */
>                                 irq_direct_mapping;
>                                 /* Dynamically set by module */
>                                 interrupts = <0>;
>                                 xlnx,datawidth = <0x40>;
>                         } ;
>                 };
>         };
> };
>
> Ranges an interrupts are dynamically set by the module at
> probe time.
>
> For interrupts, we could also think of a special interrupt
> controller for this application. For now [7/8] looks like
> a hack.
>
> An example of module using this serie (and the associated dts) can
> be found on my Github account [1].
>
> I my example you'll see that I use a Makefile rule to compile
> the devicetree and then generates a C array from the blob.
> The module should use the dtb target to generate the blob but
> I couldn't find the good way to do that for a module on a x86
> target. Help is welcome.
>
> Patch [1/8] should no be part of this serie. However, it shows
> that if we allow independant devicetree, every architecture should
> be able to select USE_OF. The better would be to have of support
> as a module.
>
> Don't take this serie as a finished work. There is a lot of aspects
> to improve. May be we should start to implement multi-root node
> properly as a lot of functions assume of_root is the only devicetree
> present in the system.
>
> Franck Jullien (8):
>   arch/x86: Add Kconfig USE_OF
>   drivers/of: attach top level tree nodes to sysfs with their name
>   drivers/of: export of_attach_node_sysfs
>   drivers/of: export of_update_property
>   drivers/of: rename __of_find_all_nodes and export it
>   of.h: add for_each_compatible_node_from helper
>   drivers/of: allow irq direct mapping
>   drivers/of: parse_phandle_with_args to look in node's root
>
>  arch/x86/Kconfig        |    7 ++++++
>  drivers/of/base.c       |   49 +++++++++++++++++++++++++++++++++++++++++-----
>  drivers/of/dynamic.c    |    4 +-
>  drivers/of/irq.c        |    6 +++++
>  drivers/of/of_private.h |    1 -
>  drivers/of/platform.c   |    6 ++++-
>  drivers/of/unittest.c   |    4 +-
>  include/linux/of.h      |   15 ++++++++++++-
>  8 files changed, 78 insertions(+), 14 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Here is the missing link:

[1] https://github.com/fjullien/of_pci_module_example
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
