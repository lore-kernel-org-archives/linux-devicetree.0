From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/7] add of_fdt_unflatten_tree
Date: Thu, 18 Nov 2010 15:54:55 -0800
Message-ID: <cce2a5ec-536b-4668-8bbe-ae413cb435ac@VA3EHSMHS006.ehs.local>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290021345-4303-1-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

	Currently, fdt blobs are handled solely at boot time.  However,
it may be useful to parse blobs into device trees after boot time.  For
instance, a PCIe device may have an FPGA which includes a device
tree.  This set of patches locally refactors the existing code to enable
this.

Patch 1 and 4-7 are the interesting bits.
Patch 2 and 3 provide the ability to use this code on x86, and are provided mostly for reference.

The non-early boot code has been compile-tested and executed on X86.

Stephen Neuendorffer (7):
  fdt: Add Kconfig for EARLY_FLATTREE
  arch/x86: Add support for device tree code.
  arch/x86: select OF and OF_FLATTREE
  fdt.c: Add non-boottime device tree functions
  fdt.c: Refactor unflatten_dt_node
  fdt.c: Reorder unflatten_dt_node
  fdt.c: Refactor unflatten_device_tree and add fdt_unflatten_tree

 arch/microblaze/Kconfig    |    1 +
 arch/powerpc/Kconfig       |    1 +
 arch/x86/Kconfig           |    2 +
 arch/x86/include/asm/irq.h |    2 +
 arch/x86/kernel/irq.c      |   11 ++
 drivers/of/Kconfig         |    5 +
 drivers/of/fdt.c           |  393 ++++++++++++++++++++++++++------------------
 include/linux/of_fdt.h     |   13 ++
 8 files changed, 272 insertions(+), 156 deletions(-)



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
