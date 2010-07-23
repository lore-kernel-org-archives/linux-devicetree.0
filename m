From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/9] Xilinx PCI endpoint driver
Date: Fri, 23 Jul 2010 14:39:17 -0700
Message-ID: <0f773b9c-7bf4-4795-93e1-64b1f81dd286@VA3EHSMHS028.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <1279918663-29960-1-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry, I just realized that the NO_IRQ patch is incomplete 'cuz I hadn't
fixed the
x86 part...  But can you try putting the hwicap fix in the test tree?

Steve

> -----Original Message-----
> From: Stephen Neuendorffer [mailto:stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org]
> Sent: Friday, July 23, 2010 1:58 PM
> To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Stephen Neuendorffer
> Subject: [PATCH 0/9] Xilinx PCI endpoint driver
> 
> The bulk of this code is still preliminary.  This update contains a
fix
> 	for the hwicap core, which should work on all arches this time.
There's
> also an IRQ-related fix that removes the dependency of drivers/of on a
> architecture-specific definition of NO_IRQ.
> 
> Stephen Neuendorffer (9):
>   drivers/of: Make device tree code work on any arch.
>   of/fdt: Add unflatten_partial_device_tree
>   of/base.c: export property access/modification functions
>   drivers/of: Allow IRQ code to work properly on architectures without
>     NO_IRQ
>   arch/x86: Add support for device tree code.
>   [Xilinx] xilinx_pcipr: Added Xilinx reconfigurable PCI endpoint
>     driver.
>   [Xilinx] xilinx_hwicap: use linux/io.h instead of asm/io.h
>   [Xilinx] xilinx_hwicap: Update driver to use generic io accessors
>   [Xilinx] xilinx_hwicap: Enable whenever OF/device trees are
>     available.
> 
>  arch/x86/include/asm/device.h              |    3 +
>  arch/x86/include/asm/irq.h                 |    4 +
>  arch/x86/kernel/Makefile                   |    1 +
>  arch/x86/kernel/device_tree.c              |   63 +++++++++
>  drivers/char/Kconfig                       |    2 +-
>  drivers/char/xilinx_hwicap/buffer_icap.c   |   16 +-
>  drivers/char/xilinx_hwicap/buffer_icap.h   |    3 +-
>  drivers/char/xilinx_hwicap/fifo_icap.c     |   39 +++---
>  drivers/char/xilinx_hwicap/fifo_icap.h     |    3 +-
>  drivers/char/xilinx_hwicap/xilinx_hwicap.c |    4 +-
>  drivers/char/xilinx_hwicap/xilinx_hwicap.h |    3 +-
>  drivers/of/address.c                       |    5 +
>  drivers/of/base.c                          |    3 +
>  drivers/of/device.c                        |    7 +-
>  drivers/of/fdt.c                           |  169
+++++++++++++++++-------
>  drivers/of/irq.c                           |   10 +-
>  drivers/of/platform.c                      |    2 +
>  drivers/pci/Kconfig                        |    8 +
>  drivers/pci/Makefile                       |    2 +
>  drivers/pci/xilinx_pcipr.c                 |  197
++++++++++++++++++++++++++++
>  include/linux/of_fdt.h                     |   11 +-
>  include/linux/of_irq.h                     |    1 +
>  22 files changed, 462 insertions(+), 94 deletions(-)
>  create mode 100644 arch/x86/kernel/device_tree.c
>  create mode 100644 drivers/pci/xilinx_pcipr.c
> 


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
