From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/8] Allow usage of independant devicetrees
Date: Thu, 17 Mar 2016 09:37:41 -0500
Message-ID: <CAL_JsqJ_JB=DXJAyzBfm3JvShq8U5+Jg1mOjY_0gM=zTbwFXVw@mail.gmail.com>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 9:56 AM, Franck Jullien
<franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org> wrote:
> This patch serie allow modules to register their own devicetree.

I've not looked at this thoroughly, but have some initial comments.
Some of what you are doing should already be possible. The DT unittest
essentially does this. I know we wanted it to work as a module, but it
does not currently. Fixing issues with building it as a module would
be a good first step and be contained to just one part of the problems
you face.

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

This should all be moved down a level rather than being at the root
level. The root is somewhat special and you need to deal with things
like having 2 or more cards.

>         compatible = "pci,pci_dev";

We already have defined way to do PCI device compatible strings[1].

>         #address-cells = <1>;
>         #size-cells = <1>;
>
>         bar@0 {
>                 compatible = "pci,pci_bar";

Describing this in terms of BARs seems strange to me. There are
examples of ISA buses downstream of PCI buses in some powerpc DTs. I
think we want to follow something similar here in terms of structure.

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

obj-y += your-dts-file.dtb

> Patch [1/8] should no be part of this serie. However, it shows
> that if we allow independant devicetree, every architecture should
> be able to select USE_OF. The better would be to have of support
> as a module.

CONFIG_OF is already user selectable.

> Don't take this serie as a finished work. There is a lot of aspects
> to improve. May be we should start to implement multi-root node
> properly as a lot of functions assume of_root is the only devicetree
> present in the system.

I think this should all be using overlays. I'm not sure that we
support applying overlays with no root DT ATM, but I know others are
certainly interested in doing just that and creating a default
skeleton DT root node should be trivial.

The big challenge here how to describe child devices which don't have
the parent described in DT. Perhaps we need some sort of virtual
parent(s) which have all the necessary providers like interrupts.

Rob

[1] http://www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
